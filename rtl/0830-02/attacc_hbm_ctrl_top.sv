// attacc_hbm_ctrl_top.sv — synthesis top for the AttAcc HBM controller level:
// the paper's controller (instruction queue + decoder + config memory +
// address generation / DRAM command FSM) + the DMA engine + the AttAcc
// baseline address path (direct_addr_plan: one affine run, no table).
// One instance per HBM.
module attacc_hbm_ctrl_top import fugue_pkg::*; import kv_tlb_pkg::*; (
    input  logic                 clk,
    input  logic                 rst_n,

    // ---- host instruction input ----
    input  logic                 instr_valid,
    input  logic [INSTR_W-1:0]   instr_word,
    output logic                 instr_ready,
    output logic                 idle,
    output logic                 addr_fault,

    // ---- DRAM command bus ----
    output dram_cmd_e            dram_cmd,
    output logic [BANK_W-1:0]    dram_bank,
    output logic [ROW_W-1:0]     dram_row,
    output logic [COL_W-1:0]     dram_col,

    // ---- GEMV / datapath control ----
    output logic                 gemv_pass_start,
    output logic                 gemv_op_is_score,
    output logic [8:0]           gemv_num_beats,
    output logic                 gemv_acc_clr,
    output logic                 gemv_vec_wr,
    output logic [3:0]           gemv_vec_addr,
    output logic                 gemv_vec_swap,
    output logic                 sfm_start,
    output logic                 mv_sb_start,
    output logic                 rd_sb_start,
    output logic                 rotate_start,
    output logic [15:0]          rotate_pos,
    output logic                 acc_bypass_bg,
    output logic                 acc_bypass_logic,

    // ---- config broadcast ----
    output logic [31:0]          cfg_nhead,
    output logic [31:0]          cfg_dhead,
    output logic [31:0]          cfg_seqlen,
    output logic [31:0]          cfg_kvbase,
    output logic [31:0]          cfg_batch,
    input  logic [$clog2(REQ_TABLE_DEPTH)-1:0] req_rd_idx,
    output logic [15:0]          req_rd_len,

    // ---- diff-decoder metadata (unused in AttAcc; kept for a common bus) ----
    output logic                 meta_wr_en,
    output logic [SM_WIDX_W-1:0] meta_wr_idx,
    output logic [$clog2(SM_CHANNELS)-1:0] meta_wr_channel,
    output logic [SM_PES_PER_CHANNEL-1:0]  meta_wr_mask,

    // ---- DMA: descriptor + read/write masters (xPU <-> HBM transfers) ----
    input  logic                 dma_desc_valid,
    output logic                 dma_desc_ready,
    input  logic [KV_ADDR_W-1:0] dma_desc_src,
    input  logic [KV_ADDR_W-1:0] dma_desc_dst,
    input  logic [15:0]          dma_desc_len,
    output logic                 dma_busy,
    output logic                 dma_done,
    output logic                 dma_rd_req_valid,
    input  logic                 dma_rd_req_ready,
    output logic [KV_ADDR_W-1:0] dma_rd_req_addr,
    input  logic                 dma_rd_resp_valid,
    input  logic [255:0]         dma_rd_resp_data,
    output logic                 dma_wr_req_valid,
    input  logic                 dma_wr_req_ready,
    output logic [KV_ADDR_W-1:0] dma_wr_req_addr,
    output logic [255:0]         dma_wr_req_data
);
    // plan port between the controller and the direct address path
    logic                 plan_cmd_valid, plan_cmd_ready, plan_cmd_done, plan_cmd_fault;
    logic [1:0]           plan_cmd_op, plan_cmd_pools;
    logic [CTX_W-1:0]     plan_cmd_ctx;
    logic [LAYER_W-1:0]   plan_cmd_layer;
    logic [POS_W-1:0]     plan_cmd_pos_lo, plan_cmd_pos_hi;
    logic                 run_valid, run_ready;
    logic [KV_ADDR_W-1:0] run_key_base;
    logic [CNT_W-1:0]     run_count;
    logic [31:0]          cfg_kvbase_i;
    assign cfg_kvbase = cfg_kvbase_i;

    attacc_controller u_ctrl (
        .clk, .rst_n,
        .instr_valid, .instr_word, .instr_ready, .idle,
        .plan_cmd_valid, .plan_cmd_ready, .plan_cmd_op,
        .plan_cmd_ctx, .plan_cmd_layer, .plan_cmd_pos_lo, .plan_cmd_pos_hi,
        .plan_cmd_pools, .plan_cmd_done, .plan_cmd_fault,
        .run_valid, .run_ready, .run_key_base, .run_count, .addr_fault,
        .dram_cmd, .dram_bank, .dram_row, .dram_col,
        .gemv_pass_start, .gemv_op_is_score, .gemv_num_beats, .gemv_acc_clr,
        .gemv_vec_wr, .gemv_vec_addr, .gemv_vec_swap,
        .sfm_start, .mv_sb_start, .rd_sb_start,
        .rotate_start, .rotate_pos, .acc_bypass_bg, .acc_bypass_logic,
        .cfg_nhead, .cfg_dhead, .cfg_seqlen, .cfg_kvbase(cfg_kvbase_i), .cfg_batch,
        .req_rd_idx, .req_rd_len,
        .meta_wr_en, .meta_wr_idx, .meta_wr_channel, .meta_wr_mask
    );

    direct_addr_plan u_plan (
        .clk, .rst_n,
        .kv_base_vec (cfg_kvbase_i),
        .cmd_valid   (plan_cmd_valid),
        .cmd_ready   (plan_cmd_ready),
        .cmd_op      (plan_cmd_op),
        .cmd_pos_lo  (plan_cmd_pos_lo),
        .cmd_pos_hi  (plan_cmd_pos_hi),
        .cmd_done    (plan_cmd_done),
        .cmd_fault   (plan_cmd_fault),
        .run_valid   (run_valid),
        .run_ready   (run_ready),
        .run_key_base(run_key_base),
        .run_count   (run_count)
    );

    dma_engine #(.ADDR_W(KV_ADDR_W)) u_dma (
        .clk, .rst_n,
        .desc_valid(dma_desc_valid), .desc_ready(dma_desc_ready),
        .desc_src(dma_desc_src), .desc_dst(dma_desc_dst), .desc_len(dma_desc_len),
        .busy(dma_busy), .done(dma_done),
        .rd_req_valid(dma_rd_req_valid), .rd_req_ready(dma_rd_req_ready),
        .rd_req_addr(dma_rd_req_addr),
        .rd_resp_valid(dma_rd_resp_valid), .rd_resp_data(dma_rd_resp_data),
        .wr_req_valid(dma_wr_req_valid), .wr_req_ready(dma_wr_req_ready),
        .wr_req_addr(dma_wr_req_addr), .wr_req_data(dma_wr_req_data)
    );

    // The controller core drives ctx/layer/pools from CFG_KVCTX; the direct
    // path ignores them (no table).
    logic _unused;
    assign _unused = ^{plan_cmd_ctx, plan_cmd_layer, plan_cmd_pools};
endmodule
