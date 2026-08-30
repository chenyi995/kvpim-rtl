// FP32 (IEEE 754 binary32) natural exponential  y = e^x  — 4 cycle latency
// (registered output at each pipeline stage). Targeted at the softmax
// path where x = score - max <= 0, but x > 0 is handled by clamping to e^0 = 1.
//
// Method:  e^x = 2^(x * log2e),  log2e ~= 1.4426950408 (stored Q1.23).
//   t   = x * log2e            (fixed point, Q.23 magnitude; t <= 0 for x <= 0)
//   i   = floor(t)  (<= 0)     -> becomes the binary32 unbiased exponent
//   f   = t - i  in [0,1)      -> 2^f in [1,2) is the binary32 mantissa
//   2^f from a 64-entry LUT (top 6 fraction bits) with linear interpolation
//         across the low 17 fraction bits.
//
// Special / boundary handling:
//   x = +inf            -> +inf
//   x = -inf            -> +0
//   x = NaN             -> qNaN
//   x = 0 / subnormal   -> 1.0            (subnormal operands flushed to zero)
//   x > 0 (finite)      -> clamped to 1.0 (softmax domain is x <= 0)
//   t < -126  (very -x) -> +0             (result underflows to subnormal range,
//                                          flush-subnormals-to-zero)
//
// No initial blocks, no latches (every reg written on every path, async reset),
// no # delays, no DesignWare, LUT is a constant case statement.
module fp32_exp (
    input  logic        clk,
    input  logic        rst_n,
    input  logic        in_valid,
    input  logic [31:0] x,
    output logic [31:0] y,
    output logic        out_valid
);
    // -----------------------------------------------------------------------
    // Constants
    // -----------------------------------------------------------------------
    // log2e in Q1.23 (24-bit unsigned): round(1.4426950408 * 2^23) = 12102203.
    localparam logic [23:0] LOG2E_Q23 = 24'd12102203;

    // =======================================================================
    // Stage 0 (combinational): decode operand, build |x| fixed point (Q9.23).
    //   mag_u is |x| in units of 2^-23 (23 fractional bits, up to 9 integer
    //   bits).  We only need magnitudes up to ~87 for a non-zero result, so
    //   for exponents >= +8 (|x| >= 128) we force a "clamp to zero" flag.
    // =======================================================================
    logic        s0_sign;
    logic [7:0]  s0_exp;
    logic [22:0] s0_frac;
    assign s0_sign = x[31];
    assign s0_exp  = x[30:23];
    assign s0_frac = x[22:0];

    logic is_nan, is_inf, is_zero_sub, is_pos;
    assign is_nan      = (s0_exp == 8'hFF) && (s0_frac != 23'd0);
    assign is_inf      = (s0_exp == 8'hFF) && (s0_frac == 23'd0);
    assign is_zero_sub = (s0_exp == 8'd0);              // zero or subnormal
    assign is_pos      = (s0_sign == 1'b0);             // x >= 0 (finite handled below)

    // Mantissa with implicit leading 1 (operand normal here).
    logic [23:0] mant24;
    assign mant24 = {1'b1, s0_frac};

    // Real (signed) exponent of x = s0_exp - 127.
    logic signed [9:0] rexp;
    assign rexp = $signed({2'b0, s0_exp}) - 10'sd127;

    // Build |x| in Q9.23 units (2^-23). Shift mant24 left/right by rexp,
    // capping the range: exp >= +8 => |x| >= 128 => definitely clamps to 0.
    logic        clamp_big;      // magnitude too large -> e^x underflows to 0
    logic [31:0] mag_u;          // Q9.23 : integer part in [31:23], frac [22:0]
    always_comb begin
        clamp_big = 1'b0;
        mag_u     = 32'd0;
        if (rexp >= 10'sd8) begin
            // |x| >= 256 (mant24 << 8 would exceed 32b anyway) -> clamp.
            clamp_big = 1'b1;
            mag_u     = 32'd0;
        end else if (rexp >= 10'sd0) begin
            // 0 <= rexp <= 7 : left shift, result < 2^(24+7) = 2^31 -> fits 32b.
            mag_u = {8'd0, mant24} << rexp[3:0];
        end else begin
            // rexp < 0 : right shift by |rexp|.  For |rexp| >= 24 the value is
            // < 2^-23 and rounds toward the origin (mag_u = 0), which yields
            // e^x ~= 1.0 as desired.
            if ((-rexp) >= 10'sd32) begin
                mag_u = 32'd0;
            end else begin
                mag_u = {8'd0, mant24} >> (-rexp);
            end
        end
    end

    // Stage-0 -> Stage-1 registers.
    logic        s1_valid;
    logic        s1_is_nan, s1_is_inf, s1_is_zero_sub, s1_is_pos;
    logic        s1_clamp_big;
    logic [31:0] s1_mag_u;
    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            s1_valid       <= 1'b0;
            s1_is_nan      <= 1'b0;
            s1_is_inf      <= 1'b0;
            s1_is_zero_sub <= 1'b0;
            s1_is_pos      <= 1'b0;
            s1_clamp_big   <= 1'b0;
            s1_mag_u       <= 32'd0;
        end else begin
            s1_valid       <= in_valid;
            s1_is_nan      <= is_nan;
            s1_is_inf      <= is_inf;
            s1_is_zero_sub <= is_zero_sub;
            s1_is_pos      <= is_pos;
            s1_clamp_big   <= clamp_big;
            s1_mag_u       <= mag_u;
        end
    end

    // =======================================================================
    // Stage 1 (combinational): t = |x| * log2e ; split floor / fraction.
    //   product units: 2^-23 (mag) * 2^-23 (log2e) = 2^-46
    //   shift right 23 -> Q.23 magnitude of |t|  (units 2^-23).
    // =======================================================================
    logic [55:0] prod;                 // 32 * 24 = 56 bits
    assign prod = s1_mag_u * LOG2E_Q23;

    logic [32:0] t_mag_u;              // |t| in Q.23 units (33 bits is ample)
    assign t_mag_u = prod[55:23];

    logic [9:0]  int_mag;             // integer part of |t|
    logic [22:0] frac_mag;           // fractional part of |t| (23 bits)
    assign int_mag  = t_mag_u[32:23];
    assign frac_mag = t_mag_u[22:0];

    // floor(t) for t <= 0:
    //   frac == 0 : i = -int_mag,        f = 0
    //   frac != 0 : i = -(int_mag + 1),  f = 1 - frac  (f in (0,1))
    // floor_mag = |i| used for the -126 clamp test.
    logic [10:0] floor_mag;           // |floor(t)|
    logic [22:0] f_u;                 // f in Q.23  (units 2^-23), in [0,1)
    always_comb begin
        if (frac_mag == 23'd0) begin
            floor_mag = {1'b0, int_mag};
            f_u       = 23'd0;
        end else begin
            floor_mag = {1'b0, int_mag} + 11'd1;
            f_u       = (23'd0 - frac_mag);      // 2^23 - frac_mag
        end
    end

    // Underflow clamp: |floor(t)| > 126 (or magnitude-too-large flag).
    logic s1_underflow;
    assign s1_underflow = s1_clamp_big || (floor_mag > 11'd126);

    // Stage-1 -> Stage-2 registers.
    logic        s2_valid;
    logic        s2_is_nan, s2_is_inf, s2_is_zero_sub, s2_is_pos;
    logic        s2_underflow;
    logic [10:0] s2_floor_mag;
    logic [22:0] s2_f_u;
    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            s2_valid       <= 1'b0;
            s2_is_nan      <= 1'b0;
            s2_is_inf      <= 1'b0;
            s2_is_zero_sub <= 1'b0;
            s2_is_pos      <= 1'b0;
            s2_underflow   <= 1'b0;
            s2_floor_mag   <= 11'd0;
            s2_f_u         <= 23'd0;
        end else begin
            s2_valid       <= s1_valid;
            s2_is_nan      <= s1_is_nan;
            s2_is_inf      <= s1_is_inf;
            s2_is_zero_sub <= s1_is_zero_sub;
            s2_is_pos      <= s1_is_pos;
            s2_underflow   <= s1_underflow;
            s2_floor_mag   <= floor_mag;
            s2_f_u         <= f_u;
        end
    end

    // =======================================================================
    // Stage 2 (combinational): 2^f via LUT + linear interpolation, assemble.
    //   LUT indexed by top 6 fraction bits (64 entries); low 17 bits drive the
    //   interpolation between LUT[idx] and LUT[idx+1].  Each entry stores the
    //   23-bit fraction of 2^(k/64) in [1,2), i.e. round((2^(k/64)-1)*2^23).
    // =======================================================================
    logic [5:0]  lut_idx;
    logic [16:0] frac_lo;
    assign lut_idx = s2_f_u[22:17];
    assign frac_lo = s2_f_u[16:0];

    logic [23:0] lut_base;            // 2^(idx/64)      fraction (24b headroom)
    logic [23:0] lut_next;            // 2^((idx+1)/64)  fraction; idx=63 -> 2.0
    always_comb begin
        unique case (lut_idx)
            6'd0  : lut_base = 24'd0;   6'd1  : lut_base = 24'd91346;
            6'd2  : lut_base = 24'd183687;   6'd3  : lut_base = 24'd277033;
            6'd4  : lut_base = 24'd371395;   6'd5  : lut_base = 24'd466786;
            6'd6  : lut_base = 24'd563215;   6'd7  : lut_base = 24'd660693;
            6'd8  : lut_base = 24'd759234;   6'd9  : lut_base = 24'd858847;
            6'd10 : lut_base = 24'd959546;   6'd11 : lut_base = 24'd1061340;
            6'd12 : lut_base = 24'd1164243;   6'd13 : lut_base = 24'd1268267;
            6'd14 : lut_base = 24'd1373424;   6'd15 : lut_base = 24'd1479725;
            6'd16 : lut_base = 24'd1587184;   6'd17 : lut_base = 24'd1695814;
            6'd18 : lut_base = 24'd1805626;   6'd19 : lut_base = 24'd1916634;
            6'd20 : lut_base = 24'd2028850;   6'd21 : lut_base = 24'd2142289;
            6'd22 : lut_base = 24'd2256963;   6'd23 : lut_base = 24'd2372886;
            6'd24 : lut_base = 24'd2490071;   6'd25 : lut_base = 24'd2608532;
            6'd26 : lut_base = 24'd2728283;   6'd27 : lut_base = 24'd2849338;
            6'd28 : lut_base = 24'd2971711;   6'd29 : lut_base = 24'd3095417;
            6'd30 : lut_base = 24'd3220470;   6'd31 : lut_base = 24'd3346884;
            6'd32 : lut_base = 24'd3474675;   6'd33 : lut_base = 24'd3603858;
            6'd34 : lut_base = 24'd3734447;   6'd35 : lut_base = 24'd3866459;
            6'd36 : lut_base = 24'd3999908;   6'd37 : lut_base = 24'd4134810;
            6'd38 : lut_base = 24'd4271181;   6'd39 : lut_base = 24'd4409037;
            6'd40 : lut_base = 24'd4548394;   6'd41 : lut_base = 24'd4689269;
            6'd42 : lut_base = 24'd4831678;   6'd43 : lut_base = 24'd4975637;
            6'd44 : lut_base = 24'd5121164;   6'd45 : lut_base = 24'd5268276;
            6'd46 : lut_base = 24'd5416990;   6'd47 : lut_base = 24'd5567323;
            6'd48 : lut_base = 24'd5719293;   6'd49 : lut_base = 24'd5872918;
            6'd50 : lut_base = 24'd6028216;   6'd51 : lut_base = 24'd6185205;
            6'd52 : lut_base = 24'd6343903;   6'd53 : lut_base = 24'd6504329;
            6'd54 : lut_base = 24'd6666503;   6'd55 : lut_base = 24'd6830442;
            6'd56 : lut_base = 24'd6996167;   6'd57 : lut_base = 24'd7163696;
            6'd58 : lut_base = 24'd7333050;   6'd59 : lut_base = 24'd7504247;
            6'd60 : lut_base = 24'd7677309;   6'd61 : lut_base = 24'd7852255;
            6'd62 : lut_base = 24'd8029107;   6'd63 : lut_base = 24'd8207884;
            default: lut_base = 24'd0;
        endcase
        unique case (lut_idx)
            6'd0  : lut_next = 24'd91346;   6'd1  : lut_next = 24'd183687;
            6'd2  : lut_next = 24'd277033;   6'd3  : lut_next = 24'd371395;
            6'd4  : lut_next = 24'd466786;   6'd5  : lut_next = 24'd563215;
            6'd6  : lut_next = 24'd660693;   6'd7  : lut_next = 24'd759234;
            6'd8  : lut_next = 24'd858847;   6'd9  : lut_next = 24'd959546;
            6'd10 : lut_next = 24'd1061340;   6'd11 : lut_next = 24'd1164243;
            6'd12 : lut_next = 24'd1268267;   6'd13 : lut_next = 24'd1373424;
            6'd14 : lut_next = 24'd1479725;   6'd15 : lut_next = 24'd1587184;
            6'd16 : lut_next = 24'd1695814;   6'd17 : lut_next = 24'd1805626;
            6'd18 : lut_next = 24'd1916634;   6'd19 : lut_next = 24'd2028850;
            6'd20 : lut_next = 24'd2142289;   6'd21 : lut_next = 24'd2256963;
            6'd22 : lut_next = 24'd2372886;   6'd23 : lut_next = 24'd2490071;
            6'd24 : lut_next = 24'd2608532;   6'd25 : lut_next = 24'd2728283;
            6'd26 : lut_next = 24'd2849338;   6'd27 : lut_next = 24'd2971711;
            6'd28 : lut_next = 24'd3095417;   6'd29 : lut_next = 24'd3220470;
            6'd30 : lut_next = 24'd3346884;   6'd31 : lut_next = 24'd3474675;
            6'd32 : lut_next = 24'd3603858;   6'd33 : lut_next = 24'd3734447;
            6'd34 : lut_next = 24'd3866459;   6'd35 : lut_next = 24'd3999908;
            6'd36 : lut_next = 24'd4134810;   6'd37 : lut_next = 24'd4271181;
            6'd38 : lut_next = 24'd4409037;   6'd39 : lut_next = 24'd4548394;
            6'd40 : lut_next = 24'd4689269;   6'd41 : lut_next = 24'd4831678;
            6'd42 : lut_next = 24'd4975637;   6'd43 : lut_next = 24'd5121164;
            6'd44 : lut_next = 24'd5268276;   6'd45 : lut_next = 24'd5416990;
            6'd46 : lut_next = 24'd5567323;   6'd47 : lut_next = 24'd5719293;
            6'd48 : lut_next = 24'd5872918;   6'd49 : lut_next = 24'd6028216;
            6'd50 : lut_next = 24'd6185205;   6'd51 : lut_next = 24'd6343903;
            6'd52 : lut_next = 24'd6504329;   6'd53 : lut_next = 24'd6666503;
            6'd54 : lut_next = 24'd6830442;   6'd55 : lut_next = 24'd6996167;
            6'd56 : lut_next = 24'd7163696;   6'd57 : lut_next = 24'd7333050;
            6'd58 : lut_next = 24'd7504247;   6'd59 : lut_next = 24'd7677309;
            6'd60 : lut_next = 24'd7852255;   6'd61 : lut_next = 24'd8029107;
            6'd62 : lut_next = 24'd8207884;   6'd63 : lut_next = 24'd8388608; // 2.0
            default: lut_next = 24'd0;
        endcase
    end

    // Register the LUT result before interpolation.  A 64-way decode followed
    // by the 24x17 interpolation multiply was the limiting stage at 666 MHz.
    logic        s3_valid;
    logic        s3_is_nan, s3_is_inf, s3_is_zero_sub, s3_is_pos;
    logic        s3_underflow;
    logic [10:0] s3_floor_mag;
    logic [23:0] s3_lut_base, s3_lut_delta;
    logic [16:0] s3_frac_lo;
    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            s3_valid       <= 1'b0;
            s3_is_nan      <= 1'b0;
            s3_is_inf      <= 1'b0;
            s3_is_zero_sub <= 1'b0;
            s3_is_pos      <= 1'b0;
            s3_underflow   <= 1'b0;
            s3_floor_mag   <= 11'd0;
            s3_lut_base    <= 24'd0;
            s3_lut_delta   <= 24'd0;
            s3_frac_lo     <= 17'd0;
        end else begin
            s3_valid       <= s2_valid;
            s3_is_nan      <= s2_is_nan;
            s3_is_inf      <= s2_is_inf;
            s3_is_zero_sub <= s2_is_zero_sub;
            s3_is_pos      <= s2_is_pos;
            s3_underflow   <= s2_underflow;
            s3_floor_mag   <= s2_floor_mag;
            s3_lut_base    <= lut_base;
            s3_lut_delta   <= lut_next - lut_base;
            s3_frac_lo     <= frac_lo;
        end
    end

    // Linear interpolation: base + (next-base) * frac_lo / 2^17.
    // Split the interpolation multiply into two parallel 12x17 products.
    // This is functionally identical to a 24x17 multiply but shortens the
    // carry-save reduction depth in the standard-cell implementation.
    logic [28:0] interp_lo, interp_hi;
    logic [40:0] interp_prod;
    assign interp_lo   = s3_lut_delta[11:0]  * s3_frac_lo;
    assign interp_hi   = s3_lut_delta[23:12] * s3_frac_lo;
    assign interp_prod = {12'd0, interp_lo} + {interp_hi, 12'd0};
    logic [23:0] mant_frac;                              // 23-bit 2^f fraction (+1 guard)
    assign mant_frac = s3_lut_base + interp_prod[40:17];

    // Saturate to the largest representable fraction (should not overflow, but
    // guard against the 2.0 boundary case).
    logic [22:0] mant_out;
    assign mant_out = mant_frac[23] ? 23'h7FFFFF : mant_frac[22:0];

    // binary32 exponent field:  i = -floor_mag ,  biased = 127 - floor_mag.
    logic signed [9:0] exp_field;
    assign exp_field = 10'sd127 - $signed({1'b0, s3_floor_mag[8:0]});

    // Assemble result with all boundary handling.
    logic [31:0] y_comb;
    always_comb begin
        if (s3_is_nan) begin
            y_comb = 32'h7FC00000;                       // qNaN
        end else if (s3_is_inf && s3_is_pos) begin
            y_comb = 32'h7F800000;                       // e^(+inf) = +inf
        end else if (s3_is_inf) begin
            y_comb = 32'h00000000;                       // e^(-inf) = +0
        end else if (s3_is_zero_sub || s3_is_pos) begin
            y_comb = 32'h3F800000;                       // e^0 = 1 ; x>0 clamp->1
        end else if (s3_underflow) begin
            y_comb = 32'h00000000;                       // underflow flush -> +0
        end else if (exp_field <= 10'sd0) begin
            y_comb = 32'h00000000;                       // subnormal flush -> +0
        end else if (exp_field >= 10'sd255) begin
            y_comb = 32'h7F800000;                       // overflow -> +inf
        end else begin
            y_comb = {1'b0, exp_field[7:0], mant_out};
        end
    end

    // Stage-2 -> output registers.
    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            y         <= 32'd0;
            out_valid <= 1'b0;
        end else begin
            y         <= y_comb;
            out_valid <= s3_valid;
        end
    end
endmodule
