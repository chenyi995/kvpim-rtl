// tb_attacc_top_link.sv — end-to-end smoke test of the linked AttAcc top:
// score MAC_AB stream -> score collector -> streaming softmax -> P writeback
// into the GEMV vector buffers -> context MAC_AB -> ctx_out.
//
// Numerics are chosen exactly representable so the check is bit-accurate:
//   * Q and K chunks are all zero  -> every token score = 0.0
//   * softmax over 32 equal scores -> P[t] = 1/32 (exp(0)=1, recip(32) exact)
//   * V lanes all 32.0             -> ctx[l] = sum over 2 words of (1/32)*32
//                                            = 2.0 (FP16 0x4000)
`timescale 1ns/1ps
module tb_attacc_top_link;
  import fugue_pkg::*;

  localparam int L = 32;                 // tokens (2 sixteen-lane words)
  localparam int SCORE_BEATS = 4;        // d_head chunks per score MAC
  localparam logic [31:0] P32_EXP = 32'h3d00_0000;   // 1/32
  localparam logic [15:0] V16     = 16'h5000;        // 32.0
  localparam logic [15:0] CTX_EXP = 16'h4000;        // 2.0

  logic clk = 0, rst_n = 0;
  always #0.5 clk = ~clk;

  logic                      instr_valid = 0;
  logic [INSTR_W-1:0]        instr_word = '0;
  logic                      instr_ready, idle;
  logic                      mat_wr_en = 0, vec_wr_en = 0, mat_swap = 0, vec_swap = 0;
  logic [3:0]                mat_wr_addr = '0, vec_wr_addr = '0;
  logic [VEC_W-1:0]          mat_wr_data = '0, vec_wr_data = '0;
  logic                      sm_start_ext = 0;
  logic [SM_LANES-1:0][31:0] sm_scores = '0;
  logic [SM_LANES-1:0][31:0] sm_probs;
  logic                      sm_valid;
  dram_cmd_e                 dram_cmd;
  logic [BANK_W-1:0]         dram_bank;
  logic [ROW_W-1:0]          dram_row;
  logic [COL_W-1:0]          dram_col;
  logic [15:0]               result;
  logic                      result_valid;
  logic [VEC_W-1:0]          ctx_out;
  logic                      ctx_out_valid, ctx_chk;

  attacc_logic_die dut (.*);

  int errors = 0;
  int sm_words_seen = 0;
  logic [VEC_W-1:0] ctx_last = '0;

  // capture softmax output words and the last context word
  always @(posedge clk) begin
    if (sm_valid) begin
      sm_words_seen <= sm_words_seen + 1;
      // fp32_recip is a LUT+NR approximation (documented): allow a small
      // relative error around 1/32; the FP16 narrowing still rounds to the
      // exact 0x2800, which the bit-exact ctx check below relies on.
      for (int l = 0; l < SM_LANES; l++) begin
        shortreal p;
        p = $bitstoshortreal(sm_probs[l]);
        if (!(p > 0.03125 * 0.9999 && p < 0.03125 * 1.0001)) begin
          errors++;
          $display("FAIL: P word %0d lane %0d = %h (expect ~%h)",
                   sm_words_seen, l, sm_probs[l], P32_EXP);
        end
      end
    end
    if (ctx_out_valid) ctx_last <= ctx_out;
  end

  task automatic push_instr(input instr_t in);
    begin
      @(negedge clk);
      while (!instr_ready) @(negedge clk);
      instr_valid <= 1'b1;
      instr_word  <= in;
      @(negedge clk);
      instr_valid <= 1'b0;
    end
  endtask

  task automatic mac(input opmode_e mode, input int len);
    instr_t in;
    begin
      in = '0;
      in.op   = PIM_MAC_AB;
      in.mode = mode[1:0];
      in.len  = 16'(len);
      push_instr(in);
    end
  endtask

  task automatic wait_idle;
    begin
      @(negedge clk);
      while (!idle) @(negedge clk);
    end
  endtask

  instr_t cfg_in;
  initial begin
    repeat (5) @(negedge clk);
    rst_n = 1;
    repeat (3) @(negedge clk);

    // ---- fill Q (vec) and K (mat) chunks with zeros, then swap to drain ----
    for (int w = 0; w < SCORE_BEATS; w++) begin
      @(negedge clk);
      vec_wr_en <= 1; vec_wr_addr <= 4'(w); vec_wr_data <= '0;
      mat_wr_en <= 1; mat_wr_addr <= 4'(w); mat_wr_data <= '0;
    end
    @(negedge clk);
    vec_wr_en <= 0; mat_wr_en <= 0;
    vec_swap <= 1; mat_swap <= 1;
    @(negedge clk);
    vec_swap <= 0; mat_swap <= 0;

    // ---- CFG_SEQLEN = 32 ----
    cfg_in = '0;
    cfg_in.op      = PIM_SET_CONFIG;
    cfg_in.cfg_idx = CFG_SEQLEN;
    cfg_in.vaddr   = 32'(L);
    push_instr(cfg_in);

    // ---- 32 score MACs (one committed token score each) ----
    for (int t = 0; t < L; t++) mac(OP_SCORE, SCORE_BEATS);
    wait_idle();

    // softmax runs automatically after the last collected word
    fork : sm_wait
      begin
        wait (sm_words_seen == L/SM_LANES);
        disable sm_wait;
      end
      begin
        repeat (3000) @(negedge clk);
        errors++;
        $display("FAIL: timeout waiting for %0d softmax words (saw %0d)",
                 L/SM_LANES, sm_words_seen);
        disable sm_wait;
      end
    join

    // allow the last P writeback to land, then swap vec so P becomes readable
    repeat (4) @(negedge clk);
    vec_swap <= 1;
    @(negedge clk);
    vec_swap <= 0;

    // ---- load V into mat (32.0 in every lane of words 0..1), swap ----
    for (int w = 0; w < L/SM_LANES; w++) begin
      @(negedge clk);
      mat_wr_en <= 1; mat_wr_addr <= 4'(w); mat_wr_data <= {SM_LANES{V16}};
    end
    @(negedge clk);
    mat_wr_en <= 0;
    mat_swap <= 1;
    @(negedge clk);
    mat_swap <= 0;

    // ---- context MAC over the two P words ----
    mac(OP_CONTEXT, L/SM_LANES);
    wait_idle();
    repeat (20) @(negedge clk);

    for (int l = 0; l < SM_LANES; l++) begin
      if (ctx_last[l*16 +: 16] !== CTX_EXP) begin
        errors++;
        $display("FAIL: ctx lane %0d = %h (expect %h)",
                 l, ctx_last[l*16 +: 16], CTX_EXP);
      end
    end

    if (errors == 0) $display("PASS tb_attacc_top_link (L=%0d: P=1/32, ctx=2.0)", L);
    else             $display("FAIL tb_attacc_top_link: %0d errors", errors);
    $finish;
  end
endmodule
