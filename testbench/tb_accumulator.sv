`timescale 1ns/1ps
module tb_accumulator;
  logic clk=0,rst_n=0,in_valid,clr; logic [3:0][15:0] parts; logic [15:0] acc; logic out_valid;
  always #5 clk=~clk;
  accumulator #(.N(4)) dut(.*);
  task automatic send(input bit c,input [15:0] p); integer n; begin
    @(negedge clk);parts[0]=p;parts[1]=p;parts[2]=p;parts[3]=p;clr=c;in_valid=1;
    @(negedge clk);in_valid=0;clr=0;n=0;while(!out_valid&&n<8)begin @(negedge clk);n=n+1;end
    if(!out_valid)$fatal(1,"accumulator timeout");end endtask
  initial begin parts='0;in_valid=0;clr=0;repeat(2)@(negedge clk);rst_n=1;
    send(1,16'h3c00); if(acc!==16'h4400)$fatal(1,"clear reduction got %h",acc);
    send(0,16'h3c00); if(acc!==16'h4800)$fatal(1,"running sum got %h",acc);
    $display("PASS tb_accumulator");$finish;
  end
endmodule
