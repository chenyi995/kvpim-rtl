`timescale 1ns/1ps
module tb_softmax_unit;
  logic clk=0,rst_n=0,start; logic [15:0][31:0] in_data,out_data; logic out_valid,busy;
  always #5 clk=~clk;
  softmax_unit #(.LANES(16)) dut(.*);
  initial begin in_data='0;start=0;repeat(2)@(negedge clk);rst_n=1;
    @(negedge clk);start=1;@(negedge clk);start=0;
    while(!out_valid)@(negedge clk);
    for(integer i=0;i<16;i=i+1) if(out_data[i]<32'h3d7ff000 || out_data[i]>32'h3d801000)$fatal(1,"softmax lane %0d got %h",i,out_data[i]);
    @(negedge clk); if(busy)$fatal(1,"softmax remains busy after completion");
    $display("PASS tb_softmax_unit");$finish;
  end
endmodule
