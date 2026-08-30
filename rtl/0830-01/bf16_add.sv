// bf16_add.sv — bfloat16 (1 sign, 8 exp, 7 mant; bias 127) adder.
// 1-cycle latency (registered output). Subnormals flushed to zero,
// round-to-nearest-even. Same structure as fp16_add, re-parameterized to BF16.
module bf16_add (
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

    logic [7:0] mant_a_in, mant_b_in;
    assign mant_a_in = (ea == 8'd0) ? 8'd0 : {1'b1, ma};
    assign mant_b_in = (eb == 8'd0) ? 8'd0 : {1'b1, mb};

    // Larger operand by |x|; subtract smaller from larger.
    logic a_ge_b;
    assign a_ge_b = ({ea, ma} >= {eb, mb});

    logic       sign_l;
    logic [7:0] exp_l, exp_s;
    logic [7:0] mant_l, mant_s;
    assign sign_l = a_ge_b ? sa : sb;
    assign exp_l  = a_ge_b ? ea : eb;
    assign exp_s  = a_ge_b ? eb : ea;
    assign mant_l = a_ge_b ? mant_a_in : mant_b_in;
    assign mant_s = a_ge_b ? mant_b_in : mant_a_in;

    // Align smaller mantissa: 8-bit mantissa + 3 guard bits = 11-bit form.
    logic [7:0] exp_diff;
    assign exp_diff = exp_l - exp_s;

    logic [10:0] mant_l_ext;
    assign mant_l_ext = {mant_l, 3'b0};

    logic [10:0] shifted;
    logic        sticky_shift;
    logic [10:0] mant_s_ext;
    always_comb begin
        if (exp_diff >= 8'd11) begin
            shifted      = 11'd0;
            sticky_shift = |mant_s;
        end else begin
            shifted      = ({mant_s, 3'b0}) >> exp_diff;
            sticky_shift = |(({mant_s, 3'b0} << (11 - exp_diff)) & 11'h7FF);
        end
        mant_s_ext = {shifted[10:1], shifted[0] | sticky_shift};
    end

    // Add / subtract magnitudes
    logic same_sign;
    assign same_sign = (sa == sb);

    logic [11:0] sum_raw;
    always_comb begin
        if (same_sign) sum_raw = {1'b0, mant_l_ext} + {1'b0, mant_s_ext};
        else           sum_raw = {1'b0, mant_l_ext} - {1'b0, mant_s_ext};
    end

    // Normalize
    logic [7:0]  exp_norm;
    logic [10:0] mant_norm;
    logic [3:0]  lz;
    always_comb begin
        lz = 4'd0;
        mant_norm = sum_raw[10:0];
        exp_norm  = exp_l;
        if (same_sign && sum_raw[11]) begin
            mant_norm = {sum_raw[11:2], sum_raw[1] | sum_raw[0]};
            exp_norm  = exp_l + 8'd1;
        end else begin
            casez (sum_raw[10:0])
                11'b1??????????: lz = 4'd0;
                11'b01?????????: lz = 4'd1;
                11'b001????????: lz = 4'd2;
                11'b0001???????: lz = 4'd3;
                11'b00001??????: lz = 4'd4;
                11'b000001?????: lz = 4'd5;
                11'b0000001????: lz = 4'd6;
                11'b00000001???: lz = 4'd7;
                11'b000000001??: lz = 4'd8;
                11'b0000000001?: lz = 4'd9;
                11'b00000000001: lz = 4'd10;
                default:         lz = 4'd11;
            endcase
            if (lz == 4'd11) begin
                mant_norm = 11'd0;
                exp_norm  = 8'd0;
            end else begin
                mant_norm = sum_raw[10:0] << lz;
                exp_norm  = (exp_l > {4'd0, lz}) ? (exp_l - {4'd0, lz}) : 8'd0;
            end
        end
    end

    // Round-to-nearest-even from the 11-bit aligned form:
    //   [10]   -> hidden 1
    //   [9:3]  -> 7 mantissa bits
    //   [2]    -> guard, [1] -> round, [0] -> sticky
    logic guard, round_b, sticky;
    logic round_up;
    logic [7:0] mant_rounded;
    logic [7:0] exp_rounded;
    always_comb begin
        guard    = mant_norm[2];
        round_b  = mant_norm[1];
        sticky   = mant_norm[0];
        round_up = guard & (round_b | sticky | mant_norm[3]);

        mant_rounded = {1'b0, mant_norm[9:3]} + {7'd0, round_up};
        exp_rounded  = exp_norm;
        if (mant_rounded[7]) begin
            mant_rounded = {1'b1, 7'd0};
            exp_rounded  = exp_norm + 8'd1;
        end
    end

    // Pack
    logic [15:0] y_comb;
    always_comb begin
        if (a_is_nan || b_is_nan ||
            (a_is_inf && b_is_inf && (sa != sb))) begin
            y_comb = {1'b0, 8'd255, 7'h40};                  // qNaN
        end else if (a_is_inf) begin
            y_comb = {sa, 8'd255, 7'd0};
        end else if (b_is_inf) begin
            y_comb = {sb, 8'd255, 7'd0};
        end else if (a_is_zero && b_is_zero) begin
            y_comb = {sa & sb, 8'd0, 7'd0};
        end else if (exp_rounded == 8'd255) begin
            y_comb = {sign_l, 8'd255, 7'd0};                 // overflow -> inf
        end else if (mant_norm == 11'd0) begin
            y_comb = 16'd0;
        end else begin
            y_comb = {sign_l, exp_rounded, mant_rounded[6:0]};
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
