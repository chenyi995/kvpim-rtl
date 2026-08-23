// accumulator.sv — FP16 partial-sum reduction across NUM_GEMV GEMV units for
// row-wise partitioning (AttAcc's per-BG / per-pCH accumulator). Reduces the N
// partial dot-products with an FP16 adder tree, then accumulates into a running
// result register (bypassed for column-wise partitioning by the caller).
//
// Written for N = NUM_GEMV = 4 (2-stage tree). Reuses fp16_add.
module accumulator import fugue_pkg::*; #(
    parameter int unsigned N = NUM_GEMV
) (
    input  logic               clk,
    input  logic               rst_n,
    input  logic               in_valid,
    input  logic [N-1:0][15:0] parts,   // FP16 partials from the N GEMV units
    input  logic               clr,     // clear the accumulator this beat
    output logic [15:0]        acc,
    output logic               out_valid
);
    // 2-stage FP16 adder tree for N = 4: (0+1),(2+3) -> (. + .)
    logic [15:0] s01, s23, s0123;
    logic        v01, v23, v0123;
    fp16_add a01  (.clk(clk),.rst_n(rst_n),.in_valid(in_valid),.a(parts[0]),.b(parts[1]),.y(s01),  .out_valid(v01));
    fp16_add a23  (.clk(clk),.rst_n(rst_n),.in_valid(in_valid),.a(parts[2]),.b(parts[3]),.y(s23),  .out_valid(v23));
    fp16_add a0123(.clk(clk),.rst_n(rst_n),.in_valid(v01),     .a(s01),     .b(s23),     .y(s0123),.out_valid(v0123));

    // clr pipe: align to the tree latency (2 cycles to v0123).
    logic [1:0] clr_pipe;
    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) clr_pipe <= '0;
        else        clr_pipe <= {clr_pipe[0], clr};
    end
    logic clr_al;
    assign clr_al = clr_pipe[1];

    logic [15:0] acc_q, acc_in, acc_sum;
    logic        v_acc;
    assign acc_in = clr_al ? 16'd0 : acc_q;
    fp16_add a_acc (.clk(clk),.rst_n(rst_n),.in_valid(v0123),.a(s0123),.b(acc_in),.y(acc_sum),.out_valid(v_acc));

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n)     acc_q <= 16'd0;
        else if (v_acc) acc_q <= acc_sum;
    end

    assign acc       = acc_q;
    assign out_valid = v_acc;
endmodule
