// fp16_mult_piped.sv — FP16 multiplier with NUM_PIPE pipeline registers, same
// T-cube / CVFPU retiming style as fp16_add_piped: one combinational multiply
// cloud followed by NUM_PIPE registers that retiming (retime=true) distributes
// across the 11x11 multiply + normalize + round. NUM_PIPE=1 == original fp16_mult.
module fp16_mult_piped #(
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
    // ===================== combinational FP16 multiply =====================
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

    logic [10:0] mant_a, mant_b;
    assign mant_a = (ea == 5'd0) ? 11'd0 : {1'b1, ma};
    assign mant_b = (eb == 5'd0) ? 11'd0 : {1'b1, mb};

    logic [21:0] prod;
    assign prod = mant_a * mant_b;

    logic signed [7:0] exp_sum;
    assign exp_sum = $signed({1'b0, ea}) + $signed({1'b0, eb}) - 8'sd15;

    logic        top_bit;
    logic [9:0]  mant_norm;
    logic [11:0] guard_bits;
    logic signed [7:0] exp_norm;
    assign top_bit    = prod[21];
    assign mant_norm  = top_bit ? prod[20:11] : prod[19:10];
    assign guard_bits = top_bit ? {prod[10:0], 1'b0} : {prod[9:0], 2'b0};
    assign exp_norm   = top_bit ? (exp_sum + 8'sd1) : exp_sum;

    logic guard, round_b, sticky, round_up;
    assign guard    = guard_bits[11];
    assign round_b  = guard_bits[10];
    assign sticky   = |guard_bits[9:0];
    assign round_up = guard & (round_b | sticky | mant_norm[0]);

    logic [10:0] mant_rounded;
    logic signed [7:0] exp_rounded;
    always_comb begin
        mant_rounded = {1'b0, mant_norm} + {10'd0, round_up};
        exp_rounded  = exp_norm;
        if (mant_rounded[10]) begin
            mant_rounded = {1'b0, 1'b1, 9'd0};
            exp_rounded  = exp_norm + 8'sd1;
        end
    end

    logic [15:0] y_comb;
    logic        sign_out;
    assign sign_out = sa ^ sb;
    always_comb begin
        if (a_is_nan || b_is_nan ||
            (a_is_inf && b_is_zero) || (a_is_zero && b_is_inf)) begin
            y_comb = {1'b0, 5'd31, 10'h200};
        end else if (a_is_inf || b_is_inf) begin
            y_comb = {sign_out, 5'd31, 10'd0};
        end else if (a_is_zero || b_is_zero) begin
            y_comb = {sign_out, 5'd0, 10'd0};
        end else if (exp_rounded >= 8'sd31) begin
            y_comb = {sign_out, 5'd31, 10'd0};
        end else if (exp_rounded <= 8'sd0) begin
            y_comb = {sign_out, 5'd0, 10'd0};
        end else begin
            y_comb = {sign_out, exp_rounded[4:0], mant_rounded[9:0]};
        end
    end

    // ===================== NUM_PIPE pipeline regs (retimed) =====================
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
