// attacc_logic_die.sv — AttAcc-ORIGINAL HBM logic-die top (BASELINE).
//
// The buffer-die logic of AttAcc, WITHOUT any of Fugue's additions: no KV segment TLB
// (addresses are computed directly), no on-die RoPE rotate unit, and no
// master-diff diff_decoder. Instantiates only GEMV units + softmax +
// accumulator + the AttAcc controller. Synthesized head-to-head against
// fugue_logic_die so the area/power/timing delta isolates exactly the cost of
// Fugue's added hardware (kv_tlb_top + rotate_q_unit + diff_decoder).
module attacc_logic_die import fugue_pkg::*; import kv_tlb_pkg::*; (
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

    // ---- complete-sequence softmax score stream / probability stream ----
    // sm_start_ext is now a per-16-score-word valid.  Hold cfg_seqlen stable
    // while streaming all ceil(cfg_seqlen/16) words for one context.
    input  logic                       sm_start_ext,
    input  logic [SM_LANES-1:0][31:0]  sm_scores,
    output logic [SM_LANES-1:0][31:0]  sm_probs,
    output logic                       sm_valid,

    // ---- DRAM command interface ----
    output dram_cmd_e                  dram_cmd,
    output logic [BANK_W-1:0]          dram_bank,
    output logic [ROW_W-1:0]           dram_row,
    output logic [COL_W-1:0]           dram_col,

    // ---- reduced GEMV result ----
    output logic [15:0]                result,
    output logic                       result_valid
);
    // ---------------- controller <-> datapath nets ----------------
    logic                plan_cmd_valid, plan_cmd_ready, plan_cmd_done, plan_cmd_fault;
    logic [1:0]          plan_cmd_op, plan_cmd_pools;
    logic [CTX_W-1:0]    plan_cmd_ctx;
    logic [LAYER_W-1:0]  plan_cmd_layer;
    logic [POS_W-1:0]    plan_cmd_pos_lo, plan_cmd_pos_hi;
    logic                run_valid, run_ready, addr_fault;
    logic [KV_ADDR_W-1:0] run_key_base;
    logic [CNT_W-1:0]    run_count;
    logic [31:0]         cfg_kvbase;

    logic                gemv_start, gemv_accum_en, gemv_accum_clr;
    logic [3:0]          gemv_row_addr, gemv_vec_addr;
    opmode_e             op_mode;
    logic                rotate_start, sfm_start, acc_clr;
    logic [15:0]         rotate_pos;
    logic [31:0]         cfg_nhead, cfg_dhead, cfg_seqlen;
    logic                meta_wr_en;
    logic [SM_WIDX_W-1:0] meta_wr_idx;
    logic [$clog2(SM_CHANNELS)-1:0] meta_wr_channel;
    logic [SM_PES_PER_CHANNEL-1:0] meta_wr_mask;

    wire op_is_score = (op_mode == OP_SCORE);

    // ---------------- controller ----------------
    // Same controller as Fugue; its address-plan port is served by DIRECT
    // addressing (direct_addr_plan: one affine run) — AttAcc's non-translated path.
    attacc_controller u_ctrl (
        .clk(clk), .rst_n(rst_n),
        .instr_valid(instr_valid), .instr_word(instr_word),
        .instr_ready(instr_ready), .idle(idle),
        .plan_cmd_valid(plan_cmd_valid), .plan_cmd_ready(plan_cmd_ready), .plan_cmd_op(plan_cmd_op),
        .plan_cmd_ctx(plan_cmd_ctx), .plan_cmd_layer(plan_cmd_layer),
        .plan_cmd_pos_lo(plan_cmd_pos_lo), .plan_cmd_pos_hi(plan_cmd_pos_hi), .plan_cmd_pools(plan_cmd_pools),
        .plan_cmd_done(plan_cmd_done), .plan_cmd_fault(plan_cmd_fault),
        .run_valid(run_valid), .run_ready(run_ready), .run_key_base(run_key_base), .run_count(run_count),
        .addr_fault(addr_fault),
        .dram_cmd(dram_cmd), .dram_bank(dram_bank),
        .dram_row(dram_row), .dram_col(dram_col),
        .gemv_start(gemv_start), .gemv_row_addr(gemv_row_addr),
        .gemv_vec_addr(gemv_vec_addr), .gemv_accum_en(gemv_accum_en),
        .gemv_accum_clr(gemv_accum_clr), .op_mode(op_mode),
        .rotate_start(rotate_start), .rotate_pos(rotate_pos),
        .sfm_start(sfm_start), .acc_clr(acc_clr),
        .cfg_nhead(cfg_nhead), .cfg_dhead(cfg_dhead), .cfg_seqlen(cfg_seqlen), .cfg_kvbase(cfg_kvbase),
        .meta_wr_en(meta_wr_en), .meta_wr_idx(meta_wr_idx), .meta_wr_channel(meta_wr_channel), .meta_wr_mask(meta_wr_mask)
    );

    // Direct address path (no table, no translation): one affine run per MAC.
    direct_addr_plan u_addr (
        .clk(clk), .rst_n(rst_n), .kv_base_vec(cfg_kvbase),
        .cmd_valid(plan_cmd_valid), .cmd_ready(plan_cmd_ready), .cmd_op(plan_cmd_op),
        .cmd_pos_lo(plan_cmd_pos_lo), .cmd_pos_hi(plan_cmd_pos_hi),
        .cmd_done(plan_cmd_done), .cmd_fault(plan_cmd_fault),
        .run_valid(run_valid), .run_ready(run_ready), .run_key_base(run_key_base), .run_count(run_count)
    );
    wire _unused_addr = addr_fault | (|plan_cmd_ctx) | (|plan_cmd_layer) | (|plan_cmd_pools);

    // ---------------- NUM_GEMV GEMV units + accumulator ----------------
    logic [NUM_GEMV-1:0][15:0] gemv_res;
    logic [NUM_GEMV-1:0]       gemv_rv;

    genvar g;
    generate
        for (g = 0; g < NUM_GEMV; g++) begin : g_gemv
            gemv_unit u_gemv (
                .clk(clk), .rst_n(rst_n),
                .mat_wr_en(mat_wr_en), .mat_wr_addr(mat_wr_addr),
                .mat_wr_data(mat_wr_data), .mat_swap(mat_swap),
                .vec_wr_en(vec_wr_en), .vec_wr_addr(vec_wr_addr),
                .vec_wr_data(vec_wr_data), .vec_swap(vec_swap),
                .start(gemv_start), .row_addr(gemv_row_addr),
                .vec_addr(gemv_vec_addr), .op_is_score(op_is_score),
                .accum_clr(gemv_accum_clr), .accum_en(gemv_accum_en),
                .result(gemv_res[g]), .result_valid(gemv_rv[g])
            );
        end
    endgenerate

    accumulator #(.N(NUM_GEMV)) u_acc (
        .clk(clk), .rst_n(rst_n),
        .in_valid(gemv_rv[0]), .parts(gemv_res), .clr(acc_clr),
        .acc(result), .out_valid(result_valid)
    );

    // ---------------- all-channel buffered softmax -----------------------------
    // 16 independent channel engines x 16 PE/engine = AttAcc's 256 FP32
    // softmax PEs.  Each engine owns 32 KiB of macro-backed score/exp storage
    // (two 16 KiB contexts), for 512 KiB across the 16 channels.
    logic [SM_CHANNELS-1:0] sm_busy_ch, sm_valid_ch;
    logic [SM_CHANNELS-1:0][SM_WIDX_W-1:0] sm_out_word;
    logic [SM_CHANNELS-1:0][0:0] sm_out_context;
    generate
        for (g = 0; g < SM_CHANNELS; g++) begin : g_softmax_channel
            softmax_unit #(.LANES(SM_PES_PER_CHANNEL), .MAX_TOKENS(2048), .CONTEXTS(ATTACC_SM_CONTEXTS)) u_sfm (
                .clk(clk), .rst_n(rst_n),
                .in_valid(sm_start_ext), .in_ready(), .in_context(1'b0), .seq_len(cfg_seqlen),
                .in_data(sm_scores[g*SM_PES_PER_CHANNEL +: SM_PES_PER_CHANNEL]),
                .out_data(sm_probs[g*SM_PES_PER_CHANNEL +: SM_PES_PER_CHANNEL]), .out_lane_valid(),
                .out_word_idx(sm_out_word[g]), .out_context(sm_out_context[g]),
                .out_valid(sm_valid_ch[g]), .busy(sm_busy_ch[g])
            );
        end
    endgenerate
    assign sm_valid = sm_valid_ch[0];

    // Keep control-only broadcasts observable (rotate/meta unused in baseline).
    wire _unused = rotate_start | (|rotate_pos) | (|cfg_nhead) | (|cfg_dhead)
                 | (|cfg_seqlen) | (|sm_busy_ch) | sfm_start | meta_wr_en | (|meta_wr_idx) | (|sm_out_word) | (|sm_out_context)
                 | (|meta_wr_mask) | (|meta_wr_channel);

endmodule
