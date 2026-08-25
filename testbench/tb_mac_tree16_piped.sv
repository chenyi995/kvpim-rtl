`timescale 1ns/1ps
module tb_mac_tree16_piped;
  logic clk=0,rst_n=0,in_valid; logic [255:0] a_word,b_word; logic [15:0] y; logic out_valid;
  always #5 clk=~clk;
  mac_tree16_piped #(.MPIPE(2),.APIPE(2)) dut(.*);
  initial begin a_word='0;b_word='0;in_valid=0;repeat(2)@(negedge clk);rst_n=1;
    for(integer i=0;i<16;i=i+1)begin a_word[i*16 +:16]=16'h3c00;b_word[i*16 +:16]=16'h3c00;end
    @(negedge clk);in_valid=1;@(negedge clk);in_valid=0;
    repeat(9) @(negedge clk);
    if(!out_valid||y!==16'h4c00)$fatal(1,"piped dot got %h valid=%b",y,out_valid);
    $display("PASS tb_mac_tree16_piped");$finish;
  end
endmodule
