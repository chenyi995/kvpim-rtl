// attacc_logic_die.sv — AttAcc-ORIGINAL HBM logic-die top (BASELINE).
//
// The buffer-die logic of AttAcc, WITHOUT any of Fugue's additions: no KV TLB
// (addresses are computed directly), no on-die RoPE rotate unit, and no
// master-diff diff_decoder. Instantiates only GEMV units + softmax +
// accumulator + the AttAcc controller. Synthesized head-to-head against
// fugue_logic_die so the area/power/timing delta isolates exactly the cost of
// Fugue's added hardware (TLB CAM + rotate_q_unit + diff_decoder).
module attacc_logic_die import fugue_pkg::*; (
    input  logic                       clk,
    input  logic                       rst_n,

    // ---- host instruction stream ----
    input  logic                       instr_valid,
    input  logic [INSTR_W-1:0]         instr_word,
    output logic                       instr_ready,
    output logic                       idle,

    // ---- GEMV operand fills ----
    input  logic                       mat_wr_en,
    input  logic [3:0]                 mat_wr_addr,
    input  logic [VEC_W-1:0]           mat_wr_data,
    input  logic                       mat_swap,
    input  logic                       vec_wr_en,
    input  logic [3:0]                 vec_wr_addr,
    input  logic [VEC_W-1:0]           vec_wr_data,
    input  logic                       vec_swap,

    // ---- softmax score load / probability out ----
    input  logic                       sm_start_ext,
    input  logic [SM_LANES-1:0][31:0]  sm_scores,
    output logic [SM_LANES-1:0][31:0]  sm_probs,
    output logic                       sm_valid,

    // ---- DRAM command interface ----
    output dram_cmd_e                  dram_cmd,
    output logic [BANK_W-1:0]          dram_bank,
    output logic [ROW_W-1:0]           dram_row,
    output logic [COL_W-1:0]           dram_col,

    // ---- reduced GEMV result ----
    output logic [15:0]                result,
    output logic                       result_valid
);
    // ---------------- controller <-> datapath nets ----------------
    logic                tlb_req_valid;
    logic [VPN_W-1:0]    tlb_req_vpn;
    logic [PPN_W-1:0]    tlb_base_ppn, tlb_resp_ppn;
    logic                tlb_resp_hit, tlb_resp_valid, tlb_busy;

    logic                gemv_start, gemv_accum_en, gemv_accum_clr;
    logic [3:0]          gemv_row_addr, gemv_vec_addr;
    opmode_e             op_mode;
    logic                rotate_start, sfm_start, acc_clr;
    logic [15:0]         rotate_pos;
    logic [31:0]         cfg_nhead, cfg_dhead, cfg_seqlen;
    logic                meta_wr_en;
    logic [SM_WIDX_W-1:0] meta_wr_idx;
    logic [SM_LANES-1:0] meta_wr_mask;

    wire op_is_score = (op_mode == OP_SCORE);

    // ---------------- controller ----------------
    // Same AttAcc controller; its TLB port is served by DIRECT addressing
    // (a 1-cycle add, no CAM) — this is AttAcc's non-translated address path.
    attacc_controller u_ctrl (
        .clk(clk), .rst_n(rst_n),
        .instr_valid(instr_valid), .instr_word(instr_word),
        .instr_ready(instr_ready), .idle(idle),
        .tlb_req_valid(tlb_req_valid), .tlb_req_vpn(tlb_req_vpn),
        .tlb_base_ppn(tlb_base_ppn), .tlb_resp_ppn(tlb_resp_ppn),
        .tlb_resp_hit(tlb_resp_hit), .tlb_resp_valid(tlb_resp_valid),
        .tlb_busy(tlb_busy),
        .dram_cmd(dram_cmd), .dram_bank(dram_bank),
        .dram_row(dram_row), .dram_col(dram_col),
        .gemv_start(gemv_start), .gemv_row_addr(gemv_row_addr),
        .gemv_vec_addr(gemv_vec_addr), .gemv_accum_en(gemv_accum_en),
        .gemv_accum_clr(gemv_accum_clr), .op_mode(op_mode),
        .rotate_start(rotate_start), .rotate_pos(rotate_pos),
        .sfm_start(sfm_start), .acc_clr(acc_clr),
        .cfg_nhead(cfg_nhead), .cfg_dhead(cfg_dhead), .cfg_seqlen(cfg_seqlen),
        .meta_wr_en(meta_wr_en), .meta_wr_idx(meta_wr_idx), .meta_wr_mask(meta_wr_mask)
    );

    // Direct address path (no TLB CAM): 1-cycle add, always "hit".
    logic             tlb_rv_d;
    logic [PPN_W-1:0] tlb_ppn_d;
    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            tlb_rv_d  <= 1'b0;
            tlb_ppn_d <= '0;
        end else begin
            tlb_rv_d  <= tlb_req_valid;
            tlb_ppn_d <= tlb_base_ppn + tlb_req_vpn[PPN_W-1:0];
        end
    end
    assign tlb_resp_valid = tlb_rv_d;
    assign tlb_resp_ppn   = tlb_ppn_d;
    assign tlb_resp_hit   = 1'b1;
    assign tlb_busy       = 1'b0;

    // ---------------- NUM_GEMV GEMV units + accumulator ----------------
    logic [NUM_GEMV-1:0][15:0] gemv_res;
    logic [NUM_GEMV-1:0]       gemv_rv;

    genvar g;
    generate
        for (g = 0; g < NUM_GEMV; g++) begin : g_gemv
            gemv_unit u_gemv (
                .clk(clk), .rst_n(rst_n),
                .mat_wr_en(mat_wr_en), .mat_wr_addr(mat_wr_addr),
                .mat_wr_data(mat_wr_data), .mat_swap(mat_swap),
                .vec_wr_en(vec_wr_en), .vec_wr_addr(vec_wr_addr),
                .vec_wr_data(vec_wr_data), .vec_swap(vec_swap),
                .start(gemv_start), .row_addr(gemv_row_addr),
                .vec_addr(gemv_vec_addr), .op_is_score(op_is_score),
                .accum_clr(gemv_accum_clr), .accum_en(gemv_accum_en),
                .result(gemv_res[g]), .result_valid(gemv_rv[g])
            );
        end
    endgenerate

    accumulator #(.N(NUM_GEMV)) u_acc (
        .clk(clk), .rst_n(rst_n),
        .in_valid(gemv_rv[0]), .parts(gemv_res), .clr(acc_clr),
        .acc(result), .out_valid(result_valid)
    );

    // ---------------- softmax (fed directly; no diff overwrite) ----------------
    wire sm_start = sfm_start | sm_start_ext;
    logic sm_busy;
    softmax_unit #(.LANES(SM_LANES)) u_sfm (
        .clk(clk), .rst_n(rst_n),
        .start(sm_start), .in_data(sm_scores),
        .out_data(sm_probs), .out_valid(sm_valid), .busy(sm_busy)
    );

    // Keep control-only broadcasts observable (rotate/meta unused in baseline).
    wire _unused = rotate_start | (|rotate_pos) | (|cfg_nhead) | (|cfg_dhead)
                 | (|cfg_seqlen) | sm_busy | meta_wr_en | (|meta_wr_idx)
                 | (|meta_wr_mask);

endmodule
