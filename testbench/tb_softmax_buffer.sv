`timescale 1ns/1ps
module tb_softmax_buffer;
  localparam int LANES=4, CTX=2, LEN=32, WORDS=8;
  logic clk=0,rst_n=0;
  logic score_wr_en,score_rd_en,exp_wr_en,exp_rd_en;
  logic [$clog2(CTX)-1:0] score_wr_context,score_rd_context,exp_wr_context,exp_rd_context;
  logic [$clog2(WORDS)-1:0] score_wr_word,score_rd_word,exp_wr_word,exp_rd_word;
  logic [LANES-1:0][31:0] score_wr_data,score_rd_data,exp_wr_data,exp_rd_data;
  logic score_rd_valid,exp_rd_valid;
  always #5 clk=~clk;
  softmax_buffer #(.NUM_CONTEXTS(CTX),.SEQ_LEN(LEN),.LANES(LANES)) dut(.*);

  task automatic idle; begin
    score_wr_en=0;score_rd_en=0;exp_wr_en=0;exp_rd_en=0;
    score_wr_context=0;score_rd_context=0;exp_wr_context=0;exp_rd_context=0;
    score_wr_word=0;score_rd_word=0;exp_wr_word=0;exp_rd_word=0;
    score_wr_data='0;exp_wr_data='0;
  end endtask
  task automatic write_score(input int c,input int w,input logic [31:0] base); begin
    @(negedge clk);score_wr_en=1;score_wr_context=c;score_wr_word=w;
    for(int l=0;l<LANES;l++) score_wr_data[l]=base+l;
    @(negedge clk);score_wr_en=0;
  end endtask
  task automatic read_score_check(input int c,input int w,input logic [31:0] base); begin
    @(negedge clk);score_rd_en=1;score_rd_context=c;score_rd_word=w;
    @(negedge clk);score_rd_en=0;
    if(!score_rd_valid) $fatal(1,"score read valid missing");
    for(int l=0;l<LANES;l++) if(score_rd_data[l]!==base+l) $fatal(1,"score c%0d w%0d lane%0d",c,w,l);
  end endtask
  task automatic write_exp(input int c,input int w,input logic [31:0] base); begin
    @(negedge clk);exp_wr_en=1;exp_wr_context=c;exp_wr_word=w;
    for(int l=0;l<LANES;l++) exp_wr_data[l]=base+l;
    @(negedge clk);exp_wr_en=0;
  end endtask
  task automatic read_exp_check(input int c,input int w,input logic [31:0] base); begin
    @(negedge clk);exp_rd_en=1;exp_rd_context=c;exp_rd_word=w;
    @(negedge clk);exp_rd_en=0;
    if(!exp_rd_valid) $fatal(1,"exp read valid missing");
    for(int l=0;l<LANES;l++) if(exp_rd_data[l]!==base+l) $fatal(1,"exp c%0d w%0d lane%0d",c,w,l);
  end endtask
  initial begin
    idle(); repeat(2)@(negedge clk);rst_n=1;
    write_score(0,3,32'h100); write_score(1,3,32'h200);
    read_score_check(0,3,32'h100); read_score_check(1,3,32'h200);
    write_exp(0,3,32'h300); write_exp(1,4,32'h400);
    read_exp_check(0,3,32'h300); read_exp_check(1,4,32'h400);
    $display("PASS tb_softmax_buffer");$finish;
  end
endmodule
