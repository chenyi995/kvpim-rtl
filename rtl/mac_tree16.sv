// mac_tree16.sv — AttAcc bank-level GEMV dot-product core, isolated for an
// Fmax experiment. This is exactly the "16 FP16 multipliers + FP16 adder tree"
// of the AttAcc GEMV unit (ASPLOS'24 §5.1: "16 FP16 multipliers, 16 FP16
// adders"), WITHOUT the double buffers, control, or the accumulator feedback
// loop — a pure feed-forward, fully-pipelined 16-lane dot product so the clock
// can be pushed to the arithmetic's real limit.
//
// Pipeline = 5 stages, each stage one FP16 op (the fp16_* units are 1-cycle,
// registered):
//   stage 1 : 16 FP16 multiplies                 a[i]*b[i]
//   stage 2 :  8 FP16 adds  (tree level 1)
//   stage 3 :  4 FP16 adds  (tree level 2)
//   stage 4 :  2 FP16 adds  (tree level 3)
//   stage 5 :  1 FP16 add   (tree level 4)  -> scalar dot product
// Fmax is therefore set by the slowest single FP16 stage (mult or add).
module mac_tree16 (
    input  logic         clk,
    input  logic         rst_n,
    input  logic         in_valid,
    input  logic [255:0] a_word,   // 16 FP16 lanes
    input  logic [255:0] b_word,   // 16 FP16 lanes
    output logic [15:0]  y,        // 16-lane dot product (FP16)
    output logic         out_valid
);
    // ---- stage 1: 16 FP16 multipliers ----
    logic [15:0] prod   [16];
    logic        prod_v [16];
    genvar i;
    generate
        for (i = 0; i < 16; i++) begin : g_mul
            fp16_mult u_mul (
                .clk(clk), .rst_n(rst_n), .in_valid(in_valid),
                .a(a_word[i*16 +: 16]), .b(b_word[i*16 +: 16]),
                .y(prod[i]), .out_valid(prod_v[i])
            );
        end
    endgenerate

    // ---- stages 2..5: 8 + 4 + 2 + 1 FP16 adder tree ----
    logic [15:0] s1 [8]; logic s1_v [8];
    logic [15:0] s2 [4]; logic s2_v [4];
    logic [15:0] s3 [2]; logic s3_v [2];
    generate
        for (i = 0; i < 8; i++) begin : g_l1
            fp16_add u_add (.clk(clk),.rst_n(rst_n),.in_valid(prod_v[2*i]),
                            .a(prod[2*i]),.b(prod[2*i+1]),.y(s1[i]),.out_valid(s1_v[i]));
        end
        for (i = 0; i < 4; i++) begin : g_l2
            fp16_add u_add (.clk(clk),.rst_n(rst_n),.in_valid(s1_v[2*i]),
                            .a(s1[2*i]),.b(s1[2*i+1]),.y(s2[i]),.out_valid(s2_v[i]));
        end
        for (i = 0; i < 2; i++) begin : g_l3
            fp16_add u_add (.clk(clk),.rst_n(rst_n),.in_valid(s2_v[2*i]),
                            .a(s2[2*i]),.b(s2[2*i+1]),.y(s3[i]),.out_valid(s3_v[i]));
        end
    endgenerate
    fp16_add u_l4 (.clk(clk),.rst_n(rst_n),.in_valid(s3_v[0]),
                   .a(s3[0]),.b(s3[1]),.y(y),.out_valid(out_valid));
endmodule
