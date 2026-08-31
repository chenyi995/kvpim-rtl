// FP32 (IEEE 754 binary32) natural exponential  y = e^x  — 8 cycle latency
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
    // Split the 32x24 range-reduction multiplication into two 16x24 partial
    // products, then recombine them in the following registered stage.
    logic [27:0] p0,p1,p2,p3,p4,p5,p6,p7;
    logic        s2q_valid, s2q_is_nan, s2q_is_inf, s2q_is_zero_sub, s2q_is_pos, s2q_clamp_big;
    logic [27:0] s2q_p0,s2q_p1,s2q_p2,s2q_p3,s2q_p4,s2q_p5,s2q_p6,s2q_p7;
    logic [31:0] prod_lo_lo, prod_lo_hi, prod_hi_lo, prod_hi_hi;
    logic        s2p_valid, s2p_is_nan, s2p_is_inf, s2p_is_zero_sub, s2p_is_pos, s2p_clamp_big;
    logic [31:0] s2p_lo_lo, s2p_lo_hi, s2p_hi_lo, s2p_hi_hi;
    logic [39:0] prod_lo, prod_hi;
    assign p0=s1_mag_u[3:0]*LOG2E_Q23; assign p1=s1_mag_u[7:4]*LOG2E_Q23;
    assign p2=s1_mag_u[11:8]*LOG2E_Q23; assign p3=s1_mag_u[15:12]*LOG2E_Q23;
    assign p4=s1_mag_u[19:16]*LOG2E_Q23; assign p5=s1_mag_u[23:20]*LOG2E_Q23;
    assign p6=s1_mag_u[27:24]*LOG2E_Q23; assign p7=s1_mag_u[31:28]*LOG2E_Q23;
    assign prod_lo_lo = {s2q_p1,4'b0}+s2q_p0; assign prod_lo_hi={s2q_p3,4'b0}+s2q_p2;
    assign prod_hi_lo = {s2q_p5,4'b0}+s2q_p4; assign prod_hi_hi={s2q_p7,4'b0}+s2q_p6;
    assign prod_lo = {s2p_lo_hi, 8'b0} + s2p_lo_lo;
    assign prod_hi = {s2p_hi_hi, 8'b0} + s2p_hi_lo;
    logic        s2m_valid, s2m_is_nan, s2m_is_inf, s2m_is_zero_sub, s2m_is_pos, s2m_clamp_big;
    logic [39:0] s2m_prod_lo, s2m_prod_hi;
    logic [55:0] prod;
    assign prod = {s2m_prod_hi, 16'b0} + {{16{1'b0}}, s2m_prod_lo};

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
    assign s1_underflow = s2m_clamp_big || (floor_mag > 11'd126);

    // Stage-1 -> Stage-2 registers.
    logic        s2_valid;
    logic        s2_is_nan, s2_is_inf, s2_is_zero_sub, s2_is_pos;
    logic        s2_underflow;
    logic [10:0] s2_floor_mag;
    logic [22:0] s2_f_u;
    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            s2q_valid<=0;s2q_is_nan<=0;s2q_is_inf<=0;s2q_is_zero_sub<=0;s2q_is_pos<=0;s2q_clamp_big<=0;
            s2q_p0<=0;s2q_p1<=0;s2q_p2<=0;s2q_p3<=0;s2q_p4<=0;s2q_p5<=0;s2q_p6<=0;s2q_p7<=0;
            s2p_valid <= 1'b0; s2p_is_nan <= 1'b0; s2p_is_inf <= 1'b0; s2p_is_zero_sub <= 1'b0; s2p_is_pos <= 1'b0; s2p_clamp_big <= 1'b0;
            s2p_lo_lo <= '0; s2p_lo_hi <= '0; s2p_hi_lo <= '0; s2p_hi_hi <= '0;
            s2m_valid      <= 1'b0; s2m_is_nan <= 1'b0; s2m_is_inf <= 1'b0;
            s2m_is_zero_sub <= 1'b0; s2m_is_pos <= 1'b0; s2m_clamp_big <= 1'b0;
            s2m_prod_lo <= '0; s2m_prod_hi <= '0;
            s2_valid       <= 1'b0;
            s2_is_nan      <= 1'b0;
            s2_is_inf      <= 1'b0;
            s2_is_zero_sub <= 1'b0;
            s2_is_pos      <= 1'b0;
            s2_underflow   <= 1'b0;
            s2_floor_mag   <= 11'd0;
            s2_f_u         <= 23'd0;
        end else begin
            s2q_valid<=s1_valid;s2q_is_nan<=s1_is_nan;s2q_is_inf<=s1_is_inf;s2q_is_zero_sub<=s1_is_zero_sub;s2q_is_pos<=s1_is_pos;s2q_clamp_big<=s1_clamp_big;
            s2q_p0<=p0;s2q_p1<=p1;s2q_p2<=p2;s2q_p3<=p3;s2q_p4<=p4;s2q_p5<=p5;s2q_p6<=p6;s2q_p7<=p7;
            s2p_valid      <= s2q_valid; s2p_is_nan <= s2q_is_nan; s2p_is_inf <= s2q_is_inf;
            s2p_is_zero_sub <= s2q_is_zero_sub; s2p_is_pos <= s2q_is_pos; s2p_clamp_big <= s2q_clamp_big;
            s2p_lo_lo <= prod_lo_lo; s2p_lo_hi <= prod_lo_hi; s2p_hi_lo <= prod_hi_lo; s2p_hi_hi <= prod_hi_hi;
            s2m_valid      <= s2p_valid;
            s2m_is_nan     <= s2p_is_nan;
            s2m_is_inf     <= s2p_is_inf;
            s2m_is_zero_sub <= s2p_is_zero_sub;
            s2m_is_pos     <= s2p_is_pos;
            s2m_clamp_big  <= s2p_clamp_big;
            s2m_prod_lo    <= prod_lo;
            s2m_prod_hi    <= prod_hi;
            s2_valid       <= s2m_valid;
            s2_is_nan      <= s2m_is_nan;
            s2_is_inf      <= s2m_is_inf;
            s2_is_zero_sub <= s2m_is_zero_sub;
            s2_is_pos      <= s2m_is_pos;
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

    // Stage-2 -> Stage-3 registers.  The LUT muxes are isolated from the
    // interpolation multiplier so this path closes at the PE macro clock.
    logic        s3_valid, s3_is_nan, s3_is_inf, s3_is_zero_sub, s3_is_pos, s3_underflow;
    logic [10:0] s3_floor_mag;
    logic [16:0] s3_frac_lo;
    logic [23:0] s3_lut_base, s3_lut_next;

    // Linear interpolation: base + (next-base) * frac_lo / 2^17.
    logic [23:0] lut_delta;
    assign lut_delta = s3_lut_next - s3_lut_base;       // >= 0, small
    // Split the interpolation products once more.  The former 12x9/12x8
    // multipliers were the post-s10 critical path; four 6-bit products keep
    // the macro leaf's individual arithmetic cones below the 0.699 ns clock.
    logic [14:0] interp_lo_lo_lo, interp_lo_lo_hi;
    logic [14:0] interp_lo_hi_lo, interp_lo_hi_hi;
    logic [13:0] interp_hi_lo_lo, interp_hi_lo_hi;
    logic [13:0] interp_hi_hi_lo, interp_hi_hi_hi;
    logic        s4_valid, s4_is_nan, s4_is_inf, s4_is_zero_sub, s4_is_pos, s4_underflow;
    logic [10:0] s4_floor_mag;
    logic [23:0] s4_lut_base, s4_delta;
    logic [16:0] s4_frac_lo;
    logic        s5_valid, s5_is_nan, s5_is_inf, s5_is_zero_sub, s5_is_pos, s5_underflow;
    logic [10:0] s5_floor_mag;
    logic [23:0] s5_lut_base;
    logic [14:0] s5_interp_lo_lo_lo, s5_interp_lo_lo_hi;
    logic [14:0] s5_interp_lo_hi_lo, s5_interp_lo_hi_hi;
    logic [13:0] s5_interp_hi_lo_lo, s5_interp_hi_lo_hi;
    logic [13:0] s5_interp_hi_hi_lo, s5_interp_hi_hi_hi;
    logic        s6_valid, s6_is_nan, s6_is_inf, s6_is_zero_sub, s6_is_pos, s6_underflow;
    logic [10:0] s6_floor_mag;
    logic [23:0] s6_lut_base;
    logic [20:0] s6_interp_lo_lo, s6_interp_lo_hi;
    logic [19:0] s6_interp_hi_lo, s6_interp_hi_hi;
    logic        s7_valid, s7_is_nan, s7_is_inf, s7_is_zero_sub, s7_is_pos, s7_underflow;
    logic [10:0] s7_floor_mag;
    logic [23:0] s7_lut_base;
    logic [32:0] s7_interp_lo;
    logic [31:0] s7_interp_hi;
    assign interp_lo_lo_lo = s4_delta[5:0]   * s4_frac_lo[8:0];
    assign interp_lo_lo_hi = s4_delta[11:6]  * s4_frac_lo[8:0];
    assign interp_lo_hi_lo = s4_delta[17:12] * s4_frac_lo[8:0];
    assign interp_lo_hi_hi = s4_delta[23:18] * s4_frac_lo[8:0];
    assign interp_hi_lo_lo = s4_delta[5:0]   * s4_frac_lo[16:9];
    assign interp_hi_lo_hi = s4_delta[11:6]  * s4_frac_lo[16:9];
    assign interp_hi_hi_lo = s4_delta[17:12] * s4_frac_lo[16:9];
    assign interp_hi_hi_hi = s4_delta[23:18] * s4_frac_lo[16:9];
    logic [40:0] interp_sum;
    assign interp_sum = {s7_interp_hi, 9'b0} + {{8{1'b0}}, s7_interp_lo};
    logic [23:0] mant_frac;                              // 23-bit 2^f fraction (+1 guard)
    assign mant_frac = s7_lut_base + interp_sum[40:17];

    // Saturate to the largest representable fraction (should not overflow, but
    // guard against the 2.0 boundary case).
    logic [22:0] mant_out;
    assign mant_out = mant_frac[23] ? 23'h7FFFFF : mant_frac[22:0];

    // binary32 exponent field:  i = -floor_mag ,  biased = 127 - floor_mag.
    logic signed [9:0] exp_field;
    assign exp_field = 10'sd127 - $signed({1'b0, s7_floor_mag[8:0]});

    // Assemble result with all boundary handling.
    logic [31:0] y_comb;
    always_comb begin
        if (s7_is_nan) begin
            y_comb = 32'h7FC00000;                       // qNaN
        end else if (s7_is_inf && s7_is_pos) begin
            y_comb = 32'h7F800000;                       // e^(+inf) = +inf
        end else if (s7_is_inf) begin
            y_comb = 32'h00000000;                       // e^(-inf) = +0
        end else if (s7_is_zero_sub || s7_is_pos) begin
            y_comb = 32'h3F800000;                       // e^0 = 1 ; x>0 clamp->1
        end else if (s7_underflow) begin
            y_comb = 32'h00000000;                       // underflow flush -> +0
        end else if (exp_field <= 10'sd0) begin
            y_comb = 32'h00000000;                       // subnormal flush -> +0
        end else if (exp_field >= 10'sd255) begin
            y_comb = 32'h7F800000;                       // overflow -> +inf
        end else begin
            y_comb = {1'b0, exp_field[7:0], mant_out};
        end
    end

    // Stage-4 -> output registers.
    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            y         <= 32'd0;
            out_valid <= 1'b0;
            s3_valid <= 1'b0; s3_is_nan <= 1'b0; s3_is_inf <= 1'b0;
            s3_is_zero_sub <= 1'b0; s3_is_pos <= 1'b0; s3_underflow <= 1'b0;
            s3_floor_mag <= '0; s3_frac_lo <= '0; s3_lut_base <= '0; s3_lut_next <= '0;
            s4_valid <= 1'b0; s4_is_nan <= 1'b0; s4_is_inf <= 1'b0;
            s4_is_zero_sub <= 1'b0; s4_is_pos <= 1'b0; s4_underflow <= 1'b0;
            s4_floor_mag <= '0; s4_lut_base <= '0; s4_delta <= '0; s4_frac_lo <= '0;
            s5_valid <= 1'b0; s5_is_nan <= 1'b0; s5_is_inf <= 1'b0; s5_is_zero_sub <= 1'b0; s5_is_pos <= 1'b0; s5_underflow <= 1'b0;
            s5_floor_mag <= '0; s5_lut_base <= '0;
            s5_interp_lo_lo_lo <= '0; s5_interp_lo_lo_hi <= '0;
            s5_interp_lo_hi_lo <= '0; s5_interp_lo_hi_hi <= '0;
            s5_interp_hi_lo_lo <= '0; s5_interp_hi_lo_hi <= '0;
            s5_interp_hi_hi_lo <= '0; s5_interp_hi_hi_hi <= '0;
            s6_valid <= 1'b0; s6_is_nan <= 1'b0; s6_is_inf <= 1'b0; s6_is_zero_sub <= 1'b0; s6_is_pos <= 1'b0; s6_underflow <= 1'b0;
            s6_floor_mag <= '0; s6_lut_base <= '0;
            s6_interp_lo_lo <= '0; s6_interp_lo_hi <= '0; s6_interp_hi_lo <= '0; s6_interp_hi_hi <= '0;
            s7_valid <= 1'b0; s7_is_nan <= 1'b0; s7_is_inf <= 1'b0; s7_is_zero_sub <= 1'b0; s7_is_pos <= 1'b0; s7_underflow <= 1'b0;
            s7_floor_mag <= '0; s7_lut_base <= '0; s7_interp_lo <= '0; s7_interp_hi <= '0;
        end else begin
            s3_valid       <= s2_valid;
            s3_is_nan      <= s2_is_nan;
            s3_is_inf      <= s2_is_inf;
            s3_is_zero_sub <= s2_is_zero_sub;
            s3_is_pos      <= s2_is_pos;
            s3_underflow   <= s2_underflow;
            s3_floor_mag   <= s2_floor_mag;
            s3_frac_lo     <= frac_lo;
            s3_lut_base    <= lut_base;
            s3_lut_next    <= lut_next;
            s4_valid       <= s3_valid;
            s4_is_nan      <= s3_is_nan;
            s4_is_inf      <= s3_is_inf;
            s4_is_zero_sub <= s3_is_zero_sub;
            s4_is_pos      <= s3_is_pos;
            s4_underflow   <= s3_underflow;
            s4_floor_mag   <= s3_floor_mag;
            s4_lut_base    <= s3_lut_base;
            s4_delta       <= lut_delta;
            s4_frac_lo     <= s3_frac_lo;
            s5_valid       <= s4_valid;
            s5_is_nan      <= s4_is_nan; s5_is_inf <= s4_is_inf; s5_is_zero_sub <= s4_is_zero_sub;
            s5_is_pos      <= s4_is_pos; s5_underflow <= s4_underflow;
            s5_floor_mag   <= s4_floor_mag; s5_lut_base <= s4_lut_base;
            s5_interp_lo_lo_lo <= interp_lo_lo_lo; s5_interp_lo_lo_hi <= interp_lo_lo_hi;
            s5_interp_lo_hi_lo <= interp_lo_hi_lo; s5_interp_lo_hi_hi <= interp_lo_hi_hi;
            s5_interp_hi_lo_lo <= interp_hi_lo_lo; s5_interp_hi_lo_hi <= interp_hi_lo_hi;
            s5_interp_hi_hi_lo <= interp_hi_hi_lo; s5_interp_hi_hi_hi <= interp_hi_hi_hi;
            s6_valid       <= s5_valid;
            s6_is_nan      <= s5_is_nan; s6_is_inf <= s5_is_inf; s6_is_zero_sub <= s5_is_zero_sub;
            s6_is_pos      <= s5_is_pos; s6_underflow <= s5_underflow;
            s6_floor_mag   <= s5_floor_mag; s6_lut_base <= s5_lut_base;
            s6_interp_lo_lo <= {s5_interp_lo_lo_hi, 6'b0} + s5_interp_lo_lo_lo;
            s6_interp_lo_hi <= {s5_interp_lo_hi_hi, 6'b0} + s5_interp_lo_hi_lo;
            s6_interp_hi_lo <= {s5_interp_hi_lo_hi, 6'b0} + s5_interp_hi_lo_lo;
            s6_interp_hi_hi <= {s5_interp_hi_hi_hi, 6'b0} + s5_interp_hi_hi_lo;
            s7_valid       <= s6_valid;
            s7_is_nan      <= s6_is_nan; s7_is_inf <= s6_is_inf; s7_is_zero_sub <= s6_is_zero_sub;
            s7_is_pos      <= s6_is_pos; s7_underflow <= s6_underflow;
            s7_floor_mag   <= s6_floor_mag; s7_lut_base <= s6_lut_base;
            s7_interp_lo   <= {s6_interp_lo_hi, 12'b0} + s6_interp_lo_lo;
            s7_interp_hi   <= {s6_interp_hi_hi, 12'b0} + s6_interp_hi_lo;
            y         <= y_comb;
            out_valid <= s7_valid;
        end
    end
endmodule
