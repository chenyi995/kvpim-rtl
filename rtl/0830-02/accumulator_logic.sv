// accumulator_logic.sv — one logic-die-level accumulator.
//
// Spec (docs/Hardware Overhead.md, Logic-Level): the logic die carries 16 of
// these accumulators; each can be switched between BYPASS and SUM mode.  Sum
// mode receives one 16-lane FP16 word per cycle and, after GROUP (=4) input
// words, emits their lane-wise sum as one 16-lane FP16 word (reducing the
// four bank-group / rank partials of a row-wise partitioned GEMV).  Bypass
// mode registers each input word straight through (column-wise partitioning:
// nothing to reduce).
//
// Implementation: 16 FP16 adders, one per lane, running-accumulate with the
// adder's own output register fed back (b = 0 on the first word of a group),
// which supports back-to-back input words on the 1-cycle registered adder.
module accumulator_logic #(
    parameter integer LANES = 16,
    parameter integer GROUP = 4
) (
    input  logic                    clk,
    input  logic                    rst_n,
    input  logic                    in_valid,
    input  logic                    mode_bypass,  // 1 = bypass, 0 = sum-of-GROUP
    input  logic [LANES-1:0][15:0]  in_word,
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

    // ---- 16 lane accumulators ----
    // The fp16_add output register free-runs, so each lane pairs the adder
    // with a hold register committed on valid results; the b operand forwards
    // the adder output on its valid cycle (back-to-back words) and takes the
    // hold register otherwise.
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

    // ---- output: sum mode strobes when the last word's add commits to the
    // hold registers (input -> acc_y (+1) -> acc_hold visible (+2)) ----
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
