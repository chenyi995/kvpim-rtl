`timescale 1ns/1ps
module tb_dbuf;
  logic clk=0,rst_n=0,wr_en,rd_en,swap; logic [1:0] wr_addr,rd_addr; logic [31:0] wr_data,rd_data;
  always #5 clk=~clk;
  dbuf_16x256 #(.DEPTH(4),.WIDTH(32)) dut(.*);
  task automatic write(input [1:0] a,input [31:0] d); begin @(negedge clk);wr_en=1;wr_addr=a;wr_data=d;@(negedge clk);wr_en=0;end endtask
  task automatic read_check(input [1:0] a,input [31:0] d); begin @(negedge clk);rd_en=1;rd_addr=a;@(negedge clk);rd_en=0;if(rd_data!==d)$fatal(1,"read %h expected %h",rd_data,d);end endtask
  initial begin wr_en=0;rd_en=0;swap=0;wr_addr=0;rd_addr=0;wr_data=0;repeat(2)@(negedge clk);rst_n=1;write(2,32'hdead_beef);@(negedge clk);swap=1;@(negedge clk);swap=0;read_check(2,32'hdead_beef);write(1,32'h1234_5678);@(negedge clk);swap=1;@(negedge clk);swap=0;read_check(1,32'h1234_5678);$display("PASS tb_dbuf");$finish;end
endmodule
