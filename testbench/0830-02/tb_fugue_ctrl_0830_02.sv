`timescale 1ns/1ps
// Smoke test for the 0830-02 Fugue HBM controller top: ATTACH loads two
// master segment descriptors through the page-table port, then a MAC_AB
// score over the merged run drives 8 tree passes / 64 column reads.
module tb_fugue_ctrl_0830_02;
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
  logic pt_mem_req_valid, pt_mem_req_ready, pt_mem_resp_valid;
  logic [KV_ADDR_W-1:0] pt_mem_req_addr;
  logic [MEM_DATA_W-1:0] pt_mem_resp_data;
  logic dma_desc_valid, dma_desc_ready, dma_busy, dma_done;
  logic [KV_ADDR_W-1:0] dma_desc_src, dma_desc_dst;
  logic [15:0] dma_desc_len;
  logic dma_rd_req_valid, dma_rd_req_ready, dma_rd_resp_valid;
  logic [KV_ADDR_W-1:0] dma_rd_req_addr;
  logic [255:0] dma_rd_resp_data;
  logic dma_wr_req_valid, dma_wr_req_ready;
  logic [KV_ADDR_W-1:0] dma_wr_req_addr;
  logic [255:0] dma_wr_req_data;

  fugue_hbm_ctrl_top dut (.*);

  // ---------------- page-table image ----------------
  // directory at byte 0: {ctx0, layer0, master} entry 0 -> 2 segments at 64
  //                      {ctx0, layer0, diff}   entry 1 -> invalid
  // descriptors at byte 64: [0,4) @ 0x1000 and [4,8) @ 0x1400 (adjacent)
  function automatic [127:0] mk_desc(
      input logic [KV_ADDR_W-1:0] key_base,
      input logic [POS_W-1:0] vs, input logic [POS_W-1:0] ve,
      input logic [CNT_W-1:0] cnt);
    logic [127:0] d;
    begin
      d = '0;
      d[D_VALID_B]              = 1'b1;
      d[D_KIND_B]               = KIND_MASTER;
      d[D_CHC_B +: CHC_W]       = 5'd15;
      d[D_CHB_B +: CH_W]        = 4'd0;
      d[D_LAYER_B +: LAYER_W]   = '0;
      d[D_CTX_B +: CTX_W]       = '0;
      d[D_CNT_B +: CNT_W]       = cnt;
      d[D_VEND_B +: POS_W]      = ve;
      d[D_VSTART_B +: POS_W]    = vs;
      d[D_KEY_B +: KV_ADDR_W]   = key_base;
      mk_desc = d;
    end
  endfunction

  logic [255:0] pt_word0, pt_word64;
  initial begin
    pt_word0 = '0;
    // dir entry 0 (bits 63:0): valid=1, seg_count=2, seg_base=64
    pt_word0[0]      = 1'b1;
    pt_word0[8:1]    = 8'd2;
    pt_word0[42:9]   = 34'd64;
    // dir entry 1 (bits 127:64): invalid
    pt_word64 = { mk_desc(34'h1400, 16'd4, 16'd8, 16'd4),
                  mk_desc(34'h1000, 16'd0, 16'd4, 16'd4) };
  end

  // single-outstanding memory model, 3-cycle latency (ptw waits per response)
  assign pt_mem_req_ready = 1'b1;
  logic [KV_ADDR_W-1:0] pend_addr;
  logic pend_v, pend_v2;
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
      pend_addr <= '0; pend_v <= 1'b0; pend_v2 <= 1'b0;
      pt_mem_resp_valid <= 1'b0; pt_mem_resp_data <= '0;
    end else begin
      pt_mem_resp_valid <= 1'b0;
      pend_v2 <= pend_v;
      pend_v  <= 1'b0;
      if (pt_mem_req_valid) begin
        pend_addr <= pt_mem_req_addr;
        pend_v    <= 1'b1;
      end
      if (pend_v2) begin
        pt_mem_resp_valid <= 1'b1;
        pt_mem_resp_data  <= (pend_addr[6]) ? pt_word64 : pt_word0;
      end
    end
  end

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

  int n_rd, n_pass;
  always @(posedge clk) begin
    if (dram_cmd==DR_RD) n_rd++;
    if (gemv_pass_start) n_pass++;
  end

  initial begin
    instr_valid=0; instr_word='0; req_rd_idx='0;
    dma_desc_valid=0; dma_desc_src='0; dma_desc_dst='0; dma_desc_len='0;
    dma_rd_req_ready=0; dma_rd_resp_valid=0; dma_rd_resp_data='0; dma_wr_req_ready=0;
    n_rd=0; n_pass=0;
    repeat(3) @(negedge clk); rst_n=1; repeat(2) @(negedge clk);

    send(instr(PIM_SET_CONFIG, 2'b00, CFG_DHEAD,  32'd128, '0, '0));
    send(instr(PIM_SET_CONFIG, 2'b00, CFG_KVBASE, 32'd0,   '0, '0));  // dir base 0
    send(instr(PIM_SET_CONFIG, 2'b00, CFG_KVCTX,  32'd0,   '0, '0));  // ctx0/layer0/master
    wait_idle(50, "config");

    // ATTACH (ctx0, layer0): loads both master descriptors, diff dir invalid.
    send(instr(PIM_ATTACH, 2'b00, 4'd0, 32'd0, '0, 16'h0000));
    wait_idle(500, "attach");
    if (addr_fault) $fatal(1, "attach fault");

    // MAC_AB score over [0,8): planner merges the two adjacent segments into
    // one run of 8 rows -> 8 passes x 8 columns.
    send(instr(PIM_MAC_AB, OP_SCORE, 4'd0, 32'd0, 16'd8, '0));
    wait_idle(3000, "mac score");
    if (addr_fault) $fatal(1, "mac fault");
    if (n_pass!==8) $fatal(1, "passes=%0d", n_pass);
    if (n_rd!==64)  $fatal(1, "rds=%0d", n_rd);

    $display("PASS tb_fugue_ctrl_0830_02");
    $finish;
  end
endmodule
