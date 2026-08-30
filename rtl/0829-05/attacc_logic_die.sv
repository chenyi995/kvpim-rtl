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
    // One buffered softmax unit for the single simulated HBM channel, with
    // 16 FP32 SIMD lanes.  cfg_seqlen is shared by the channel datapath.
    input  logic [SM_UNITS-1:0]                              sm_in_valid,
    output logic [SM_UNITS-1:0]                              sm_in_ready,
    input  logic [SM_UNITS-1:0][SM_LANES-1:0][31:0]         sm_scores,
    output logic [SM_UNITS-1:0][SM_LANES-1:0][31:0]         sm_probs,
    output logic [SM_UNITS-1:0]                              sm_valid,
    input  logic [SM_UNITS-1:0]                              sm_out_ready,
    output logic [SM_UNITS-1:0][SM_LANES-1:0]               sm_keep,
    output logic [SM_UNITS-1:0]                              sm_last,

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
    logic [SM_LANES-1:0] meta_wr_mask;

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
        .meta_wr_en(meta_wr_en), .meta_wr_idx(meta_wr_idx), .meta_wr_mask(meta_wr_mask)
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

    // ---------------- 1 x buffered MAX_L=4096 softmax --------------------------
    // This generate block is deliberately in the logic-die top: it is the
    // physical single-channel implementation, not an array wrapper.
    logic [SM_UNITS-1:0] sm_busy, sm_done;
    generate
        for (g = 0; g < SM_UNITS; g++) begin : g_softmax
            buffered_softmax_unit #(.MAX_L(4096)) u_sfm (
                .clk(clk), .rst_n(rst_n),
                .in_valid(sm_in_valid[g]), .in_ready(sm_in_ready[g]),
                .in_data(sm_scores[g]), .seq_len(cfg_seqlen),
                .out_valid(sm_valid[g]), .out_ready(sm_out_ready[g]),
                .out_data(sm_probs[g]), .out_keep(sm_keep[g]),
                .out_last(sm_last[g]), .done(sm_done[g])
            );
            assign sm_busy[g] = !sm_in_ready[g];
        end
    endgenerate

    // Keep control-only broadcasts observable (rotate/meta unused in baseline).
    wire _unused = rotate_start | (|rotate_pos) | (|cfg_nhead) | (|cfg_dhead)
                 | (|cfg_seqlen) | (|sm_busy) | (|sm_done) | sfm_start | meta_wr_en | (|meta_wr_idx)
                 | (|meta_wr_mask);

endmodule
