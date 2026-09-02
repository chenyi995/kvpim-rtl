// FP32 (IEEE 754 binary32) reciprocal  y = 1/a  for a > 0 (softmax denominator).
// 4-cycle latency (registered output). out_valid follows in_valid through the SAME
// four register stages as the data. Subnormals are flushed to zero. Round-to-nearest-
// even on the final mantissa. Boundary handling: a==+0 (or subnormal) -> +inf,
// a==+inf -> +0, a==NaN -> qNaN, overflow -> +inf, underflow -> +0.
//
// Algorithm:  a = 1.m * 2^(E-127),  1/a = (1/1.m) * 2^(127-E).
//   * A 256-entry constant LUT (indexed by the top 8 mantissa bits) provides an
//     initial reciprocal seed r0 ~= 1/1.m in Q2.30 fixed point.
//   * ONE Newton-Raphson iteration refines it:  r1 = r0 * (2 - m*r0).
//   * 1/1.m lands in (0.5, 1], so the reciprocal is left-normalized (leading-1 at
//     bit 30/29/28 of r1) and the biased result exponent is p + 224 - E, where p is
//     the leading-1 bit position (p=29 is the common case giving 253 - E).
// No division operator is used; the LUT is a constant case statement.
module fp32_recip (
    input  logic        clk,
    input  logic        rst_n,
    input  logic        in_valid,
    input  logic [31:0] a,
    output logic [31:0] y,
    output logic        out_valid
);
    // ---------------------------------------------------------------------------
    // Stage 0 (combinational): decompose, classify, seed lookup
    // ---------------------------------------------------------------------------
    logic [7:0]  ea;
    logic [22:0] ma;
    assign ea = a[30:23];
    assign ma = a[22:0];

    logic a_is_zero, a_is_sub, a_is_inf, a_is_nan;
    assign a_is_zero = (ea == 8'd0)   && (ma == 23'd0);   // +0 (sign ignored, a>0 assumed)
    assign a_is_sub  = (ea == 8'd0)   && (ma != 23'd0);   // subnormal -> flushed to 0
    assign a_is_inf  = (ea == 8'd255) && (ma == 23'd0);
    assign a_is_nan  = (ea == 8'd255) && (ma != 23'd0);

    // Mantissa with implicit leading 1: M = {1, ma} interpreted as Q1.23 (24-bit).
    logic [23:0] mant_M;
    assign mant_M = {1'b1, ma};

    // Seed index: top 8 mantissa bits.
    logic [7:0] seed_idx;
    assign seed_idx = ma[22:15];

    // Reciprocal seed r0 ~= 1/(1.m) in Q2.30 (value in (0.5,1]); constant LUT.
    logic [31:0] seed;
    always_comb begin
        seed = 32'h20080201;                 // safe default (index 255)
        case (seed_idx)
            8'd0  : seed = 32'h3FE00FF8;
            8'd1  : seed = 32'h3FA08F29;
            8'd2  : seed = 32'h3F618C22;
            8'd3  : seed = 32'h3F23056D;
            8'd4  : seed = 32'h3EE4F99D;
            8'd5  : seed = 32'h3EA76748;
            8'd6  : seed = 32'h3E6A4D0B;
            8'd7  : seed = 32'h3E2DA989;
            8'd8  : seed = 32'h3DF17B67;
            8'd9  : seed = 32'h3DB5C153;
            8'd10 : seed = 32'h3D7A79FF;
            8'd11 : seed = 32'h3D3FA421;
            8'd12 : seed = 32'h3D053E73;
            8'd13 : seed = 32'h3CCB47B8;
            8'd14 : seed = 32'h3C91BEB3;
            8'd15 : seed = 32'h3C58A22E;
            8'd16 : seed = 32'h3C1FF0F8;
            8'd17 : seed = 32'h3BE7A9E3;
            8'd18 : seed = 32'h3BAFCBC6;
            8'd19 : seed = 32'h3B78557D;
            8'd20 : seed = 32'h3B4145E7;
            8'd21 : seed = 32'h3B0A9BE8;
            8'd22 : seed = 32'h3AD45668;
            8'd23 : seed = 32'h3A9E7452;
            8'd24 : seed = 32'h3A68F498;
            8'd25 : seed = 32'h3A33D62B;
            8'd26 : seed = 32'h39FF1804;
            8'd27 : seed = 32'h39CAB91D;
            8'd28 : seed = 32'h3996B877;
            8'd29 : seed = 32'h39631512;
            8'd30 : seed = 32'h392FCDF6;
            8'd31 : seed = 32'h38FCE22C;
            8'd32 : seed = 32'h38CA50C0;
            8'd33 : seed = 32'h389818C3;
            8'd34 : seed = 32'h38663948;
            8'd35 : seed = 32'h3834B166;
            8'd36 : seed = 32'h38038038;
            8'd37 : seed = 32'h37D2A4DA;
            8'd38 : seed = 32'h37A21E6D;
            8'd39 : seed = 32'h3771EC13;
            8'd40 : seed = 32'h37420CF3;
            8'd41 : seed = 32'h37128037;
            8'd42 : seed = 32'h36E3450A;
            8'd43 : seed = 32'h36B45A9B;
            8'd44 : seed = 32'h3685C01B;
            8'd45 : seed = 32'h365774C0;
            8'd46 : seed = 32'h362977C0;
            8'd47 : seed = 32'h35FBC854;
            8'd48 : seed = 32'h35CE65BA;
            8'd49 : seed = 32'h35A14F30;
            8'd50 : seed = 32'h357483F8;
            8'd51 : seed = 32'h35480355;
            8'd52 : seed = 32'h351BCC8D;
            8'd53 : seed = 32'h34EFDEEA;
            8'd54 : seed = 32'h34C439B7;
            8'd55 : seed = 32'h3498DC40;
            8'd56 : seed = 32'h346DC5D6;
            8'd57 : seed = 32'h3442F5CB;
            8'd58 : seed = 32'h34186B72;
            8'd59 : seed = 32'h33EE2623;
            8'd60 : seed = 32'h33C42535;
            8'd61 : seed = 32'h339A6803;
            8'd62 : seed = 32'h3370EDEA;
            8'd63 : seed = 32'h3347B649;
            8'd64 : seed = 32'h331EC080;
            8'd65 : seed = 32'h32F60BF2;
            8'd66 : seed = 32'h32CD9803;
            8'd67 : seed = 32'h32A5641B;
            8'd68 : seed = 32'h327D6FA1;
            8'd69 : seed = 32'h3255BA01;
            8'd70 : seed = 32'h322E42A5;
            8'd71 : seed = 32'h320708FD;
            8'd72 : seed = 32'h31E00C78;
            8'd73 : seed = 32'h31B94C87;
            8'd74 : seed = 32'h3192C89E;
            8'd75 : seed = 32'h316C8031;
            8'd76 : seed = 32'h314672B8;
            8'd77 : seed = 32'h31209FAA;
            8'd78 : seed = 32'h30FB0681;
            8'd79 : seed = 32'h30D5A6B9;
            8'd80 : seed = 32'h30B07FCF;
            8'd81 : seed = 32'h308B9142;
            8'd82 : seed = 32'h3066DA90;
            8'd83 : seed = 32'h30425B3D;
            8'd84 : seed = 32'h301E12CC;
            8'd85 : seed = 32'h2FFA00C0;
            8'd86 : seed = 32'h2FD624A0;
            8'd87 : seed = 32'h2FB27DF3;
            8'd88 : seed = 32'h2F8F0C43;
            8'd89 : seed = 32'h2F6BCF19;
            8'd90 : seed = 32'h2F48C601;
            8'd91 : seed = 32'h2F25F088;
            8'd92 : seed = 32'h2F034E3C;
            8'd93 : seed = 32'h2EE0DEAC;
            8'd94 : seed = 32'h2EBEA16A;
            8'd95 : seed = 32'h2E9C9608;
            8'd96 : seed = 32'h2E7ABC19;
            8'd97 : seed = 32'h2E591331;
            8'd98 : seed = 32'h2E379AE6;
            8'd99 : seed = 32'h2E1652D0;
            8'd100: seed = 32'h2DF53A86;
            8'd101: seed = 32'h2DD451A2;
            8'd102: seed = 32'h2DB397BE;
            8'd103: seed = 32'h2D930C76;
            8'd104: seed = 32'h2D72AF67;
            8'd105: seed = 32'h2D52802D;
            8'd106: seed = 32'h2D327E69;
            8'd107: seed = 32'h2D12A9BA;
            8'd108: seed = 32'h2CF301C1;
            8'd109: seed = 32'h2CD38621;
            8'd110: seed = 32'h2CB4367C;
            8'd111: seed = 32'h2C951276;
            8'd112: seed = 32'h2C7619B4;
            8'd113: seed = 32'h2C574BDD;
            8'd114: seed = 32'h2C38A898;
            8'd115: seed = 32'h2C1A2F8C;
            8'd116: seed = 32'h2BFBE063;
            8'd117: seed = 32'h2BDDBAC6;
            8'd118: seed = 32'h2BBFBE60;
            8'd119: seed = 32'h2BA1EADE;
            8'd120: seed = 32'h2B843FEA;
            8'd121: seed = 32'h2B66BD34;
            8'd122: seed = 32'h2B496269;
            8'd123: seed = 32'h2B2C2F38;
            8'd124: seed = 32'h2B0F2352;
            8'd125: seed = 32'h2AF23E68;
            8'd126: seed = 32'h2AD5802B;
            8'd127: seed = 32'h2AB8E84D;
            8'd128: seed = 32'h2A9C7683;
            8'd129: seed = 32'h2A802A80;
            8'd130: seed = 32'h2A6403F9;
            8'd131: seed = 32'h2A4802A5;
            8'd132: seed = 32'h2A2C2638;
            8'd133: seed = 32'h2A106E6B;
            8'd134: seed = 32'h29F4DAF6;
            8'd135: seed = 32'h29D96B91;
            8'd136: seed = 32'h29BE1FF6;
            8'd137: seed = 32'h29A2F7DE;
            8'd138: seed = 32'h2987F306;
            8'd139: seed = 32'h296D1127;
            8'd140: seed = 32'h295251FF;
            8'd141: seed = 32'h2937B54B;
            8'd142: seed = 32'h291D3AC8;
            8'd143: seed = 32'h2902E234;
            8'd144: seed = 32'h28E8AB4E;
            8'd145: seed = 32'h28CE95D7;
            8'd146: seed = 32'h28B4A18D;
            8'd147: seed = 32'h289ACE32;
            8'd148: seed = 32'h28811B88;
            8'd149: seed = 32'h28678950;
            8'd150: seed = 32'h284E174D;
            8'd151: seed = 32'h2834C543;
            8'd152: seed = 32'h281B92F5;
            8'd153: seed = 32'h28028028;
            8'd154: seed = 32'h27E98CA1;
            8'd155: seed = 32'h27D0B825;
            8'd156: seed = 32'h27B8027C;
            8'd157: seed = 32'h279F6B6A;
            8'd158: seed = 32'h2786F2B9;
            8'd159: seed = 32'h276E982F;
            8'd160: seed = 32'h27565B95;
            8'd161: seed = 32'h273E3CB4;
            8'd162: seed = 32'h27263B56;
            8'd163: seed = 32'h270E5744;
            8'd164: seed = 32'h26F69049;
            8'd165: seed = 32'h26DEE630;
            8'd166: seed = 32'h26C758C4;
            8'd167: seed = 32'h26AFE7D2;
            8'd168: seed = 32'h26989326;
            8'd169: seed = 32'h26815A8C;
            8'd170: seed = 32'h266A3DD3;
            8'd171: seed = 32'h26533CC8;
            8'd172: seed = 32'h263C573A;
            8'd173: seed = 32'h26258CF7;
            8'd174: seed = 32'h260EDDCF;
            8'd175: seed = 32'h25F84991;
            8'd176: seed = 32'h25E1D00E;
            8'd177: seed = 32'h25CB7117;
            8'd178: seed = 32'h25B52C7C;
            8'd179: seed = 32'h259F020F;
            8'd180: seed = 32'h2588F1A2;
            8'd181: seed = 32'h2572FB07;
            8'd182: seed = 32'h255D1E11;
            8'd183: seed = 32'h25475A93;
            8'd184: seed = 32'h2531B062;
            8'd185: seed = 32'h251C1F50;
            8'd186: seed = 32'h2506A732;
            8'd187: seed = 32'h24F147DD;
            8'd188: seed = 32'h24DC0127;
            8'd189: seed = 32'h24C6D2E4;
            8'd190: seed = 32'h24B1BCEB;
            8'd191: seed = 32'h249CBF12;
            8'd192: seed = 32'h2487D930;
            8'd193: seed = 32'h24730B1B;
            8'd194: seed = 32'h245E54AC;
            8'd195: seed = 32'h2449B5B9;
            8'd196: seed = 32'h24352E1C;
            8'd197: seed = 32'h2420BDAC;
            8'd198: seed = 32'h240C6442;
            8'd199: seed = 32'h23F821B9;
            8'd200: seed = 32'h23E3F5E8;
            8'd201: seed = 32'h23CFE0AA;
            8'd202: seed = 32'h23BBE1D9;
            8'd203: seed = 32'h23A7F951;
            8'd204: seed = 32'h239426EA;
            8'd205: seed = 32'h23806A81;
            8'd206: seed = 32'h236CC3F2;
            8'd207: seed = 32'h23593317;
            8'd208: seed = 32'h2345B7CD;
            8'd209: seed = 32'h233251F1;
            8'd210: seed = 32'h231F015F;
            8'd211: seed = 32'h230BC5F5;
            8'd212: seed = 32'h22F89F8E;
            8'd213: seed = 32'h22E58E0A;
            8'd214: seed = 32'h22D29146;
            8'd215: seed = 32'h22BFA921;
            8'd216: seed = 32'h22ACD578;
            8'd217: seed = 32'h229A162B;
            8'd218: seed = 32'h22876B18;
            8'd219: seed = 32'h2274D41F;
            8'd220: seed = 32'h22625120;
            8'd221: seed = 32'h224FE1FA;
            8'd222: seed = 32'h223D868E;
            8'd223: seed = 32'h222B3EBB;
            8'd224: seed = 32'h22190A64;
            8'd225: seed = 32'h2206E967;
            8'd226: seed = 32'h21F4DBA8;
            8'd227: seed = 32'h21E2E107;
            8'd228: seed = 32'h21D0F965;
            8'd229: seed = 32'h21BF24A6;
            8'd230: seed = 32'h21AD62AA;
            8'd231: seed = 32'h219BB355;
            8'd232: seed = 32'h218A1689;
            8'd233: seed = 32'h21788C29;
            8'd234: seed = 32'h21671418;
            8'd235: seed = 32'h2155AE3A;
            8'd236: seed = 32'h21445A72;
            8'd237: seed = 32'h213318A4;
            8'd238: seed = 32'h2121E8B4;
            8'd239: seed = 32'h2110CA87;
            8'd240: seed = 32'h20FFBE01;
            8'd241: seed = 32'h20EEC306;
            8'd242: seed = 32'h20DDD97C;
            8'd243: seed = 32'h20CD0148;
            8'd244: seed = 32'h20BC3A4F;
            8'd245: seed = 32'h20AB8477;
            8'd246: seed = 32'h209ADFA6;
            8'd247: seed = 32'h208A4BC2;
            8'd248: seed = 32'h2079C8B1;
            8'd249: seed = 32'h20695659;
            8'd250: seed = 32'h2058F4A1;
            8'd251: seed = 32'h2048A370;
            8'd252: seed = 32'h203862AD;
            8'd253: seed = 32'h2028323F;
            8'd254: seed = 32'h2018120E;
            8'd255: seed = 32'h20080201;
            default: seed = 32'h20080201;
        endcase
    end

    // Special-case class encoded once so it can ride the pipeline.
    //   2'b00 = normal, 2'b01 = zero/subnormal (->+inf), 2'b10 = +inf (->+0), 2'b11 = NaN
    logic [1:0] cls_s0;
    always_comb begin
        if (a_is_nan)                 cls_s0 = 2'b11;
        else if (a_is_inf)            cls_s0 = 2'b10;
        else if (a_is_zero || a_is_sub) cls_s0 = 2'b01;
        else                          cls_s0 = 2'b00;
    end

    // ---------------------------------------------------------------------------
    // Stage 1 registers
    // ---------------------------------------------------------------------------
    logic [23:0] mant_M_s1;
    logic [31:0] seed_s1;
    logic [7:0]  ea_s1;
    logic [1:0]  cls_s1;
    logic        v_s1;

    // ---------------------------------------------------------------------------
    // Stage 1 combinational: first Newton multiply  P = M * r0  and  TWO = 2 - m*r0
    // ---------------------------------------------------------------------------
    // P is Q(23+30)=Q53 in 56 bits (value m*r0, in ~[0.5,2)).
    logic [55:0] prod_P;
    assign prod_P = mant_M_s1 * seed_s1;
    // Align P down to Q2.30 (>>23) and subtract from 2.0 (2<<30).
    logic [31:0] p30;
    logic [31:0] two_minus;
    assign p30       = prod_P[54:23];                 // 32-bit Q2.30 of m*r0
    assign two_minus = {2'b10, 30'd0} - p30;          // 2.0 (Q2.30) - m*r0 ; always >= 0 here

    // ---------------------------------------------------------------------------
    // Stage 2 registers
    // ---------------------------------------------------------------------------
    logic [31:0] seed_s2;
    logic [31:0] two_s2;
    logic [7:0]  ea_s2;
    logic [1:0]  cls_s2;
    logic        v_s2;

    // ---------------------------------------------------------------------------
    // Stage 2 combinational: second Newton multiply  r1 = r0 * (2 - m*r0)
    // ---------------------------------------------------------------------------
    // r0 (Q2.30) * two (Q2.30) = Q60 in 64 bits; take [61:30] as Q2.30 result r1.
    logic [63:0] prod_R;
    logic [31:0] recip_r1;
    assign prod_R   = seed_s2 * two_s2;
    assign recip_r1 = prod_R[61:30];                  // 32-bit Q2.30, value 1/1.m in (0.5,1]

    // ---------------------------------------------------------------------------
    // Stage 3 registers
    // ---------------------------------------------------------------------------
    logic [31:0] r1_s3;
    logic [7:0]  ea_s3;
    logic [1:0]  cls_s3;
    logic        v_s3;

    // ---------------------------------------------------------------------------
    // Stage 3 combinational: normalize, round (RNE), exponent, pack
    // ---------------------------------------------------------------------------
    // Locate the leading 1 of r1 among bits 30/29/28 (3-way normalize). The common
    // case is bit 29 (value in [0.5,1)); bit 30 only for the exact 1/1 = 1.0 case;
    // bit 28 can occur at the m->2^- endpoint where the approximation dips just
    // below 0.5. p = leading-1 position.
    logic [1:0]  lead_p;        // encodes 30/29/28 as 2/1/0
    logic [4:0]  p_val;         // actual bit position (28..30)
    always_comb begin
        if      (r1_s3[30]) begin lead_p = 2'd2; p_val = 5'd30; end
        else if (r1_s3[29]) begin lead_p = 2'd1; p_val = 5'd29; end
        else                begin lead_p = 2'd0; p_val = 5'd28; end
    end

    // Extract 23-bit fraction below the leading 1, plus guard/round/sticky.
    // For p=30: frac=[29:7] g=[6] r=[5] s=|[4:0]
    // For p=29: frac=[28:6] g=[5] r=[4] s=|[3:0]
    // For p=28: frac=[27:5] g=[4] r=[3] s=|[2:0]
    logic [22:0] frac23;
    logic        guard, round_b, sticky;
    always_comb begin
        case (lead_p)
            2'd2: begin                                   // p = 30
                frac23  = r1_s3[29:7];
                guard   = r1_s3[6];
                round_b = r1_s3[5];
                sticky  = |r1_s3[4:0];
            end
            2'd1: begin                                   // p = 29 (typical)
                frac23  = r1_s3[28:6];
                guard   = r1_s3[5];
                round_b = r1_s3[4];
                sticky  = |r1_s3[3:0];
            end
            default: begin                                // p = 28
                frac23  = r1_s3[27:5];
                guard   = r1_s3[4];
                round_b = r1_s3[3];
                sticky  = |r1_s3[2:0];
            end
        endcase
    end

    // Biased result exponent (signed to detect over/underflow): exp = p + 224 - E.
    logic signed [10:0] exp_base;
    assign exp_base = $signed({4'd0, p_val}) + 11'sd224 - $signed({3'd0, ea_s3});

    // Round-to-nearest-even.
    logic        round_up;
    logic [23:0] mant_rounded;   // 24 bits to catch carry-out
    logic signed [10:0] exp_rounded;
    assign round_up = guard & (round_b | sticky | frac23[0]);
    always_comb begin
        mant_rounded = {1'b0, frac23} + {23'd0, round_up};
        exp_rounded  = exp_base;
        if (mant_rounded[23]) begin
            // Mantissa carried out (1.111..1 -> 10.000..0): bump exponent.
            mant_rounded = 24'd0;
            exp_rounded  = exp_base + 11'sd1;
        end
    end

    // Pack result with special-case, overflow and underflow handling.
    logic [31:0] y_comb;
    always_comb begin
        case (cls_s3)
            2'b11:   y_comb = {1'b0, 8'd255, 23'h400000};   // NaN -> qNaN
            2'b10:   y_comb = 32'h00000000;                 // 1/inf -> +0
            2'b01:   y_comb = {1'b0, 8'd255, 23'd0};        // 1/0 (or subnormal) -> +inf
            default: begin
                if (exp_rounded >= 11'sd255)
                    y_comb = {1'b0, 8'd255, 23'd0};         // overflow -> +inf
                else if (exp_rounded <= 11'sd0)
                    y_comb = 32'h00000000;                  // underflow -> +0
                else
                    y_comb = {1'b0, exp_rounded[7:0], mant_rounded[22:0]};
            end
        endcase
    end

    // ---------------------------------------------------------------------------
    // Pipeline registers (4 stages: s1, s2, s3, output). out_valid tracks in_valid
    // through the same four stages.
    // ---------------------------------------------------------------------------
    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            // Stage 1
            mant_M_s1 <= 24'd0;
            seed_s1   <= 32'd0;
            ea_s1     <= 8'd0;
            cls_s1    <= 2'b00;
            v_s1      <= 1'b0;
            // Stage 2
            seed_s2   <= 32'd0;
            two_s2    <= 32'd0;
            ea_s2     <= 8'd0;
            cls_s2    <= 2'b00;
            v_s2      <= 1'b0;
            // Stage 3
            r1_s3     <= 32'd0;
            ea_s3     <= 8'd0;
            cls_s3    <= 2'b00;
            v_s3      <= 1'b0;
            // Output
            y         <= 32'd0;
            out_valid <= 1'b0;
        end else begin
            // Stage 1 <- Stage 0
            mant_M_s1 <= mant_M;
            seed_s1   <= seed;
            ea_s1     <= ea;
            cls_s1    <= cls_s0;
            v_s1      <= in_valid;
            // Stage 2 <- Stage 1
            seed_s2   <= seed_s1;
            two_s2    <= two_minus;
            ea_s2     <= ea_s1;
            cls_s2    <= cls_s1;
            v_s2      <= v_s1;
            // Stage 3 <- Stage 2
            r1_s3     <= recip_r1;
            ea_s3     <= ea_s2;
            cls_s3    <= cls_s2;
            v_s3      <= v_s2;
            // Output <- Stage 3
            y         <= y_comb;
            out_valid <= v_s3;
        end
    end
endmodule
