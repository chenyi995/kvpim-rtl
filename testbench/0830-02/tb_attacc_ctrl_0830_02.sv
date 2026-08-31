`timescale 1ns/1ps
// Smoke test for the 0830-02 AttAcc HBM controller top: config memory
// (incl. batch / per-request-L table), WR_GB strobes, and the MAC_AB
// score/context traversals through direct_addr_plan.
module tb_attacc_ctrl_0830_02;
  import fugue_pkg::*;
  import kv_tlb_pkg::*;

  logic clk=0, rst_n=0;
  always #5 clk=~clk;

  logic instr_valid, instr_ready, idle, addr_fault;
  logic [INSTR_W-1:0] instr_word;
  dram_cmd_e dram_cmd;
  logic [BANK_W-1:0] dram_bank;
  logic [ROW_W-1:0]  dram_row;
  logic [COL_W-1:0]  dram_col;
  logic gemv_pass_start, gemv_op_is_score, gemv_acc_clr;
  logic [8:0] gemv_num_beats;
  logic gemv_vec_wr, gemv_vec_swap;
  logic [3:0] gemv_vec_addr;
  logic sfm_start, mv_sb_start, rd_sb_start, rotate_start;
  logic [15:0] rotate_pos;
  logic acc_bypass_bg, acc_bypass_logic;
  logic [31:0] cfg_nhead, cfg_dhead, cfg_seqlen, cfg_kvbase, cfg_batch;
  logic [$clog2(REQ_TABLE_DEPTH)-1:0] req_rd_idx;
  logic [15:0] req_rd_len;
  logic meta_wr_en;
  logic [SM_WIDX_W-1:0] meta_wr_idx;
  logic [$clog2(SM_CHANNELS)-1:0] meta_wr_channel;
  logic [SM_PES_PER_CHANNEL-1:0] meta_wr_mask;
  logic dma_desc_valid, dma_desc_ready, dma_busy, dma_done;
  logic [KV_ADDR_W-1:0] dma_desc_src, dma_desc_dst;
  logic [15:0] dma_desc_len;
  logic dma_rd_req_valid, dma_rd_req_ready, dma_rd_resp_valid;
  logic [KV_ADDR_W-1:0] dma_rd_req_addr;
  logic [255:0] dma_rd_resp_data;
  logic dma_wr_req_valid, dma_wr_req_ready;
  logic [KV_ADDR_W-1:0] dma_wr_req_addr;
  logic [255:0] dma_wr_req_data;

  attacc_hbm_ctrl_top dut (.*);

  function automatic [INSTR_W-1:0] instr(
      input opcode_e op, input logic [1:0] mode, input logic [3:0] cidx,
      input logic [31:0] vaddr, input logic [15:0] len, input logic [15:0] imm);
    instr = {op, mode, cidx, vaddr, len, imm};
  endfunction

  task automatic send(input logic [INSTR_W-1:0] w);
    begin
      @(negedge clk); instr_valid=1; instr_word=w;
      @(negedge clk); while(!instr_ready) @(negedge clk);
      instr_valid=0;
    end
  endtask

  task automatic wait_idle(input int max_cycles, input string what);
    int n;
    begin
      n=0;
      while (!idle) begin
        @(posedge clk); n++;
        if (n>max_cycles) $fatal(1, "timeout waiting idle after %s", what);
      end
    end
  endtask

  int n_rd, n_act, n_pass, n_vecwr, n_swap;
  always @(posedge clk) begin
    if (dram_cmd==DR_RD)   n_rd++;
    if (dram_cmd==DR_ACT)  n_act++;
    if (gemv_pass_start)   n_pass++;
    if (gemv_vec_wr)       n_vecwr++;
    if (gemv_vec_swap)     n_swap++;
  end

  initial begin
    instr_valid=0; instr_word='0; req_rd_idx='0;
    dma_desc_valid=0; dma_desc_src='0; dma_desc_dst='0; dma_desc_len='0;
    dma_rd_req_ready=0; dma_rd_resp_valid=0; dma_rd_resp_data='0; dma_wr_req_ready=0;
    n_rd=0; n_act=0; n_pass=0; n_vecwr=0; n_swap=0;
    repeat(3) @(negedge clk); rst_n=1; repeat(2) @(negedge clk);

    // ---- config ----
    send(instr(PIM_SET_CONFIG, 2'b00, CFG_DHEAD,  32'd128, '0, '0));
    send(instr(PIM_SET_CONFIG, 2'b00, CFG_KVBASE, 32'd0,   '0, '0));
    send(instr(PIM_SET_CONFIG, 2'b00, CFG_PARTMODE, 32'd3, '0, '0));
    send(instr(PIM_SET_CONFIG, 2'b00, CFG_BATCH,  32'd4,   '0, 16'h0000));
    send(instr(PIM_SET_CONFIG, 2'b00, CFG_BATCH,  32'd777, '0, 16'h8003));
    wait_idle(50, "config");
    if (cfg_dhead!==32'd128)  $fatal(1,"cfg_dhead=%0d", cfg_dhead);
    if (cfg_batch!==32'd4)    $fatal(1,"cfg_batch=%0d", cfg_batch);
    if (acc_bypass_bg!==1'b0 || acc_bypass_logic!==1'b0) $fatal(1,"partmode decode");
    req_rd_idx = 5'd3; repeat(2) @(negedge clk);
    if (req_rd_len!==16'd777) $fatal(1,"req_len[3]=%0d", req_rd_len);

    // ---- GEMV buffer write strobe (+swap on imm[4]) ----
    send(instr(PIM_WR_GB, 2'b00, 4'd0, 32'd0, '0, 16'h0005));
    send(instr(PIM_WR_GB, 2'b00, 4'd0, 32'd0, '0, 16'h0017));
    wait_idle(50, "wr_gb");
    if (n_vecwr!==2) $fatal(1,"n_vecwr=%0d", n_vecwr);
    if (n_swap!==1)  $fatal(1,"n_swap=%0d", n_swap);

    // ---- MAC_AB score: 2 token rows -> 2 tree passes, 16 column reads ----
    n_rd=0; n_act=0; n_pass=0;
    send(instr(PIM_MAC_AB, OP_SCORE, 4'd0, 32'd0, 16'd2, '0));
    wait_idle(500, "mac score");
    if (n_pass!==2)  $fatal(1,"score passes=%0d", n_pass);
    if (n_rd!==16)   $fatal(1,"score rds=%0d", n_rd);
    if (n_act<1)     $fatal(1,"score acts=%0d", n_act);
    if (addr_fault)  $fatal(1,"score addr_fault");

    // ---- MAC_AB context: 4 rows, dhead/16=8 chunks -> 8 passes, 32 reads ----
    n_rd=0; n_act=0; n_pass=0;
    send(instr(PIM_MAC_AB, OP_CONTEXT, 4'd0, 32'd0, 16'd4, '0));
    wait_idle(1500, "mac context");
    if (n_pass!==8)  $fatal(1,"context passes=%0d", n_pass);
    if (n_rd!==32)   $fatal(1,"context rds=%0d", n_rd);
    if (addr_fault)  $fatal(1,"context addr_fault");

    // ---- misc strobes ----
    send(instr(PIM_SFM,   2'b00, 4'd0, 32'd0, '0, '0));
    send(instr(PIM_MV_SB, 2'b00, 4'd0, 32'd0, '0, '0));
    wait_idle(50, "strobes");

    $display("PASS tb_attacc_ctrl_0830_02");
    $finish;
  end
endmodule
