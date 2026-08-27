`timescale 1ns/1ps
module tb_mq_score_store;
 logic clk=0,rst_n=0,mwr_valid,dwr_valid;logic[0:0]mwr_agent,dwr_agent,rd_agent;logic[6:0]mwr_idx,dwr_idx,rd_idx;logic[3:0]mwr_drop,dwr_lanes;logic[3:0][31:0]mwr_data,dwr_data,rd_data;always #5 clk=~clk;mq_score_store #(.AGENTS(2),.LANES(4),.NWORDS(2))dut(.*);
 initial begin mwr_valid=0;dwr_valid=0;mwr_agent=1;mwr_idx=0;mwr_drop=4'b0100;dwr_agent=1;dwr_idx=0;dwr_lanes=4'b1100;rd_agent=1;rd_idx=0;mwr_data[0]=10;mwr_data[1]=11;mwr_data[2]=12;mwr_data[3]=13;dwr_data[0]=100;dwr_data[1]=101;dwr_data[2]=102;dwr_data[3]=103;repeat(2)@(negedge clk);rst_n=1;
  @(negedge clk);mwr_valid=1;dwr_valid=1;@(negedge clk);mwr_valid=0;dwr_valid=0;#1;
  if(rd_data[0]!==10||rd_data[1]!==11||rd_data[2]!==102||rd_data[3]!==103)$fatal(1,"store %h %h %h %h",rd_data[0],rd_data[1],rd_data[2],rd_data[3]);
  $display("PASS tb_mq_score_store");$finish;end
endmodule
