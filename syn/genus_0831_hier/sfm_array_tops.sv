// sfm_array_tops.sv — synthesis-only wrappers fixing the CONTEXTS parameter
// of softmax_array_256 (the integrated logic-die softmax fabric):
//   * attacc: CONTEXTS=2  -> 16 channels x 32 KiB buffer = 512 KiB/die
//   * fugue : CONTEXTS=16 -> 16 channels x 256 KiB buffer = 4 MiB/die
// Pass-through ports only; no logic added.
module sfm_array_attacc (
    input  logic clk, rst_n,
    input  logic [15:0] in_valid,
    output logic [15:0] in_ready,
    input  logic [15:0][0:0] in_context,
    input  logic [15:0][31:0] seq_len,
    input  logic [15:0][15:0][31:0] in_data,
    output logic [15:0][15:0][31:0] out_data,
    output logic [15:0][15:0] out_lane_valid,
    output logic [15:0][6:0] out_word_idx,
    output logic [15:0][0:0] out_context,
    output logic [15:0] out_valid,
    output logic [15:0] busy
);
    softmax_array_256 #(.CONTEXTS(2)) u_array (.*);
endmodule

module sfm_array_fugue (
    input  logic clk, rst_n,
    input  logic [15:0] in_valid,
    output logic [15:0] in_ready,
    input  logic [15:0][3:0] in_context,
    input  logic [15:0][31:0] seq_len,
    input  logic [15:0][15:0][31:0] in_data,
    output logic [15:0][15:0][31:0] out_data,
    output logic [15:0][15:0] out_lane_valid,
    output logic [15:0][6:0] out_word_idx,
    output logic [15:0][3:0] out_context,
    output logic [15:0] out_valid,
    output logic [15:0] busy
);
    softmax_array_256 #(.CONTEXTS(16)) u_array (.*);
endmodule
