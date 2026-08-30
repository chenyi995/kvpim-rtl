// mq_bg_reduce.sv — BG-level (GBUS CTRL) reduction layer for Fugue MQ.
//
// Design ruling (Chenyi, 2026-08-23; kvpim-sim docs/README_bg_reduction.md):
//   * score side (K^T row-wise at the bank): the four banks of a BG emit
//     partial scores of the SAME token/query -- a true 4:1 FP16 reduction.
//     MVSB drains the banks serially, so a per-query collect array gathers
//     the four contributions before the pipelined 4:1 adder tree (2 levels
//     of the repo's 1-cycle fp16_add) folds them.  N_Q collect contexts.
//   * context side (V column-wise at the bank): the four banks own DISJOINT
//     output dims -- no arithmetic at this level (AttAcc: "the accumulator
//     ... is simply bypassed").  A ping-pong pass-through buffer of N_C
//     contexts queues the 256-b output words; the cross-BG (token-axis)
//     reduction is deferred to the logic die's existing accumulators.
//   * the whole layer runs on the SAME clock as the bank PE (it must keep
//     up with the PE's emit rate); the FP adders pipeline per level, so
//     frequency scales like the MAC tree (MACTREE_FMAX.md).
//
// Like the rest of this repo: an area/timing exploration model with
// representative control, not a functional sign-off.
module mq_bg_reduce #(
    parameter integer N_Q = 16,  // score-side resident query slots
    parameter integer N_C = 2    // context-side resident P slots
) (
    input  logic                       clk,
    input  logic                       rst_n,

    // ---- score side: serial per-bank partial scores (MVSB order) ----
    input  logic                       sc_in_valid,
    input  logic [1:0]                 sc_in_bank,    // which bank of the BG
    input  logic [$clog2(N_Q)-1:0]     sc_in_slot,    // which resident query
    input  logic [15:0]                sc_in_partial, // FP16 partial score
    // ---- reduced score stream up the GBUS ----
    output logic [15:0]                sc_out_sum,
    output logic                       sc_out_valid,
    output logic [$clog2(N_Q)-1:0]     sc_out_slot,

    // ---- context side: 256-b output words from the banks (disjoint dims) --
    input  logic                       cx_in_valid,
    input  logic [$clog2(N_C)-1:0]     cx_in_slot,
    input  logic                       cx_in_word,    // word group 0/1
    input  logic [255:0]               cx_in_data,
    input  logic                       cx_swap,       // ping-pong flip
    input  logic                       cx_drain_en,
    input  logic [$clog2(N_C)-1:0]     cx_drain_slot,
    input  logic                       cx_drain_word,
    output logic [255:0]               cx_out_data,
    output logic                       busy
);
    // ------------------------------------------------------------------
    // Score side: per-query collect array (4 banks arrive serially).
    // ------------------------------------------------------------------
    logic [15:0] collect [N_Q][4];
    logic [3:0]  collect_seen [N_Q];

    logic              fire;
    logic [$clog2(N_Q)-1:0] fire_slot;
    logic [15:0]       fire_op [4];

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            for (int q = 0; q < N_Q; q++) collect_seen[q] <= '0;
            fire <= 1'b0;
        end else begin
            fire <= 1'b0;
            if (sc_in_valid) begin
                collect[sc_in_slot][sc_in_bank] <= sc_in_partial;
                collect_seen[sc_in_slot][sc_in_bank] <= 1'b1;
                // fourth arrival launches the reduction for that query
                if ((collect_seen[sc_in_slot] | (4'b1 << sc_in_bank)) == 4'hF) begin
                    fire       <= 1'b1;
                    fire_slot  <= sc_in_slot;
                    for (int b = 0; b < 4; b++)
                        fire_op[b] <= (b == int'(sc_in_bank)) ? sc_in_partial
                                                              : collect[sc_in_slot][b];
                    collect_seen[sc_in_slot] <= '0;
                end
            end
        end
    end

    // Pipelined 4:1 adder tree: level 1 = two fp16_add, level 2 = one.
    logic [15:0] l1a, l1b;
    logic        l1va, l1vb;
    fp16_add u_l1a (.clk(clk), .rst_n(rst_n), .in_valid(fire),
                    .a(fire_op[0]), .b(fire_op[1]), .y(l1a), .out_valid(l1va));
    fp16_add u_l1b (.clk(clk), .rst_n(rst_n), .in_valid(fire),
                    .a(fire_op[2]), .b(fire_op[3]), .y(l1b), .out_valid(l1vb));
    fp16_add u_l2  (.clk(clk), .rst_n(rst_n), .in_valid(l1va & l1vb),
                    .a(l1a), .b(l1b), .y(sc_out_sum), .out_valid(sc_out_valid));

    // slot tag rides beside the two adder levels
    logic [$clog2(N_Q)-1:0] slot_d1;
    always_ff @(posedge clk) begin
        slot_d1     <= fire_slot;
        sc_out_slot <= slot_d1;
    end

    // ------------------------------------------------------------------
    // Context side: bypass queue, N_C contexts x 2 words, ping-pong.
    // ------------------------------------------------------------------
    logic [255:0] cx_store [2][N_C][2];
    logic         cx_half;
    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) cx_half <= 1'b0;
        else begin
            if (cx_swap) cx_half <= ~cx_half;
            if (cx_in_valid)
                cx_store[cx_half][cx_in_slot][cx_in_word] <= cx_in_data;
        end
    end
    always_ff @(posedge clk) begin
        if (cx_drain_en)
            cx_out_data <= cx_store[~cx_half][cx_drain_slot][cx_drain_word];
    end

    always_comb begin
        busy = sc_out_valid | l1va;
        for (int q = 0; q < N_Q; q++)
            if (collect_seen[q] != 4'h0) busy = 1'b1;
    end
endmodule

// ---- configuration tops for the sweep (mirror the bank-PE points) ----
module mq_bg_8x1 (
    input logic clk, input logic rst_n,
    input logic sc_in_valid, input logic [1:0] sc_in_bank,
    input logic [2:0] sc_in_slot, input logic [15:0] sc_in_partial,
    output logic [15:0] sc_out_sum, output logic sc_out_valid,
    output logic [2:0] sc_out_slot,
    input logic cx_in_valid, input logic cx_in_slot_unused,
    input logic cx_in_word, input logic [255:0] cx_in_data,
    input logic cx_swap, input logic cx_drain_en,
    input logic cx_drain_slot_unused, input logic cx_drain_word,
    output logic [255:0] cx_out_data, output logic busy
);
    mq_bg_reduce #(.N_Q(8), .N_C(1)) u (
        .clk(clk), .rst_n(rst_n),
        .sc_in_valid(sc_in_valid), .sc_in_bank(sc_in_bank),
        .sc_in_slot(sc_in_slot), .sc_in_partial(sc_in_partial),
        .sc_out_sum(sc_out_sum), .sc_out_valid(sc_out_valid),
        .sc_out_slot(sc_out_slot),
        .cx_in_valid(cx_in_valid), .cx_in_slot('0),
        .cx_in_word(cx_in_word), .cx_in_data(cx_in_data),
        .cx_swap(cx_swap), .cx_drain_en(cx_drain_en),
        .cx_drain_slot('0), .cx_drain_word(cx_drain_word),
        .cx_out_data(cx_out_data), .busy(busy));
endmodule

module mq_bg_16x2 (
    input logic clk, input logic rst_n,
    input logic sc_in_valid, input logic [1:0] sc_in_bank,
    input logic [3:0] sc_in_slot, input logic [15:0] sc_in_partial,
    output logic [15:0] sc_out_sum, output logic sc_out_valid,
    output logic [3:0] sc_out_slot,
    input logic cx_in_valid, input logic cx_in_slot,
    input logic cx_in_word, input logic [255:0] cx_in_data,
    input logic cx_swap, input logic cx_drain_en,
    input logic cx_drain_slot, input logic cx_drain_word,
    output logic [255:0] cx_out_data, output logic busy
);
    mq_bg_reduce #(.N_Q(16), .N_C(2)) u (
        .clk(clk), .rst_n(rst_n),
        .sc_in_valid(sc_in_valid), .sc_in_bank(sc_in_bank),
        .sc_in_slot(sc_in_slot), .sc_in_partial(sc_in_partial),
        .sc_out_sum(sc_out_sum), .sc_out_valid(sc_out_valid),
        .sc_out_slot(sc_out_slot),
        .cx_in_valid(cx_in_valid), .cx_in_slot(cx_in_slot),
        .cx_in_word(cx_in_word), .cx_in_data(cx_in_data),
        .cx_swap(cx_swap), .cx_drain_en(cx_drain_en),
        .cx_drain_slot(cx_drain_slot), .cx_drain_word(cx_drain_word),
        .cx_out_data(cx_out_data), .busy(busy));
endmodule

module mq_bg_32x4 (
    input logic clk, input logic rst_n,
    input logic sc_in_valid, input logic [1:0] sc_in_bank,
    input logic [4:0] sc_in_slot, input logic [15:0] sc_in_partial,
    output logic [15:0] sc_out_sum, output logic sc_out_valid,
    output logic [4:0] sc_out_slot,
    input logic cx_in_valid, input logic [1:0] cx_in_slot,
    input logic cx_in_word, input logic [255:0] cx_in_data,
    input logic cx_swap, input logic cx_drain_en,
    input logic [1:0] cx_drain_slot, input logic cx_drain_word,
    output logic [255:0] cx_out_data, output logic busy
);
    mq_bg_reduce #(.N_Q(32), .N_C(4)) u (
        .clk(clk), .rst_n(rst_n),
        .sc_in_valid(sc_in_valid), .sc_in_bank(sc_in_bank),
        .sc_in_slot(sc_in_slot), .sc_in_partial(sc_in_partial),
        .sc_out_sum(sc_out_sum), .sc_out_valid(sc_out_valid),
        .sc_out_slot(sc_out_slot),
        .cx_in_valid(cx_in_valid), .cx_in_slot(cx_in_slot),
        .cx_in_word(cx_in_word), .cx_in_data(cx_in_data),
        .cx_swap(cx_swap), .cx_drain_en(cx_drain_en),
        .cx_drain_slot(cx_drain_slot), .cx_drain_word(cx_drain_word),
        .cx_out_data(cx_out_data), .busy(busy));
endmodule
