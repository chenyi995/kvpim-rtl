// rotate_q_unit.sv — RoPE (rotary position embedding) rotate applied to a
// 256-bit (16 FP16 lane = 8 pair) Q/K word, in RoPIM's datapath order:
//   SEPARATE (adjacent pair) -> NEGATE (sign flip) -> MULTIPLY (x cos/sin) -> ADD
// (RoPIM: Jeon et al., "RoPIM: A PIM Architecture for Accelerating Rotary
//  Positional Embedding," IEEE CAL 2025.)
//
// Pairing convention: ADJACENT-PAIR (x[2i], x[2i+1]) sharing angle p*theta_i,
// theta_i = base^(-2i/d).  Per pair (a=x[2i], b=x[2i+1], c=cos, s=sin):
//     y[2i]   = a*c - b*s
//     y[2i+1] = a*s + b*c
// The "-b*s" term is realized by NEGATING b before the multiply — for IEEE
// float, negate == flip bit[15] (no carry), which is exactly RoPIM's
// "separate, then negate, then multiply, then add" ordering.
//
// cos/sin are supplied as pre-computed operand words (RoPIM streams them from
// DRAM operand rows; Fugue holds per-agent sin/cos in die-level registers) —
// NOT CORDIC and NOT an on-die trig ROM. For pair i, both lane 2i and 2i+1 of
// cos_word/sin_word carry the pair's cos_i / sin_i.
//
// Reuses the proven fp16_mult / fp16_add primitives. Latency = 2 cycles
// (1 multiply + 1 add), registered, valid-piped.
module rotate_q_unit (
    input  logic         clk,
    input  logic         rst_n,
    input  logic         in_valid,
    input  logic [255:0] x_word,    // 16 FP16 lanes (8 pairs) of Q/K
    input  logic [255:0] cos_word,  // per-lane cos (cos_i duplicated across pair)
    input  logic [255:0] sin_word,  // per-lane sin (sin_i duplicated across pair)
    output logic [255:0] y_word,    // rotated output
    output logic         out_valid
);
    logic [7:0] pair_ov;   // per-pair even-adder valid (all identical latency)

    genvar p;
    generate
        for (p = 0; p < 8; p++) begin : g_pair
            localparam int LO = (2*p)   * 16;   // even lane bit offset
            localparam int HI = (2*p+1) * 16;   // odd  lane bit offset

            logic [15:0] a, b, c, s, b_neg;
            assign a     = x_word  [LO +: 16];
            assign b     = x_word  [HI +: 16];
            assign c     = cos_word[LO +: 16];               // cos_i
            assign s     = sin_word[LO +: 16];               // sin_i
            // NEGATE: flip sign bit of b (the term subtracted for the even out).
            assign b_neg = {~b[15], b[14:0]};

            // MULTIPLY: 4 products — a*c, (-b)*s, a*s, b*c
            logic [15:0] p_ac, p_nbs, p_as, p_bc;
            logic        v_ac, v_nbs, v_as, v_bc;
            fp16_mult m_ac  (.clk(clk),.rst_n(rst_n),.in_valid(in_valid),.a(a),    .b(c),.y(p_ac), .out_valid(v_ac));
            fp16_mult m_nbs (.clk(clk),.rst_n(rst_n),.in_valid(in_valid),.a(b_neg),.b(s),.y(p_nbs),.out_valid(v_nbs));
            fp16_mult m_as  (.clk(clk),.rst_n(rst_n),.in_valid(in_valid),.a(a),    .b(s),.y(p_as), .out_valid(v_as));
            fp16_mult m_bc  (.clk(clk),.rst_n(rst_n),.in_valid(in_valid),.a(b),    .b(c),.y(p_bc), .out_valid(v_bc));

            // ADD: even = a*c + (-b*s) ; odd = a*s + b*c
            logic v_even, v_odd;
            fp16_add a_even (.clk(clk),.rst_n(rst_n),.in_valid(v_ac),.a(p_ac),.b(p_nbs),.y(y_word[LO +: 16]),.out_valid(v_even));
            fp16_add a_odd  (.clk(clk),.rst_n(rst_n),.in_valid(v_as),.a(p_as),.b(p_bc), .y(y_word[HI +: 16]),.out_valid(v_odd));

            assign pair_ov[p] = v_even;
        end
    endgenerate

    // All lanes share the same 2-cycle latency; tap pair 0.
    assign out_valid = pair_ov[0];
endmodule
