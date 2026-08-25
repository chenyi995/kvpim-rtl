`timescale 1ns/1ps
module tb_sincos_bf16;
 logic clk=0,rst_n=0,in_valid; logic [15:0] phase,sin_bf16,cos_bf16; logic out_valid;
 always #5 clk=~clk;
 sincos_bf16 dut(.*);
 task automatic check(input [15:0] p,input [15:0] es,input [15:0] ec); integer n; begin
   @(negedge clk);phase=p;in_valid=1;@(negedge clk);in_valid=0;n=0;while(!out_valid&&n<8)begin @(negedge clk);n=n+1;end
   if(!out_valid || cos_bf16!==ec || ((p==16'h8000) ? (sin_bf16[14:7] > 8'd96) : (sin_bf16!==es))) $fatal(1,"phase=%h sin/cos=%h/%h",p,sin_bf16,cos_bf16); end endtask
 initial begin phase=0;in_valid=0;repeat(2)@(negedge clk);rst_n=1;check(16'h0000,16'h0000,16'h3f80);check(16'h8000,16'h0000,16'hbf80);$display("PASS tb_sincos_bf16");$finish;end
endmodule
