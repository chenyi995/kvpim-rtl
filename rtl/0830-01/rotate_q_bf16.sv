// rotate_q_bf16.sv — RoPE rotate on a Q/K word, BF16, with ON-DIE sin/cos
// generation (the "M2" approach: compute the coefficients from the angle on the
// die instead of streaming them in). Per adjacent pair (a = x[2i], b = x[2i+1]),
// angle phi_i = p*theta_i is supplied as a 16-bit phase (turns), and each lane's
// sin/cos is produced by a per-pair sincos_bf16 unit; the rotation itself reuses
// the BF16 MAC (RoPIM datapath order: separate -> negate -> multiply -> add):
//     y[2i]   = a*cos - b*sin        (subtract = BF16 sign-flip on b)
//     y[2i+1] = a*sin + b*cos
//
// This is the head-to-head counterpart of rotate_q_unit.sv, but (1) BF16 instead
// of FP16 and (2) cos/sin generated on-die rather than taken as operand ports —
// so its area/timing INCLUDES the coefficient generator. Latency = sincos (3) +
// multiply (1) + add (1) = 5 cycles, registered and valid-piped.
module rotate_q_bf16 #(
    parameter integer PAIRS = 8      // 8 pairs = 16 BF16 lanes = one 256b word
) (
    input  logic                     clk,
    input  logic                     rst_n,
    input  logic                     in_valid,
    input  logic [PAIRS-1:0][15:0]   x_even,   // a = x[2i]
    input  logic [PAIRS-1:0][15:0]   x_odd,    // b = x[2i+1]
    input  logic [PAIRS-1:0][15:0]   phase,    // per-pair angle p*theta_i (turns)
    output logic [PAIRS-1:0][15:0]   y_even,
    output logic [PAIRS-1:0][15:0]   y_odd,
    output logic                     out_valid
);
    localparam integer SC_LAT = 3;       // sincos_bf16 latency

    logic [PAIRS-1:0] pair_ov;

    genvar p;
    generate
        for (p = 0; p < PAIRS; p++) begin : g_pair
            // ---- on-die cos/sin for this pair's angle ----
            logic [15:0] c, s;
            logic        sc_v;
            sincos_bf16 u_sc (
                .clk(clk), .rst_n(rst_n), .in_valid(in_valid),
                .phase(phase[p]), .sin_bf16(s), .cos_bf16(c), .out_valid(sc_v)
            );

            // ---- delay a/b by the sincos latency so they align with c/s ----
            logic [15:0] a_pipe [1:SC_LAT];
            logic [15:0] b_pipe [1:SC_LAT];
            always_ff @(posedge clk or negedge rst_n) begin
                if (!rst_n) begin
                    for (int j = 1; j <= SC_LAT; j++) begin
                        a_pipe[j] <= 16'd0;
                        b_pipe[j] <= 16'd0;
                    end
                end else begin
                    a_pipe[1] <= x_even[p];
                    b_pipe[1] <= x_odd[p];
                    for (int j = 2; j <= SC_LAT; j++) begin
                        a_pipe[j] <= a_pipe[j-1];
                        b_pipe[j] <= b_pipe[j-1];
                    end
                end
            end
            wire [15:0] a_d   = a_pipe[SC_LAT];
            wire [15:0] b_d   = b_pipe[SC_LAT];
            wire [15:0] b_neg = {~b_d[15], b_d[14:0]};   // NEGATE = BF16 sign flip

            // ---- MULTIPLY: a*c, (-b)*s, a*s, b*c ----
            logic [15:0] p_ac, p_nbs, p_as, p_bc;
            logic        v_ac, v_as;
            bf16_mult m_ac  (.clk(clk),.rst_n(rst_n),.in_valid(sc_v),.a(a_d),  .b(c),.y(p_ac), .out_valid(v_ac));
            bf16_mult m_nbs (.clk(clk),.rst_n(rst_n),.in_valid(sc_v),.a(b_neg),.b(s),.y(p_nbs),.out_valid());
            bf16_mult m_as  (.clk(clk),.rst_n(rst_n),.in_valid(sc_v),.a(a_d),  .b(s),.y(p_as), .out_valid(v_as));
            bf16_mult m_bc  (.clk(clk),.rst_n(rst_n),.in_valid(sc_v),.a(b_d),  .b(c),.y(p_bc), .out_valid());

            // ---- ADD: even = a*c + (-b*s) ; odd = a*s + b*c ----
            logic v_even;
            bf16_add a_even (.clk(clk),.rst_n(rst_n),.in_valid(v_ac),.a(p_ac),.b(p_nbs),.y(y_even[p]),.out_valid(v_even));
            bf16_add a_odd  (.clk(clk),.rst_n(rst_n),.in_valid(v_as),.a(p_as),.b(p_bc), .y(y_odd[p]), .out_valid());

            assign pair_ov[p] = v_even;
        end
    endgenerate

    // All lanes share the same latency; tap pair 0.
    assign out_valid = pair_ov[0];
endmodule
