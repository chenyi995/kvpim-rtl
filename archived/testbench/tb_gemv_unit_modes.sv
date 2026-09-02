`timescale 1ns/1ps
module tb_gemv_unit_modes;
  logic clk=0,rst_n=0,mat_wr_en,mat_swap,vec_wr_en,vec_swap,start,op_is_score,accum_clr,accum_en,result_valid,context_result_valid;
  logic [3:0] mat_wr_addr,vec_wr_addr,row_addr,vec_addr;
  logic [255:0] mat_wr_data,vec_wr_data,context_result;
  logic [15:0] result;
  always #5 clk=~clk;
  gemv_unit dut(.*);
  task automatic idle; begin mat_wr_en=0;vec_wr_en=0;mat_swap=0;vec_swap=0;start=0;op_is_score=1;accum_clr=0;accum_en=0;mat_wr_addr=0;vec_wr_addr=0;row_addr=0;vec_addr=0;mat_wr_data='0;vec_wr_data='0; end endtask
  task automatic write_and_swap; begin
    @(negedge clk);mat_wr_en=1;vec_wr_en=1;mat_wr_addr=0;vec_wr_addr=0;
    @(negedge clk);mat_wr_en=0;vec_wr_en=0;
    @(negedge clk);mat_swap=1;vec_swap=1;
    @(negedge clk);mat_swap=0;vec_swap=0;
  end endtask
  task automatic launch(input logic score,input logic clear); begin
    @(negedge clk);start=1;op_is_score=score;accum_en=1;accum_clr=clear;
    @(negedge clk);start=0;accum_en=0;accum_clr=0;
  end endtask
  initial begin
    idle();repeat(2)@(negedge clk);rst_n=1;
    // Score mode: 16 x (1*1) reduces to scalar 16.
    for(int i=0;i<16;i++) begin mat_wr_data[i*16 +:16]=16'h3c00;vec_wr_data[i*16 +:16]=16'h3c00; end
    write_and_swap(); launch(1,1); while(!result_valid)@(negedge clk);
    if(result!==16'h4c00)$fatal(1,"score result=%h",result);

    // Context mode: 16 lanes remain distinct and accumulate across two starts.
    for(int i=0;i<16;i++) begin mat_wr_data[i*16 +:16]=16'h4000;vec_wr_data[i*16 +:16]=16'h3c00; end // 2*1
    // Fill the currently empty bank and exchange roles.
    write_and_swap(); launch(0,1); while(!context_result_valid)@(negedge clk);
    for(int i=0;i<16;i++) if(context_result[i*16 +:16]!==16'h4000)$fatal(1,"context first lane %0d",i);
    launch(0,0); while(!context_result_valid)@(negedge clk);
    for(int i=0;i<16;i++) if(context_result[i*16 +:16]!==16'h4400)$fatal(1,"context accumulated lane %0d got %h",i,context_result[i*16 +:16]);
    $display("PASS tb_gemv_unit_modes");$finish;
  end
endmodule
