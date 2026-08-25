`timescale 1ns/1ps
module tb_mq_bank_pe;
 logic clk=0,rst_n=0,vec_wr_en,vec_swap,col_wr_en,col_is_second,ctx_word_sel,start,op_is_score,stage_swap,drain_en,drain_sel_ctx,drain_word,busy;logic[1:0]vec_wr_addr,slot_base;logic[255:0]vec_wr_data,col_data,drain_data;logic[1:0]n_active;logic[3:0]token_lane;logic drain_slot;
 always #5 clk=~clk;
 mq_bank_pe #(.N_Q(2),.N_C(1),.VEC_DEPTH(4),.MPIPE(2),.APIPE(2))dut(.*);
 task automatic wait_pipe;begin repeat(16)@(negedge clk);end endtask
 initial begin vec_wr_en=0;vec_swap=0;col_wr_en=0;col_is_second=0;ctx_word_sel=0;start=0;n_active=1;op_is_score=1;slot_base=0;token_lane=0;stage_swap=0;drain_en=0;drain_sel_ctx=0;drain_slot=0;drain_word=0;vec_wr_addr=0;vec_wr_data='0;col_data='0;repeat(2)@(negedge clk);rst_n=1;
  for(integer i=0;i<16;i=i+1)begin vec_wr_data[i*16 +:16]=16'h3c00;col_data[i*16 +:16]=16'h3c00;end
  @(negedge clk);vec_wr_en=1;@(negedge clk);vec_wr_en=0;vec_swap=1;@(negedge clk);vec_swap=0;
  @(negedge clk);col_wr_en=1;col_is_second=0;@(negedge clk);col_wr_en=0;start=1;@(negedge clk);start=0;wait_pipe;
  @(negedge clk);col_wr_en=1;col_is_second=1;@(negedge clk);col_wr_en=0;start=1;@(negedge clk);start=0;wait_pipe;
  @(negedge clk);stage_swap=1;@(negedge clk);stage_swap=0;drain_en=1;@(negedge clk);drain_en=0;
  if(drain_data[15:0]!==16'h5000)$fatal(1,"MQ score result %h",drain_data[15:0]);
  $display("PASS tb_mq_bank_pe");$finish;end
endmodule
