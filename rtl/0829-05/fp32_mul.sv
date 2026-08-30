// FP32 (IEEE 754 binary32) multiplier — 4 cycle latency.
// Handles zero / inf / NaN at the boundary and uses round-to-nearest-even for
// normal cases. Subnormals are flushed to zero (FTZ).
module fp32_mul (
    input  logic        clk,
    input  logic        rst_n,
    input  logic        in_valid,
    input  logic [31:0] a,
    input  logic [31:0] b,
    output logic [31:0] y,
    output logic        out_valid
);
    // Keep the expensive 24x24 multiplier off the input boundary.  Its product
    // is captured before normalization/rounding, so neither arithmetic stage
    // contains two wide arithmetic cones.
    logic [31:0] a_s0, b_s0;
    logic        v_s0;
    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            a_s0 <= 32'd0;
            b_s0 <= 32'd0;
            v_s0 <= 1'b0;
        end else begin
            a_s0 <= a;
            b_s0 <= b;
            v_s0 <= in_valid;
        end
    end

    // Decompose
    logic        sa, sb;
    logic [7:0]  ea, eb;
    logic [22:0] ma, mb;
    assign sa = a_s0[31]; assign ea = a_s0[30:23]; assign ma = a_s0[22:0];
    assign sb = b_s0[31]; assign eb = b_s0[30:23]; assign mb = b_s0[22:0];

    logic a_is_zero, b_is_zero, a_is_inf, b_is_inf, a_is_nan, b_is_nan;
    assign a_is_zero = (ea == 8'd0)   && (ma == 23'd0);
    assign b_is_zero = (eb == 8'd0)   && (mb == 23'd0);
    assign a_is_inf  = (ea == 8'd255) && (ma == 23'd0);
    assign b_is_inf  = (eb == 8'd255) && (mb == 23'd0);
    assign a_is_nan  = (ea == 8'd255) && (ma != 23'd0);
    assign b_is_nan  = (eb == 8'd255) && (mb != 23'd0);

    // Implicit leading 1 for normals (subnormal operands flushed to zero).
    logic [23:0] mant_a, mant_b;
    assign mant_a = (ea == 8'd0) ? 24'd0 : {1'b1, ma};
    assign mant_b = (eb == 8'd0) ? 24'd0 : {1'b1, mb};

    // 24 x 24 -> 48-bit product
    // A 24x24 mapped multiplier is still too slow as one reg-to-reg stage.
    // Use four parallel 12x12 products, then register their shifted sum.
    logic [23:0] pp_ll_s1, pp_lh_s1, pp_hl_s1, pp_hh_s1;
    logic [47:0] prod_s1, prod_s2;
    logic        a_zero_s1, b_zero_s1, a_inf_s1, b_inf_s1, a_nan_s1, b_nan_s1;
    logic        sign_out_s1, v_s1;
    logic signed [10:0] exp_sum_s1;

    // Exponent sum (unbiased): ea + eb - 127
    logic signed [10:0] exp_sum;
    assign exp_sum = $signed({1'b0, ea}) + $signed({1'b0, eb}) - 11'sd127;

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            pp_ll_s1    <= 24'd0; pp_lh_s1 <= 24'd0;
            pp_hl_s1    <= 24'd0; pp_hh_s1 <= 24'd0;
            a_zero_s1   <= 1'b0; b_zero_s1 <= 1'b0;
            a_inf_s1    <= 1'b0; b_inf_s1  <= 1'b0;
            a_nan_s1    <= 1'b0; b_nan_s1  <= 1'b0;
            sign_out_s1 <= 1'b0;
            exp_sum_s1  <= '0;
            v_s1        <= 1'b0;
        end else begin
            pp_ll_s1    <= mant_a[11:0]  * mant_b[11:0];
            pp_lh_s1    <= mant_a[11:0]  * mant_b[23:12];
            pp_hl_s1    <= mant_a[23:12] * mant_b[11:0];
            pp_hh_s1    <= mant_a[23:12] * mant_b[23:12];
            a_zero_s1   <= a_is_zero; b_zero_s1 <= b_is_zero;
            a_inf_s1    <= a_is_inf;  b_inf_s1  <= b_is_inf;
            a_nan_s1    <= a_is_nan;  b_nan_s1  <= b_is_nan;
            sign_out_s1 <= sa ^ sb;
            exp_sum_s1  <= exp_sum;
            v_s1        <= v_s0;
        end
    end

    assign prod_s1 = {pp_hh_s1, 24'd0} +
                     ({12'd0, pp_lh_s1, 12'd0} + {12'd0, pp_hl_s1, 12'd0}) +
                     pp_ll_s1;

    logic        a_zero_s2, b_zero_s2, a_inf_s2, b_inf_s2, a_nan_s2, b_nan_s2;
    logic        sign_out_s2, v_s2;
    logic signed [10:0] exp_sum_s2;
    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            prod_s2     <= 48'd0;
            a_zero_s2   <= 1'b0; b_zero_s2 <= 1'b0;
            a_inf_s2    <= 1'b0; b_inf_s2  <= 1'b0;
            a_nan_s2    <= 1'b0; b_nan_s2  <= 1'b0;
            sign_out_s2 <= 1'b0;
            exp_sum_s2  <= '0;
            v_s2        <= 1'b0;
        end else begin
            prod_s2     <= prod_s1;
            a_zero_s2   <= a_zero_s1; b_zero_s2 <= b_zero_s1;
            a_inf_s2    <= a_inf_s1;  b_inf_s2  <= b_inf_s1;
            a_nan_s2    <= a_nan_s1;  b_nan_s2  <= b_nan_s1;
            sign_out_s2 <= sign_out_s1;
            exp_sum_s2  <= exp_sum_s1;
            v_s2        <= v_s1;
        end
    end

    // Normalize: top bit of prod[47] is 1 when both operands are normal and
    // their product overflows by one binary digit.
    logic        top_bit;
    logic [22:0] mant_norm;
    logic [24:0] guard_bits;
    logic signed [10:0] exp_norm;
    assign top_bit   = prod_s2[47];
    assign mant_norm = top_bit ? prod_s2[46:24] : prod_s2[45:23];
    assign guard_bits = top_bit ? {prod_s2[23:0], 1'b0} : {prod_s2[22:0], 2'b0};
    assign exp_norm  = top_bit ? (exp_sum_s2 + 11'sd1) : exp_sum_s2;

    // Round to nearest even (use top guard bit + sticky)
    logic guard, round_b, sticky, round_up;
    assign guard   = guard_bits[24];
    assign round_b = guard_bits[23];
    assign sticky  = |guard_bits[22:0];
    assign round_up = guard & (round_b | sticky | mant_norm[0]);

    logic [23:0] mant_rounded;
    logic signed [10:0] exp_rounded;
    always_comb begin
        mant_rounded = {1'b0, mant_norm} + {23'd0, round_up};
        exp_rounded  = exp_norm;
        if (mant_rounded[23]) begin
            // Rounding pushed mantissa to next exponent (1.111..1 -> 10.000..0)
            mant_rounded = {1'b0, 1'b1, 22'd0};
            exp_rounded  = exp_norm + 11'sd1;
        end
    end

    // Pack result, applying overflow / underflow / special handling.
    logic [31:0] y_comb;
    always_comb begin
        if (a_nan_s2 || b_nan_s2 ||
            (a_inf_s2 && b_zero_s2) || (a_zero_s2 && b_inf_s2)) begin
            y_comb = {1'b0, 8'd255, 23'h400000};             // qNaN
        end else if (a_inf_s2 || b_inf_s2) begin
            y_comb = {sign_out_s2, 8'd255, 23'd0};           // signed inf
        end else if (a_zero_s2 || b_zero_s2) begin
            y_comb = {sign_out_s2, 8'd0, 23'd0};             // signed zero
        end else if (exp_rounded >= 11'sd255) begin
            y_comb = {sign_out_s2, 8'd255, 23'd0};           // overflow -> inf
        end else if (exp_rounded <= 11'sd0) begin
            y_comb = {sign_out_s2, 8'd0, 23'd0};             // flush subnormal
        end else begin
            y_comb = {sign_out_s2, exp_rounded[7:0], mant_rounded[22:0]};
        end
    end

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            y         <= 32'd0;
            out_valid <= 1'b0;
        end else begin
            y         <= y_comb;
            out_valid <= v_s2;
        end
    end
endmodule
