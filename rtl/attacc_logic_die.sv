// attacc_logic_die.sv — AttAcc-ORIGINAL HBM logic-die top (BASELINE).
//
// The buffer-die logic of AttAcc, WITHOUT any of Fugue's additions: no KV TLB
// (addresses are computed directly), no on-die RoPE rotate unit, and no
// master-diff diff_decoder. Instantiates GEMV units + softmax + accumulator +
// the AttAcc controller.
//
// The score->softmax->context dataflow is now linked at this top level
// (ChangeNotes 接入项 1):
//   1. every retired score-mode MAC_AB commits one FP16 token score
//      (accumulator output) into a 16-lane collect word (FP32-widened);
//   2. each full (or final-partial) word streams into streaming_softmax_unit,
//      which buffers the whole L-token row (score_mem/exp_mem banks) and, after
//      the last word, emits normalized probabilities one 16-lane word per beat;
//   3. each probability word is narrowed to FP16 and written back into the
//      GEMV vector buffers (the P operand of the context phase) at its word
//      index — P is the streamed operand, per the master-diff dataflow notes;
//   4. context-mode MAC_AB then computes S x V with per-lane accumulation and
//      the 256-bit context word is exposed at ctx_out.
// The P writeback address reuses the 16-entry vector buffer, so one resident
// context phase covers L <= 16*LANES = 256 tokens (SM_MAX_TOKENS default);
// longer rows are the same hardware time-multiplexed with buffer refills.
module attacc_logic_die import fugue_pkg::*; #(
    parameter integer SM_MAX_TOKENS = 256   // softmax row capacity (flop model)
) (
    input  logic                       clk,
    input  logic                       rst_n,

    // ---- host instruction stream ----
    input  logic                       instr_valid,
    input  logic [INSTR_W-1:0]         instr_word,
    output logic                       instr_ready,
    output logic                       idle,

    // ---- GEMV operand fills ----
    input  logic                       mat_wr_en,
    input  logic [3:0]                 mat_wr_addr,
    input  logic [VEC_W-1:0]           mat_wr_data,
    input  logic                       mat_swap,
    input  logic                       vec_wr_en,
    input  logic [3:0]                 vec_wr_addr,
    input  logic [VEC_W-1:0]           vec_wr_data,
    input  logic                       vec_swap,

    // ---- softmax external score load (bypass path) / probability out ----
    input  logic                       sm_start_ext,
    input  logic [SM_LANES-1:0][31:0]  sm_scores,
    output logic [SM_LANES-1:0][31:0]  sm_probs,
    output logic                       sm_valid,

    // ---- DRAM command interface ----
    output dram_cmd_e                  dram_cmd,
    output logic [BANK_W-1:0]          dram_bank,
    output logic [ROW_W-1:0]           dram_row,
    output logic [COL_W-1:0]           dram_col,

    // ---- reduced GEMV result (score scalar) ----
    output logic [15:0]                result,
    output logic                       result_valid,

    // ---- context result (S x V, 16 FP16 output dims of GEMV unit 0) ----
    output logic [VEC_W-1:0]           ctx_out,
    output logic                       ctx_out_valid,
    output logic                       ctx_chk       // parity fold of units 1..3
);
    localparam integer SM_TILE_WORDS = (SM_MAX_TOKENS + SM_LANES - 1) / SM_LANES;
    localparam integer SM_TW_W = (SM_TILE_WORDS <= 1) ? 1 : $clog2(SM_TILE_WORDS);
    // score-commit delay: covers buffer read + mult + 4 tree adds + cross-unit
    // accumulate + output registers between the last MAC beat and the final
    // accumulator value (see gemv_unit/accumulator pipelines).
    localparam integer COMMIT_DLY = 12;

    // ---------------- controller <-> datapath nets ----------------
    logic                tlb_req_valid;
    logic [VPN_W-1:0]    tlb_req_vpn;
    logic [PPN_W-1:0]    tlb_base_ppn, tlb_resp_ppn;
    logic                tlb_resp_hit, tlb_resp_valid, tlb_busy;

    logic                gemv_start, gemv_accum_en, gemv_accum_clr;
    logic [3:0]          gemv_row_addr, gemv_vec_addr;
    opmode_e             op_mode;
    logic                rotate_start, sfm_start, acc_clr, mac_done;
    logic [15:0]         rotate_pos;
    logic [31:0]         cfg_nhead, cfg_dhead, cfg_seqlen;
    logic                meta_wr_en;
    logic [SM_WIDX_W-1:0] meta_wr_idx;
    logic [SM_LANES-1:0] meta_wr_mask;

    wire op_is_score = (op_mode == OP_SCORE);

    // ---------------- controller ----------------
    // Same AttAcc controller; its TLB port is served by DIRECT addressing
    // (a 1-cycle add, no CAM) — this is AttAcc's non-translated address path.
    attacc_controller u_ctrl (
        .clk(clk), .rst_n(rst_n),
        .instr_valid(instr_valid), .instr_word(instr_word),
        .instr_ready(instr_ready), .idle(idle),
        .tlb_req_valid(tlb_req_valid), .tlb_req_vpn(tlb_req_vpn),
        .tlb_base_ppn(tlb_base_ppn), .tlb_resp_ppn(tlb_resp_ppn),
        .tlb_resp_hit(tlb_resp_hit), .tlb_resp_valid(tlb_resp_valid),
        .tlb_busy(tlb_busy),
        .dram_cmd(dram_cmd), .dram_bank(dram_bank),
        .dram_row(dram_row), .dram_col(dram_col),
        .gemv_start(gemv_start), .gemv_row_addr(gemv_row_addr),
        .gemv_vec_addr(gemv_vec_addr), .gemv_accum_en(gemv_accum_en),
        .gemv_accum_clr(gemv_accum_clr), .op_mode(op_mode),
        .rotate_start(rotate_start), .rotate_pos(rotate_pos),
        .sfm_start(sfm_start), .acc_clr(acc_clr), .mac_done(mac_done),
        .cfg_nhead(cfg_nhead), .cfg_dhead(cfg_dhead), .cfg_seqlen(cfg_seqlen),
        .meta_wr_en(meta_wr_en), .meta_wr_idx(meta_wr_idx), .meta_wr_mask(meta_wr_mask)
    );

    // Direct address path (no TLB CAM): 1-cycle add, always "hit".
    logic             tlb_rv_d;
    logic [PPN_W-1:0] tlb_ppn_d;
    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            tlb_rv_d  <= 1'b0;
            tlb_ppn_d <= '0;
        end else begin
            tlb_rv_d  <= tlb_req_valid;
            tlb_ppn_d <= tlb_base_ppn + tlb_req_vpn[PPN_W-1:0];
        end
    end
    assign tlb_resp_valid = tlb_rv_d;
    assign tlb_resp_ppn   = tlb_ppn_d;
    assign tlb_resp_hit   = 1'b1;
    assign tlb_busy       = 1'b0;

    // ---------------- P (probability) writeback into the vec buffers --------
    // Declared ahead of the GEMV generate: the internal P stream takes the
    // vector write port when the softmax is draining; host fills otherwise.
    logic             p_wr_en;
    logic [3:0]       p_wr_addr;
    logic [VEC_W-1:0] p_wr_data;

    wire             vec_wr_en_m   = p_wr_en ? 1'b1      : vec_wr_en;
    wire [3:0]       vec_wr_addr_m = p_wr_en ? p_wr_addr : vec_wr_addr;
    wire [VEC_W-1:0] vec_wr_data_m = p_wr_en ? p_wr_data : vec_wr_data;

    // ---------------- NUM_GEMV GEMV units + accumulator ----------------
    logic [NUM_GEMV-1:0][15:0]      gemv_res;
    logic [NUM_GEMV-1:0]            gemv_rv;
    logic [NUM_GEMV-1:0][VEC_W-1:0] gemv_ctx;
    logic [NUM_GEMV-1:0]            gemv_ctx_v;

    genvar g;
    generate
        for (g = 0; g < NUM_GEMV; g++) begin : g_gemv
            gemv_unit u_gemv (
                .clk(clk), .rst_n(rst_n),
                .mat_wr_en(mat_wr_en), .mat_wr_addr(mat_wr_addr),
                .mat_wr_data(mat_wr_data), .mat_swap(mat_swap),
                .vec_wr_en(vec_wr_en_m), .vec_wr_addr(vec_wr_addr_m),
                .vec_wr_data(vec_wr_data_m), .vec_swap(vec_swap),
                .start(gemv_start), .row_addr(gemv_row_addr),
                .vec_addr(gemv_vec_addr), .op_is_score(op_is_score),
                .accum_clr(gemv_accum_clr), .accum_en(gemv_accum_en),
                .result(gemv_res[g]), .result_valid(gemv_rv[g]),
                .context_result(gemv_ctx[g]), .context_result_valid(gemv_ctx_v[g])
            );
        end
    endgenerate

    accumulator #(.N(NUM_GEMV)) u_acc (
        .clk(clk), .rst_n(rst_n),
        .in_valid(gemv_rv[0]), .parts(gemv_res), .clr(acc_clr),
        .acc(result), .out_valid(result_valid)
    );

    // Context word: unit 0 carries the architected 16 output dims; the other
    // units' context accumulators stay observable through a parity fold.
    assign ctx_out       = gemv_ctx[0];
    assign ctx_out_valid = gemv_ctx_v[0];
    assign ctx_chk       = (^gemv_ctx[1]) ^ (^gemv_ctx[2]) ^ (^gemv_ctx[3])
                         ^ gemv_ctx_v[1] ^ gemv_ctx_v[2] ^ gemv_ctx_v[3];

    // ---------------- score collector (GEMV -> softmax link) ---------------
    // The accumulator's last value for the current score MAC is captured
    // continuously; the retire pulse (mac_done, score mode), delayed past the
    // datapath pipeline, commits it into the collect word. The next MAC's
    // first result cannot land before its own pipeline latency, so the
    // delayed commit always reads this MAC's final value.
    logic [15:0] last_score;
    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n)            last_score <= '0;
        else if (result_valid) last_score <= result;
    end

    logic [COMMIT_DLY-1:0] commit_pipe;
    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) commit_pipe <= '0;
        else        commit_pipe <= {commit_pipe[COMMIT_DLY-2:0],
                                    mac_done & op_is_score};
    end
    wire score_commit = commit_pipe[COMMIT_DLY-1];

    logic [31:0]              seq_len_eff;
    assign seq_len_eff = (cfg_seqlen == 0 || cfg_seqlen > SM_MAX_TOKENS)
                         ? SM_MAX_TOKENS : cfg_seqlen;

    logic [31:0]              tok_cnt;
    logic [SM_LANES-1:0][31:0] collect_word;
    logic [31:0]              score32;
    fp16_to_fp32 u_s2w (.a(last_score), .y(score32));

    wire [3:0] tok_lane   = tok_cnt[3:0];
    wire       tok_last   = (tok_cnt == seq_len_eff - 1);
    wire       lane_last  = (tok_lane == 4'd15);
    wire       word_flush = score_commit & (lane_last | tok_last);

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            tok_cnt      <= '0;
            collect_word <= '0;
        end else if (score_commit) begin
            collect_word[tok_lane] <= score32;
            tok_cnt <= tok_last ? 32'd0 : tok_cnt + 32'd1;
        end
    end

    // Present the word with the just-committed lane merged in (same cycle).
    logic [SM_LANES-1:0][31:0] flush_word;
    always_comb begin
        flush_word = collect_word;
        flush_word[tok_lane] = score32;
    end

    // ---------------- streaming softmax (buffer core, P streams out) --------
    logic                       ssm_in_valid, ssm_in_ready;
    logic [SM_LANES-1:0][31:0]  ssm_in_data;
    logic [SM_LANES-1:0][31:0]  ssm_out_data;
    logic [SM_LANES-1:0]        ssm_out_lane_valid;
    logic [SM_TW_W-1:0]         ssm_out_word_idx;
    logic                       ssm_out_valid, ssm_busy;

    assign ssm_in_valid = word_flush | sm_start_ext;
    assign ssm_in_data  = sm_start_ext ? sm_scores : flush_word;

    streaming_softmax_unit #(
        .LANES(SM_LANES), .MAX_TOKENS(SM_MAX_TOKENS), .CONTEXTS(1)
    ) u_ssm (
        .clk(clk), .rst_n(rst_n),
        .in_valid(ssm_in_valid), .in_ready(ssm_in_ready),
        .in_context(1'b0), .seq_len(seq_len_eff),
        .in_data(ssm_in_data),
        .out_data(ssm_out_data), .out_lane_valid(ssm_out_lane_valid),
        .out_word_idx(ssm_out_word_idx), .out_context(),
        .out_valid(ssm_out_valid), .busy(ssm_busy)
    );

    assign sm_probs = ssm_out_data;
    assign sm_valid = ssm_out_valid;

    // ---------------- P word -> FP16 -> vec buffer write --------------------
    logic [VEC_W-1:0] p_word16;
    generate
        for (g = 0; g < SM_LANES; g++) begin : g_p16
            logic [15:0] p16;
            fp32_to_fp16 u_n (.a(ssm_out_data[g]), .y(p16));
            assign p_word16[g*16 +: 16] = ssm_out_lane_valid[g] ? p16 : 16'd0;
        end
    endgenerate

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            p_wr_en   <= 1'b0;
            p_wr_addr <= '0;
            p_wr_data <= '0;
        end else begin
            p_wr_en   <= ssm_out_valid;
            p_wr_addr <= 4'(ssm_out_word_idx);
            p_wr_data <= p_word16;
        end
    end

    // Keep control-only broadcasts observable (rotate/meta unused in baseline).
    wire _unused = rotate_start | (|rotate_pos) | (|cfg_nhead) | (|cfg_dhead)
                 | ssm_busy | ssm_in_ready | sfm_start | meta_wr_en
                 | (|meta_wr_idx) | (|meta_wr_mask);

endmodule
