// gemv_unit.sv — one AttAcc bank-level GEMV unit, exactly as specified in the
// AttAcc paper (ASPLOS'24 §5.1): "Each GEMV unit consists of 16 FP16
// multipliers, 16 FP16 adders, double-buffered 16 256-bit buffers that can
// store the input vectors, and a control unit."
//
//   * 16 FP16 multipliers on lane-aligned pairs of {DRAM column, vector word}.
//   * 16 FP16 adders, ONE physical set, switched between two modes:
//       - adder-tree mode (op_is_score=1, Q·K^T): adders 0..14 form the
//         8+4+2+1 reduction tree, adder 15 is the scalar accumulator that
//         sums partial dot products across d_head chunks;
//       - parallel-accumulate mode (op_is_score=0, S·V): each adder i is an
//         independent lane accumulator, ctx[i] += S[token] * V[token][i].
//     The a/b/valid inputs of every adder are muxed by the captured mode, so
//     the same 16 adders serve both modes (no duplicated adder set).
//   * ONE double-buffered 16x256-bit vector buffer (dbuf_16x256, 2 x 512 B).
//     Only the vector operand (Q or attention scores) is buffered; the
//     matrix operand (K/V rows) streams straight off the bank's DRAM column
//     reads (PIM_MAC_AB "reads necessary data from DRAM cells and GEMV
//     buffers"), one 256-bit beat per cycle.
//   * A control unit: captures a pass command, sequences the vector-buffer
//     read address / broadcast lane per matrix beat, aligns the
//     first/last-beat flags with the arithmetic pipeline, and produces the
//     result valids.
//
// Pass protocol:
//   pass_start (1-cycle pulse) captures {op_is_score, num_beats, acc_clr}.
//   Then num_beats matrix beats arrive on mat_valid/mat_data (back-to-back or
//   gapped).  Score mode: beat b multiplies the DRAM column by vector entry
//   b[3:0] (d_head chunk b) and the tree+accumulator reduce across beats;
//   score_out/score_valid deliver one FP16 when the pass drains.  Context
//   mode: beat b multiplies the DRAM column (16 output dims of token b) by
//   score S[b] = vector entry b[7:4], lane b[3:0], broadcast to all lanes;
//   ctx_out/ctx_valid deliver the 16-lane FP16 word when the pass drains.
//   acc_clr=0 chains a pass onto the previous accumulator state (row-wise
//   partitioning across multiple runs).
module gemv_unit (
    input  logic         clk,
    input  logic         rst_n,

    // ---- vector (GEMV buffer) fill port: PIM_WR_GB / PIM_MV_SB ----
    input  logic         vec_wr_en,
    input  logic [3:0]   vec_wr_addr,
    input  logic [255:0] vec_wr_data,
    input  logic         vec_swap,       // exchange fill/compute copies

    // ---- matrix stream: the bank's DRAM column-read data path ----
    input  logic         mat_valid,
    input  logic [255:0] mat_data,

    // ---- pass command (control unit) ----
    input  logic         pass_start,
    input  logic         op_is_score,    // 1 = Q*K^T (tree), 0 = S*V (parallel acc)
    input  logic [8:0]   num_beats,      // matrix beats in this pass (1..256)
    input  logic         acc_clr,        // 1 = start accumulators from zero

    // ---- results ----
    output logic [15:0]  score_out,
    output logic         score_valid,
    output logic [255:0] ctx_out,
    output logic         ctx_valid,
    output logic         busy
);
    // =====================================================================
    // Control unit
    // =====================================================================
    logic       mode_q;        // captured op_is_score
    logic       clr_q;         // captured acc_clr
    logic [8:0] nbeats_q;
    logic [8:0] beat;          // beats accepted so far
    logic       running;

    wire beat_fire = running && mat_valid && (beat != nbeats_q);
    wire beat_is_first = (beat == 9'd0) && clr_q;
    wire beat_is_last  = (beat == nbeats_q - 9'd1);

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            mode_q <= 1'b0; clr_q <= 1'b0; nbeats_q <= '0;
            beat <= '0; running <= 1'b0;
        end else begin
            if (pass_start) begin
                mode_q   <= op_is_score;
                clr_q    <= acc_clr;
                nbeats_q <= num_beats;
                beat     <= '0;
                running  <= 1'b1;
            end else if (beat_fire) begin
                beat <= beat + 9'd1;
                if (beat_is_last) running <= 1'b0;
            end
        end
    end
    assign busy = running;

    // Vector-buffer read address for this beat: score mode walks the d_head
    // chunks (entry = beat[3:0]); context mode walks the score words (entry =
    // beat[7:4], one lane per token).
    logic [3:0] vec_rd_addr;
    assign vec_rd_addr = mode_q ? beat[3:0] : beat[7:4];

    // =====================================================================
    // Double-buffered vector buffer (the paper's GEMV buffer)
    // =====================================================================
    logic [255:0] vec_rd;
    dbuf_16x256 u_vec_buf (
        .clk     (clk),
        .rst_n   (rst_n),
        .wr_en   (vec_wr_en),
        .wr_addr (vec_wr_addr),
        .wr_data (vec_wr_data),
        .rd_en   (beat_fire),
        .rd_addr (vec_rd_addr),
        .rd_data (vec_rd),
        .swap    (vec_swap)
    );

    // Align the matrix beat with the 1-cycle registered buffer read.
    logic [255:0] mat_q;
    logic         mul_iv;
    logic [3:0]   bcast_lane_q;   // context mode: which vec_rd lane is S[token]
    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            mat_q <= '0; mul_iv <= 1'b0; bcast_lane_q <= '0;
        end else begin
            mul_iv <= beat_fire;
            if (beat_fire) begin
                mat_q        <= mat_data;
                bcast_lane_q <= beat[3:0];
            end
        end
    end

    // Multiplier B operand: the vector word lane-aligned (score) or one score
    // broadcast to all 16 lanes (context).
    logic [15:0] vec_lane [16];
    logic [15:0] bcast;
    always_comb begin
        for (int l = 0; l < 16; l++) vec_lane[l] = vec_rd[l*16 +: 16];
        bcast = vec_lane[bcast_lane_q];
    end

    // =====================================================================
    // 16 FP16 multipliers
    // =====================================================================
    logic [15:0] prod   [16];
    logic        prod_v;
    genvar i;
    generate
        for (i = 0; i < 16; i++) begin : g_mul
            logic pv;
            fp16_mult u_mul (
                .clk(clk), .rst_n(rst_n), .in_valid(mul_iv),
                .a(mat_q[i*16 +: 16]),
                .b(mode_q ? vec_lane[i] : bcast),
                .y(prod[i]), .out_valid(pv)
            );
            if (i == 0) assign prod_v = pv;
        end
    endgenerate

    // =====================================================================
    // first/last flag pipes, aligned to each mode's adder-input stage.
    //   beat issue -> mul input (+1) -> product (+2)          [context adders]
    //   product -> tree L1..L4 (+3..+6) -> accumulator input  [score adder 15]
    // =====================================================================
    logic [6:1] first_pipe, last_pipe;
    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            first_pipe <= '0; last_pipe <= '0;
        end else begin
            first_pipe <= {first_pipe[5:1], beat_fire & beat_is_first};
            last_pipe  <= {last_pipe[5:1],  beat_fire & beat_is_last};
        end
    end
    wire first_ctx = first_pipe[2];   // at the context adders' input
    wire last_ctx  = last_pipe[2];
    wire first_acc = first_pipe[6];   // at the score accumulator's input
    wire last_acc  = last_pipe[6];

    // =====================================================================
    // 16 FP16 adders, ONE set, mode-switched between the reduction tree and
    // 16 parallel lane accumulators.
    //   score:   0..7 = tree L1, 8..11 = L2, 12..13 = L3, 14 = L4,
    //            15 = scalar accumulator.
    //   context: adder i accumulates prod[i].
    // The fp16_add output register free-runs (only out_valid is gated), so
    // each accumulating adder pairs with a HOLD register that commits only on
    // a valid result.  The b operand forwards the adder output on the cycle
    // it is valid (back-to-back beats) and takes the hold register otherwise;
    // the first beat of a clearing pass substitutes zero.
    // =====================================================================
    logic [15:0] add_a [16], add_b [16], add_y [16];
    logic        add_iv [16], add_ov [16];
    logic [15:0] acc_hold [16];
    logic [15:0] fwd [16];

    always_comb begin
        for (int k = 0; k < 16; k++)
            fwd[k] = add_ov[k] ? add_y[k] : acc_hold[k];

        for (int k = 0; k < 16; k++) begin
            add_a[k]  = prod[k];
            add_b[k]  = first_ctx ? 16'd0 : fwd[k];
            add_iv[k] = prod_v & ~mode_q;
        end
        if (mode_q) begin
            for (int k = 0; k < 8; k++) begin   // tree level 1
                add_a[k]  = prod[2*k];
                add_b[k]  = prod[2*k+1];
                add_iv[k] = prod_v;
            end
            for (int k = 0; k < 4; k++) begin   // tree level 2
                add_a[8+k]  = add_y[2*k];
                add_b[8+k]  = add_y[2*k+1];
                add_iv[8+k] = add_ov[2*k];
            end
            for (int k = 0; k < 2; k++) begin   // tree level 3
                add_a[12+k]  = add_y[8+2*k];
                add_b[12+k]  = add_y[9+2*k];
                add_iv[12+k] = add_ov[8+2*k];
            end
            add_a[14]  = add_y[12];             // tree level 4
            add_b[14]  = add_y[13];
            add_iv[14] = add_ov[12];
            add_a[15]  = add_y[14];             // scalar accumulator
            add_b[15]  = first_acc ? 16'd0 : fwd[15];
            add_iv[15] = add_ov[14];
        end
    end

    generate
        for (i = 0; i < 16; i++) begin : g_add
            fp16_add u_add (
                .clk(clk), .rst_n(rst_n), .in_valid(add_iv[i]),
                .a(add_a[i]), .b(add_b[i]),
                .y(add_y[i]), .out_valid(add_ov[i])
            );
            always_ff @(posedge clk or negedge rst_n) begin
                if (!rst_n)         acc_hold[i] <= '0;
                else if (add_ov[i]) acc_hold[i] <= add_y[i];
            end
        end
    endgenerate

    // =====================================================================
    // Result strobes, aligned to the hold registers: last beat's add input
    // -> add_y (+1) -> acc_hold visible (+2).
    // =====================================================================
    logic sc_last_d, ctx_last_d, score_valid_q, ctx_valid_q;
    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            sc_last_d <= 1'b0; ctx_last_d <= 1'b0;
            score_valid_q <= 1'b0; ctx_valid_q <= 1'b0;
        end else begin
            sc_last_d     <= mode_q  & last_acc & add_iv[15];
            ctx_last_d    <= ~mode_q & last_ctx & add_iv[0];
            score_valid_q <= sc_last_d;
            ctx_valid_q   <= ctx_last_d;
        end
    end

    assign score_out   = acc_hold[15];
    assign score_valid = score_valid_q;
    generate
        for (i = 0; i < 16; i++) begin : g_ctx_out
            assign ctx_out[i*16 +: 16] = acc_hold[i];
        end
    endgenerate
    assign ctx_valid = ctx_valid_q;
endmodule
