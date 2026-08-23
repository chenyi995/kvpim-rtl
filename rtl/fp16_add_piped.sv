// fp16_add_piped.sv — FP16 adder with NUM_PIPE pipeline registers, in the
// T-cube / CVFPU style: the whole add is one combinational cloud, followed by
// NUM_PIPE registers that register *retiming* (retime=true, high effort) then
// spreads back through the align/add/normalize/round logic to balance stages.
// NUM_PIPE=1 reproduces the original single-stage fp16_add.
//
// Combinational body is identical to fp16_add.sv; only the output register is
// deepened. Data pipe regs are reset-less to give retiming maximum freedom;
// the valid pipe is reset.
module fp16_add_piped #(
    parameter int unsigned NUM_PIPE = 2
) (
    input  logic        clk,
    input  logic        rst_n,
    input  logic        in_valid,
    input  logic [15:0] a,
    input  logic [15:0] b,
    output logic [15:0] y,
    output logic        out_valid
);
    // ===================== combinational FP16 add =====================
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

    logic [10:0] mant_a_in, mant_b_in;
    assign mant_a_in = (ea == 5'd0) ? 11'd0 : {1'b1, ma};
    assign mant_b_in = (eb == 5'd0) ? 11'd0 : {1'b1, mb};

    logic a_ge_b;
    assign a_ge_b = ({ea, ma} >= {eb, mb});

    logic        sign_l;
    logic [4:0]  exp_l, exp_s;
    logic [10:0] mant_l, mant_s;
    assign sign_l = a_ge_b ? sa : sb;
    assign exp_l  = a_ge_b ? ea : eb;
    assign exp_s  = a_ge_b ? eb : ea;
    assign mant_l = a_ge_b ? mant_a_in : mant_b_in;
    assign mant_s = a_ge_b ? mant_b_in : mant_a_in;

    logic [4:0] exp_diff;
    assign exp_diff = exp_l - exp_s;

    logic [13:0] mant_l_ext;
    assign mant_l_ext = {mant_l, 3'b0};
    logic [13:0] shifted;
    logic sticky_shift;
    logic [13:0] mant_s_ext;
    always_comb begin
        if (exp_diff >= 5'd14) begin
            shifted      = 14'd0;
            sticky_shift = |mant_s;
        end else begin
            shifted      = ({mant_s, 3'b0}) >> exp_diff;
            sticky_shift = |(({mant_s, 3'b0} << (14 - exp_diff)) & 14'h3FFF);
        end
        mant_s_ext = {shifted[13:1], shifted[0] | sticky_shift};
    end

    logic same_sign;
    assign same_sign = (sa == sb);

    logic [14:0] sum_raw;
    always_comb begin
        if (same_sign) sum_raw = {1'b0, mant_l_ext} + {1'b0, mant_s_ext};
        else           sum_raw = {1'b0, mant_l_ext} - {1'b0, mant_s_ext};
    end

    logic [4:0]  exp_norm;
    logic [13:0] mant_norm;
    logic [4:0]  lz;
    always_comb begin
        lz = 5'd0;
        mant_norm = sum_raw[13:0];
        exp_norm  = exp_l;
        if (same_sign && sum_raw[14]) begin
            mant_norm = {sum_raw[14:2], sum_raw[1] | sum_raw[0]};
            exp_norm  = exp_l + 5'd1;
        end else begin
            casez (sum_raw[13:0])
                14'b1?????????????: lz = 5'd0;
                14'b01????????????: lz = 5'd1;
                14'b001???????????: lz = 5'd2;
                14'b0001??????????: lz = 5'd3;
                14'b00001?????????: lz = 5'd4;
                14'b000001????????: lz = 5'd5;
                14'b0000001???????: lz = 5'd6;
                14'b00000001??????: lz = 5'd7;
                14'b000000001?????: lz = 5'd8;
                14'b0000000001????: lz = 5'd9;
                14'b00000000001???: lz = 5'd10;
                14'b000000000001??: lz = 5'd11;
                14'b0000000000001?: lz = 5'd12;
                14'b00000000000001: lz = 5'd13;
                default:            lz = 5'd14;
            endcase
            if (lz == 5'd14) begin
                mant_norm = 14'd0;
                exp_norm  = 5'd0;
            end else begin
                mant_norm = sum_raw[13:0] << lz;
                exp_norm  = (exp_l > lz) ? (exp_l - lz) : 5'd0;
            end
        end
    end

    logic guard, round_b, sticky;
    logic round_up;
    logic [10:0] mant_rounded;
    logic [4:0]  exp_rounded;
    always_comb begin
        guard    = mant_norm[2];
        round_b  = mant_norm[1];
        sticky   = mant_norm[0];
        round_up = guard & (round_b | sticky | mant_norm[3]);

        mant_rounded = {1'b0, mant_norm[12:3]} + {10'd0, round_up};
        exp_rounded  = exp_norm;
        if (mant_rounded[10]) begin
            mant_rounded = {1'b0, 1'b1, 9'd0};
            exp_rounded  = exp_norm + 5'd1;
        end
    end

    logic [15:0] y_comb;
    always_comb begin
        if (a_is_nan || b_is_nan ||
            (a_is_inf && b_is_inf && (sa != sb))) begin
            y_comb = {1'b0, 5'd31, 10'h200};
        end else if (a_is_inf) begin
            y_comb = {sa, 5'd31, 10'd0};
        end else if (b_is_inf) begin
            y_comb = {sb, 5'd31, 10'd0};
        end else if (a_is_zero && b_is_zero) begin
            y_comb = {sa & sb, 5'd0, 10'd0};
        end else if (exp_rounded == 5'd31) begin
            y_comb = {sign_l, 5'd31, 10'd0};
        end else if (mant_norm == 14'd0) begin
            y_comb = 16'd0;
        end else begin
            y_comb = {sign_l, exp_rounded, mant_rounded[9:0]};
        end
    end

    // ===================== NUM_PIPE pipeline regs (retimed) =====================
    // Data regs have no reset so retiming can move them freely through the cloud.
    logic [15:0] d_pipe [NUM_PIPE];
    logic        v_pipe [NUM_PIPE];
    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            for (int i = 0; i < NUM_PIPE; i++) v_pipe[i] <= 1'b0;
        end else begin
            v_pipe[0] <= in_valid;
            for (int i = 1; i < NUM_PIPE; i++) v_pipe[i] <= v_pipe[i-1];
        end
    end
    always_ff @(posedge clk) begin
        d_pipe[0] <= y_comb;
        for (int i = 1; i < NUM_PIPE; i++) d_pipe[i] <= d_pipe[i-1];
    end

    assign y         = d_pipe[NUM_PIPE-1];
    assign out_valid = v_pipe[NUM_PIPE-1];
endmodule
