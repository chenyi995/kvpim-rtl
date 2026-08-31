// FP32 (IEEE 754 binary32) adder — four pipeline stages.
// Subnormals flushed to zero. Round-to-nearest-even.
module fp32_add (
    input  logic        clk,
    input  logic        rst_n,
    input  logic        in_valid,
    input  logic [31:0] a,
    input  logic [31:0] b,
    output logic [31:0] y,
    output logic        out_valid
);
    // Decompose
    logic        sa, sb;
    logic [7:0]  ea, eb;
    logic [22:0] ma, mb;
    assign sa = a[31]; assign ea = a[30:23]; assign ma = a[22:0];
    assign sb = b[31]; assign eb = b[30:23]; assign mb = b[22:0];

    logic a_is_zero, b_is_zero, a_is_inf, b_is_inf, a_is_nan, b_is_nan;
    assign a_is_zero = (ea == 8'd0)   && (ma == 23'd0);
    assign b_is_zero = (eb == 8'd0)   && (mb == 23'd0);
    assign a_is_inf  = (ea == 8'd255) && (ma == 23'd0);
    assign b_is_inf  = (eb == 8'd255) && (mb == 23'd0);
    assign a_is_nan  = (ea == 8'd255) && (ma != 23'd0);
    assign b_is_nan  = (eb == 8'd255) && (mb != 23'd0);

    // Implicit leading 1 for normals (subnormal operands flushed to zero).
    logic [23:0] mant_a_in, mant_b_in;
    assign mant_a_in = (ea == 8'd0) ? 24'd0 : {1'b1, ma};
    assign mant_b_in = (eb == 8'd0) ? 24'd0 : {1'b1, mb};

    // Decide larger operand (by |x|); subtract smaller from larger.
    logic a_ge_b;
    assign a_ge_b = ({ea, ma} >= {eb, mb});

    logic        sign_l, sign_s;
    logic [7:0]  exp_l, exp_s;
    logic [23:0] mant_l, mant_s;
    assign sign_l = a_ge_b ? sa : sb;
    assign sign_s = a_ge_b ? sb : sa;
    assign exp_l  = a_ge_b ? ea : eb;
    assign exp_s  = a_ge_b ? eb : ea;
    assign mant_l = a_ge_b ? mant_a_in : mant_b_in;
    assign mant_s = a_ge_b ? mant_b_in : mant_a_in;

    // Align: shift smaller right by (exp_l - exp_s), tracking sticky bits.
    logic [7:0] exp_diff;
    assign exp_diff = exp_l - exp_s;

    // Extend smaller mantissa with 3 guard/round/sticky bits to the right.
    logic [26:0] mant_s_ext;
    logic [26:0] mant_l_ext;
    assign mant_l_ext = {mant_l, 3'b0};
    // Shift mant_s_ext by exp_diff, collapsing shifted-out bits into sticky.
    logic [26:0] shifted;
    logic sticky_shift;
    always_comb begin
        if (exp_diff >= 8'd27) begin
            shifted      = 27'd0;
            sticky_shift = |mant_s;
        end else begin
            shifted      = ({mant_s, 3'b0}) >> exp_diff;
            // Sticky: any 1 bit shifted past bit 0
            sticky_shift = |(({mant_s, 3'b0} << (8'd27 - exp_diff)) & 27'h7FFFFFF);
        end
        mant_s_ext = {shifted[26:1], shifted[0] | sticky_shift};
    end

    // Add or subtract magnitudes
    logic same_sign;
    assign same_sign = (sa == sb);

    // Stage 0: isolate exponent comparison/alignment (including the barrel
    // shift and sticky-bit generation) from the 28-bit add/subtract.
    logic [26:0] mant_l_ext_s0, mant_s_ext_s0;
    logic        same_sign_s0, sign_l_s0, sa_s0, sb_s0;
    logic [7:0]  exp_l_s0;
    logic        a_is_zero_s0, b_is_zero_s0, a_is_inf_s0, b_is_inf_s0;
    logic        a_is_nan_s0, b_is_nan_s0, valid_s0;

    logic [27:0] sum_raw;
    always_comb begin
        if (same_sign_s0) sum_raw = {1'b0, mant_l_ext_s0} + {1'b0, mant_s_ext_s0};
        else              sum_raw = {1'b0, mant_l_ext_s0} - {1'b0, mant_s_ext_s0};
    end

    // Stage 1 closes the exponent alignment and magnitude add/subtract path.
    // The following normalization/round/pack logic works only on these
    // registers, so it is a distinct clock-to-clock timing stage.
    logic [27:0] sum_raw_s1;
    logic        same_sign_s1, sign_l_s1, sa_s1, sb_s1;
    logic [7:0]  exp_l_s1;
    logic        a_is_zero_s1, b_is_zero_s1, a_is_inf_s1, b_is_inf_s1;
    logic        a_is_nan_s1, b_is_nan_s1, valid_s1;

    // Normalize: if same_sign there can be a carry-out -> shift right 1.
    // If different sign there can be many leading zeros -> shift left.
    logic [7:0]  exp_norm;
    logic [26:0] mant_norm;
    logic [4:0]  lz;
    always_comb begin
        lz = 5'd0;
        mant_norm = sum_raw_s1[26:0];
        exp_norm  = exp_l_s1;
        if (same_sign_s1 && sum_raw_s1[27]) begin
            mant_norm = {sum_raw_s1[27:2], sum_raw_s1[1] | sum_raw_s1[0]};
            exp_norm  = exp_l_s1 + 8'd1;
        end else begin
            // Find leading 1 in sum_raw[26:0] and shift left.
            casez (sum_raw_s1[26:0])
                27'b1??????????????????????????: lz = 5'd0;
                27'b01?????????????????????????: lz = 5'd1;
                27'b001????????????????????????: lz = 5'd2;
                27'b0001???????????????????????: lz = 5'd3;
                27'b00001??????????????????????: lz = 5'd4;
                27'b000001?????????????????????: lz = 5'd5;
                27'b0000001????????????????????: lz = 5'd6;
                27'b00000001???????????????????: lz = 5'd7;
                27'b000000001??????????????????: lz = 5'd8;
                27'b0000000001?????????????????: lz = 5'd9;
                27'b00000000001????????????????: lz = 5'd10;
                27'b000000000001???????????????: lz = 5'd11;
                27'b0000000000001??????????????: lz = 5'd12;
                27'b00000000000001?????????????: lz = 5'd13;
                27'b000000000000001????????????: lz = 5'd14;
                27'b0000000000000001???????????: lz = 5'd15;
                27'b00000000000000001??????????: lz = 5'd16;
                27'b000000000000000001?????????: lz = 5'd17;
                27'b0000000000000000001????????: lz = 5'd18;
                27'b00000000000000000001???????: lz = 5'd19;
                27'b000000000000000000001??????: lz = 5'd20;
                27'b0000000000000000000001?????: lz = 5'd21;
                27'b00000000000000000000001????: lz = 5'd22;
                27'b000000000000000000000001???: lz = 5'd23;
                27'b0000000000000000000000001??: lz = 5'd24;
                27'b00000000000000000000000001?: lz = 5'd25;
                27'b000000000000000000000000001: lz = 5'd26;
                default:                         lz = 5'd27;
            endcase
            if (lz == 5'd27) begin
                mant_norm = 27'd0;
                exp_norm  = 8'd0;
            end else begin
                mant_norm = sum_raw_s1[26:0] << lz;
                exp_norm  = (exp_l_s1 > {3'b0, lz}) ? (exp_l_s1 - {3'b0, lz}) : 8'd0;
            end
        end
    end

    // Register the normalization result before rounding/packing.  This breaks
    // the formerly critical sum_raw_s1 -> y path when adders are used at the
    // root of the softmax reduction tree.
    logic [26:0] mant_norm_s2;
    logic [7:0]  exp_norm_s2;
    logic        sign_l_s2, sa_s2, sb_s2;
    logic        a_is_zero_s2, b_is_zero_s2, a_is_inf_s2, b_is_inf_s2;
    logic        a_is_nan_s2, b_is_nan_s2, valid_s2;

    // Round-to-nearest-even from the registered normalized form:
    //   [26]    -> hidden 1
    //   [25:3]  -> 23 mantissa bits
    //   [2]     -> guard
    //   [1]     -> round
    //   [0]     -> sticky
    logic guard, round_b, sticky;
    logic round_up;
    logic [23:0] mant_rounded;
    logic [7:0]  exp_rounded;
    always_comb begin
        guard    = mant_norm_s2[2];
        round_b  = mant_norm_s2[1];
        sticky   = mant_norm_s2[0];
        round_up = guard & (round_b | sticky | mant_norm_s2[3]);

        mant_rounded = {1'b0, mant_norm_s2[25:3]} + {23'd0, round_up};
        exp_rounded  = exp_norm_s2;
        if (mant_rounded[23]) begin
            mant_rounded = {1'b0, 1'b1, 22'd0};
            exp_rounded  = exp_norm_s2 + 8'd1;
        end
    end

    // Pack
    logic [31:0] y_comb;
    always_comb begin
        if (a_is_nan_s2 || b_is_nan_s2 ||
            (a_is_inf_s2 && b_is_inf_s2 && (sa_s2 != sb_s2))) begin
            y_comb = {1'b0, 8'd255, 23'h400000};             // qNaN
        end else if (a_is_inf_s2) begin
            y_comb = {sa_s2, 8'd255, 23'd0};
        end else if (b_is_inf_s2) begin
            y_comb = {sb_s2, 8'd255, 23'd0};
        end else if (a_is_zero_s2 && b_is_zero_s2) begin
            y_comb = {sa_s2 & sb_s2, 8'd0, 23'd0};
        end else if (exp_rounded >= 8'd255) begin
            y_comb = {sign_l_s2, 8'd255, 23'd0};             // overflow -> inf
        end else if (mant_norm_s2 == 27'd0) begin
            y_comb = 32'd0;
        end else begin
            y_comb = {sign_l_s2, exp_rounded, mant_rounded[22:0]};
        end
    end

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            y         <= 32'd0;
            out_valid <= 1'b0;
            mant_l_ext_s0 <= '0; mant_s_ext_s0 <= '0; same_sign_s0 <= 1'b0;
            sign_l_s0 <= 1'b0; sa_s0 <= 1'b0; sb_s0 <= 1'b0; exp_l_s0 <= '0;
            a_is_zero_s0 <= 1'b0; b_is_zero_s0 <= 1'b0; a_is_inf_s0 <= 1'b0;
            b_is_inf_s0 <= 1'b0; a_is_nan_s0 <= 1'b0; b_is_nan_s0 <= 1'b0; valid_s0 <= 1'b0;
            sum_raw_s1 <= '0; same_sign_s1 <= 1'b0; sign_l_s1 <= 1'b0; sa_s1 <= 1'b0; sb_s1 <= 1'b0;
            exp_l_s1 <= '0; a_is_zero_s1 <= 1'b0; b_is_zero_s1 <= 1'b0;
            a_is_inf_s1 <= 1'b0; b_is_inf_s1 <= 1'b0; a_is_nan_s1 <= 1'b0;
            b_is_nan_s1 <= 1'b0; valid_s1 <= 1'b0;
            mant_norm_s2 <= '0; exp_norm_s2 <= '0; sign_l_s2 <= 1'b0;
            sa_s2 <= 1'b0; sb_s2 <= 1'b0; a_is_zero_s2 <= 1'b0; b_is_zero_s2 <= 1'b0;
            a_is_inf_s2 <= 1'b0; b_is_inf_s2 <= 1'b0; a_is_nan_s2 <= 1'b0;
            b_is_nan_s2 <= 1'b0; valid_s2 <= 1'b0;
        end else begin
            mant_l_ext_s0 <= mant_l_ext; mant_s_ext_s0 <= mant_s_ext;
            same_sign_s0 <= same_sign; sign_l_s0 <= sign_l; sa_s0 <= sa; sb_s0 <= sb; exp_l_s0 <= exp_l;
            a_is_zero_s0 <= a_is_zero; b_is_zero_s0 <= b_is_zero;
            a_is_inf_s0 <= a_is_inf; b_is_inf_s0 <= b_is_inf;
            a_is_nan_s0 <= a_is_nan; b_is_nan_s0 <= b_is_nan; valid_s0 <= in_valid;
            sum_raw_s1 <= sum_raw;
            same_sign_s1 <= same_sign_s0; sign_l_s1 <= sign_l_s0; sa_s1 <= sa_s0; sb_s1 <= sb_s0; exp_l_s1 <= exp_l_s0;
            a_is_zero_s1 <= a_is_zero_s0; b_is_zero_s1 <= b_is_zero_s0;
            a_is_inf_s1 <= a_is_inf_s0; b_is_inf_s1 <= b_is_inf_s0;
            a_is_nan_s1 <= a_is_nan_s0; b_is_nan_s1 <= b_is_nan_s0;
            valid_s1 <= valid_s0;
            mant_norm_s2 <= mant_norm; exp_norm_s2 <= exp_norm;
            sign_l_s2 <= sign_l_s1; sa_s2 <= sa_s1; sb_s2 <= sb_s1;
            a_is_zero_s2 <= a_is_zero_s1; b_is_zero_s2 <= b_is_zero_s1;
            a_is_inf_s2 <= a_is_inf_s1; b_is_inf_s2 <= b_is_inf_s1;
            a_is_nan_s2 <= a_is_nan_s1; b_is_nan_s2 <= b_is_nan_s1;
            valid_s2 <= valid_s1;
            y         <= y_comb;
            out_valid <= valid_s2;
        end
    end
endmodule
