// softmax_pe.sv -- one reusable AttAcc softmax processing element.
//
// A PE contains exactly the arithmetic leaves specified in AttAcc §5.1:
// one FP32 adder (score-max), one FP32 exponent, and one FP32 multiplier
// (exp * reciprocal(sum)).  The PE has no cross-lane state, which makes it a
// convenient independently synthesized macro/black-box boundary for DC.
module softmax_pe (
    input  logic        clk,
    input  logic        rst_n,
    input  logic        sub_valid,
    input  logic [31:0] score,
    input  logic [31:0] neg_max,
    output logic [31:0] exp_y,
    output logic        sub_done,
    output logic        exp_done,
    input  logic        norm_valid,
    input  logic [31:0] norm_exp,
    input  logic [31:0] reciprocal,
    output logic [31:0] prob_y,
    output logic        norm_done
);
    logic [31:0] sub_y;
    fp32_add u_add (
        .clk(clk), .rst_n(rst_n), .in_valid(sub_valid),
        .a(score), .b(neg_max), .y(sub_y), .out_valid(sub_done)
    );
    fp32_exp u_exp (
        .clk(clk), .rst_n(rst_n), .in_valid(sub_done),
        .x(sub_y), .y(exp_y), .out_valid(exp_done)
    );
    fp32_mul u_mul (
        .clk(clk), .rst_n(rst_n), .in_valid(norm_valid),
        .a(norm_exp), .b(reciprocal), .y(prob_y), .out_valid(norm_done)
    );
endmodule
