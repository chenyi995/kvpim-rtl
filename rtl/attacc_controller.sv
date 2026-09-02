// attacc_controller.sv — the AttAcc HBM controller core (one per HBM), per the
// paper (§Controller) and the original attacc_drampim source
// (hbm3_pim_controller.cpp / gen_trace_attacc_bank.py):
//
//   * instruction queue (FIFO) + decoder: one Att_inst per PIM API call
//     (PIM_SET_CONFIG / ACT_AB / MAC_AB / SFM / WR_GB / MV_GB / MV_SB /
//      RD_SB / SET_META / ATTACH / ROTATE).
//   * config memory: N_head, d_head, L, KV base, partitioning (row/col-wise
//     per memory-node level), RoPE base, KV ctx, batch size, and the
//     per-request L table (paper: "batch size, and L of each request within
//     the batch").
//   * address generation + DRAM command FSM: PIM_MAC_AB is expanded through
//     the address-plan port (direct_addr_plan in AttAcc, kv_tlb_top in
//     Fugue) into physically contiguous runs; runs are cached in a small run
//     buffer so the context (S*V) traversal can replay them once per output
//     d_head chunk.  Columns are read 32 B at a time; a per-bank open-row
//     table inserts PRE/ACT only on row changes (the simulator's
//     RequireAllBanksRowOpen preq logic), and tRCD/tRP/tRAS/tCCD down-counters
//     gate command issue (HBM3-5.2Gbps constraints in controller ticks).
//   * GEMV pass control: score (Q*K^T) issues one adder-tree pass of
//     d_head/16 beats per token row; context (S*V) issues one
//     parallel-accumulate pass of total_rows beats per output chunk.
//
// The I/O + DMA engine of the paper's controller is the separate dma_engine
// module; the per-channel command bus fans out from this core.
module attacc_controller import fugue_pkg::*; import kv_tlb_pkg::*; #(
    parameter integer QDEPTH  = 8,
    parameter integer RUN_BUF = 16,
    // DRAM timing in controller clock ticks (HBM3-5.2Gbps at 666 MHz).
    parameter integer T_RCD = 10,
    parameter integer T_RP  = 10,
    parameter integer T_RAS = 23,
    parameter integer T_CCD = 1
) (
    input  logic                 clk,
    input  logic                 rst_n,

    // ---- host instruction input (I/O module side) ----
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
    output logic                 addr_fault,      // sticky: plan fault / run-buffer overflow

    // ---- DRAM command interface (per-channel command bus) ----
    output dram_cmd_e            dram_cmd,
    output logic [BANK_W-1:0]    dram_bank,
    output logic [ROW_W-1:0]     dram_row,
    output logic [COL_W-1:0]     dram_col,

    // ---- GEMV pass control (new gemv_unit protocol) ----
    output logic                 gemv_pass_start,
    output logic                 gemv_op_is_score,
    output logic [8:0]           gemv_num_beats,
    output logic                 gemv_acc_clr,
    output logic                 gemv_vec_wr,     // PIM_WR_GB / PIM_MV_GB strobe
    output logic [3:0]           gemv_vec_addr,
    output logic                 gemv_vec_swap,

    // ---- datapath strobes ----
    output logic                 sfm_start,       // PIM_SFM
    output logic                 mv_sb_start,     // PIM_MV_SB (GEMV -> softmax buffer)
    output logic                 rd_sb_start,     // PIM_RD_SB (softmax buffer -> host)
    output logic                 rotate_start,    // PIM_ROTATE (Fugue RoPE)
    output logic [15:0]          rotate_pos,
    output logic                 acc_bypass_bg,   // BG accumulator bypass/sum
    output logic                 acc_bypass_logic,// logic-die accumulator bypass/sum

    // ---- config broadcast ----
    output logic [31:0]          cfg_nhead,
    output logic [31:0]          cfg_dhead,
    output logic [31:0]          cfg_seqlen,
    output logic [31:0]          cfg_kvbase,
    output logic [31:0]          cfg_batch,
    input  logic [$clog2(REQ_TABLE_DEPTH)-1:0] req_rd_idx,
    output logic [15:0]          req_rd_len,      // per-request L table read

    // ---- diff-decoder metadata write (PIM_SET_META) ----
    output logic                 meta_wr_en,
    output logic [SM_WIDX_W-1:0] meta_wr_idx,
    output logic [$clog2(SM_CHANNELS)-1:0] meta_wr_channel,
    output logic [SM_PES_PER_CHANNEL-1:0]  meta_wr_mask
);
    localparam integer PW        = (QDEPTH <= 1) ? 1 : $clog2(QDEPTH);
    localparam integer RBW       = $clog2(RUN_BUF);
    localparam integer COL_SHIFT = $clog2(HBM_TX_BYTES);                    // 5
    localparam integer ROW_BITS  = CH_SHIFT - COL_SHIFT - COL_W - BANK_W;   // 15
    localparam integer NBANKS    = 1 << BANK_W;
    localparam integer TMR_W     = 6;

    // =====================================================================
    // Config memory
    // =====================================================================
    logic [31:0] cfg [NUM_CFG];
    logic [15:0] req_len_table [REQ_TABLE_DEPTH];
    // NOTE: unpacked-array reads feeding module outputs are written as
    // always_comb, not continuous assigns — iverilog 11 miscompiles
    // `assign out = array[idx];` in multi-module designs (outputs stick at X).
    always_comb begin
        cfg_nhead  = cfg[CFG_NHEAD];
        cfg_dhead  = cfg[CFG_DHEAD];
        cfg_seqlen = cfg[CFG_SEQLEN];
        cfg_kvbase = cfg[CFG_KVBASE];
        cfg_batch  = cfg[CFG_BATCH];
        // CFG_PARTMODE: bit0 = BG level row-wise (sum), bit1 = logic-die
        // level row-wise; a cleared bit selects the bypass path.
        acc_bypass_bg    = ~cfg[CFG_PARTMODE][0];
        acc_bypass_logic = ~cfg[CFG_PARTMODE][1];
    end

    logic [15:0] req_rd_len_q;
    always_ff @(posedge clk) req_rd_len_q <= req_len_table[req_rd_idx];
    assign req_rd_len = req_rd_len_q;

    // =====================================================================
    // Instruction FIFO
    // =====================================================================
    instr_t        fifo_mem [QDEPTH];
    logic [PW-1:0] wr_ptr, rd_ptr;
    logic [PW:0]   cnt;
    logic          full, empty;
    assign full        = (cnt == QDEPTH[PW:0]);
    assign empty       = (cnt == '0);
    assign instr_ready = ~full;

    instr_t cur, head;
    always_comb head = fifo_mem[rd_ptr];

    // =====================================================================
    // Address decode: 34-bit HBM byte address -> {bank, row, col}
    // =====================================================================
    function automatic logic [COL_W-1:0] col_of(input logic [KV_ADDR_W-1:0] a);
        return a[COL_SHIFT +: COL_W];
    endfunction
    function automatic logic [BANK_W-1:0] bank_of(input logic [KV_ADDR_W-1:0] a);
        return a[COL_SHIFT+COL_W +: BANK_W];
    endfunction
    function automatic logic [ROW_W-1:0] row_of(input logic [KV_ADDR_W-1:0] a);
        return {{(ROW_W-ROW_BITS){1'b0}}, a[COL_SHIFT+COL_W+BANK_W +: ROW_BITS]};
    endfunction

    // =====================================================================
    // Per-bank open-row table (the preq logic's bank state)
    // =====================================================================
    logic [NBANKS-1:0]           open_valid;
    logic [ROW_W-1:0]            open_row [NBANKS];

    function automatic logic row_hit(input logic [KV_ADDR_W-1:0] a);
        return open_valid[bank_of(a)] && (open_row[bank_of(a)] == row_of(a));
    endfunction
    function automatic logic needs_pre(input logic [KV_ADDR_W-1:0] a);
        return open_valid[bank_of(a)] && (open_row[bank_of(a)] != row_of(a));
    endfunction

    // =====================================================================
    // DRAM timing down-counters (issue gates)
    // =====================================================================
    logic [TMR_W-1:0] tmr_rcd, tmr_rp, tmr_ras, tmr_ccd;
    wire can_rd  = (tmr_rcd == '0) && (tmr_ccd == '0);
    wire can_act = (tmr_rp  == '0);
    wire can_pre = (tmr_ras == '0);

    // =====================================================================
    // Run buffer: physically contiguous runs collected from the plan port
    // =====================================================================
    logic [KV_ADDR_W-1:0] runbuf_base  [RUN_BUF];
    logic [CNT_W-1:0]     runbuf_count [RUN_BUF];
    logic [RBW:0]         n_runs;
    logic [8:0]           total_rows;         // saturates at 256 (GEMV buffer)
    logic                 run_overflow;

    // =====================================================================
    // MAC traversal state
    // =====================================================================
    logic                 mac_is_score;
    logic [8:0]           nb_score;           // d_head / 16
    logic [RBW:0]         run_idx;
    logic [CNT_W-1:0]     row_in_run;
    logic [3:0]           col_cnt;            // score: 0 .. nb_score-1
    logic [4:0]           chunk;              // context: output d_head chunk
    logic [KV_ADDR_W-1:0] cur_addr;
    logic [POS_W-1:0]     r_pos_lo, r_pos_hi;
    logic [1:0]           r_op;
    logic                 plan_finished, plan_faulted;

    logic [KV_ADDR_W-1:0] run_base_sel;
    logic [CNT_W-1:0]     run_count_sel;
    logic [4:0]           nchunks;
    always_comb begin
        run_base_sel  = runbuf_base[run_idx[RBW-1:0]];
        run_count_sel = runbuf_count[run_idx[RBW-1:0]];
        nchunks       = cfg[CFG_DHEAD][8:4];   // d_head/16 (<=16 buffer entries)
    end

    // =====================================================================
    // FSM
    // =====================================================================
    typedef enum logic [4:0] {
        S_IDLE, S_CFG, S_ROT, S_SFM, S_META, S_MISC, S_WRGB,
        S_ACTAB, S_ATTACH, S_ATTACH_W,
        S_MAC_PLAN, S_MAC_COLLECT,
        S_PASS_START, S_STEP, S_PRE, S_ACT, S_RD, S_NEXT, S_MAC_DONE
    } state_e;
    state_e state;

    assign idle = (state == S_IDLE) && empty;

    // plan port (Moore)
    assign plan_cmd_valid  = (state == S_MAC_PLAN) || (state == S_ATTACH);
    assign plan_cmd_op     = r_op;
    always_comb begin
        plan_cmd_ctx   = cfg[CFG_KVCTX][CTX_W-1:0];
        plan_cmd_layer = cfg[CFG_KVCTX][8 +: LAYER_W];
        plan_cmd_pools = (cfg[CFG_KVCTX][17:16] == 2'b00) ? 2'b01 : cfg[CFG_KVCTX][17:16];
    end
    assign plan_cmd_pos_lo = r_pos_lo;
    assign plan_cmd_pos_hi = r_pos_hi;
    assign run_ready       = (state == S_MAC_COLLECT);

    wire push = instr_valid & ~full;
    wire pop  = (state == S_IDLE) & ~empty;

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            state <= S_IDLE;
            wr_ptr <= '0; rd_ptr <= '0; cnt <= '0; cur <= '0;
            for (int i = 0; i < NUM_CFG; i++) cfg[i] <= '0;
            for (int i = 0; i < REQ_TABLE_DEPTH; i++) req_len_table[i] <= '0;
            open_valid <= '0;
            for (int i = 0; i < NBANKS; i++) open_row[i] <= '0;
            tmr_rcd <= '0; tmr_rp <= '0; tmr_ras <= '0; tmr_ccd <= '0;
            n_runs <= '0; total_rows <= '0; run_overflow <= 1'b0;
            for (int i = 0; i < RUN_BUF; i++) begin
                runbuf_base[i] <= '0; runbuf_count[i] <= '0;
            end
            mac_is_score <= 1'b1; nb_score <= 9'd8;
            run_idx <= '0; row_in_run <= '0; col_cnt <= '0; chunk <= '0;
            cur_addr <= '0; r_pos_lo <= '0; r_pos_hi <= '0; r_op <= OP_PLAN;
            plan_finished <= 1'b0; plan_faulted <= 1'b0; addr_fault <= 1'b0;
            dram_cmd <= DR_NOP; dram_bank <= '0; dram_row <= '0; dram_col <= '0;
            gemv_pass_start <= 1'b0; gemv_op_is_score <= 1'b1;
            gemv_num_beats <= '0; gemv_acc_clr <= 1'b0;
            gemv_vec_wr <= 1'b0; gemv_vec_addr <= '0; gemv_vec_swap <= 1'b0;
            sfm_start <= 1'b0; mv_sb_start <= 1'b0; rd_sb_start <= 1'b0;
            rotate_start <= 1'b0; rotate_pos <= '0;
            meta_wr_en <= 1'b0; meta_wr_idx <= '0; meta_wr_channel <= '0; meta_wr_mask <= '0;
        end else begin
            // ---- FIFO write ----
            if (push) begin
                fifo_mem[wr_ptr] <= instr_word;
                wr_ptr <= (wr_ptr == (QDEPTH-1)) ? '0 : wr_ptr + 1'b1;
            end
            cnt <= cnt + (push ? 1 : 0) - (pop ? 1 : 0);

            // ---- default (deassert) all pulses ----
            dram_cmd        <= DR_NOP;
            gemv_pass_start <= 1'b0;
            gemv_vec_wr     <= 1'b0;
            gemv_vec_swap   <= 1'b0;
            sfm_start       <= 1'b0;
            mv_sb_start     <= 1'b0;
            rd_sb_start     <= 1'b0;
            rotate_start    <= 1'b0;
            meta_wr_en      <= 1'b0;

            // ---- timing counters tick every cycle ----
            if (tmr_rcd != '0) tmr_rcd <= tmr_rcd - 1'b1;
            if (tmr_rp  != '0) tmr_rp  <= tmr_rp  - 1'b1;
            if (tmr_ras != '0) tmr_ras <= tmr_ras - 1'b1;
            if (tmr_ccd != '0) tmr_ccd <= tmr_ccd - 1'b1;

            // plan completion may pulse while runs are still being collected.
            if (plan_cmd_done) begin
                plan_finished <= 1'b1;
                plan_faulted  <= plan_cmd_fault;
            end

            unique case (state)
                // ---------------- fetch / dispatch ----------------
                S_IDLE: begin
                    if (~empty) begin
                        cur    <= fifo_mem[rd_ptr];
                        rd_ptr <= (rd_ptr == (QDEPTH-1)) ? '0 : rd_ptr + 1'b1;
                        unique case (head.op)
                            PIM_SET_CONFIG: state <= S_CFG;
                            PIM_ROTATE:     state <= S_ROT;
                            PIM_SFM:        state <= S_SFM;
                            PIM_SET_META:   state <= S_META;
                            PIM_WR_GB,
                            PIM_MV_GB:      state <= S_WRGB;
                            PIM_ACT_AB:     state <= S_ACTAB;
                            PIM_ATTACH: begin
                                r_op          <= head.imm[0] ? OP_FLUSH : OP_ATTACH;
                                plan_finished <= 1'b0; plan_faulted <= 1'b0; addr_fault <= 1'b0;
                                state         <= S_ATTACH;
                            end
                            PIM_MAC_AB: begin
                                mac_is_score  <= (head.mode == OP_SCORE);
                                nb_score      <= cfg[CFG_DHEAD][12:4];
                                r_op          <= OP_PLAN;
                                r_pos_lo      <= head.vaddr[POS_W-1:0];
                                r_pos_hi      <= head.vaddr[POS_W-1:0] + head.len;
                                n_runs        <= '0; total_rows <= '0; run_overflow <= 1'b0;
                                plan_finished <= 1'b0; plan_faulted <= 1'b0; addr_fault <= 1'b0;
                                state         <= (head.len == 16'd0) ? S_MAC_DONE : S_MAC_PLAN;
                            end
                            default:        state <= S_MISC;   // MV_SB / RD_SB / NOP
                        endcase
                    end
                end

                // ---------------- config memory write ----------------
                S_CFG: begin
                    if (cur.cfg_idx == CFG_BATCH && cur.imm[15])
                        req_len_table[cur.imm[$clog2(REQ_TABLE_DEPTH)-1:0]] <= cur.vaddr[15:0];
                    else
                        cfg[cur.cfg_idx] <= cur.vaddr;
                    state <= S_IDLE;
                end

                // ---------------- single-strobe instructions ----------------
                S_ROT: begin
                    rotate_start <= 1'b1;
                    rotate_pos   <= cur.imm;
                    state        <= S_IDLE;
                end
                S_SFM: begin
                    sfm_start <= 1'b1;
                    state     <= S_IDLE;
                end
                S_META: begin
                    meta_wr_en      <= 1'b1;
                    meta_wr_idx     <= cur.imm[SM_WIDX_W-1:0];
                    meta_wr_channel <= cur.imm[15:12];
                    meta_wr_mask    <= cur.vaddr[SM_PES_PER_CHANNEL-1:0];
                    state           <= S_IDLE;
                end
                S_WRGB: begin
                    // Write one 256-bit vector word into the GEMV buffer's
                    // fill copy (data rides the external write bus).
                    // imm[3:0] = buffer entry; imm[4] = swap after the write.
                    gemv_vec_wr   <= 1'b1;
                    gemv_vec_addr <= cur.imm[3:0];
                    gemv_vec_swap <= cur.imm[4];
                    state         <= S_IDLE;
                end
                S_ACTAB: begin
                    // Explicit all-bank activate: same row in every bank.
                    dram_cmd <= DR_ACT;
                    dram_row <= cur.vaddr[ROW_W-1:0];
                    open_valid <= '1;
                    for (int b = 0; b < NBANKS; b++) open_row[b] <= cur.vaddr[ROW_W-1:0];
                    tmr_rcd <= TMR_W'(T_RCD); tmr_ras <= TMR_W'(T_RAS);
                    state <= S_IDLE;
                end
                S_MISC: begin
                    // MV_SB / RD_SB are data-movement strobes for the
                    // bank->die / die->host paths; NOP falls through.
                    if (cur.op == PIM_MV_SB) mv_sb_start <= 1'b1;
                    if (cur.op == PIM_RD_SB) rd_sb_start <= 1'b1;
                    state <= S_IDLE;
                end

                // ---------------- KV TLB attach / flush ----------------
                S_ATTACH:   if (plan_cmd_ready) state <= S_ATTACH_W;
                S_ATTACH_W: begin
                    if (plan_finished || plan_cmd_done) begin
                        addr_fault <= plan_finished ? plan_faulted : plan_cmd_fault;
                        state      <= S_IDLE;
                    end
                end

                // ---------------- MAC: plan + collect runs ----------------
                S_MAC_PLAN: if (plan_cmd_ready) state <= S_MAC_COLLECT;
                S_MAC_COLLECT: begin
                    if (run_valid) begin
                        if (n_runs == RUN_BUF[RBW:0]) begin
                            run_overflow <= 1'b1;
                        end else begin
                            runbuf_base [n_runs[RBW-1:0]] <= run_key_base;
                            runbuf_count[n_runs[RBW-1:0]] <= run_count;
                            n_runs <= n_runs + 1'b1;
                            // total_rows saturates at the GEMV-buffer capacity
                            // (256 scores); larger L chains a second MAC_AB.
                            total_rows <= (({1'b0, total_rows} + {1'b0, run_count[8:0]}) > 10'd256)
                                          ? 9'd256
                                          : total_rows + run_count[8:0];
                        end
                    end else if (plan_finished) begin
                        addr_fault <= plan_faulted | run_overflow;
                        if (plan_faulted || (n_runs == '0)) state <= S_MAC_DONE;
                        else begin
                            run_idx <= '0; row_in_run <= '0; chunk <= '0;
                            state   <= S_PASS_START;
                        end
                    end
                end

                // ---------------- MAC: execute passes ----------------
                // score : one tree pass per token row (nb_score beats).
                // context: one parallel-accumulate pass per output chunk
                //          (total_rows beats), replaying the run buffer.
                S_PASS_START: begin
                    gemv_pass_start  <= 1'b1;
                    gemv_op_is_score <= mac_is_score;
                    gemv_num_beats   <= mac_is_score ? nb_score : total_rows;
                    gemv_acc_clr     <= 1'b1;
                    col_cnt          <= '0;
                    cur_addr         <= mac_is_score
                        ? run_base_sel + (KV_ADDR_W'(row_in_run) << STRIDE_SHIFT)
                        : run_base_sel + (KV_ADDR_W'(chunk) << COL_SHIFT);
                    state <= S_STEP;
                end

                // Decide + wait: PRE (row conflict), ACT (row closed), RD (hit).
                S_STEP: begin
                    if (needs_pre(cur_addr)) begin
                        if (can_pre) state <= S_PRE;
                    end else if (!row_hit(cur_addr)) begin
                        if (can_act) state <= S_ACT;
                    end else if (can_rd) begin
                        state <= S_RD;
                    end
                end
                S_PRE: begin
                    dram_cmd  <= DR_PRE;
                    dram_bank <= bank_of(cur_addr);
                    open_valid[bank_of(cur_addr)] <= 1'b0;
                    tmr_rp <= TMR_W'(T_RP);
                    state  <= S_STEP;
                end
                S_ACT: begin
                    dram_cmd  <= DR_ACT;
                    dram_bank <= bank_of(cur_addr);
                    dram_row  <= row_of(cur_addr);
                    open_valid[bank_of(cur_addr)] <= 1'b1;
                    open_row[bank_of(cur_addr)]   <= row_of(cur_addr);
                    tmr_rcd <= TMR_W'(T_RCD);
                    tmr_ras <= TMR_W'(T_RAS);
                    state   <= S_STEP;
                end
                S_RD: begin
                    // One 32-B column read = one 16-lane FP16 beat into the
                    // GEMV units (PIM_MAC_AB data path).
                    dram_cmd <= DR_RD;
                    dram_bank<= bank_of(cur_addr);
                    dram_col <= col_of(cur_addr);
                    tmr_ccd  <= TMR_W'(T_CCD - 1);
                    state    <= S_NEXT;
                end
                S_NEXT: begin
                    if (mac_is_score) begin
                        // next of nb_score columns of this token's K row
                        if ({5'd0, col_cnt} != nb_score - 9'd1) begin
                            col_cnt  <= col_cnt + 4'd1;
                            cur_addr <= cur_addr + KV_ADDR_W'(HBM_TX_BYTES);
                            state    <= S_STEP;
                        end else if (row_in_run != run_count_sel - 1'b1) begin
                            row_in_run <= row_in_run + 1'b1;
                            state      <= S_PASS_START;
                        end else if (run_idx != n_runs - 1'b1) begin
                            run_idx    <= run_idx + 1'b1;
                            row_in_run <= '0;
                            state      <= S_PASS_START;
                        end else begin
                            state <= S_MAC_DONE;
                        end
                    end else begin
                        // context: same chunk column of the next token row
                        if (row_in_run != run_count_sel - 1'b1) begin
                            row_in_run <= row_in_run + 1'b1;
                            cur_addr   <= cur_addr + KV_ADDR_W'(VEC_BYTES);
                            state      <= S_STEP;
                        end else if (run_idx != n_runs - 1'b1) begin
                            run_idx    <= run_idx + 1'b1;
                            row_in_run <= '0;
                            cur_addr   <= runbuf_base[run_idx[RBW-1:0] + 1'b1]
                                          + (KV_ADDR_W'(chunk) << COL_SHIFT);
                            state      <= S_STEP;
                        end else if ({4'd0, chunk} != {3'd0, nchunks} - 6'd1) begin
                            chunk      <= chunk + 5'd1;
                            run_idx    <= '0;
                            row_in_run <= '0;
                            state      <= S_PASS_START;
                        end else begin
                            state <= S_MAC_DONE;
                        end
                    end
                end

                S_MAC_DONE: state <= S_IDLE;
                default:    state <= S_IDLE;
            endcase
        end
    end
endmodule
