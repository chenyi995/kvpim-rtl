`timescale 1ns/1ps
module tb_mac_tree16;
  logic clk=0,rst_n=0,in_valid; logic [255:0] a_word,b_word; logic [15:0] y; logic out_valid;
  always #5 clk=~clk;
  mac_tree16 dut(.*);
  task automatic run(input [15:0] expected); integer n; begin
    @(negedge clk);in_valid=1;@(negedge clk);in_valid=0;n=0;while(!out_valid&&n<10)begin @(negedge clk);n=n+1;end
    if(!out_valid||y!==expected)$fatal(1,"dot got %h expected %h",y,expected);end endtask
  initial begin a_word='0;b_word='0;in_valid=0;repeat(2)@(negedge clk);rst_n=1;
    a_word[15:0]=16'h3c00;b_word[15:0]=16'h3c00;run(16'h3c00);
    a_word='0;b_word='0; for(integer i=0;i<16;i=i+1)begin a_word[i*16 +:16]=16'h3c00;b_word[i*16 +:16]=16'h3c00;end run(16'h4c00);
    $display("PASS tb_mac_tree16");$finish;
  end
endmodule
