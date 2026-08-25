`timescale 1ns/1ps
module tb_gemv_unit;
 logic clk=0,rst_n=0,mat_wr_en,mat_swap,vec_wr_en,vec_swap,start,op_is_score,accum_clr,accum_en,result_valid,context_result_valid; logic [3:0] mat_wr_addr,vec_wr_addr,row_addr,vec_addr; logic [255:0] mat_wr_data,vec_wr_data,context_result; logic [15:0] result;
 always #5 clk=~clk;
 gemv_unit dut(.*);
 task automatic write_mat; begin @(negedge clk);mat_wr_en=1;mat_wr_addr=0;@(negedge clk);mat_wr_en=0;@(negedge clk);mat_swap=1;@(negedge clk);mat_swap=0;end endtask
 task automatic write_vec; begin @(negedge clk);vec_wr_en=1;vec_wr_addr=0;@(negedge clk);vec_wr_en=0;@(negedge clk);vec_swap=1;@(negedge clk);vec_swap=0;end endtask
 initial begin mat_wr_en=0;vec_wr_en=0;mat_swap=0;vec_swap=0;start=0;op_is_score=1;accum_clr=0;accum_en=0;mat_wr_addr=0;vec_wr_addr=0;row_addr=0;vec_addr=0;mat_wr_data='0;vec_wr_data='0;repeat(2)@(negedge clk);rst_n=1;
  for(integer i=0;i<16;i=i+1)begin mat_wr_data[i*16 +:16]=16'h3c00;vec_wr_data[i*16 +:16]=16'h3c00;end
  write_mat;write_vec;
  @(negedge clk);start=1;accum_clr=1;accum_en=1;@(negedge clk);start=0;accum_clr=0;accum_en=0;while(!result_valid)@(negedge clk);
  if(result!==16'h4c00)$fatal(1,"gemv result=%h",result);
  $display("PASS tb_gemv_unit");$finish;
 end
endmodule
