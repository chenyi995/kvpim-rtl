// diff_decoder.sv — Fugue master-diff merge decoder (BIDIRECTIONAL).
//
// Implements the "diff decoder with its metadata buffer" of the Fugue logic
// die (03-design.tex, Execution). ONE registered diff-mask per score word
// drives BOTH directions of the master-diff merge:
//
//   forward  (overwrite / splice a vector):
//        corrected[l] = mask[l] ? diff : master[l]
//     Diff scores arrive as a COMPACT stream (only the diff tokens) and are
//     scattered to their lanes by the mask via a prefix-popcount rank — this
//     produces the softmax-buffer write positions (the paper's second decoder
//     output). If diff scores are already lane-aligned, load a mask and the
//     scatter is the identity.
//
//   reverse  (recirculation mask, the paper's third decoder output):
//        to_master[l] = mask[l] ? 0 : prob[l]   // diff positions zeroed
//        to_diff[l]   = mask[l] ? prob[l] : 0   // routed to the diff channel
//
// The mask table is loaded by the controller's PIM_SET_META instruction — the
// SAME control path as the config register file (mirrors cfg[] writes).
// The forward and reverse data paths are registered.  In addition to making
// the mask table a clean timing boundary, this prevents the compact-stream
// scatter and the softmax input reduction from becoming one clock path.
module diff_decoder import fugue_pkg::*; #(
    parameter integer LANES  = SM_LANES,   // FP32 score lanes per word
    parameter integer W      = 32,         // FP32
    parameter integer NWORDS = SM_WORDS
) (
    input  logic                     clk,
    input  logic                     rst_n,

    // ---- control: load one word's diff mask (mirrors cfg[] write) ----
    input  logic                     meta_wr_en,
    input  logic [SM_WIDX_W-1:0]     meta_wr_idx,
    input  logic [LANES-1:0]         meta_wr_mask,

    // ---- forward: master score + compact diff stream -> corrected vector ----
    input  logic                     fwd_valid,
    input  logic [SM_WIDX_W-1:0]     fwd_word_idx,
    input  logic [LANES-1:0][W-1:0]  master_score,
    input  logic [LANES-1:0][W-1:0]  diff_stream,
    output logic [LANES-1:0][W-1:0]  corrected_score,
    output logic [LANES-1:0]         corrected_mask,
    output logic                     corrected_valid,

    // ---- reverse: recirculated probabilities split by the mask ----
    input  logic                     rev_valid,
    input  logic [SM_WIDX_W-1:0]     rev_word_idx,
    input  logic [LANES-1:0][W-1:0]  prob,
    output logic [LANES-1:0][W-1:0]  to_master,
    output logic [LANES-1:0][W-1:0]  to_diff,
    output logic                     rev_valid_o
);
    localparam integer RANKW = (LANES <= 1) ? 1 : $clog2(LANES);

    // ---- metadata buffer: one LANES-bit diff mask per score word ----
    logic [LANES-1:0] diff_mask [NWORDS];
    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            for (int i = 0; i < NWORDS; i++) diff_mask[i] <= '0;
        else if (meta_wr_en)
            diff_mask[meta_wr_idx] <= meta_wr_mask;
    end

    // ===================== forward: scatter + overwrite =====================
    logic [LANES-1:0] fmask;
    assign fmask = diff_mask[fwd_word_idx];

    // per-lane rank = # set mask bits strictly below l (index into diff_stream)
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
    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            corrected_score <= '0;
            corrected_mask  <= '0;
            corrected_valid <= 1'b0;
        end else begin
            corrected_valid <= fwd_valid;
            if (fwd_valid) begin
                corrected_mask <= fmask;
                for (int l = 0; l < LANES; l++)
                    corrected_score[l] <= fmask[l] ? diff_stream[rank[l]]
                                                    : master_score[l];
            end
        end
    end

    // ===================== reverse: mask gate ===============================
    logic [LANES-1:0] rmask;
    assign rmask = diff_mask[rev_word_idx];
    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            to_master  <= '0;
            to_diff    <= '0;
            rev_valid_o <= 1'b0;
        end else begin
            rev_valid_o <= rev_valid;
            if (rev_valid) begin
                for (int l = 0; l < LANES; l++) begin
                    to_master[l] <= rmask[l] ? '0      : prob[l];
                    to_diff[l]   <= rmask[l] ? prob[l] : '0;
                end
            end
        end
    end
endmodule
