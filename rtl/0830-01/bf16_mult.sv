// bf16_mult.sv — bfloat16 (1 sign, 8 exp, 7 mant; bias 127) multiplier.
// 1-cycle latency (registered output). Handles zero/inf/NaN at the boundary,
// round-to-nearest-even for normals, subnormals flushed to zero. Same structure
// as fp16_mult, re-parameterized for the BF16 field widths.
module bf16_mult (
    input  logic        clk,
    input  logic        rst_n,
    input  logic        in_valid,
    input  logic [15:0] a,
    input  logic [15:0] b,
    output logic [15:0] y,
    output logic        out_valid
);
    // Decompose
    logic       sa, sb;
    logic [7:0] ea, eb;
    logic [6:0] ma, mb;
    assign sa = a[15]; assign ea = a[14:7]; assign ma = a[6:0];
    assign sb = b[15]; assign eb = b[14:7]; assign mb = b[6:0];

    logic a_is_zero, b_is_zero, a_is_inf, b_is_inf, a_is_nan, b_is_nan;
    assign a_is_zero = (ea == 8'd0)   && (ma == 7'd0);
    assign b_is_zero = (eb == 8'd0)   && (mb == 7'd0);
    assign a_is_inf  = (ea == 8'd255) && (ma == 7'd0);
    assign b_is_inf  = (eb == 8'd255) && (mb == 7'd0);
    assign a_is_nan  = (ea == 8'd255) && (ma != 7'd0);
    assign b_is_nan  = (eb == 8'd255) && (mb != 7'd0);

    // Implicit leading 1 for normals (subnormal operands flushed to zero).
    logic [7:0] mant_a, mant_b;
    assign mant_a = (ea == 8'd0) ? 8'd0 : {1'b1, ma};
    assign mant_b = (eb == 8'd0) ? 8'd0 : {1'b1, mb};

    // 8 x 8 -> 16-bit product
    logic [15:0] prod;
    assign prod = mant_a * mant_b;

    // Exponent sum (unbiased): ea + eb - 127
    logic signed [10:0] exp_sum;
    assign exp_sum = $signed({1'b0, ea}) + $signed({1'b0, eb}) - 11'sd127;

    // Normalize: prod[15] set when the product overflows by one binary digit.
    logic       top_bit;
    logic [6:0] mant_norm;
    logic [8:0] guard_bits;
    logic signed [10:0] exp_norm;
    assign top_bit    = prod[15];
    assign mant_norm  = top_bit ? prod[14:8] : prod[13:7];
    assign guard_bits = top_bit ? {prod[7:0], 1'b0} : {prod[6:0], 2'b0};
    assign exp_norm   = top_bit ? (exp_sum + 11'sd1) : exp_sum;

    // Round to nearest even (guard + round + sticky)
    logic guard, round_b, sticky, round_up;
    assign guard    = guard_bits[8];
    assign round_b  = guard_bits[7];
    assign sticky   = |guard_bits[6:0];
    assign round_up = guard & (round_b | sticky | mant_norm[0]);

    logic [7:0] mant_rounded;
    logic signed [10:0] exp_rounded;
    always_comb begin
        mant_rounded = {1'b0, mant_norm} + {7'd0, round_up};
        exp_rounded  = exp_norm;
        if (mant_rounded[7]) begin
            // Rounding pushed 1.111..1 -> 10.000..0
            mant_rounded = {1'b1, 7'd0};
            exp_rounded  = exp_norm + 11'sd1;
        end
    end

    // Pack, with overflow / underflow / special handling.
    logic [15:0] y_comb;
    logic        sign_out;
    assign sign_out = sa ^ sb;
    always_comb begin
        if (a_is_nan || b_is_nan ||
            (a_is_inf && b_is_zero) || (a_is_zero && b_is_inf)) begin
            y_comb = {1'b0, 8'd255, 7'h40};                 // qNaN
        end else if (a_is_inf || b_is_inf) begin
            y_comb = {sign_out, 8'd255, 7'd0};              // signed inf
        end else if (a_is_zero || b_is_zero) begin
            y_comb = {sign_out, 8'd0, 7'd0};                // signed zero
        end else if (exp_rounded >= 11'sd255) begin
            y_comb = {sign_out, 8'd255, 7'd0};              // overflow -> inf
        end else if (exp_rounded <= 11'sd0) begin
            y_comb = {sign_out, 8'd0, 7'd0};                // flush subnormal
        end else begin
            y_comb = {sign_out, exp_rounded[7:0], mant_rounded[6:0]};
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
