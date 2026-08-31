`timescale 1ns/1ps
// tb for the 0830-02 gemv_unit: shared-adder dual mode, double-buffered
// vector buffer, streaming matrix beats, internal pass control.
module tb_gemv_unit_0830_02;
  logic clk=0, rst_n=0;
  logic vec_wr_en, vec_swap, mat_valid, pass_start, op_is_score, acc_clr;
  logic [3:0] vec_wr_addr;
  logic [255:0] vec_wr_data, mat_data, ctx_out;
  logic [8:0] num_beats;
  logic [15:0] score_out;
  logic score_valid, ctx_valid, busy;
  always #5 clk=~clk;

  gemv_unit dut(.*);

  // exact FP16 encode for small non-negative integers (< 2048)
  function automatic [15:0] fp16(input integer v);
    integer e, m;
    begin
      if (v==0) fp16=16'h0;
      else begin
        e=0; m=v;
        while (m>=2) begin m=m/2; e=e+1; end          // e = floor(log2 v)
        fp16 = {1'b0, 5'(e+15), 10'((v - (1<<e)) * (1<<(10-e)) / 1)};
      end
    end
  endfunction

  int n_score; logic [15:0] scores[$];
  int n_ctx;   logic [255:0] ctxs[$];
  always @(posedge clk) begin
    if (score_valid) begin scores.push_back(score_out); n_score++; end
    if (ctx_valid)   begin ctxs.push_back(ctx_out);     n_ctx++;   end
  end

  task automatic idle;
    begin
      vec_wr_en=0; vec_swap=0; mat_valid=0; pass_start=0;
      op_is_score=1; acc_clr=1; vec_wr_addr='0; vec_wr_data='0;
      mat_data='0; num_beats='0;
    end
  endtask

  task automatic vec_write(input [3:0] a, input [255:0] d);
    begin @(negedge clk); vec_wr_en=1; vec_wr_addr=a; vec_wr_data=d;
          @(negedge clk); vec_wr_en=0; end
  endtask
  task automatic swap; begin @(negedge clk); vec_swap=1; @(negedge clk); vec_swap=0; end endtask
  task automatic start_pass(input logic score, input [8:0] nb, input logic clr);
    begin @(negedge clk); pass_start=1; op_is_score=score; num_beats=nb; acc_clr=clr;
          @(negedge clk); pass_start=0; end
  endtask

  logic [255:0] w;
  initial begin
    idle(); repeat(3) @(negedge clk); rst_n=1; repeat(2) @(negedge clk);

    // ---------- score mode: dhead=128 (8 beats), Q=1.0, K lane l = l+1 ----------
    for (int l=0;l<16;l++) w[l*16 +: 16]=fp16(1);
    for (int a=0;a<8;a++) vec_write(4'(a), w);
    swap();
    start_pass(1, 9'd8, 1);
    for (int b=0;b<8;b++) begin
      @(negedge clk); mat_valid=1;
      for (int l=0;l<16;l++) mat_data[l*16 +: 16]=fp16(l+1);
    end
    @(negedge clk); mat_valid=0;
    repeat (12) @(negedge clk);
    if (n_score!==1)                 $fatal(1,"score pass1: n_score=%0d", n_score);
    if (scores[0]!==fp16(1088))      $fatal(1,"score pass1: got %h want %h", scores[0], fp16(1088));

    // ---------- back-to-back score passes: K=1.0 then K=2.0, Q=1.0 ----------
    start_pass(1, 9'd8, 1);
    for (int b=0;b<8;b++) begin
      @(negedge clk); mat_valid=1;
      for (int l=0;l<16;l++) mat_data[l*16 +: 16]=fp16(1);
    end
    @(negedge clk); mat_valid=0; pass_start=1; op_is_score=1; num_beats=9'd8; acc_clr=1;
    @(negedge clk); pass_start=0;
    for (int b=0;b<8;b++) begin
      mat_valid=1;
      for (int l=0;l<16;l++) mat_data[l*16 +: 16]=fp16(2);
      @(negedge clk);
    end
    mat_valid=0;
    repeat (14) @(negedge clk);
    if (n_score!==3)                 $fatal(1,"b2b: n_score=%0d", n_score);
    if (scores[1]!==fp16(128))       $fatal(1,"b2b pass1: got %h want %h", scores[1], fp16(128));
    if (scores[2]!==fp16(256))       $fatal(1,"b2b pass2: got %h want %h", scores[2], fp16(256));

    // ---------- context mode: 4 tokens, S=[1,2,1,2], V[t][l]=l+1 ----------
    // ctx[l] = (1+2+1+2)*(l+1) = 6*(l+1); tests the broadcast-lane select.
    w='0;
    w[0*16 +: 16]=fp16(1); w[1*16 +: 16]=fp16(2);
    w[2*16 +: 16]=fp16(1); w[3*16 +: 16]=fp16(2);
    vec_write(4'd0, w);
    swap();
    start_pass(0, 9'd4, 1);
    for (int b=0;b<4;b++) begin
      @(negedge clk); mat_valid=1;
      for (int l=0;l<16;l++) mat_data[l*16 +: 16]=fp16(l+1);
    end
    @(negedge clk); mat_valid=0;
    repeat (8) @(negedge clk);
    if (n_ctx!==1) $fatal(1,"ctx: n_ctx=%0d", n_ctx);
    w = ctxs[0];
    for (int l=0;l<16;l++)
      if (w[l*16 +: 16]!==fp16(6*(l+1)))
        $fatal(1,"ctx lane %0d: got %h want %h", l, w[l*16 +: 16], fp16(6*(l+1)));

    // ---------- chained context pass (acc_clr=0) doubles the result ----------
    start_pass(0, 9'd4, 0);
    for (int b=0;b<4;b++) begin
      @(negedge clk); mat_valid=1;
      for (int l=0;l<16;l++) mat_data[l*16 +: 16]=fp16(l+1);
    end
    @(negedge clk); mat_valid=0;
    repeat (8) @(negedge clk);
    if (n_ctx!==2) $fatal(1,"ctx chain: n_ctx=%0d", n_ctx);
    w = ctxs[1];
    for (int l=0;l<16;l++)
      if (w[l*16 +: 16]!==fp16(12*(l+1)))
        $fatal(1,"ctx chain lane %0d: got %h want %h", l, w[l*16 +: 16], fp16(12*(l+1)));

    $display("PASS tb_gemv_unit_0830_02");
    $finish;
  end
endmodule
