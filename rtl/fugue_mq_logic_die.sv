// fugue_mq_logic_die.sv — Fugue MQ logic-die top (+ per-agent score store),
// with AGENTS-parameterized config tops for the design-choice sweep.
//
// Base = fugue2 (RoPE on the GPU: baseline + TLB + merge decoder).  The MQ
// batch replaces the single-agent diff_decoder with:
//   * mq_diff_decoder  — AGENTS-way D_i mask table (per-agent bitmap), the
//     master-write filter (write-order fix), the causal-drop comparator
//     (bank-whole prefill), and the same forward splice / reverse mask gate;
//   * mq_score_store   — per-agent score tile: AGENTS x SM_WORDS x 16 x FP32
//     flops.  Master-side writes land through drop-filtering (D_i + causal);
//     the diff path overwrites unconditionally; softmax reads the assembled
//     word of the selected agent.  This is the tile-scale stand-in for the
//     n_q-fold softmax-buffer residency (DATAFLOW.md §1/§3) — same convention
//     as the repo's LANES-wide softmax tile.
//
// Everything else (controller, TLB, GEMV substrate, softmax) is fugue2's.
module mq_score_store import fugue_pkg::*; #(
    parameter integer AGENTS = 16,
    parameter integer LANES  = SM_LANES,
    parameter integer W      = 32,
    parameter integer NWORDS = SM_WORDS
) (
    input  logic                      clk,
    input  logic                      rst_n,
    // master-side write (drop-filtered per lane)
    input  logic                      mwr_valid,
    input  logic [$clog2(AGENTS)-1:0] mwr_agent,
    input  logic [SM_WIDX_W-1:0]      mwr_idx,
    input  logic [LANES-1:0]          mwr_drop,
    input  logic [LANES-1:0][W-1:0]   mwr_data,
    // diff-side write (unconditional on its lanes)
    input  logic                      dwr_valid,
    input  logic [$clog2(AGENTS)-1:0] dwr_agent,
    input  logic [SM_WIDX_W-1:0]      dwr_idx,
    input  logic [LANES-1:0]          dwr_lanes,
    input  logic [LANES-1:0][W-1:0]   dwr_data,
    // read (to softmax)
    input  logic [$clog2(AGENTS)-1:0] rd_agent,
    input  logic [SM_WIDX_W-1:0]      rd_idx,
    output logic [LANES-1:0][W-1:0]   rd_data
);
    logic [LANES-1:0][W-1:0] store [AGENTS][NWORDS];
    always_ff @(posedge clk) begin
        for (int l = 0; l < LANES; l++) begin
            // diff wins on a same-cycle collision (the filter's contract).
            if (dwr_valid && dwr_lanes[l])
                store[dwr_agent][dwr_idx][l] <= dwr_data[l];
            else if (mwr_valid && !mwr_drop[l])
                store[mwr_agent][mwr_idx][l] <= mwr_data[l];
        end
    end
    assign rd_data = store[rd_agent][rd_idx];
endmodule


module fugue_mq_logic_die import fugue_pkg::*; #(
    parameter integer AGENTS = 16
) (
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

    // ---- MQ controls ----
    input  logic [$clog2(AGENTS)-1:0]  agent_sel,       // active agent of the transfer
    input  logic [$clog2(AGENTS)-1:0]  meta_agent,      // D_i bitmap load target
    input  logic [15:0]                q_pos,           // query position (causal drop)
    input  logic [15:0]                word_base_pos,   // token position of lane 0

    // ---- score path ----
    input  logic                       sm_start_ext,
    input  logic [SM_WIDX_W-1:0]       sm_word_idx,
    input  logic [SM_LANES-1:0][31:0]  sm_scores,       // master scores (banks)
    input  logic [SM_LANES-1:0][31:0]  diff_stream,     // compact diff scores
    output logic [SM_LANES-1:0][31:0]  sm_probs,
    output logic                       sm_valid,
    output logic [SM_LANES-1:0][31:0]  ctx_to_master,
    output logic [SM_LANES-1:0][31:0]  ctx_to_diff,

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

    tlb u_tlb (
        .clk(clk), .rst_n(rst_n),
        .req_valid(tlb_req_valid), .req_vpn(tlb_req_vpn),
        .base_ppn(tlb_base_ppn),
        .resp_valid(tlb_resp_valid), .resp_hit(tlb_resp_hit),
        .resp_ppn(tlb_resp_ppn), .busy(tlb_busy)
    );

    // ---------------- GEMV substrate (unchanged) ----------------
    logic [NUM_GEMV-1:0][15:0] gemv_res;
    logic [NUM_GEMV-1:0]       gemv_rv;
    genvar u;
    generate
        for (u = 0; u < NUM_GEMV; u++) begin : g_gemv
            gemv_unit u_gemv (
                .clk(clk), .rst_n(rst_n),
                .mat_wr_en(mat_wr_en), .mat_wr_addr(mat_wr_addr),
                .mat_wr_data(mat_wr_data), .mat_swap(mat_swap),
                .vec_wr_en(vec_wr_en), .vec_wr_addr(vec_wr_addr),
                .vec_wr_data(vec_wr_data), .vec_swap(vec_swap),
                .start(gemv_start), .row_addr(gemv_row_addr),
                .vec_addr(gemv_vec_addr), .op_is_score(op_is_score),
                .accum_clr(gemv_accum_clr), .accum_en(gemv_accum_en),
                .result(gemv_res[u]), .result_valid(gemv_rv[u])
            );
        end
    endgenerate

    accumulator #(.N(NUM_GEMV)) u_acc (
        .clk(clk), .rst_n(rst_n),
        .in_valid(gemv_rv[0]), .parts(gemv_res), .clr(acc_clr),
        .acc(result), .out_valid(result_valid)
    );

    // ---------------- MQ merge decoder + per-agent score store ----------------
    logic [SM_LANES-1:0][31:0]  sm_out;
    logic                       sm_busy;
    logic [SM_LANES-1:0]        master_wr_drop, causal_drop;
    logic [SM_LANES-1:0][31:0]  corrected_score;
    logic [SM_LANES-1:0]        corrected_mask;
    logic                       corrected_valid;

    mq_diff_decoder #(.AGENTS(AGENTS)) u_mqdiff (
        .clk(clk), .rst_n(rst_n),
        .meta_wr_en(meta_wr_en), .meta_wr_agent(meta_agent),
        .meta_wr_idx(meta_wr_idx), .meta_wr_mask(meta_wr_mask),
        .agent_sel(agent_sel),
        .wr_word_idx(sm_word_idx), .q_pos(q_pos),
        .word_base_pos(word_base_pos),
        .master_wr_drop(master_wr_drop), .causal_drop(causal_drop),
        .fwd_valid(sm_start_ext), .fwd_word_idx(sm_word_idx),
        .master_score(sm_scores), .diff_stream(diff_stream),
        .corrected_score(corrected_score), .corrected_mask(corrected_mask),
        .corrected_valid(corrected_valid),
        .rev_valid(sm_valid), .rev_word_idx(sm_word_idx),
        .prob(sm_out),
        .to_master(ctx_to_master), .to_diff(ctx_to_diff),
        .rev_valid_o()
    );

    logic [SM_LANES-1:0][31:0] assembled;
    mq_score_store #(.AGENTS(AGENTS)) u_store (
        .clk(clk), .rst_n(rst_n),
        // master path: dropped at D_i lanes and at non-causal lanes
        .mwr_valid(sm_start_ext), .mwr_agent(agent_sel), .mwr_idx(sm_word_idx),
        .mwr_drop(master_wr_drop | causal_drop), .mwr_data(sm_scores),
        // diff path: writes its lanes unconditionally (causal-gated)
        .dwr_valid(sm_start_ext), .dwr_agent(agent_sel), .dwr_idx(sm_word_idx),
        .dwr_lanes(corrected_mask & ~causal_drop), .dwr_data(corrected_score),
        .rd_agent(agent_sel), .rd_idx(sm_word_idx),
        .rd_data(assembled)
    );

    // ---------------- softmax over the assembled per-agent word ----------------
    softmax_unit #(.LANES(SM_LANES)) u_sfm (
        .clk(clk), .rst_n(rst_n),
        .start(sm_start_ext | sfm_start), .in_data(assembled),
        .out_data(sm_out), .out_valid(sm_valid), .busy(sm_busy)
    );
    assign sm_probs = sm_out;

    // Keep control-only broadcasts observable so they are not trimmed away.
    wire _unused = rotate_start | (|rotate_pos) | (|cfg_nhead) | (|cfg_dhead)
                 | (|cfg_seqlen) | sm_busy | tlb_resp_hit | corrected_valid
                 | (|corrected_mask);
endmodule

// ---------------------------------------------------------------------------
// Config tops for the AGENTS sweep.
// ---------------------------------------------------------------------------
module fugue_mq_a8 (
    input  logic clk, input logic rst_n,
    input  logic instr_valid, input logic [fugue_pkg::INSTR_W-1:0] instr_word,
    output logic instr_ready, output logic idle,
    input  logic mat_wr_en, input logic [3:0] mat_wr_addr,
    input  logic [fugue_pkg::VEC_W-1:0] mat_wr_data, input logic mat_swap,
    input  logic vec_wr_en, input logic [3:0] vec_wr_addr,
    input  logic [fugue_pkg::VEC_W-1:0] vec_wr_data, input logic vec_swap,
    input  logic [2:0] agent_sel, input logic [2:0] meta_agent,
    input  logic [15:0] q_pos, input logic [15:0] word_base_pos,
    input  logic sm_start_ext, input logic [fugue_pkg::SM_WIDX_W-1:0] sm_word_idx,
    input  logic [fugue_pkg::SM_LANES-1:0][31:0] sm_scores,
    input  logic [fugue_pkg::SM_LANES-1:0][31:0] diff_stream,
    output logic [fugue_pkg::SM_LANES-1:0][31:0] sm_probs, output logic sm_valid,
    output logic [fugue_pkg::SM_LANES-1:0][31:0] ctx_to_master,
    output logic [fugue_pkg::SM_LANES-1:0][31:0] ctx_to_diff,
    output fugue_pkg::dram_cmd_e dram_cmd,
    output logic [fugue_pkg::BANK_W-1:0] dram_bank,
    output logic [fugue_pkg::ROW_W-1:0] dram_row,
    output logic [fugue_pkg::COL_W-1:0] dram_col,
    output logic [15:0] result, output logic result_valid
);
    fugue_mq_logic_die #(.AGENTS(8)) u_die (.*);
endmodule

module fugue_mq_a16 (
    input  logic clk, input logic rst_n,
    input  logic instr_valid, input logic [fugue_pkg::INSTR_W-1:0] instr_word,
    output logic instr_ready, output logic idle,
    input  logic mat_wr_en, input logic [3:0] mat_wr_addr,
    input  logic [fugue_pkg::VEC_W-1:0] mat_wr_data, input logic mat_swap,
    input  logic vec_wr_en, input logic [3:0] vec_wr_addr,
    input  logic [fugue_pkg::VEC_W-1:0] vec_wr_data, input logic vec_swap,
    input  logic [3:0] agent_sel, input logic [3:0] meta_agent,
    input  logic [15:0] q_pos, input logic [15:0] word_base_pos,
    input  logic sm_start_ext, input logic [fugue_pkg::SM_WIDX_W-1:0] sm_word_idx,
    input  logic [fugue_pkg::SM_LANES-1:0][31:0] sm_scores,
    input  logic [fugue_pkg::SM_LANES-1:0][31:0] diff_stream,
    output logic [fugue_pkg::SM_LANES-1:0][31:0] sm_probs, output logic sm_valid,
    output logic [fugue_pkg::SM_LANES-1:0][31:0] ctx_to_master,
    output logic [fugue_pkg::SM_LANES-1:0][31:0] ctx_to_diff,
    output fugue_pkg::dram_cmd_e dram_cmd,
    output logic [fugue_pkg::BANK_W-1:0] dram_bank,
    output logic [fugue_pkg::ROW_W-1:0] dram_row,
    output logic [fugue_pkg::COL_W-1:0] dram_col,
    output logic [15:0] result, output logic result_valid
);
    fugue_mq_logic_die #(.AGENTS(16)) u_die (.*);
endmodule

module fugue_mq_a32 (
    input  logic clk, input logic rst_n,
    input  logic instr_valid, input logic [fugue_pkg::INSTR_W-1:0] instr_word,
    output logic instr_ready, output logic idle,
    input  logic mat_wr_en, input logic [3:0] mat_wr_addr,
    input  logic [fugue_pkg::VEC_W-1:0] mat_wr_data, input logic mat_swap,
    input  logic vec_wr_en, input logic [3:0] vec_wr_addr,
    input  logic [fugue_pkg::VEC_W-1:0] vec_wr_data, input logic vec_swap,
    input  logic [4:0] agent_sel, input logic [4:0] meta_agent,
    input  logic [15:0] q_pos, input logic [15:0] word_base_pos,
    input  logic sm_start_ext, input logic [fugue_pkg::SM_WIDX_W-1:0] sm_word_idx,
    input  logic [fugue_pkg::SM_LANES-1:0][31:0] sm_scores,
    input  logic [fugue_pkg::SM_LANES-1:0][31:0] diff_stream,
    output logic [fugue_pkg::SM_LANES-1:0][31:0] sm_probs, output logic sm_valid,
    output logic [fugue_pkg::SM_LANES-1:0][31:0] ctx_to_master,
    output logic [fugue_pkg::SM_LANES-1:0][31:0] ctx_to_diff,
    output fugue_pkg::dram_cmd_e dram_cmd,
    output logic [fugue_pkg::BANK_W-1:0] dram_bank,
    output logic [fugue_pkg::ROW_W-1:0] dram_row,
    output logic [fugue_pkg::COL_W-1:0] dram_col,
    output logic [15:0] result, output logic result_valid
);
    fugue_mq_logic_die #(.AGENTS(32)) u_die (.*);
endmodule
