`timescale 1ns/1ps
module tb_dbuf_sram;
 logic clk=0,rst_n=0,wr_en,rd_en,swap;logic[3:0]wr_addr,rd_addr;logic[255:0]wr_data,rd_data;always #5 clk=~clk;dbuf_16x256 dut(.*);
 initial begin wr_en=0;rd_en=0;swap=0;wr_addr=0;rd_addr=0;wr_data=0;repeat(2)@(negedge clk);rst_n=1;@(negedge clk);wr_en=1;wr_data=256'hdead_beef;wr_addr=3;@(negedge clk);wr_en=0;swap=1;@(negedge clk);swap=0;rd_en=1;rd_addr=3;@(negedge clk);rd_en=0;@(negedge clk);if(rd_data!==256'hdead_beef)$fatal(1,"sram dbuf got %h",rd_data);$display("PASS tb_dbuf_sram");$finish;end
endmodule
