`timescale 1ns/1ps
// Logic-die-level units of the 0830-02 snapshot:
//  * buffered softmax_unit (one 16-score tile, equal scores -> probs ~ 1/16)
//  * causal_comparator (paper 4.4.2: discard scores of keys after the query)
//  * latency-tolerant checks of the pipelined FP32 leaves (add s3 / mul s2)
module tb_logic_die_units_0830_02;
  logic clk=0, rst_n=0;
  always #5 clk=~clk;

  // ---------------- softmax_unit ----------------
  logic sm_iv, sm_ready, sm_ov, sm_busy;
  logic [0:0] sm_ctx_in, sm_ctx_out;
  logic [31:0] sm_len;
  logic [15:0][31:0] sm_in, sm_out;
  logic [15:0] sm_lane_valid;
  logic [6:0] sm_widx;
  softmax_unit #(.LANES(16), .MAX_TOKENS(2048), .CONTEXTS(2)) u_sm (
    .clk, .rst_n,
    .in_valid(sm_iv), .in_ready(sm_ready), .in_context(sm_ctx_in),
    .seq_len(sm_len), .in_data(sm_in),
    .out_data(sm_out), .out_lane_valid(sm_lane_valid),
    .out_word_idx(sm_widx), .out_context(sm_ctx_out),
    .out_valid(sm_ov), .busy(sm_busy)
  );

  // ---------------- causal comparator ----------------
  logic cc_iv, cc_ov;
  logic [15:0] cc_qpos, cc_base;
  logic [15:0] cc_mask;
  causal_comparator u_cc (
    .clk, .rst_n, .in_valid(cc_iv),
    .q_pos(cc_qpos), .word_base(cc_base),
    .keep_mask(cc_mask), .out_valid(cc_ov)
  );

  // ---------------- fp32 leaves (latency-tolerant) ----------------
  logic fa_iv, fa_ov, fm_ov;
  logic [31:0] fa_a, fa_b, fa_y, fm_y;
  fp32_add u_fa (.clk, .rst_n, .in_valid(fa_iv), .a(fa_a), .b(fa_b), .y(fa_y), .out_valid(fa_ov));
  fp32_mul u_fm (.clk, .rst_n, .in_valid(fa_iv), .a(fa_a), .b(fa_b), .y(fm_y), .out_valid(fm_ov));

  logic [31:0] fa_res[$], fm_res[$];
  always @(posedge clk) begin
    if (fa_ov) fa_res.push_back(fa_y);
    if (fm_ov) fm_res.push_back(fm_y);
  end

  task automatic fp32_check(input [31:0] a, b, ea, em);
    begin
      fa_res.delete(); fm_res.delete();
      @(negedge clk); fa_a=a; fa_b=b; fa_iv=1;
      @(negedge clk); fa_iv=0;
      repeat (16) @(negedge clk);
      if (fa_res.size()!==1 || fa_res[0]!==ea)
        $fatal(1,"fp32_add a=%h b=%h got %0d results [0]=%h want %h", a,b,fa_res.size(),fa_res[0],ea);
      if (fm_res.size()!==1 || fm_res[0]!==em)
        $fatal(1,"fp32_mul a=%h b=%h got %h want %h", a,b,fm_res[0],em);
    end
  endtask

  initial begin
    sm_iv=0; sm_ctx_in=0; sm_len=0; sm_in='0;
    cc_iv=0; cc_qpos='0; cc_base='0;
    fa_iv=0; fa_a='0; fa_b='0;
    repeat(3) @(negedge clk); rst_n=1; repeat(2) @(negedge clk);

    // ---- fp32 leaves: 1+1=2, 1*1=1; 2+1=3, 2*1=2; 3+(-2)=1, 3*(-2)=-6 ----
    fp32_check(32'h3f800000, 32'h3f800000, 32'h40000000, 32'h3f800000);
    fp32_check(32'h40000000, 32'h3f800000, 32'h40400000, 32'h40000000);
    fp32_check(32'h40400000, 32'hc0000000, 32'h3f800000, 32'hc0c00000);

    // ---- causal comparator: q_pos=19, word_base=16 -> lanes 0..3 kept ----
    @(negedge clk); cc_qpos=16'd19; cc_base=16'd16; cc_iv=1;
    @(negedge clk); cc_iv=0;
    @(negedge clk);
    if (cc_mask!==16'h000F) $fatal(1,"causal mask=%h", cc_mask);
    // q_pos before the word -> nothing kept; q_pos far after -> all kept
    @(negedge clk); cc_qpos=16'd7;    cc_base=16'd16; cc_iv=1;
    @(negedge clk); cc_iv=0; @(negedge clk);
    if (cc_mask!==16'h0000) $fatal(1,"causal mask (before)=%h", cc_mask);
    @(negedge clk); cc_qpos=16'd2047; cc_base=16'd16; cc_iv=1;
    @(negedge clk); cc_iv=0; @(negedge clk);
    if (cc_mask!==16'hFFFF) $fatal(1,"causal mask (after)=%h", cc_mask);

    // ---- softmax: 16 equal scores (1.0), seq_len=16 -> probs ~ 1/16 ----
    for (int l=0;l<16;l++) sm_in[l]=32'h3f800000;
    sm_len=32'd16; sm_ctx_in=0;
    // one-cycle handshake: in IDLE in_ready is high, the word is accepted at
    // the very next posedge (holding in_valid would relaunch the engine).
    @(negedge clk); if (!sm_ready) $fatal(1,"softmax not ready");
    sm_iv=1;
    @(negedge clk); sm_iv=0;
    fork
      begin : wait_sm
        while(!sm_ov) @(negedge clk);
      end
      begin : sm_watchdog
        repeat (3000) @(negedge clk);
        $fatal(1,"softmax timeout");
      end
    join_any
    disable sm_watchdog;
    for (int l=0;l<16;l++)
      if (sm_out[l]<32'h3d7ff000 || sm_out[l]>32'h3d801000)
        $fatal(1,"softmax lane %0d got %h", l, sm_out[l]);
    if (sm_lane_valid!==16'hFFFF) $fatal(1,"softmax lane_valid=%h", sm_lane_valid);
    repeat (3) @(negedge clk);
    if (sm_busy) $fatal(1,"softmax busy stuck");

    $display("PASS tb_logic_die_units_0830_02");
    $finish;
  end
endmodule
