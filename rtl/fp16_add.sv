// FP16 (IEEE 754-2008 binary16) adder — 1 cycle latency (registered output).
// Full IEEE semantics (ruling chenyi9 2026-09-02, replacing the earlier
// flush-to-zero unit): subnormal operands and results (gradual underflow),
// round-to-nearest-even, overflow to signed infinity, signed-zero rules
// (x + (-x) = +0; -0 + -0 = -0), inf/NaN rules.  NaN results are the
// canonical quiet NaN (0x7E00); no exception flags.
module fp16_add (
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
    // subnormal is 1.
    logic [10:0] mant_a_in, mant_b_in;
    logic [4:0]  ea_eff, eb_eff;
    assign mant_a_in = (ea == 5'd0) ? {1'b0, ma} : {1'b1, ma};
    assign mant_b_in = (eb == 5'd0) ? {1'b0, mb} : {1'b1, mb};
    assign ea_eff = (ea == 5'd0) ? 5'd1 : ea;
    assign eb_eff = (eb == 5'd0) ? 5'd1 : eb;

    // ---- order by magnitude; subtract smaller from larger ----
    logic a_ge_b;
    assign a_ge_b = ({ea, ma} >= {eb, mb});

    logic        sign_l, sign_s;
    logic [4:0]  exp_l, exp_s;
    logic [10:0] mant_l, mant_s;
    assign sign_l = a_ge_b ? sa : sb;
    assign sign_s = a_ge_b ? sb : sa;
    assign exp_l  = a_ge_b ? ea_eff : eb_eff;
    assign exp_s  = a_ge_b ? eb_eff : ea_eff;
    assign mant_l = a_ge_b ? mant_a_in : mant_b_in;
    assign mant_s = a_ge_b ? mant_b_in : mant_a_in;

    // ---- align: shift the smaller right by exp_diff, keeping G/R/sticky ----
    logic [4:0]  exp_diff;
    assign exp_diff = exp_l - exp_s;
    logic [13:0] mant_l_ext, mant_s_ext;              // {hidden, frac[9:0], G, R, S}
    logic [13:0] shifted, lost;
    assign mant_l_ext = {mant_l, 3'b0};
    always_comb begin
        {shifted, lost} = {mant_s, 3'b0, 14'b0} >> exp_diff;
        mant_s_ext = {shifted[13:1], shifted[0] | (|lost)};
    end

    // ---- add or subtract magnitudes ----
    logic same_sign;
    assign same_sign = (sa == sb);
    logic [14:0] sum_raw;
    always_comb begin
        if (same_sign) sum_raw = {1'b0, mant_l_ext} + {1'b0, mant_s_ext};
        else           sum_raw = {1'b0, mant_l_ext} - {1'b0, mant_s_ext};
    end

    // ---- normalize ----
    // Carry-out: shift right one (sticky-preserving), exponent + 1.
    // Otherwise shift left to the leading one, but never below the minimum
    // exponent 1: the left shift is capped at exp_l - 1, and a result whose
    // leading one is not at [13] after that is a subnormal (exponent field 0).
    function automatic [3:0] lzc14(input [13:0] v);
        integer i;
        begin
            lzc14 = 4'd14;
            for (i = 13; i >= 0; i--) if (v[i] && lzc14 == 4'd14) lzc14 = 4'(13 - i);
        end
    endfunction
    logic [3:0]  lz, shl;
    logic [4:0]  exp_norm;
    logic [13:0] mant_norm;
    always_comb begin
        lz = lzc14(sum_raw[13:0]);
        if (sum_raw[14]) begin
            mant_norm = {sum_raw[14:2], sum_raw[1] | sum_raw[0]};
            exp_norm  = exp_l + 5'd1;
            shl       = 4'd0;
        end else begin
            shl       = ({1'b0, lz} > (exp_l - 5'd1)) ? 4'(exp_l - 5'd1) : lz;
            mant_norm = sum_raw[13:0] << shl;
            exp_norm  = exp_l - {1'b0, shl};
        end
    end

    // ---- round to nearest even: [13] hidden, [12:3] frac, [2] G, [1] R, [0] S ----
    logic guard, round_b, sticky, round_up;
    logic [11:0] mant_rounded;                        // {carry, hidden, frac[9:0]}
    logic [5:0]  exp_out;
    always_comb begin
        guard    = mant_norm[2];
        round_b  = mant_norm[1];
        sticky   = mant_norm[0];
        round_up = guard & (round_b | sticky | mant_norm[3]);
        mant_rounded = {1'b0, mant_norm[13:3]} + {11'd0, round_up};
        if (mant_rounded[11])      exp_out = {1'b0, exp_norm} + 6'd1;   // 1.111.. + ulp -> 10.000..
        else if (mant_rounded[10]) exp_out = {1'b0, exp_norm};          // normal (or subnormal rounded up to min normal)
        else                       exp_out = 6'd0;                      // subnormal
    end

    // ---- pack ----
    logic [15:0] y_comb;
    always_comb begin
        if (a_is_nan || b_is_nan ||
            (a_is_inf && b_is_inf && (sa != sb))) begin
            y_comb = {1'b0, 5'd31, 10'h200};                 // qNaN
        end else if (a_is_inf) begin
            y_comb = {sa, 5'd31, 10'd0};
        end else if (b_is_inf) begin
            y_comb = {sb, 5'd31, 10'd0};
        end else if (a_is_zero && b_is_zero) begin
            y_comb = {sa & sb, 5'd0, 10'd0};                 // -0 + -0 = -0, else +0
        end else if (sum_raw == 15'd0) begin
            y_comb = 16'd0;                                  // exact cancellation -> +0
        end else if (exp_out >= 6'd31) begin
            y_comb = {sign_l, 5'd31, 10'd0};                 // overflow -> inf (RNE)
        end else begin
            y_comb = {sign_l, exp_out[4:0], mant_rounded[9:0]};
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
