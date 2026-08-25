// GEMV unit
//
// Architecture:
//   * Two double-buffered 16-entry x 256-bit banks (8 kbit each, 16 kbit total)
//     - buf_mat  : matrix tile coming from DRAM (K-cache row for "score",
//                  V-cache row for "context")
//     - buf_vec  : vector operand (Q for "score", attention scores for
//                  "context")
//   * 16 FP16 multipliers operate on lane-aligned pairs from the two banks
//     (256-bit = 16 x FP16 lanes).
//   * 16 FP16 adders form a 4-stage reduction tree (8+4+2+1) producing one
//     scalar partial dot-product per cycle that is then accumulated into
//     the result register.
//
// `op_is_score` selects the reduction axis:
//   score (Q·K^T): 16 lane products are reduced to one scalar and accumulated
//                   across d_head chunks.
//   context (S·V): each of the 16 lane products is accumulated independently
//                   across sequence-score chunks, producing a 256-bit word.
module gemv_unit (
    input  logic         clk,
    input  logic         rst_n,

    // DRAM read side: data + write address into the "matrix" double-buffer.
    input  logic         mat_wr_en,
    input  logic [3:0]   mat_wr_addr,
    input  logic [255:0] mat_wr_data,
    input  logic         mat_swap,

    // Vector (Q or attn scores) side.
    input  logic         vec_wr_en,
    input  logic [3:0]   vec_wr_addr,
    input  logic [255:0] vec_wr_data,
    input  logic         vec_swap,

    // Compute control: assert `start` to begin a 16-lane dot product over
    // `len` matrix rows; produce one scalar per row.
    input  logic         start,
    input  logic [3:0]   row_addr,            // matrix row to read
    input  logic [3:0]   vec_addr,            // vector entry (whole 256b)
    input  logic         op_is_score,         // 1=score (Q*K), 0=context (S*V)
    input  logic         accum_clr,           // 1=clear accumulator
    input  logic         accum_en,            // 1=add product into accumulator
    output logic [15:0]  result,
    output logic         result_valid,
    output logic [255:0] context_result,
    output logic         context_result_valid
);
    // ---------------------------------------------------------------------
    // Storage: two double-buffered banks
    // ---------------------------------------------------------------------
    logic [255:0] mat_rd, vec_rd;
    logic         rd_en;
    assign rd_en = start;

    dbuf_16x256 u_buf_mat (
        .clk     (clk),
        .rst_n   (rst_n),
        .wr_en   (mat_wr_en),
        .wr_addr (mat_wr_addr),
        .wr_data (mat_wr_data),
        .rd_en   (rd_en),
        .rd_addr (row_addr),
        .rd_data (mat_rd),
        .swap    (mat_swap)
    );

    dbuf_16x256 u_buf_vec (
        .clk     (clk),
        .rst_n   (rst_n),
        .wr_en   (vec_wr_en),
        .wr_addr (vec_wr_addr),
        .wr_data (vec_wr_data),
        .rd_en   (rd_en),
        .rd_addr (vec_addr),
        .rd_data (vec_rd),
        .swap    (vec_swap)
    );

    // Pipeline valid that follows the buffer read latency.
    logic mul_in_valid;
    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) mul_in_valid <= 1'b0;
        else        mul_in_valid <= start;
    end

    // ---------------------------------------------------------------------
    // 16 FP16 multipliers (lane-aligned)
    // ---------------------------------------------------------------------
    logic [15:0] prod   [16];
    logic        prod_v [16];

    genvar i;
    generate
        for (i = 0; i < 16; i++) begin : g_mul
            fp16_mult u_mul (
                .clk      (clk),
                .rst_n    (rst_n),
                .in_valid (mul_in_valid),
                .a        (mat_rd[i*16 +: 16]),
                .b        (vec_rd[i*16 +: 16]),
                .y        (prod[i]),
                .out_valid(prod_v[i])
            );
        end
    endgenerate

    // ---------------------------------------------------------------------
    // 16 FP16 adders arranged as 8 + 4 + 2 + 1 reduction + 1 accumulator
    // (15 adders for the tree + 1 for the accumulator = 16 total).
    // ---------------------------------------------------------------------
    logic [15:0] s1 [8];   logic s1_v [8];
    logic [15:0] s2 [4];   logic s2_v [4];
    logic [15:0] s3 [2];   logic s3_v [2];
    logic [15:0] s4;       logic s4_v;

    generate
        for (i = 0; i < 8; i++) begin : g_l1
            fp16_add u_add (
                .clk(clk), .rst_n(rst_n),
                .in_valid(prod_v[2*i]),
                .a(prod[2*i]), .b(prod[2*i+1]),
                .y(s1[i]), .out_valid(s1_v[i])
            );
        end
        for (i = 0; i < 4; i++) begin : g_l2
            fp16_add u_add (
                .clk(clk), .rst_n(rst_n),
                .in_valid(s1_v[2*i]),
                .a(s1[2*i]), .b(s1[2*i+1]),
                .y(s2[i]), .out_valid(s2_v[i])
            );
        end
        for (i = 0; i < 2; i++) begin : g_l3
            fp16_add u_add (
                .clk(clk), .rst_n(rst_n),
                .in_valid(s2_v[2*i]),
                .a(s2[2*i]), .b(s2[2*i+1]),
                .y(s3[i]), .out_valid(s3_v[i])
            );
        end
        fp16_add u_l4 (
            .clk(clk), .rst_n(rst_n),
            .in_valid(s3_v[0]),
            .a(s3[0]), .b(s3[1]),
            .y(s4), .out_valid(s4_v)
        );
    endgenerate

    // Score-mode scalar accumulator (16th FP16 adder after the reduction tree).
    logic [15:0] acc;
    logic [15:0] acc_in;
    logic        acc_in_v;
    logic [15:0] acc_sum;
    logic        acc_sum_v;

    // accum_en/clr are control signals timed by the caller relative to start.
    // We pipe them along with the multiplier valid so they line up with s4.
    logic [5:0] ctrl_pipe_en, ctrl_pipe_clr, ctrl_pipe_score;
    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            ctrl_pipe_en  <= '0;
            ctrl_pipe_clr <= '0;
            ctrl_pipe_score <= '0;
        end else begin
            ctrl_pipe_en  <= {ctrl_pipe_en[4:0],  accum_en};
            ctrl_pipe_clr <= {ctrl_pipe_clr[4:0], accum_clr};
            ctrl_pipe_score <= {ctrl_pipe_score[4:0], op_is_score};
        end
    end

    logic accum_en_aligned, accum_clr_aligned, score_mode_aligned;
    assign accum_en_aligned  = ctrl_pipe_en[5];
    assign accum_clr_aligned = ctrl_pipe_clr[5];
    assign score_mode_aligned = ctrl_pipe_score[5];

    assign acc_in   = accum_clr_aligned ? 16'd0 : acc;
    assign acc_in_v = s4_v & accum_en_aligned & score_mode_aligned;

    fp16_add u_acc_add (
        .clk(clk), .rst_n(rst_n),
        .in_valid (acc_in_v),
        .a        (s4),
        .b        (acc_in),
        .y        (acc_sum),
        .out_valid(acc_sum_v)
    );

    logic result_valid_q;
    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            acc            <= 16'd0;
            result_valid_q <= 1'b0;
        end else begin
            result_valid_q <= acc_sum_v;
            if (acc_sum_v) acc <= acc_sum;
            else if (accum_clr_aligned) acc <= 16'd0;
        end
    end

    // ---------------------------------------------------------------------
    // Context-mode vector accumulator.  Unlike the score path, products must
    // NOT be reduced across lanes: lane l is output dimension l and accumulates
    // S[token] * V[token][l] over token chunks.  The one-cycle bypass preserves
    // correctness for back-to-back starts despite the registered FP16 add.
    // ---------------------------------------------------------------------
    logic [15:0] ctx_acc [16], ctx_sum [16];
    logic [15:0] ctx_old [16];
    logic        ctx_sum_v [16];
    logic        context_result_valid_q;
    logic [1:0]  ctx_en_pipe, ctx_clr_pipe, ctx_mode_pipe;
    logic        ctx_issue_v, ctx_clear_aligned;

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            ctx_en_pipe   <= '0;
            ctx_clr_pipe  <= '0;
            ctx_mode_pipe <= '0;
        end else begin
            ctx_en_pipe   <= {ctx_en_pipe[0], accum_en};
            ctx_clr_pipe  <= {ctx_clr_pipe[0], accum_clr};
            ctx_mode_pipe <= {ctx_mode_pipe[0], op_is_score};
        end
    end

    assign ctx_clear_aligned = ctx_clr_pipe[1];
    assign ctx_issue_v       = prod_v[0] & ctx_en_pipe[1] & ~ctx_mode_pipe[1];

    generate
        for (i = 0; i < 16; i++) begin : g_ctx_acc
            // A previous lane-add result is forwarded while its register is
            // being committed, avoiding a read-after-write bubble.
            assign ctx_old[i] = ctx_clear_aligned ? 16'd0
                              : (ctx_sum_v[i] ? ctx_sum[i] : ctx_acc[i]);
            fp16_add u_ctx_add (
                .clk(clk), .rst_n(rst_n), .in_valid(ctx_issue_v),
                .a(prod[i]), .b(ctx_old[i]),
                .y(ctx_sum[i]), .out_valid(ctx_sum_v[i])
            );
            always_ff @(posedge clk or negedge rst_n) begin
                if (!rst_n) ctx_acc[i] <= '0;
                else if (ctx_sum_v[i]) ctx_acc[i] <= ctx_sum[i];
                else if (ctx_clear_aligned) ctx_acc[i] <= '0;
            end
            assign context_result[i*16 +: 16] = ctx_acc[i];
        end
    endgenerate

    // ctx_acc is committed on the edge after ctx_sum_v is asserted.  Delay
    // the externally visible valid by that edge so context_result always
    // denotes the newly committed 16-lane accumulator state.
    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) context_result_valid_q <= 1'b0;
        else        context_result_valid_q <= ctx_sum_v[0];
    end

    // Score and context are separate interfaces; never corrupt a numerical
    // result with a mode tag.  Both valids are aligned to their own datapaths.
    assign result       = acc;
    assign result_valid = result_valid_q;
    assign context_result_valid = context_result_valid_q;
endmodule
