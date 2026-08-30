// Synthesis-only replacement for softmax_pe.sv.
// Use this declaration after synthesizing softmax_pe as a macro; it preserves
// the exact interface while allowing the channel softmax hierarchy to compile
// without repeatedly expanding 16 PE implementations.
(* black_box *) module softmax_pe (
    input logic clk, input logic rst_n,
    input logic sub_valid, input logic [31:0] score, input logic [31:0] neg_max,
    output logic [31:0] exp_y, output logic sub_done, output logic exp_done,
    input logic norm_valid, input logic [31:0] norm_exp, input logic [31:0] reciprocal,
    output logic [31:0] prob_y, output logic norm_done
);
endmodule
