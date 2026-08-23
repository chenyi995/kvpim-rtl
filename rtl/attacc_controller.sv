// attacc_controller.sv — Fugue logic-die control (AttAcc controller + Fugue
// address translation).  Contains: an instruction queue (FIFO), an instruction
// decoder, a config-register file, a TLB-driven address generator, and a DRAM
// command FSM.  Decodes the PIM command set (SET_CONFIG / ACT_AB / MAC_AB /
// SFM / ROTATE / MV / WR / RD) into datapath control + DRAM commands.
//
// Registered (Moore) control outputs — every pulse is defaulted to 0 each cycle
// so no latches are inferred.  Single-instruction-at-a-time execution; the FIFO
// smooths host issue.
module attacc_controller import fugue_pkg::*; #(
    parameter int unsigned QDEPTH = 8
) (
    input  logic                clk,
    input  logic                rst_n,

    // ---- host instruction input ----
    input  logic                instr_valid,
    input  logic [INSTR_W-1:0]  instr_word,
    output logic                instr_ready,
    output logic                idle,

    // ---- TLB interface ----
    output logic                tlb_req_valid,
    output logic [VPN_W-1:0]    tlb_req_vpn,
    output logic [PPN_W-1:0]    tlb_base_ppn,
    input  logic [PPN_W-1:0]    tlb_resp_ppn,
    input  logic                tlb_resp_hit,
    input  logic                tlb_resp_valid,
    input  logic                tlb_busy,

    // ---- DRAM command interface ----
    output dram_cmd_e           dram_cmd,
    output logic [BANK_W-1:0]   dram_bank,
    output logic [ROW_W-1:0]    dram_row,
    output logic [COL_W-1:0]    dram_col,

    // ---- datapath control ----
    output logic                gemv_start,
    output logic [3:0]          gemv_row_addr,
    output logic [3:0]          gemv_vec_addr,
    output logic                gemv_accum_en,
    output logic                gemv_accum_clr,
    output opmode_e             op_mode,
    output logic                rotate_start,
    output logic [15:0]         rotate_pos,
    output logic                sfm_start,
    output logic                acc_clr,

    // ---- config broadcast ----
    output logic [31:0]         cfg_nhead,
    output logic [31:0]         cfg_dhead,
    output logic [31:0]         cfg_seqlen,

    // ---- diff-decoder metadata write (PIM_SET_META), mirrors cfg[] write ----
    output logic                 meta_wr_en,
    output logic [SM_WIDX_W-1:0] meta_wr_idx,
    output logic [SM_LANES-1:0]  meta_wr_mask
);
    localparam int unsigned PW = (QDEPTH <= 1) ? 1 : $clog2(QDEPTH);

    // ---- config register file ----
    logic [31:0] cfg [NUM_CFG];
    assign cfg_nhead      = cfg[CFG_NHEAD];
    assign cfg_dhead      = cfg[CFG_DHEAD];
    assign cfg_seqlen     = cfg[CFG_SEQLEN];
    assign tlb_base_ppn   = cfg[CFG_KVBASE][PPN_W-1:0];

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
    logic [LADDR_W-1:0] laddr;      // running logical address for MAC
    logic [15:0]        beat, len;

    wire [LADDR_W-1:0]  cur_addr = laddr;
    wire [VPN_W-1:0]    cur_vpn  = cur_addr[LADDR_W-1:PGOFF_W];
    wire [COL_W-1:0]    cur_col  = cur_addr[PGOFF_W-1:0];
    logic [PPN_W-1:0]   cur_ppn;

    // ---- FSM ----
    typedef enum logic [3:0] {
        S_IDLE, S_CFG, S_ROT, S_SFM, S_MISC, S_META,
        S_MAC_TLB, S_MAC_TLBW, S_MAC_ACT, S_MAC_RD, S_MAC_NEXT, S_MAC_DONE
    } state_e;
    state_e state;

    assign idle = (state == S_IDLE) && empty;

    // combinational push/pop bookkeeping
    wire push = instr_valid & ~full;
    wire pop  = (state == S_IDLE) & ~empty;

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            state <= S_IDLE;
            wr_ptr <= '0; rd_ptr <= '0; cnt <= '0;
            beat <= '0; len <= '0; laddr <= '0; cur_ppn <= '0;
            cur <= '0;
            for (int i = 0; i < NUM_CFG; i++) cfg[i] <= '0;
            // control defaults
            tlb_req_valid <= 1'b0; tlb_req_vpn <= '0;
            dram_cmd <= DR_NOP; dram_bank <= '0; dram_row <= '0; dram_col <= '0;
            gemv_start <= 1'b0; gemv_row_addr <= '0; gemv_vec_addr <= '0;
            gemv_accum_en <= 1'b0; gemv_accum_clr <= 1'b0; op_mode <= OP_SCORE;
            rotate_start <= 1'b0; rotate_pos <= '0; sfm_start <= 1'b0; acc_clr <= 1'b0;
            meta_wr_en <= 1'b0; meta_wr_idx <= '0; meta_wr_mask <= '0;
        end else begin
            // ---- FIFO write ----
            if (push) begin
                fifo_mem[wr_ptr] <= instr_t'(instr_word);
                wr_ptr <= (wr_ptr == PW'(QDEPTH-1)) ? '0 : wr_ptr + 1'b1;
            end
            cnt <= cnt + (push ? 1 : 0) - (pop ? 1 : 0);

            // ---- default (deassert) all pulses each cycle ----
            tlb_req_valid  <= 1'b0;
            dram_cmd       <= DR_NOP;
            gemv_start     <= 1'b0;
            gemv_accum_en  <= 1'b0;
            gemv_accum_clr <= 1'b0;
            rotate_start   <= 1'b0;
            sfm_start      <= 1'b0;
            acc_clr        <= 1'b0;
            meta_wr_en     <= 1'b0;

            unique case (state)
                // -------- fetch / dispatch --------
                S_IDLE: begin
                    if (~empty) begin
                        cur    <= fifo_mem[rd_ptr];
                        rd_ptr <= (rd_ptr == PW'(QDEPTH-1)) ? '0 : rd_ptr + 1'b1;
                        unique case (fifo_mem[rd_ptr].op)
                            PIM_SET_CONFIG: state <= S_CFG;
                            PIM_ROTATE:     state <= S_ROT;
                            PIM_SFM:        state <= S_SFM;
                            PIM_SET_META:   state <= S_META;
                            PIM_MAC_AB: begin
                                op_mode <= opmode_e'(fifo_mem[rd_ptr].mode);
                                len     <= fifo_mem[rd_ptr].len;
                                beat    <= 16'd0;
                                laddr   <= fifo_mem[rd_ptr].vaddr;
                                state   <= (fifo_mem[rd_ptr].len == 16'd0) ? S_MAC_DONE : S_MAC_TLB;
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
                    meta_wr_mask <= cur.vaddr[SM_LANES-1:0];
                    state        <= S_IDLE;
                end

                // -------- misc control-only ops --------
                S_MISC: begin
                    acc_clr <= 1'b1;                // e.g. clear before a new head
                    state   <= S_IDLE;
                end

                // -------- MAC / GEMV over `len` columns --------
                S_MAC_TLB: begin
                    tlb_req_valid <= 1'b1;
                    tlb_req_vpn   <= cur_vpn;
                    state         <= S_MAC_TLBW;
                end
                S_MAC_TLBW: begin
                    if (tlb_resp_valid) begin
                        cur_ppn <= tlb_resp_ppn;
                        state   <= S_MAC_ACT;
                    end
                end
                S_MAC_ACT: begin
                    dram_cmd  <= DR_ACT;
                    dram_bank <= cur_ppn[PPN_W-1:ROW_W];
                    dram_row  <= cur_ppn[ROW_W-1:0];
                    state     <= S_MAC_RD;
                end
                S_MAC_RD: begin
                    dram_cmd       <= DR_RD;
                    dram_col       <= cur_col;
                    gemv_start     <= 1'b1;
                    gemv_row_addr  <= beat[3:0];
                    gemv_vec_addr  <= beat[3:0];
                    gemv_accum_en  <= 1'b1;
                    gemv_accum_clr <= (beat == 16'd0);
                    state          <= S_MAC_NEXT;
                end
                S_MAC_NEXT: begin
                    beat  <= beat + 16'd1;
                    laddr <= laddr + 1'b1;
                    state <= (beat + 16'd1 < len) ? S_MAC_TLB : S_MAC_DONE;
                end
                S_MAC_DONE: state <= S_IDLE;

                default: state <= S_IDLE;
            endcase
        end
    end
endmodule
