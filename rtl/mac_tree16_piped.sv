// mac_tree16_piped.sv — same AttAcc bank-level FP16 dot-product tree as
// mac_tree16, but each FP16 op is internally pipelined (fp16_mult_piped /
// fp16_add_piped) so register *retiming* can push the clock past the single-op
// limit. Total pipeline depth = MPIPE (multiply) + 4*APIPE (four adder levels).
module mac_tree16_piped #(
    parameter int unsigned MPIPE = 2,   // sub-stages per FP16 multiply
    parameter int unsigned APIPE = 2    // sub-stages per FP16 add
) (
    input  logic         clk,
    input  logic         rst_n,
    input  logic         in_valid,
    input  logic [255:0] a_word,
    input  logic [255:0] b_word,
    output logic [15:0]  y,
    output logic         out_valid
);
    logic [15:0] prod   [16];
    logic        prod_v [16];
    genvar i;
    generate
        for (i = 0; i < 16; i++) begin : g_mul
            fp16_mult_piped #(.NUM_PIPE(MPIPE)) u_mul (
                .clk(clk), .rst_n(rst_n), .in_valid(in_valid),
                .a(a_word[i*16 +: 16]), .b(b_word[i*16 +: 16]),
                .y(prod[i]), .out_valid(prod_v[i])
            );
        end
    endgenerate

    logic [15:0] s1 [8]; logic s1_v [8];
    logic [15:0] s2 [4]; logic s2_v [4];
    logic [15:0] s3 [2]; logic s3_v [2];
    generate
        for (i = 0; i < 8; i++) begin : g_l1
            fp16_add_piped #(.NUM_PIPE(APIPE)) u_add (.clk(clk),.rst_n(rst_n),.in_valid(prod_v[2*i]),
                            .a(prod[2*i]),.b(prod[2*i+1]),.y(s1[i]),.out_valid(s1_v[i]));
        end
        for (i = 0; i < 4; i++) begin : g_l2
            fp16_add_piped #(.NUM_PIPE(APIPE)) u_add (.clk(clk),.rst_n(rst_n),.in_valid(s1_v[2*i]),
                            .a(s1[2*i]),.b(s1[2*i+1]),.y(s2[i]),.out_valid(s2_v[i]));
        end
        for (i = 0; i < 2; i++) begin : g_l3
            fp16_add_piped #(.NUM_PIPE(APIPE)) u_add (.clk(clk),.rst_n(rst_n),.in_valid(s2_v[2*i]),
                            .a(s2[2*i]),.b(s2[2*i+1]),.y(s3[i]),.out_valid(s3_v[i]));
        end
    endgenerate
    fp16_add_piped #(.NUM_PIPE(APIPE)) u_l4 (.clk(clk),.rst_n(rst_n),.in_valid(s3_v[0]),
                   .a(s3[0]),.b(s3[1]),.y(y),.out_valid(out_valid));
endmodule
