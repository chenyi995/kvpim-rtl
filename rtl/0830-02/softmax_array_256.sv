// All-channel softmax fabric: 16 independent channel engines x 16 PE/channel.
// In the final macro-top profile softmax_pe is supplied only by its .db view.
module softmax_array_256 import fugue_pkg::*; #(
    parameter integer CONTEXTS = 2
) (
    input logic clk, rst_n,
    input logic [15:0] in_valid,
    output logic [15:0] in_ready,
    input logic [15:0][$clog2(CONTEXTS)-1:0] in_context,
    input logic [15:0][31:0] seq_len,
    input logic [15:0][15:0][31:0] in_data,
    output logic [15:0][15:0][31:0] out_data,
    output logic [15:0][15:0] out_lane_valid,
    output logic [15:0][6:0] out_word_idx,
    output logic [15:0][$clog2(CONTEXTS)-1:0] out_context,
    output logic [15:0] out_valid,
    output logic [15:0] busy
);
    genvar c;
    generate for (c=0; c<16; c++) begin : g_channel
        softmax_unit #(.LANES(16), .MAX_TOKENS(2048), .CONTEXTS(CONTEXTS)) u_channel (
            .clk, .rst_n, .in_valid(in_valid[c]), .in_ready(in_ready[c]),
            .in_context(in_context[c]), .seq_len(seq_len[c]), .in_data(in_data[c]),
            .out_data(out_data[c]), .out_lane_valid(out_lane_valid[c]),
            .out_word_idx(out_word_idx[c]), .out_context(out_context[c]),
            .out_valid(out_valid[c]), .busy(busy[c])
        );
    end endgenerate
endmodule
