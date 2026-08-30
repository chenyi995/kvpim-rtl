// attacc_controller.sv — Fugue logic-die control (AttAcc controller + KV
// address planning).  Contains: an instruction queue (FIFO), an instruction
// decoder, a config-register file, a run-based DRAM address generator fed by
// the KV address-plan port, and a DRAM command FSM.  Decodes the PIM command
// set (SET_CONFIG / ACT_AB / MAC_AB / SFM / ROTATE / MV / WR / RD / SET_META /
// ATTACH) into datapath control + DRAM commands.
//
// Address-plan port = kv_tlb_top's command/run interface (drampim's segment
// TLB: OP_PLAN over logical token positions -> physically contiguous runs).
// The AttAcc baseline serves the same port with direct_addr_plan (one affine
// run, no table), so this controller is identical in both dies.
//
//   PIM_MAC_AB : vaddr[15:0] = first logical token position, len = rows.
//                -> OP_PLAN (ctx/layer/pools from CFG_KVCTX); for each run,
//                   for each row, COLS_PER_VEC 32-B column reads; ACT only
//                   when the DRAM {bank,row} changes (open-row tracking).
//   PIM_ATTACH : imm[0]=0 -> OP_ATTACH (ctx, layer); imm[0]=1 -> OP_FLUSH.
//
// Registered (Moore) control outputs — every pulse is defaulted to 0 each cycle
// so no latches are inferred.  Single-instruction-at-a-time execution; the FIFO
// smooths host issue.
module attacc_controller import fugue_pkg::*; import kv_tlb_pkg::*; #(
    parameter integer QDEPTH = 8
) (
    input  logic                 clk,
    input  logic                 rst_n,

    // ---- host instruction input ----
    input  logic                 instr_valid,
    input  logic [INSTR_W-1:0]   instr_word,
    output logic                 instr_ready,
    output logic                 idle,

    // ---- KV address-plan port (kv_tlb_top / direct_addr_plan) ----
    output logic                 plan_cmd_valid,
    input  logic                 plan_cmd_ready,
    output logic [1:0]           plan_cmd_op,
    output logic [CTX_W-1:0]     plan_cmd_ctx,
    output logic [LAYER_W-1:0]   plan_cmd_layer,
    output logic [POS_W-1:0]     plan_cmd_pos_lo,
    output logic [POS_W-1:0]     plan_cmd_pos_hi,
    output logic [1:0]           plan_cmd_pools,
    input  logic                 plan_cmd_done,
    input  logic                 plan_cmd_fault,
    input  logic                 run_valid,
    output logic                 run_ready,
    input  logic [KV_ADDR_W-1:0] run_key_base,
    input  logic [CNT_W-1:0]     run_count,
    output logic                 addr_fault,      // sticky: last plan/attach faulted

    // ---- DRAM command interface ----
    output dram_cmd_e            dram_cmd,
    output logic [BANK_W-1:0]    dram_bank,
    output logic [ROW_W-1:0]     dram_row,
    output logic [COL_W-1:0]     dram_col,

    // ---- datapath control ----
    output logic                 gemv_start,
    output logic [3:0]           gemv_row_addr,
    output logic [3:0]           gemv_vec_addr,
    output logic                 gemv_accum_en,
    output logic                 gemv_accum_clr,
    output opmode_e              op_mode,
    output logic                 rotate_start,
    output logic [15:0]          rotate_pos,
    output logic                 sfm_start,
    output logic                 acc_clr,

    // ---- config broadcast ----
    output logic [31:0]          cfg_nhead,
    output logic [31:0]          cfg_dhead,
    output logic [31:0]          cfg_seqlen,
    output logic [31:0]          cfg_kvbase,      // AttAcc: KV base; Fugue: page-table directory base

    // ---- diff-decoder metadata write (PIM_SET_META), mirrors cfg[] write ----
    output logic                 meta_wr_en,
    output logic [SM_WIDX_W-1:0] meta_wr_idx,
    output logic [$clog2(SM_CHANNELS)-1:0] meta_wr_channel,
    // PIM_SET_META carries one channel's 16-bit mask.  The all-channel tops
    // broadcast that command to their sixteen physical decoder instances.
    output logic [SM_PES_PER_CHANNEL-1:0] meta_wr_mask
);
    localparam integer PW = (QDEPTH <= 1) ? 1 : $clog2(QDEPTH);
    localparam integer COLS_PER_VEC = VEC_BYTES / HBM_TX_BYTES;   // 8 x 32-B columns per K/V row
    localparam integer COL_SHIFT    = $clog2(HBM_TX_BYTES);       // 5
    localparam integer ROW_BITS     = CH_SHIFT - COL_SHIFT - COL_W - BANK_W;   // in-channel row bits (15)

    // ---- config register file ----
    logic [31:0] cfg [NUM_CFG];
    assign cfg_nhead  = cfg[CFG_NHEAD];
    assign cfg_dhead  = cfg[CFG_DHEAD];
    assign cfg_seqlen = cfg[CFG_SEQLEN];
    assign cfg_kvbase = cfg[CFG_KVBASE];

    // ---- instruction FIFO ----
    instr_t          fifo_mem [QDEPTH];
    logic [PW-1:0]   wr_ptr, rd_ptr;
    logic [PW:0]     cnt;
    logic            full, empty;
    assign full        = (cnt == QDEPTH[PW:0]);
    assign empty       = (cnt == '0);
    assign instr_ready = ~full;

    // ---- decode of the head instruction ----
    instr_t cur;
    instr_t head;
    assign head = fifo_mem[rd_ptr];

    // ---- physical byte address -> {bank, row, col} of one pseudo-channel ----
    // Representative HBM3 mapping: 32-B column, COL_W column bits (2 KiB row
    // buffer), BANK_W bank bits, then row; a[CH_SHIFT+:] is the channel.
    function automatic logic [COL_W-1:0] col_of(input logic [KV_ADDR_W-1:0] a);
        return a[COL_SHIFT +: COL_W];
    endfunction
    function automatic logic [BANK_W-1:0] bank_of(input logic [KV_ADDR_W-1:0] a);
        return a[COL_SHIFT+COL_W +: BANK_W];
    endfunction
    function automatic logic [ROW_W-1:0] row_of(input logic [KV_ADDR_W-1:0] a);
        return {{(ROW_W-ROW_BITS){1'b0}}, a[COL_SHIFT+COL_W+BANK_W +: ROW_BITS]};
    endfunction

    // ---- MAC run state ----
    logic [KV_ADDR_W-1:0] cur_addr;                    // byte address of the current column
    logic [CNT_W+3:0]     cols_left;                   // columns left in the current run
    logic [15:0]          beat;                        // running column beat (GEMV addressing)
    logic [POS_W-1:0]     r_pos_lo, r_pos_hi;
    logic [1:0]           r_op;
    logic                 plan_finished, plan_faulted;
    logic                 open_valid;
    logic [BANK_W-1:0]    open_bank;
    logic [ROW_W-1:0]     open_row;

    logic [KV_ADDR_W-1:0] next_addr;
    assign next_addr = cur_addr + KV_ADDR_W'(HBM_TX_BYTES);
    function automatic logic needs_act(input logic [KV_ADDR_W-1:0] a);
        return !open_valid || (bank_of(a) != open_bank) || (row_of(a) != open_row);
    endfunction

    // ---- FSM ----
    typedef enum logic [3:0] {
        S_IDLE, S_CFG, S_ROT, S_SFM, S_MISC, S_META, S_ATTACH, S_ATTACH_W,
        S_MAC_PLAN, S_MAC_RUN, S_MAC_ACT, S_MAC_RD, S_MAC_NEXT, S_MAC_DONE
    } state_e;
    state_e state;

    assign idle = (state == S_IDLE) && empty;

    // plan port (Moore)
    assign plan_cmd_valid  = (state == S_MAC_PLAN) || (state == S_ATTACH);
    assign plan_cmd_op     = r_op;
    assign plan_cmd_ctx    = cfg[CFG_KVCTX][CTX_W-1:0];
    assign plan_cmd_layer  = cfg[CFG_KVCTX][8 +: LAYER_W];
    assign plan_cmd_pools  = (cfg[CFG_KVCTX][17:16] == 2'b00) ? 2'b01 : cfg[CFG_KVCTX][17:16];
    assign plan_cmd_pos_lo = r_pos_lo;
    assign plan_cmd_pos_hi = r_pos_hi;
    assign run_ready       = (state == S_MAC_RUN);

    // combinational push/pop bookkeeping
    wire push = instr_valid & ~full;
    wire pop  = (state == S_IDLE) & ~empty;

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            state <= S_IDLE;
            wr_ptr <= '0; rd_ptr <= '0; cnt <= '0;
            cur <= '0;
            for (int i = 0; i < NUM_CFG; i++) cfg[i] <= '0;
            cur_addr <= '0; cols_left <= '0; beat <= '0; r_pos_lo <= '0; r_pos_hi <= '0;
            r_op <= OP_PLAN; plan_finished <= 1'b0; plan_faulted <= 1'b0; addr_fault <= 1'b0;
            open_valid <= 1'b0; open_bank <= '0; open_row <= '0;
            // control defaults
            dram_cmd <= DR_NOP; dram_bank <= '0; dram_row <= '0; dram_col <= '0;
            gemv_start <= 1'b0; gemv_row_addr <= '0; gemv_vec_addr <= '0;
            gemv_accum_en <= 1'b0; gemv_accum_clr <= 1'b0; op_mode <= OP_SCORE;
            rotate_start <= 1'b0; rotate_pos <= '0; sfm_start <= 1'b0; acc_clr <= 1'b0;
            meta_wr_en <= 1'b0; meta_wr_idx <= '0; meta_wr_channel <= '0; meta_wr_mask <= '0;
        end else begin
            // ---- FIFO write ----
            if (push) begin
                fifo_mem[wr_ptr] <= instr_word;
                wr_ptr <= (wr_ptr == (QDEPTH-1)) ? '0 : wr_ptr + 1'b1;
            end
            cnt <= cnt + (push ? 1 : 0) - (pop ? 1 : 0);

            // ---- default (deassert) all pulses each cycle ----
            dram_cmd       <= DR_NOP;
            gemv_start     <= 1'b0;
            gemv_accum_en  <= 1'b0;
            gemv_accum_clr <= 1'b0;
            rotate_start   <= 1'b0;
            sfm_start      <= 1'b0;
            acc_clr        <= 1'b0;
            meta_wr_en     <= 1'b0;

            // plan completion is a pulse that may arrive while a run is being
            // consumed: latch it.
            if (plan_cmd_done) begin
                plan_finished <= 1'b1;
                plan_faulted  <= plan_cmd_fault;
            end

            unique case (state)
                // -------- fetch / dispatch --------
                S_IDLE: begin
                    if (~empty) begin
                        cur    <= fifo_mem[rd_ptr];
                        rd_ptr <= (rd_ptr == (QDEPTH-1)) ? '0 : rd_ptr + 1'b1;
                        unique case (head.op)
                            PIM_SET_CONFIG: state <= S_CFG;
                            PIM_ROTATE:     state <= S_ROT;
                            PIM_SFM:        state <= S_SFM;
                            PIM_SET_META:   state <= S_META;
                            PIM_ATTACH: begin
                                r_op          <= head.imm[0] ? OP_FLUSH : OP_ATTACH;
                                plan_finished <= 1'b0; plan_faulted <= 1'b0; addr_fault <= 1'b0;
                                state         <= S_ATTACH;
                            end
                            PIM_MAC_AB: begin
                                op_mode       <= head.mode;
                                beat          <= 16'd0;
                                r_op          <= OP_PLAN;
                                r_pos_lo      <= head.vaddr[POS_W-1:0];
                                r_pos_hi      <= head.vaddr[POS_W-1:0] + head.len;
                                plan_finished <= 1'b0; plan_faulted <= 1'b0; addr_fault <= 1'b0;
                                open_valid    <= 1'b0;
                                state         <= (head.len == 16'd0) ? S_MAC_DONE : S_MAC_PLAN;
                            end
                            default:        state <= S_MISC;   // ACT_AB / MV_* / WR / RD / NOP
                        endcase
                    end
                end

                // -------- config write --------
                S_CFG: begin
                    cfg[cur.cfg_idx] <= cur.vaddr;  // 32-bit config value
                    state <= S_IDLE;
                end

                // -------- rotate (RoPE) --------
                S_ROT: begin
                    rotate_start <= 1'b1;
                    rotate_pos   <= cur.imm;        // token position -> angle gen
                    state        <= S_IDLE;
                end

                // -------- softmax --------
                S_SFM: begin
                    sfm_start <= 1'b1;
                    state     <= S_IDLE;
                end

                // -------- load diff-decoder mask (Fugue master-diff) --------
                S_META: begin
                    meta_wr_en   <= 1'b1;
                    meta_wr_idx  <= cur.imm[SM_WIDX_W-1:0];
                    // imm[15:12] selects the physical HBM channel; imm[6:0]
                    // remains the score-word index for a 2048-token context.
                    meta_wr_channel <= cur.imm[15:12];
                    meta_wr_mask <= cur.vaddr[SM_PES_PER_CHANNEL-1:0];
                    state        <= S_IDLE;
                end

                // -------- misc control-only ops --------
                S_MISC: begin
                    acc_clr <= 1'b1;                // e.g. clear before a new head
                    state   <= S_IDLE;
                end

                // -------- KV TLB attach / flush --------
                S_ATTACH:   if (plan_cmd_ready) state <= S_ATTACH_W;
                S_ATTACH_W: begin
                    if (plan_finished || plan_cmd_done) begin
                        addr_fault <= plan_finished ? plan_faulted : plan_cmd_fault;
                        state      <= S_IDLE;
                    end
                end

                // -------- MAC / GEMV over the runs of [pos_lo, pos_hi) --------
                S_MAC_PLAN: if (plan_cmd_ready) state <= S_MAC_RUN;
                S_MAC_RUN: begin
                    if (run_valid) begin
                        cur_addr  <= run_key_base;
                        cols_left <= {run_count, 3'b000};          // rows x COLS_PER_VEC
                        state     <= needs_act(run_key_base) ? S_MAC_ACT : S_MAC_RD;
                    end else if (plan_finished) begin
                        addr_fault <= plan_faulted;
                        state      <= S_MAC_DONE;
                    end
                end
                S_MAC_ACT: begin
                    dram_cmd   <= DR_ACT;
                    dram_bank  <= bank_of(cur_addr);
                    dram_row   <= row_of(cur_addr);
                    open_valid <= 1'b1;
                    open_bank  <= bank_of(cur_addr);
                    open_row   <= row_of(cur_addr);
                    state      <= S_MAC_RD;
                end
                S_MAC_RD: begin
                    dram_cmd       <= DR_RD;
                    dram_col       <= col_of(cur_addr);
                    gemv_start     <= 1'b1;
                    gemv_row_addr  <= beat[3:0];
                    gemv_vec_addr  <= beat[3:0];
                    gemv_accum_en  <= 1'b1;
                    gemv_accum_clr <= (beat == 16'd0);
                    state          <= S_MAC_NEXT;
                end
                S_MAC_NEXT: begin
                    beat      <= beat + 16'd1;
                    cur_addr  <= next_addr;
                    cols_left <= cols_left - 1'b1;
                    if (cols_left <= 1)              state <= S_MAC_RUN;
                    else if (needs_act(next_addr))   state <= S_MAC_ACT;
                    else                             state <= S_MAC_RD;
                end
                S_MAC_DONE: state <= S_IDLE;

                default: state <= S_IDLE;
            endcase
        end
    end
endmodule
