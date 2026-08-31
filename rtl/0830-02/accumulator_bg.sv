// accumulator_bg.sv — the bank-group-level accumulator.
//
// Spec (docs/Hardware Overhead.md, BG-level): ONE accumulator per bank group
// that can be switched between a BYPASS mode and a SUM mode.  Sum mode takes
// four FP16 partial results in parallel and produces their sum as one FP16
// (row-wise KV partitioning: the four banks of the group each contribute a
// partial dot product that must be reduced).  Bypass mode is used for
// column-wise partitioning, where each input is already a complete result:
// the four captured inputs are forwarded unmodified, one per cycle, onto the
// single FP16 output.
//
//   sum mode    : out = ((p0+p1) + (p2+p3)), 2-level FP16 adder tree
//                 (3 fp16_add), latency 2, one result per in_valid.
//   bypass mode : latency 1..4, out streams p0,p1,p2,p3 with out_valid
//                 high for four cycles.  One transaction at a time.
module accumulator_bg (
    input  logic               clk,
    input  logic               rst_n,
    input  logic               in_valid,
    input  logic               mode_bypass,   // 1 = bypass, 0 = sum
    input  logic [3:0][15:0]   parts,         // FP16 partials from the 4 banks
    output logic [15:0]        out,
    output logic               out_valid
);
    // ---- sum mode: 2-level FP16 adder tree ----
    logic [15:0] s1 [2];
    logic        s1_v [2];
    logic [15:0] tree_sum;
    logic        tree_v;
    wire  sum_iv = in_valid & ~mode_bypass;

    fp16_add u_l1a (.clk(clk), .rst_n(rst_n), .in_valid(sum_iv),
                    .a(parts[0]), .b(parts[1]), .y(s1[0]), .out_valid(s1_v[0]));
    fp16_add u_l1b (.clk(clk), .rst_n(rst_n), .in_valid(sum_iv),
                    .a(parts[2]), .b(parts[3]), .y(s1[1]), .out_valid(s1_v[1]));
    fp16_add u_l2  (.clk(clk), .rst_n(rst_n), .in_valid(s1_v[0]),
                    .a(s1[0]), .b(s1[1]), .y(tree_sum), .out_valid(tree_v));

    // ---- bypass mode: capture the four lanes, shift one out per cycle ----
    logic [3:0][15:0] byp_q;
    logic [2:0]       byp_left;   // lanes still to emit
    logic [15:0]      byp_out;
    logic             byp_v;

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            byp_q <= '0; byp_left <= '0; byp_out <= '0; byp_v <= 1'b0;
        end else begin
            byp_v <= 1'b0;
            if (in_valid && mode_bypass && (byp_left == 3'd0)) begin
                byp_out  <= parts[0];
                byp_v    <= 1'b1;
                byp_q    <= {16'd0, parts[3], parts[2], parts[1]};
                byp_left <= 3'd3;
            end else if (byp_left != 3'd0) begin
                byp_out  <= byp_q[0];
                byp_v    <= 1'b1;
                byp_q    <= {16'd0, byp_q[3:1]};
                byp_left <= byp_left - 3'd1;
            end
        end
    end

    assign out       = mode_bypass ? byp_out : tree_sum;
    assign out_valid = mode_bypass ? byp_v   : tree_v;
endmodule
