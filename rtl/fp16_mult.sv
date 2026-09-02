// FP16 (IEEE 754-2008 binary16) multiplier — 1 cycle latency (registered
// output).  Full IEEE semantics (ruling chenyi9 2026-09-02, replacing the
// earlier flush-to-zero unit): subnormal operands and subnormal results
// (gradual underflow), round-to-nearest-even, overflow to signed infinity,
// signed zero, inf/NaN rules.  NaN results are the canonical quiet NaN
// (0x7E00); no exception flags.
module fp16_mult (
    input  logic        clk,
    input  logic        rst_n,
    input  logic        in_valid,
    input  logic [15:0] a,
    input  logic [15:0] b,
    output logic [15:0] y,
    output logic        out_valid
);
    // ---- decode ----
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

    // Significand with hidden bit (0 for subnormals); effective exponent of a
    // subnormal is 1 (value = 0.m x 2^(1-15)).
    logic [10:0] mant_a, mant_b;
    logic [4:0]  ea_eff, eb_eff;
    assign mant_a = (ea == 5'd0) ? {1'b0, ma} : {1'b1, ma};
    assign mant_b = (eb == 5'd0) ? {1'b0, mb} : {1'b1, mb};
    assign ea_eff = (ea == 5'd0) ? 5'd1 : ea;
    assign eb_eff = (eb == 5'd0) ? 5'd1 : eb;

    // ---- 11 x 11 -> 22-bit product, value = prod x 2^(exp_sum - 20) ----
    logic [21:0] prod;
    assign prod = mant_a * mant_b;
    logic signed [7:0] exp_sum;                       // biased, -13 .. 45
    assign exp_sum = $signed({3'b0, ea_eff}) + $signed({3'b0, eb_eff}) - 8'sd15;

    // ---- normalize: leading one to bit 21 ----
    function automatic [4:0] lzc22(input [21:0] v);
        integer i;
        begin
            lzc22 = 5'd22;
            for (i = 21; i >= 0; i--) if (v[i] && lzc22 == 5'd22) lzc22 = 5'(21 - i);
        end
    endfunction
    logic [4:0]  lz;
    logic [21:0] sig_n;                               // hidden bit at [21]
    logic signed [7:0] e_norm;                        // biased exponent after normalization
    assign lz     = lzc22(prod);
    assign sig_n  = prod << lz;
    assign e_norm = exp_sum + 8'sd1 - $signed({3'b0, lz});

    // ---- denormalize when e_norm < 1 (gradual underflow) ----
    logic [5:0]  rshift;
    logic [5:0]  exp_field;                           // biased, 1 .. 46 (>= 31 overflows)
    logic [21:0] sig_d;
    logic        sticky_d;
    always_comb begin
        if (e_norm >= 8'sd1) begin
            rshift = 6'd0;  exp_field = e_norm[5:0];
        end else begin
            rshift = (8'sd1 - e_norm > 8'sd22) ? 6'd22 : 6'(8'sd1 - e_norm);
            exp_field = 6'd0;
        end
        {sig_d, sticky_d} = 23'({sig_n, 1'b0} >> rshift) | {22'd0, |(sig_n & ~(22'h3FFFFF << rshift))};
    end

    // ---- round to nearest even: fraction [20:11], guard [10], sticky [9:0] ----
    logic guard, sticky, round_up;
    logic [11:0] mant_r;                              // {carry, hidden, frac[9:0]}
    assign guard    = sig_d[10];
    assign sticky   = (|sig_d[9:0]) | sticky_d;
    assign round_up = guard & (sticky | sig_d[11]);
    assign mant_r   = {1'b0, sig_d[21:11]} + {11'd0, round_up};

    logic [6:0] exp_out;
    always_comb begin
        if (rshift == 6'd0) exp_out = {1'b0, exp_field} + {6'd0, mant_r[11]};   // carry -> exponent+1
        else                exp_out = {6'd0, mant_r[10]};                        // rounded up into min normal
    end

    // ---- pack ----
    logic [15:0] y_comb;
    logic        sign_out;
    assign sign_out = sa ^ sb;
    always_comb begin
        if (a_is_nan || b_is_nan ||
            (a_is_inf && b_is_zero) || (a_is_zero && b_is_inf)) begin
            y_comb = {1'b0, 5'd31, 10'h200};                 // qNaN
        end else if (a_is_inf || b_is_inf) begin
            y_comb = {sign_out, 5'd31, 10'd0};               // signed inf
        end else if (a_is_zero || b_is_zero) begin
            y_comb = {sign_out, 5'd0, 10'd0};                // signed zero
        end else if (exp_out >= 7'd31) begin
            y_comb = {sign_out, 5'd31, 10'd0};               // overflow -> inf (RNE)
        end else begin
            y_comb = {sign_out, exp_out[4:0], mant_r[9:0]};  // normal or subnormal
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
