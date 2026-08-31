// Synthesis-only leaf for one channel-local Fugue diff decoder.
// The all-channel Fugue/Fugue2 die has one 16-lane instance per HBM channel.
module diff_decoder_channel_dc_top import fugue_pkg::*; (
    input  logic                    clk,
    input  logic                    rst_n,
    input  logic                    meta_wr_en,
    input  logic [SM_WIDX_W-1:0]    meta_wr_idx,
    input  logic [15:0]             meta_wr_mask,
    input  logic                    fwd_valid,
    input  logic [SM_WIDX_W-1:0]    fwd_word_idx,
    input  logic [15:0][31:0]       master_score,
    input  logic [15:0][31:0]       diff_stream,
    output logic [15:0][31:0]       corrected_score,
    output logic [15:0]             corrected_mask,
    output logic                    corrected_valid,
    input  logic                    rev_valid,
    input  logic [SM_WIDX_W-1:0]    rev_word_idx,
    input  logic [15:0][31:0]       prob,
    output logic [15:0][31:0]       to_master,
    output logic [15:0][31:0]       to_diff,
    output logic                    rev_valid_o
);
    diff_decoder #(.LANES(16), .W(32), .NWORDS(SM_WORDS)) u_decoder (.*);
endmodule
