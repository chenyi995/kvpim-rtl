// mq_diff_decoder.sv — multi-agent (MQ) master-diff merge decoder.
//
// Generalizes diff_decoder to the Fugue MQ batch: the metadata buffer holds
// one D_i mask table PER RESIDENT AGENT (the per-agent D_i bitmap of
// attacc_drampim_xinyao/experiments/mq_command/DATAFLOW.md §6-1), selected by
// `agent_sel`.  Three consumers share the one table:
//
//   1) master-write filter (§6-1, the write-order fix): `master_wr_drop[l]`
//      is asserted for lanes the selected agent overrides, so master-side
//      score writes at D_i are DROPPED regardless of diff/master arrival
//      order (the diff path writes unconditionally).
//   2) forward splice: compact diff scores scattered by prefix-popcount rank,
//      overwriting the master lanes — unchanged from diff_decoder.
//   3) reverse mask gate: probabilities split to master/diff — unchanged.
//
// Plus the bank-whole prefill causal drop (§6-2): `causal_drop[l]` is
// asserted for lanes whose token position (word_base + l) exceeds the
// query's own position `q_pos` — one comparator per lane, applied wherever
// scores enter the per-agent score store.
module mq_diff_decoder import fugue_pkg::*; #(
    parameter integer AGENTS = 16,         // resident agents (n_q)
    parameter integer LANES  = SM_LANES,
    parameter integer W      = 32,
    parameter integer NWORDS = SM_WORDS,
    parameter integer POS_W  = 16
) (
    input  logic                      clk,
    input  logic                      rst_n,

    // ---- control: load one (agent, word) mask (PIM_SET_META + agent id) ----
    input  logic                      meta_wr_en,
    input  logic [$clog2(AGENTS)-1:0] meta_wr_agent,
    input  logic [SM_WIDX_W-1:0]      meta_wr_idx,
    input  logic [LANES-1:0]          meta_wr_mask,

    // ---- the active agent of the current word transfer ----
    input  logic [$clog2(AGENTS)-1:0] agent_sel,

    // ---- master-write filter + causal drop (score-store write side) ----
    input  logic [SM_WIDX_W-1:0]      wr_word_idx,
    input  logic [POS_W-1:0]          q_pos,          // query's own position
    input  logic [POS_W-1:0]          word_base_pos,  // token position of lane 0
    output logic [LANES-1:0]          master_wr_drop, // D_i lanes: drop master
    output logic [LANES-1:0]          causal_drop,    // future lanes: drop all

    // ---- forward: master + compact diff -> corrected word ----
    input  logic                      fwd_valid,
    input  logic [SM_WIDX_W-1:0]      fwd_word_idx,
    input  logic [LANES-1:0][W-1:0]   master_score,
    input  logic [LANES-1:0][W-1:0]   diff_stream,
    output logic [LANES-1:0][W-1:0]   corrected_score,
    output logic [LANES-1:0]          corrected_mask,
    output logic                      corrected_valid,

    // ---- reverse: probabilities split by the selected agent's mask ----
    input  logic                      rev_valid,
    input  logic [SM_WIDX_W-1:0]      rev_word_idx,
    input  logic [LANES-1:0][W-1:0]   prob,
    output logic [LANES-1:0][W-1:0]   to_master,
    output logic [LANES-1:0][W-1:0]   to_diff,
    output logic                      rev_valid_o
);
    localparam integer RANKW = (LANES <= 1) ? 1 : $clog2(LANES);

    // ---- per-agent metadata: AGENTS x NWORDS x LANES-bit D_i masks ----
    logic [LANES-1:0] diff_mask [AGENTS][NWORDS];
    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            for (int a = 0; a < AGENTS; a++)
                for (int i = 0; i < NWORDS; i++)
                    diff_mask[a][i] <= '0;
        end else if (meta_wr_en) begin
            diff_mask[meta_wr_agent][meta_wr_idx] <= meta_wr_mask;
        end
    end

    // ---- master-write filter + causal comparator ----
    assign master_wr_drop = diff_mask[agent_sel][wr_word_idx];
    genvar c;
    generate
        for (c = 0; c < LANES; c++) begin : g_causal
            assign causal_drop[c] =
                ((word_base_pos + POS_W'(c)) > q_pos);
        end
    endgenerate

    // ---- forward splice (per the selected agent) ----
    logic [LANES-1:0] fmask;
    assign fmask = diff_mask[agent_sel][fwd_word_idx];

    logic [RANKW-1:0] rank [LANES];
    always_comb begin
        integer acc;
        acc = 0;
        for (int l = 0; l < LANES; l++) begin
            rank[l] = acc[RANKW-1:0];
            if (fmask[l]) acc = acc + 1;
        end
    end
    genvar g;
    generate
        for (g = 0; g < LANES; g++) begin : g_fwd
            assign corrected_score[g] = fmask[g] ? diff_stream[rank[g]]
                                                 : master_score[g];
        end
    endgenerate
    assign corrected_mask  = fmask;
    assign corrected_valid = fwd_valid;

    // ---- reverse mask gate (per the selected agent) ----
    logic [LANES-1:0] rmask;
    assign rmask = diff_mask[agent_sel][rev_word_idx];
    generate
        for (g = 0; g < LANES; g++) begin : g_rev
            assign to_master[g] = rmask[g] ? '0      : prob[g];
            assign to_diff[g]   = rmask[g] ? prob[g] : '0;
        end
    endgenerate
    assign rev_valid_o = rev_valid;
endmodule
