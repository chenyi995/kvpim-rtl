// mq_bank_pe.sv — MQ (multi-query) in-bank PE for Fugue, plus config tops.
//
// The AttAcc bank PE (gemv_unit) holds ONE resident operand vector and streams
// DRAM columns against it.  The MQ PE serves the Fugue shared-KV batch: one
// DRAM column is read ONCE into a column latch and the PE rotates over the
// n resident query slots, one 16-lane FP16 dot per PE cycle (MQ-MAC command:
// kvpim-sim PLAN_mq_command.md; audited state list in
// attacc_drampim_xinyao/experiments/mq_command/DATAFLOW.md §1/§3).
//
// Added state over the baseline (the audit's list, all flop-based per the
// project's no-SRAM-macro convention):
//   * column operand latch          1 x 256 b
//   * resident-operand store        dbuf DEPTH=VEC_DEPTH x 256 b (x2 halves)
//                                   (baseline 16 -> 512 B; x2 = 32 -> 1 KiB;
//                                    x4 = 64 -> 2 KiB active)
//   * per-Q running partial sums    N_Q x FP16 (two-phase: a token's first
//                                   column stores, the second adds+emits)
//   * row-boundary score staging    2 (ping-pong) x N_Q x 16 x FP16
//   * context accumulators          2 (ping-pong) x N_C x 2 words x 256 b
//   * Q-slot rotation counter       mod n_active (runtime <= N_Q)
// The MAC datapath itself is unchanged in operation count (16 mult + 15-add
// tree + accumulate) and uses the internally pipelined tree so retiming can
// chase PE clocks above the single-cycle limit ("PE 全流水可提频").
//
// Like the rest of this repo this is an area/timing exploration model, not a
// functional sign-off (representative control, no DRAM protocol).
module mq_bank_pe #(
    parameter integer N_Q       = 16,  // score-side resident query slots
    parameter integer N_C       = 2,   // context-side resident P slots
    parameter integer VEC_DEPTH = 32,  // operand store entries per half
    parameter integer MPIPE     = 2,   // fp16 mult sub-stages
    parameter integer APIPE     = 2    // fp16 add sub-stages
) (
    input  logic                          clk,
    input  logic                          rst_n,

    // ---- resident-operand loads (WRGB: Q slices / MVGB: P slices) ----
    input  logic                          vec_wr_en,
    input  logic [$clog2(VEC_DEPTH)-1:0]  vec_wr_addr,
    input  logic [255:0]                  vec_wr_data,
    input  logic                          vec_swap,

    // ---- one DRAM column arrives (MAC_AB): latch it once ----
    input  logic                          col_wr_en,
    input  logic [255:0]                  col_data,
    // column parity inside the token (0 = first 16 dims, 1 = second)
    input  logic                          col_is_second,
    // context phase: which of the two output word groups this column feeds
    input  logic                          ctx_word_sel,

    // ---- sweep control ----
    input  logic                          start,        // begin slot rotation
    input  logic [$clog2(N_Q+1)-1:0]      n_active,     // resident slots (<= N_Q)
    input  logic                          op_is_score,  // 1=score, 0=context
    input  logic [$clog2(VEC_DEPTH)-1:0]  slot_base,    // operand word of slot 0
    input  logic [3:0]                    token_lane,   // token index in the row (staging column)
    input  logic                          stage_swap,   // row boundary: flip staging ping-pong

    // ---- drains (MVSB path) ----
    input  logic                          drain_en,
    input  logic                          drain_sel_ctx,  // 0=score staging, 1=ctx store
    input  logic [$clog2(N_Q)-1:0]        drain_slot,
    input  logic                          drain_word,     // ctx word group / staging half word
    output logic [255:0]                  drain_data,
    output logic                          busy
);
    localparam integer QW = $clog2(N_Q);

    // ------------------------------------------------------------------
    // Column operand latch: one DRAM read serves every resident slot.
    // ------------------------------------------------------------------
    logic [255:0] col_latch;
    always_ff @(posedge clk) begin
        if (col_wr_en) col_latch <= col_data;
    end
    logic col_second_q, ctx_word_q;
    always_ff @(posedge clk) begin
        if (col_wr_en) begin
            col_second_q <= col_is_second;
            ctx_word_q   <= ctx_word_sel;
        end
    end

    // ------------------------------------------------------------------
    // Resident-operand store (double-buffered, parameterized depth).
    // ------------------------------------------------------------------
    logic [255:0] vec_rd;
    logic         vec_rd_en;
    logic [$clog2(VEC_DEPTH)-1:0] vec_rd_addr;

    dbuf_16x256 #(.DEPTH(VEC_DEPTH)) u_vec_store (
        .clk(clk), .rst_n(rst_n),
        .wr_en(vec_wr_en), .wr_addr(vec_wr_addr), .wr_data(vec_wr_data),
        .rd_en(vec_rd_en), .rd_addr(vec_rd_addr), .rd_data(vec_rd),
        .swap(vec_swap)
    );

    // ------------------------------------------------------------------
    // Q-slot rotation: n_active MACs per latched column, one per PE cycle.
    // ------------------------------------------------------------------
    logic [QW:0] slot_ctr;
    logic        rotating;
    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            slot_ctr <= '0;
            rotating <= 1'b0;
        end else if (start) begin
            slot_ctr <= '0;
            rotating <= 1'b1;
        end else if (rotating) begin
            if (slot_ctr == n_active - 1'b1) begin
                slot_ctr <= '0;
                rotating <= 1'b0;
            end else begin
                slot_ctr <= slot_ctr + 1'b1;
            end
        end
    end
    assign vec_rd_en   = rotating | start;
    assign vec_rd_addr = slot_base + slot_ctr[$clog2(VEC_DEPTH)-1:0];
    assign busy        = rotating;

    // Slot tag pipeline alongside the datapath.
    localparam integer TREE_LAT = MPIPE + 4*APIPE + 1; // + buffer read
    logic [QW-1:0] slot_pipe   [TREE_LAT+1];
    logic          valid_pipe  [TREE_LAT+1];
    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            for (int s = 0; s <= TREE_LAT; s++) begin
                slot_pipe[s]  <= '0;
                valid_pipe[s] <= 1'b0;
            end
        end else begin
            slot_pipe[0]  <= slot_ctr[QW-1:0];
            valid_pipe[0] <= rotating | start;
            for (int s = 1; s <= TREE_LAT; s++) begin
                slot_pipe[s]  <= slot_pipe[s-1];
                valid_pipe[s] <= valid_pipe[s-1];
            end
        end
    end

    // ------------------------------------------------------------------
    // MAC datapath: pipelined 16-lane FP16 dot (retimable for high f_PE).
    // ------------------------------------------------------------------
    logic        tree_in_valid;
    logic [15:0] dot;
    logic        dot_valid;
    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) tree_in_valid <= 1'b0;
        else        tree_in_valid <= rotating | start;
    end
    mac_tree16_piped #(.MPIPE(MPIPE), .APIPE(APIPE)) u_tree (
        .clk(clk), .rst_n(rst_n), .in_valid(tree_in_valid),
        .a_word(col_latch), .b_word(vec_rd),
        .y(dot), .out_valid(dot_valid)
    );

    logic [QW-1:0] dot_slot;
    assign dot_slot = slot_pipe[TREE_LAT];

    // ------------------------------------------------------------------
    // Per-Q running partial sums (score): a token's first column stores its
    // dot, the second column adds and emits to the staging file.  Same-slot
    // reuse distance is n_active cycles >= the adder latency by design
    // (the audit's no-RAW argument).
    // ------------------------------------------------------------------
    logic [15:0] q_acc [N_Q];
    logic        acc_add_in_v;
    logic [15:0] acc_sum;
    logic        acc_sum_v;
    logic [QW-1:0] acc_slot_pipe [APIPE+1];

    assign acc_add_in_v = dot_valid & col_second_q & op_is_score;

    fp16_add_piped #(.NUM_PIPE(APIPE)) u_score_acc (
        .clk(clk), .rst_n(rst_n), .in_valid(acc_add_in_v),
        .a(dot), .b(q_acc[dot_slot]),
        .y(acc_sum), .out_valid(acc_sum_v)
    );
    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            for (int s = 0; s <= APIPE; s++) acc_slot_pipe[s] <= '0;
        end else begin
            acc_slot_pipe[0] <= dot_slot;
            for (int s = 1; s <= APIPE; s++) acc_slot_pipe[s] <= acc_slot_pipe[s-1];
        end
    end
    always_ff @(posedge clk) begin
        if (dot_valid & ~col_second_q & op_is_score)
            q_acc[dot_slot] <= dot;                 // first column: store
    end

    // ------------------------------------------------------------------
    // Row-boundary score staging: 2 x N_Q x 16 x FP16 ping-pong; finished
    // token scores park here until the MVSB drain empties the row.
    // ------------------------------------------------------------------
    logic stage_sel;
    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n)          stage_sel <= 1'b0;
        else if (stage_swap) stage_sel <= ~stage_sel;
    end
    logic [15:0] stage [2][N_Q][16];
    logic [3:0]  token_lane_q;
    always_ff @(posedge clk) begin
        if (acc_add_in_v) token_lane_q <= token_lane;   // latch with the add
        if (acc_sum_v)
            stage[stage_sel][acc_slot_pipe[APIPE]][token_lane_q] <= acc_sum;
    end

    // ------------------------------------------------------------------
    // Context accumulators: 2 x N_C x 2 words x 256 b ping-pong.  In context
    // mode the per-column result accumulates into the slot's output word
    // (per-lane writeback bypass covers the N_C == adder-latency corner).
    // ------------------------------------------------------------------
    localparam integer CW = (N_C <= 1) ? 1 : $clog2(N_C);
    logic [255:0] ctx_acc [2][N_C][2];
    logic         ctx_add_in_v;
    logic [15:0]  ctx_sum;
    logic         ctx_sum_v;
    logic [CW-1:0] ctx_slot_pipe [APIPE+1];
    logic          ctx_word_pipe [APIPE+1];

    assign ctx_add_in_v = dot_valid & ~op_is_score;
    // Writeback bypass: if the same (slot, word) lane is being written this
    // cycle, add against the incoming sum instead of the stale flop.
    logic [15:0] ctx_old;
    logic        ctx_bypass;
    assign ctx_bypass = ctx_sum_v &&
                        (ctx_slot_pipe[APIPE] == dot_slot[CW-1:0]) &&
                        (ctx_word_pipe[APIPE] == ctx_word_q);
    assign ctx_old = ctx_bypass ? ctx_sum
                                : ctx_acc[stage_sel][dot_slot[CW-1:0]][ctx_word_q][15:0];

    fp16_add_piped #(.NUM_PIPE(APIPE)) u_ctx_acc (
        .clk(clk), .rst_n(rst_n), .in_valid(ctx_add_in_v),
        .a(dot), .b(ctx_old),
        .y(ctx_sum), .out_valid(ctx_sum_v)
    );
    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            for (int s = 0; s <= APIPE; s++) begin
                ctx_slot_pipe[s] <= '0;
                ctx_word_pipe[s] <= 1'b0;
            end
        end else begin
            ctx_slot_pipe[0] <= dot_slot[CW-1:0];
            ctx_word_pipe[0] <= ctx_word_q;
            for (int s = 1; s <= APIPE; s++) begin
                ctx_slot_pipe[s] <= ctx_slot_pipe[s-1];
                ctx_word_pipe[s] <= ctx_word_pipe[s-1];
            end
        end
    end
    // Shift-in write keeps every bit of the accumulator word driven (the
    // scalar tree output is representative; a full 16-lane context datapath
    // writes the whole word), so synthesis retains the audited storage.
    always_ff @(posedge clk) begin
        if (ctx_sum_v)
            ctx_acc[stage_sel][ctx_slot_pipe[APIPE]][ctx_word_pipe[APIPE]]
                <= {ctx_acc[stage_sel][ctx_slot_pipe[APIPE]][ctx_word_pipe[APIPE]][239:0],
                    ctx_sum};
    end

    // ------------------------------------------------------------------
    // Drain port (MVSB): one 256-bit word per cycle from either store.
    // ------------------------------------------------------------------
    logic [255:0] stage_word;
    always_comb begin
        for (int l = 0; l < 16; l++)
            stage_word[l*16 +: 16] = stage[~stage_sel][drain_slot][l];
    end
    logic [255:0] drain_r;
    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) drain_r <= '0;
        else if (drain_en)
            drain_r <= drain_sel_ctx
                       ? ctx_acc[~stage_sel][drain_slot[CW-1:0]][drain_word]
                       : stage_word;
    end
    assign drain_data = drain_r;
endmodule

// ---------------------------------------------------------------------------
// Synthesis tops: AttAcc baseline bank PE and three MQ configurations.
// ---------------------------------------------------------------------------

// AttAcc-original bank PE (one resident vector; the reused gemv_unit).
module attacc_bank_pe (
    input  logic         clk,
    input  logic         rst_n,
    input  logic         mat_wr_en,
    input  logic [3:0]   mat_wr_addr,
    input  logic [255:0] mat_wr_data,
    input  logic         mat_swap,
    input  logic         vec_wr_en,
    input  logic [3:0]   vec_wr_addr,
    input  logic [255:0] vec_wr_data,
    input  logic         vec_swap,
    input  logic         start,
    input  logic [3:0]   row_addr,
    input  logic [3:0]   vec_addr,
    input  logic         op_is_score,
    input  logic         accum_clr,
    input  logic         accum_en,
    output logic [15:0]  result,
    output logic         result_valid
);
    gemv_unit u_pe (.*);
endmodule

module mq_pe_8x1_d16 (   // (n_q, n_c) = (8, 1), buffer x1 (512 B)
    input  logic clk, input logic rst_n,
    input  logic vec_wr_en, input logic [3:0] vec_wr_addr,
    input  logic [255:0] vec_wr_data, input logic vec_swap,
    input  logic col_wr_en, input logic [255:0] col_data,
    input  logic col_is_second, input logic ctx_word_sel,
    input  logic start, input logic [3:0] n_active, input logic op_is_score,
    input  logic [3:0] slot_base, input logic [3:0] token_lane,
    input  logic stage_swap, input logic drain_en, input logic drain_sel_ctx,
    input  logic [2:0] drain_slot, input logic drain_word,
    output logic [255:0] drain_data, output logic busy
);
    mq_bank_pe #(.N_Q(8), .N_C(1), .VEC_DEPTH(16)) u_pe (.*);
endmodule

module mq_pe_16x2_d32 (  // (16, 2), buffer x2 (1 KiB)
    input  logic clk, input logic rst_n,
    input  logic vec_wr_en, input logic [4:0] vec_wr_addr,
    input  logic [255:0] vec_wr_data, input logic vec_swap,
    input  logic col_wr_en, input logic [255:0] col_data,
    input  logic col_is_second, input logic ctx_word_sel,
    input  logic start, input logic [4:0] n_active, input logic op_is_score,
    input  logic [4:0] slot_base, input logic [3:0] token_lane,
    input  logic stage_swap, input logic drain_en, input logic drain_sel_ctx,
    input  logic [3:0] drain_slot, input logic drain_word,
    output logic [255:0] drain_data, output logic busy
);
    mq_bank_pe #(.N_Q(16), .N_C(2), .VEC_DEPTH(32)) u_pe (.*);
endmodule

module mq_pe_32x4_d64 (  // (32, 4), buffer x4 (2 KiB)
    input  logic clk, input logic rst_n,
    input  logic vec_wr_en, input logic [5:0] vec_wr_addr,
    input  logic [255:0] vec_wr_data, input logic vec_swap,
    input  logic col_wr_en, input logic [255:0] col_data,
    input  logic col_is_second, input logic ctx_word_sel,
    input  logic start, input logic [5:0] n_active, input logic op_is_score,
    input  logic [5:0] slot_base, input logic [3:0] token_lane,
    input  logic stage_swap, input logic drain_en, input logic drain_sel_ctx,
    input  logic [4:0] drain_slot, input logic drain_word,
    output logic [255:0] drain_data, output logic busy
);
    mq_bank_pe #(.N_Q(32), .N_C(4), .VEC_DEPTH(64)) u_pe (.*);
endmodule
