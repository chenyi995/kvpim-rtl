`timescale 1ns/1ps
module tb_rotate_q_unit;
  logic clk=0,rst_n=0,in_valid; logic [255:0] x_word,cos_word,sin_word,y_word; logic out_valid;
  always #5 clk=~clk;
  rotate_q_unit dut(.*);
  initial begin x_word='0;cos_word='0;sin_word='0;in_valid=0;repeat(2)@(negedge clk);rst_n=1;
    for(integer i=0;i<8;i=i+1)begin x_word[(2*i)*16 +:16]=16'h3c00; x_word[(2*i+1)*16 +:16]=16'h0000;cos_word[(2*i)*16 +:16]=16'h3c00;cos_word[(2*i+1)*16 +:16]=16'h3c00;end
    @(negedge clk);in_valid=1;@(negedge clk);in_valid=0;
    while(!out_valid) @(negedge clk);
    for(integer j=0;j<8;j=j+1)if(y_word[(2*j)*16 +:16]!==16'h3c00||y_word[(2*j+1)*16 +:16]!==16'h0000)$fatal(1,"rotate lane %0d got %h/%h",j,y_word[(2*j)*16 +:16],y_word[(2*j+1)*16 +:16]);
    $display("PASS tb_rotate_q_unit");$finish;
  end
endmodule
