// Synthesis-only leaf for one HBM bank-group accumulator.
// A bank group contains four banks and each bank has two GEMV units, so this
// accumulator reduces eight FP16 partial sums.
module accumulator_bg_dc_top (
    input  logic             clk,
    input  logic             rst_n,
    input  logic             in_valid,
    input  logic [7:0][15:0] parts,
    input  logic             clr,
    output logic [15:0]      acc,
    output logic             out_valid
);
    accumulator #(.N(8)) u_acc (.*);
endmodule
