// fugue_logic_die.sv — Fugue HBM logic-die top.
//
// AttAcc's buffer-die logic (GEMV units, softmax, accumulator, controller)
// PLUS Fugue's three additions: a KV TLB (logical->physical DRAM translation),
// a RoPE rotate-Q unit on the query path, and the master-diff diff_decoder
// (bidirectional score overwrite + recirculation mask).
//
//   host instr ─► attacc_controller ─► TLB ─► DRAM cmd (ACT/RD/WR)
//                     │        └─► diff_decoder metadata (PIM_SET_META)
//                     ├─► NUM_GEMV × gemv_unit ─► accumulator ─► result
//                     ├─► rotate_q_unit  (RoPE on Q/K, RoPIM-style)
//                     └─► diff_decoder(fwd) ─► softmax_unit ─► diff_decoder(rev)
//                                                              ├─► ctx_to_master
//                                                              └─► ctx_to_diff
module fugue_logic_die import fugue_pkg::*; import kv_tlb_pkg::*; (
    input  logic                       clk,
    input  logic                       rst_n,

    // ---- host instruction stream ----
    input  logic                       instr_valid,
    input  logic [INSTR_W-1:0]         instr_word,
    output logic                       instr_ready,
    output logic                       idle,

    // ---- GEMV operand fills (matrix K/V tile + vector Q/scores) ----
    input  logic                       mat_wr_en,
    input  logic [3:0]                 mat_wr_addr,
    input  logic [VEC_W-1:0]           mat_wr_data,
    input  logic                       mat_swap,
    input  logic                       vec_wr_en,
    input  logic [3:0]                 vec_wr_addr,
    input  logic [VEC_W-1:0]           vec_wr_data,
    input  logic                       vec_swap,

    // ---- RoPE rotate (BF16, on-die sin/cos): upstream sends only the query +
    //      per-pair angles p*theta_i; cos/sin are generated on the die. ----
    input  logic                       rope_in_valid,
    input  logic [VEC_W-1:0]           rope_x,        // query word (16 BF16 lanes)
    input  logic [7:0][15:0]           rope_phase,    // 8 per-pair angles (turns)
    output logic [VEC_W-1:0]           rope_y,
    output logic                       rope_valid,

    // ---- score path: master scores + compact diff scores -> softmax ----
    input  logic                       sm_start_ext,
    input  logic [SM_WIDX_W-1:0]       sm_word_idx,      // which score word
    input  logic [SM_LANES-1:0][31:0]  sm_scores,        // master scores (from banks)
    input  logic [SM_LANES-1:0][31:0]  diff_stream,      // compact diff scores
    output logic [SM_LANES-1:0][31:0]  sm_probs,         // softmax probabilities
    output logic                       sm_valid,
    output logic [SM_LANES-1:0][31:0]  ctx_to_master,    // recirc: master side (diff lanes 0)
    output logic [SM_LANES-1:0][31:0]  ctx_to_diff,      // recirc: diff channel side

    // ---- KV page-table memory port (segment-TLB walker; 32-B reads) ----
    output logic                       pt_mem_req_valid,
    input  logic                       pt_mem_req_ready,
    output logic [KV_ADDR_W-1:0]       pt_mem_req_addr,
    input  logic                       pt_mem_resp_valid,
    input  logic [MEM_DATA_W-1:0]      pt_mem_resp_data,

    // ---- DRAM command interface (to the banks) ----
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

    // ---------------- KV segment TLB (drampim CacheBlendTLB in hardware) ----------------
    // CFG_KVBASE = page-table directory base in 32-B units.
    run_t               kv_run;
    logic [KV_ADDR_W-1:0] kv_run_value_base;
    kv_tlb_top #(.ENTRIES(KV_TLB_ENTRIES)) u_tlb (
        .clk(clk), .rst_n(rst_n),
        .cfg_dir_base({cfg_kvbase[KV_ADDR_W-6:0], 5'b0}),
        .cmd_valid(plan_cmd_valid), .cmd_ready(plan_cmd_ready), .cmd_op(plan_cmd_op),
        .cmd_ctx(plan_cmd_ctx), .cmd_layer(plan_cmd_layer),
        .cmd_pos_lo(plan_cmd_pos_lo), .cmd_pos_hi(plan_cmd_pos_hi), .cmd_pools(plan_cmd_pools),
        .cmd_done(plan_cmd_done), .cmd_fault(plan_cmd_fault),
        .run_valid(run_valid), .run_ready(run_ready), .run(kv_run), .run_value_base(kv_run_value_base),
        .mem_req_valid(pt_mem_req_valid), .mem_req_ready(pt_mem_req_ready), .mem_req_addr(pt_mem_req_addr),
        .mem_resp_valid(pt_mem_resp_valid), .mem_resp_data(pt_mem_resp_data)
    );
    assign run_key_base = kv_run.key_base;
    assign run_count    = kv_run.count;

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

    // ---------------- RoPE rotate-Q unit (BF16, on-die sin/cos) ----------------
    // Adjacent-pair (de)interleave of the 256b word into 8 even/odd BF16 lanes.
    logic [7:0][15:0] rope_xe, rope_xo, rope_ye, rope_yo;
    genvar rp;
    generate
        for (rp = 0; rp < 8; rp++) begin : g_rope_split
            assign rope_xe[rp] = rope_x[(2*rp)  *16 +: 16];
            assign rope_xo[rp] = rope_x[(2*rp+1)*16 +: 16];
            assign rope_y[(2*rp)  *16 +: 16] = rope_ye[rp];
            assign rope_y[(2*rp+1)*16 +: 16] = rope_yo[rp];
        end
    endgenerate

    rotate_q_bf16 #(.PAIRS(8)) u_rotate (
        .clk(clk), .rst_n(rst_n),
        .in_valid(rope_in_valid),
        .x_even(rope_xe), .x_odd(rope_xo),
        .phase(rope_phase),
        .y_even(rope_ye), .y_odd(rope_yo),
        .out_valid(rope_valid)
    );

    // ---------------- diff_decoder (master-diff merge) + softmax ----------------
    wire sm_start = sm_start_ext;

    logic [SM_LANES-1:0][31:0] corrected_score;
    logic [SM_LANES-1:0]       corrected_mask;
    logic                      corrected_valid;
    logic [SM_LANES-1:0][31:0] sm_out;
    logic                      sm_busy;
    logic [SM_WIDX_W-1:0]      sm_out_word;
    logic [4:0]                 sm_out_context;

    diff_decoder u_diff (
        .clk(clk), .rst_n(rst_n),
        .meta_wr_en(meta_wr_en), .meta_wr_idx(meta_wr_idx), .meta_wr_mask(meta_wr_mask),
        // forward: master score overwritten by diff score -> corrected -> softmax
        .fwd_valid(sm_start), .fwd_word_idx(sm_word_idx),
        .master_score(sm_scores), .diff_stream(diff_stream),
        .corrected_score(corrected_score), .corrected_mask(corrected_mask),
        .corrected_valid(corrected_valid),
        // reverse: softmax probabilities split by mask
        .rev_valid(sm_valid), .rev_word_idx(sm_out_word),
        .prob(sm_out),
        .to_master(ctx_to_master), .to_diff(ctx_to_diff),
        .rev_valid_o()
    );

    streaming_softmax_unit #(.LANES(SM_LANES), .MAX_TOKENS(2048), .CONTEXTS(32)) u_sfm (
        .clk(clk), .rst_n(rst_n),
        .in_valid(corrected_valid), .in_ready(), .in_context(5'd0), .seq_len(cfg_seqlen), .in_data(corrected_score),
        .out_data(sm_out), .out_lane_valid(), .out_word_idx(sm_out_word), .out_context(sm_out_context),
        .out_valid(sm_valid), .busy(sm_busy)
    );
    assign sm_probs = sm_out;

    // Keep control-only broadcasts observable so they are not trimmed away
    // (they parameterize upstream operand/angle generation in a full SoC).
    wire _unused = rotate_start | (|rotate_pos) | (|cfg_nhead) | (|cfg_dhead)
                 | (|cfg_seqlen) | sm_busy | sfm_start | addr_fault | (|kv_run_value_base) | corrected_valid
                 | (|corrected_mask);

endmodule
