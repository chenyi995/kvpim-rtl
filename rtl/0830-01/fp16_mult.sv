// FP16 (IEEE 754 binary16) multiplier — 1 cycle latency (registered output).
// Handles zero / inf / NaN at the boundary and uses round-to-nearest-even for
// normal cases. Subnormals are flushed to zero.
module fp16_mult (
    input  logic        clk,
    input  logic        rst_n,
    input  logic        in_valid,
    input  logic [15:0] a,
    input  logic [15:0] b,
    output logic [15:0] y,
    output logic        out_valid
);
    // Decompose
    logic        sa, sb;
    logic [4:0]  ea, eb;
    logic [9:0]  ma, mb;
    assign sa = a[15]; assign ea = a[14:10]; assign ma = a[9:0];
    assign sb = b[15]; assign eb = b[14:10]; assign mb = b[9:0];

    logic a_is_zero, b_is_zero, a_is_inf, b_is_inf, a_is_nan, b_is_nan;
    assign a_is_zero = (ea == 5'd0)  && (ma == 10'd0);
    assign b_is_zero = (eb == 5'd0)  && (mb == 10'd0);
    assign a_is_inf  = (ea == 5'd31) && (ma == 10'd0);
    assign b_is_inf  = (eb == 5'd31) && (mb == 10'd0);
    assign a_is_nan  = (ea == 5'd31) && (ma != 10'd0);
    assign b_is_nan  = (eb == 5'd31) && (mb != 10'd0);

    // Implicit leading 1 for normals (subnormal operands flushed to zero).
    logic [10:0] mant_a, mant_b;
    assign mant_a = (ea == 5'd0) ? 11'd0 : {1'b1, ma};
    assign mant_b = (eb == 5'd0) ? 11'd0 : {1'b1, mb};

    // 11 x 11 -> 22-bit product
    logic [21:0] prod;
    assign prod = mant_a * mant_b;

    // Exponent sum (unbiased): ea + eb - 15
    logic signed [7:0] exp_sum;
    assign exp_sum = $signed({1'b0, ea}) + $signed({1'b0, eb}) - 8'sd15;

    // Normalize: top bit of prod[21] is 1 when both operands are normal and
    // their product overflows by one binary digit.
    logic        top_bit;
    logic [9:0]  mant_norm;
    logic [11:0] guard_bits;
    logic signed [7:0] exp_norm;
    assign top_bit   = prod[21];
    assign mant_norm = top_bit ? prod[20:11] : prod[19:10];
    assign guard_bits = top_bit ? {prod[10:0], 1'b0} : {prod[9:0], 2'b0};
    assign exp_norm  = top_bit ? (exp_sum + 8'sd1) : exp_sum;

    // Round to nearest even (use top guard bit + sticky)
    logic guard, round_b, sticky, round_up;
    assign guard   = guard_bits[11];
    assign round_b = guard_bits[10];
    assign sticky  = |guard_bits[9:0];
    assign round_up = guard & (round_b | sticky | mant_norm[0]);

    logic [10:0] mant_rounded;
    logic signed [7:0] exp_rounded;
    always_comb begin
        mant_rounded = {1'b0, mant_norm} + {10'd0, round_up};
        exp_rounded  = exp_norm;
        if (mant_rounded[10]) begin
            // Rounding pushed mantissa to next exponent (1.111..1 -> 10.000..0)
            mant_rounded = {1'b0, 1'b1, 9'd0};
            exp_rounded  = exp_norm + 8'sd1;
        end
    end

    // Pack result, applying overflow / underflow / special handling.
    logic [15:0] y_comb;
    logic        sign_out;
    assign sign_out = sa ^ sb;
    always_comb begin
        if (a_is_nan || b_is_nan ||
            (a_is_inf && b_is_zero) || (a_is_zero && b_is_inf)) begin
            y_comb = {1'b0, 5'd31, 10'h200};                // qNaN
        end else if (a_is_inf || b_is_inf) begin
            y_comb = {sign_out, 5'd31, 10'd0};              // signed inf
        end else if (a_is_zero || b_is_zero) begin
            y_comb = {sign_out, 5'd0, 10'd0};               // signed zero
        end else if (exp_rounded >= 8'sd31) begin
            y_comb = {sign_out, 5'd31, 10'd0};              // overflow -> inf
        end else if (exp_rounded <= 8'sd0) begin
            y_comb = {sign_out, 5'd0, 10'd0};               // flush subnormal
        end else begin
            y_comb = {sign_out, exp_rounded[4:0], mant_rounded[9:0]};
        end
    end

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            y         <= 16'd0;
            out_valid <= 1'b0;
        end else begin
            y         <= y_comb;
            out_valid <= in_valid;
        end
    end
endmodule
