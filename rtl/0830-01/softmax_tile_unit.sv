// softmax_unit.sv — AttAcc-style softmax datapath (FP32), three-stage pipeline
// max -> exp -> normalize, over one LANES-wide tile of scores. Wider L is
// handled by time-multiplexing this same arithmetic over the buffer (online
// softmax) in the paper; the per-lane cost (exp/add/mul/recip + adder tree)
// is what this unit captures for area/timing.
//
//   probability[l] = exp(score[l] - max) / sum_k exp(score[k] - max)
//
// Instantiates the FP32 leaf units authored alongside this file:
//   fp32_add  (also used as subtract via sign flip), fp32_exp,
//   fp32_recip, fp32_mul.  Control is valid-driven, so it tolerates whatever
//   fixed latency each leaf reports.
module softmax_tile_unit import fugue_pkg::*; #(
    // One instance serves one HBM channel.  The logic-die array instantiates
    // SM_CHANNELS copies, giving 256 PE leaves in total.
    parameter integer LANES = SM_PES_PER_CHANNEL
) (
    input  logic                    clk,
    input  logic                    rst_n,
    input  logic                    start,       // begin softmax over in_data
    input  logic [LANES-1:0][31:0]  in_data,     // LANES FP32 scores
    output logic [LANES-1:0][31:0]  out_data,    // LANES FP32 probabilities
    output logic                    out_valid,
    output logic                    busy
);
    // The all-channel array is sixteen instances of this 16-lane engine.
    // Keeping the tree fixed at 16 makes a synthesized softmax_pe usable as a
    // leaf macro in either this legacy tile block or buffered softmax_unit.
    initial if (LANES != SM_PES_PER_CHANNEL)
        $error("softmax_tile_unit is one 16-PE channel engine");
    // ---- FP32 greater-than (sign-magnitude, NaN not expected on scores) ----
    function automatic logic fp32_gt(input logic [31:0] a, input logic [31:0] b);
        logic sa, sb;
        logic [30:0] ma, mb;
        begin
            sa = a[31]; sb = b[31];
            ma = a[30:0]; mb = b[30:0];
            if (sa != sb) begin
                if (ma == 31'd0 && mb == 31'd0) fp32_gt = 1'b0;  // +0 == -0
                else                            fp32_gt = (sa == 1'b0);
            end else if (sa == 1'b0) begin
                fp32_gt = (ma > mb);                              // both >= 0
            end else begin
                fp32_gt = (ma < mb);                             // both <= 0
            end
        end
    endfunction

    // ---- captured tile + reduction results ----
    logic [LANES-1:0][31:0] score;
    logic [31:0]            gmax, neg_gmax, sumv, recipv;
    logic [LANES-1:0][31:0] e_reg;

    // ---- combinational max reduce over the captured scores ----
    // Balanced 16-input comparator tree: 8 -> 4 -> 2 -> 1.  The former
    // serial 15-comparator chain could not meet the HBM-rate clock.
    logic [31:0] mx1 [8], mx1_q [8], mx2 [4], mx2_q [4], mx3 [2];
    always_comb begin
        for (int l = 0; l < 8; l++)
            mx1[l] = fp32_gt(score[2*l], score[2*l+1]) ? score[2*l] : score[2*l+1];
        for (int l = 0; l < 4; l++)
            mx2[l] = fp32_gt(mx1_q[2*l], mx1_q[2*l+1]) ? mx1_q[2*l] : mx1_q[2*l+1];
        for (int l = 0; l < 2; l++)
            mx3[l] = fp32_gt(mx2_q[2*l], mx2_q[2*l+1]) ? mx2_q[2*l] : mx2_q[2*l+1];
    end
    wire [31:0] gmax_c = fp32_gt(mx3[0], mx3[1]) ? mx3[0] : mx3[1];

    // ---- FSM ----
    typedef enum logic [3:0] {
        IDLE, MAX_L1, MAX_L2, MAX_L3, SUB_ISSUE, SUB_WAIT, EXP_WAIT,
        SUM_ISSUE, SUM_WAIT, RECIP_WAIT, NORM_ISSUE, NORM_WAIT
    } state_e;
    state_e state;

    // issue pulses / valids from the leaf arrays
    logic        sub_iv, sum_iv, norm_iv;
    logic [LANES-1:0][31:0] sub_y;  logic sub_v;
    logic [LANES-1:0][31:0] exp_y;  logic exp_v;
    logic        tree_v;
    logic [31:0] tree_y;
    logic [31:0] recip_y; logic recip_v;
    logic [LANES-1:0][31:0] mul_y;  logic mul_v;

    assign neg_gmax = {~gmax[31], gmax[30:0]};
    assign sub_iv   = (state == SUB_ISSUE);
    assign sum_iv   = (state == SUM_ISSUE);
    assign norm_iv  = (state == NORM_ISSUE);
    assign busy     = (state != IDLE);

    // ---- LANES AttAcc softmax PEs (adder + exp + multiplier) ----
    genvar l;
    generate
        for (l = 0; l < LANES; l++) begin : g_sub
            logic v;
            logic exp_done, norm_done;
            softmax_pe u_pe (
                .clk(clk), .rst_n(rst_n), .sub_valid(sub_iv),
                .score(score[l]), .neg_max(neg_gmax), .exp_y(exp_y[l]),
                .sub_done(v), .exp_done(exp_done),
                .norm_valid(norm_iv), .norm_exp(e_reg[l]), .reciprocal(recipv),
                .prob_y(mul_y[l]), .norm_done(norm_done)
            );
            if (l == 0) begin
                assign sub_v = v;
                assign exp_v = exp_done;
                assign mul_v = norm_done;
            end
        end
    endgenerate

    // ---- FP32 sum adder tree over the registered exps (8+4+2+1) ----
    logic [31:0] t1 [8]; logic t1v [8];
    logic [31:0] t2 [4]; logic t2v [4];
    logic [31:0] t3 [2]; logic t3v [2];
    generate
        for (l = 0; l < 8; l++) begin : g_t1
            fp32_add u (.clk(clk),.rst_n(rst_n),.in_valid(sum_iv),
                        .a(e_reg[2*l]),.b(e_reg[2*l+1]),.y(t1[l]),.out_valid(t1v[l]));
        end
        for (l = 0; l < 4; l++) begin : g_t2
            fp32_add u (.clk(clk),.rst_n(rst_n),.in_valid(t1v[2*l]),
                        .a(t1[2*l]),.b(t1[2*l+1]),.y(t2[l]),.out_valid(t2v[l]));
        end
        for (l = 0; l < 2; l++) begin : g_t3
            fp32_add u (.clk(clk),.rst_n(rst_n),.in_valid(t2v[2*l]),
                        .a(t2[2*l]),.b(t2[2*l+1]),.y(t3[l]),.out_valid(t3v[l]));
        end
    endgenerate
    fp32_add u_tsum (.clk(clk),.rst_n(rst_n),.in_valid(t3v[0]),
                     .a(t3[0]),.b(t3[1]),.y(tree_y),.out_valid(tree_v));

    // ---- reciprocal of the sum, fed when the tree completes ----
    fp32_recip u_recip (.clk(clk),.rst_n(rst_n),.in_valid(tree_v),
                        .a(tree_y),.y(recip_y),.out_valid(recip_v));

    assign out_data  = mul_y;
    assign out_valid = mul_v;

    // ---- sequencing ----
    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            state  <= IDLE;
            gmax   <= '0; sumv <= '0; recipv <= '0;
            score  <= '0; e_reg <= '0; mx1_q <= '0; mx2_q <= '0;
        end else begin
            unique case (state)
                IDLE:       if (start) begin score <= in_data; state <= MAX_L1; end
                MAX_L1:     begin mx1_q <= mx1; state <= MAX_L2; end
                MAX_L2:     begin mx2_q <= mx2; state <= MAX_L3; end
                MAX_L3:     begin gmax <= gmax_c; state <= SUB_ISSUE; end
                SUB_ISSUE:  state <= SUB_WAIT;
                SUB_WAIT:   if (sub_v)   state <= EXP_WAIT;              // exp fired by sub_v
                EXP_WAIT:   if (exp_v) begin e_reg <= exp_y; state <= SUM_ISSUE; end
                SUM_ISSUE:  state <= SUM_WAIT;
                SUM_WAIT:   if (tree_v) begin sumv <= tree_y; state <= RECIP_WAIT; end
                RECIP_WAIT: if (recip_v) begin recipv <= recip_y; state <= NORM_ISSUE; end
                NORM_ISSUE: state <= NORM_WAIT;
                NORM_WAIT:  if (mul_v)   state <= IDLE;
                default:    state <= IDLE;
            endcase
        end
    end
endmodule
