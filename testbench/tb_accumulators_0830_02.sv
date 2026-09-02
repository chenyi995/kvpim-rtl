`timescale 1ns/1ps
// tb for the 0830-02 accumulators: BG-level 4->1 (bypass/sum) + buffer,
// logic-die-level 16-lane x 4-beat (bypass/sum).
module tb_accumulators_0830_02;
  logic clk=0, rst_n=0;
  always #5 clk=~clk;

  function automatic [15:0] fp16(input integer v);
    integer e;
    begin
      if (v==0) fp16=16'h0;
      else begin
        e=0; while ((v>>e)>=2) e=e+1;
        fp16 = {1'b0, 5'(e+15), 10'((v - (1<<e)) * (1<<(10-e)))};
      end
    end
  endfunction

  // ---- BG accumulator ----
  logic bg_iv, bg_byp;
  logic [3:0][15:0] bg_parts;
  logic [15:0] bg_out;
  logic bg_ov;
  accumulator_bg u_bg (.clk, .rst_n, .in_valid(bg_iv), .mode_bypass(bg_byp),
                       .parts(bg_parts), .out(bg_out), .out_valid(bg_ov));

  // ---- BG accumulator buffers (ASAP7 macro): AttAcc 8-deep, Fugue 64-deep ----
  logic ab_we, ab_re;
  logic [2:0] ab_wa, ab_ra;
  logic [15:0] ab_wd, ab_rd;
  accum_buffer_bg_attacc u_ab (.clk, .rst_n, .wr_en(ab_we), .wr_addr(ab_wa), .wr_data(ab_wd),
                               .rd_en(ab_re), .rd_addr(ab_ra), .rd_data(ab_rd));
  logic fb_we, fb_re;
  logic [5:0] fb_wa, fb_ra;
  logic [15:0] fb_wd, fb_rd;
  accum_buffer_bg_fugue u_fb (.clk, .rst_n, .wr_en(fb_we), .wr_addr(fb_wa), .wr_data(fb_wd),
                              .rd_en(fb_re), .rd_addr(fb_ra), .rd_data(fb_rd));

  // ---- logic-die accumulator ----
  logic lg_iv, lg_byp;
  logic [15:0][15:0] lg_in, lg_out;
  logic lg_ov;
  accumulator_logic u_lg (.clk, .rst_n, .in_valid(lg_iv), .mode_bypass(lg_byp),
                          .in_word(lg_in), .out_word(lg_out), .out_valid(lg_ov));

  logic [15:0] bg_got[$];
  logic [15:0][15:0] lg_got[$];
  logic [15:0][15:0] lg_chk;
  always @(posedge clk) begin
    if (bg_ov) bg_got.push_back(bg_out);
    if (lg_ov) lg_got.push_back(lg_out);
  end

  initial begin
    bg_iv=0; bg_byp=0; bg_parts='0;
    ab_we=0; ab_re=0; ab_wa='0; ab_ra='0; ab_wd='0;
    fb_we=0; fb_re=0; fb_wa='0; fb_ra='0; fb_wd='0;
    lg_iv=0; lg_byp=0; lg_in='0;
    repeat(3) @(negedge clk); rst_n=1; repeat(2) @(negedge clk);

    // BG sum: 1+2+3+4 = 10
    bg_parts[0]=fp16(1); bg_parts[1]=fp16(2); bg_parts[2]=fp16(3); bg_parts[3]=fp16(4);
    bg_byp=0; bg_iv=1; @(negedge clk); bg_iv=0;
    repeat(4) @(negedge clk);
    if (bg_got.size()!==1 || bg_got[0]!==fp16(10))
      $fatal(1,"bg sum: got %0d results, [0]=%h", bg_got.size(), bg_got[0]);

    // BG bypass: 5,6,7,8 stream out in order
    bg_parts[0]=fp16(5); bg_parts[1]=fp16(6); bg_parts[2]=fp16(7); bg_parts[3]=fp16(8);
    bg_byp=1; bg_iv=1; @(negedge clk); bg_iv=0;
    repeat(6) @(negedge clk);
    if (bg_got.size()!==5) $fatal(1,"bg bypass: %0d results", bg_got.size());
    for (int i=0;i<4;i++)
      if (bg_got[1+i]!==fp16(5+i)) $fatal(1,"bg bypass[%0d]=%h", i, bg_got[1+i]);

    // AttAcc buffer (8-deep macro): write 8, read back
    for (int i=0;i<8;i++) begin
      @(negedge clk); ab_we=1; ab_wa=3'(i); ab_wd=fp16(i+1);
    end
    @(negedge clk); ab_we=0;
    for (int i=0;i<8;i++) begin
      @(negedge clk); ab_re=1; ab_ra=3'(i);
      @(negedge clk); ab_re=0;
      if (ab_rd!==fp16(i+1)) $fatal(1,"accum buffer[%0d]=%h", i, ab_rd);
    end

    // Fugue buffer (64-deep, 8 resident queries x 8 slots): stride walk
    for (int i=0;i<64;i+=7) begin
      @(negedge clk); fb_we=1; fb_wa=6'(i); fb_wd=fp16(i+2);
    end
    @(negedge clk); fb_we=0;
    for (int i=0;i<64;i+=7) begin
      @(negedge clk); fb_re=1; fb_ra=6'(i);
      @(negedge clk); fb_re=0;
      if (fb_rd!==fp16(i+2)) $fatal(1,"fugue accum buffer[%0d]=%h", i, fb_rd);
    end

    // logic sum: 4 back-to-back words, word k lanes = k+1 -> each lane 10
    lg_byp=0;
    for (int k=0;k<4;k++) begin
      @(negedge clk); lg_iv=1;
      for (int l=0;l<16;l++) lg_in[l]=fp16(k+1);
    end
    @(negedge clk); lg_iv=0;
    repeat(4) @(negedge clk);
    if (lg_got.size()!==1) $fatal(1,"logic sum: %0d results", lg_got.size());
    lg_chk = lg_got[0];
    for (int l=0;l<16;l++)
      if (lg_chk[l]!==fp16(10)) $fatal(1,"logic sum lane %0d=%h", l, lg_chk[l]);

    // second group immediately (counter restarts): word k lanes = 2k+2 -> 20
    for (int k=0;k<4;k++) begin
      @(negedge clk); lg_iv=1;
      for (int l=0;l<16;l++) lg_in[l]=fp16(2*(k+1));
    end
    @(negedge clk); lg_iv=0;
    repeat(4) @(negedge clk);
    if (lg_got.size()!==2) $fatal(1,"logic sum2: %0d results", lg_got.size());
    lg_chk = lg_got[1];
    for (int l=0;l<16;l++)
      if (lg_chk[l]!==fp16(20)) $fatal(1,"logic sum2 lane %0d=%h", l, lg_chk[l]);

    // logic bypass: word passes straight through
    lg_byp=1;
    @(negedge clk); lg_iv=1;
    for (int l=0;l<16;l++) lg_in[l]=fp16(l+1);
    @(negedge clk); lg_iv=0;
    repeat(3) @(negedge clk);
    if (lg_got.size()!==3) $fatal(1,"logic bypass: %0d results", lg_got.size());
    lg_chk = lg_got[2];
    for (int l=0;l<16;l++)
      if (lg_chk[l]!==fp16(l+1)) $fatal(1,"logic bypass lane %0d=%h", l, lg_chk[l]);

    $display("PASS tb_accumulators_0830_02");
    $finish;
  end
endmodule
