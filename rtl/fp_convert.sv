// fp_convert.sv — combinational FP16 <-> FP32 lane converters for the
// top-level score/probability link (score GEMV emits FP16, the softmax core
// computes in FP32 per AttAcc, the context GEMV consumes FP16 again).
// Conventions match the repo's FP16 arithmetic: FTZ (denormals flush to zero),
// RNE on the narrowing direction, inf/NaN mapped across.

module fp16_to_fp32 (
    input  logic [15:0] a,
    output logic [31:0] y
);
    logic        s;
    logic [4:0]  e;
    logic [9:0]  m;
    always_comb begin
        s = a[15]; e = a[14:10]; m = a[9:0];
        if (e == 5'd0) begin
            y = {s, 31'd0};                          // zero / denormal (FTZ)
        end else if (e == 5'd31) begin
            y = {s, 8'hff, m, 13'd0};                // inf / NaN
        end else begin
            y = {s, {3'b0, e} + 8'd112, m, 13'd0};   // exact widening
        end
    end
endmodule

module fp32_to_fp16 (
    input  logic [31:0] a,
    output logic [15:0] y
);
    logic        s;
    logic [7:0]  e;
    logic [22:0] m;
    logic signed [9:0] e16;      // unbiased-for-fp16 exponent, may under/overflow
    logic [10:0] frac;           // {carry, 10-bit mantissa} after rounding
    logic        round_up;
    always_comb begin
        s = a[31]; e = a[30:23]; m = a[22:0];
        e16 = $signed({2'b0, e}) - 10'sd112;         // fp32 bias 127 -> fp16 bias 15
        // RNE on the 13 dropped mantissa bits.
        round_up = m[12] & (|m[11:0] | m[13]);
        {frac} = {1'b0, m[22:13]} + (round_up ? 11'd1 : 11'd0);
        if (e == 8'd0) begin
            y = {s, 15'd0};                          // zero / denormal (FTZ)
        end else if (e == 8'hff) begin
            y = {s, 5'h1f, (m != 0) ? 10'h200 : 10'h0};  // inf / NaN
        end else if (e16 >= 10'sd31 || (e16 == 10'sd30 && frac[10])) begin
            y = {s, 5'h1f, 10'd0};                   // overflow -> inf
        end else if (e16 <= 10'sd0 && !(e16 == 10'sd0 && frac[10])) begin
            y = {s, 15'd0};                          // underflow (FTZ)
        end else if (frac[10]) begin
            y = {s, e16[4:0] + 5'd1, 10'd0};         // mantissa carry-out
        end else begin
            y = {s, e16[4:0], frac[9:0]};
        end
    end
endmodule
