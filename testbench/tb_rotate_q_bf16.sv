`timescale 1ns/1ps
module tb_rotate_q_bf16;
  logic clk=0,rst_n=0,in_valid; logic [7:0][15:0] x_even,x_odd,phase,y_even,y_odd; logic out_valid;
  always #5 clk=~clk;
  rotate_q_bf16 #(.PAIRS(8)) dut(.*);
  initial begin x_even='0;x_odd='0;phase='0;in_valid=0;repeat(2)@(negedge clk);rst_n=1;
    for(integer i=0;i<8;i=i+1) x_even[i]=16'h3f80;
    @(negedge clk);in_valid=1;@(negedge clk);in_valid=0; while(!out_valid)@(negedge clk);
    for(integer j=0;j<8;j=j+1)if(y_even[j]!==16'h3f80||y_odd[j]!==16'h0000)$fatal(1,"BF16 rotate lane %0d got %h/%h",j,y_even[j],y_odd[j]);
    $display("PASS tb_rotate_q_bf16");$finish;
  end
endmodule
