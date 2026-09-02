// accumulator_bg.sv — the bank-group-level accumulator, 16 lanes.
//
// AttAcc (ASPLOS'24 §5.1, §7.7): one accumulator per bank group reduces the
// partial results of the group's four banks and is bypassed under column-wise
// partitioning; its 0.036 mm^2 (1z-nm DRAM) is "mostly arithmetic units",
// i.e. one FP16 adder per output lane of the GEMV unit.  Ruling chenyi9
// 2026-09-02: model it at that width (the earlier scalar 4->1 unit covered
// only the score path).
//
//   * Datapath: 16 FP16 lanes (one GEMV output word, 256 b).  Score partials
//     use lane 0; context partials use all 16 lanes.
//   * SUM mode: the four banks' words arrive one per cycle (the group's shared
//     bus); each lane accumulates over GROUP = 4 words and the lane-wise sum
//     is emitted once — same running-accumulate microarchitecture as the
//     logic-die accumulator (fp16_add output register free-runs, so a HOLD
//     register commits on valid results and the b operand forwards the fresh
//     sum on its valid cycle).
//   * BYPASS mode: each input word is registered straight through.
module accumulator_bg #(
    parameter integer LANES = 16,
    parameter integer GROUP = 4
) (
    input  logic                    clk,
    input  logic                    rst_n,
    input  logic                    in_valid,
    input  logic                    mode_bypass,  // 1 = bypass, 0 = sum-of-GROUP
    input  logic [LANES-1:0][15:0]  in_word,      // one bank's partial word
    output logic [LANES-1:0][15:0]  out_word,
    output logic                    out_valid
);
    localparam integer CNT_W = $clog2(GROUP);

    // ---- group sequencing ----
    logic [CNT_W-1:0] cnt;
    wire sum_iv   = in_valid & ~mode_bypass;
    wire is_first = (cnt == '0);
    wire is_last  = (cnt == CNT_W'(GROUP-1));

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n)      cnt <= '0;
        else if (sum_iv) cnt <= is_last ? '0 : cnt + 1'b1;
    end

    // ---- lane accumulators ----
    logic [LANES-1:0][15:0] acc_y, acc_hold;
    logic [LANES-1:0]       acc_ov;
    genvar l;
    generate
        for (l = 0; l < LANES; l++) begin : g_lane
            fp16_add u_add (
                .clk(clk), .rst_n(rst_n), .in_valid(sum_iv),
                .a(in_word[l]),
                .b(is_first ? 16'd0 : (acc_ov[l] ? acc_y[l] : acc_hold[l])),
                .y(acc_y[l]), .out_valid(acc_ov[l])
            );
            always_ff @(posedge clk or negedge rst_n) begin
                if (!rst_n)         acc_hold[l] <= '0;
                else if (acc_ov[l]) acc_hold[l] <= acc_y[l];
            end
        end
    endgenerate

    // ---- bypass register ----
    logic [LANES-1:0][15:0] byp_q;
    logic                   byp_v;
    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            byp_q <= '0; byp_v <= 1'b0;
        end else begin
            byp_v <= in_valid & mode_bypass;
            if (in_valid & mode_bypass) byp_q <= in_word;
        end
    end

    // ---- output: sum mode strobes when the last word's add commits ----
    logic last_d, last_q;
    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            last_d <= 1'b0; last_q <= 1'b0;
        end else begin
            last_d <= sum_iv & is_last;
            last_q <= last_d;
        end
    end

    assign out_word  = mode_bypass ? byp_q : acc_hold;
    assign out_valid = mode_bypass ? byp_v : last_q;
endmodule
