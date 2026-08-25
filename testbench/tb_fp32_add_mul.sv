`timescale 1ns/1ps
module tb_fp32_add_mul;
  logic clk=0,rst_n=0,in_valid; logic [31:0] a,b,add_y,mul_y; logic add_v,mul_v;
  always #5 clk=~clk;
  fp32_add ua(.clk,.rst_n,.in_valid,.a,.b,.y(add_y),.out_valid(add_v));
  fp32_mul um(.clk,.rst_n,.in_valid,.a,.b,.y(mul_y),.out_valid(mul_v));
  task automatic check(input [31:0] aa,bb,ea,em); begin
    @(negedge clk);a=aa;b=bb;in_valid=1;@(negedge clk);in_valid=0;
    if(!add_v||!mul_v||add_y!==ea||mul_y!==em)$fatal(1,"a=%h b=%h add=%h mul=%h",aa,bb,add_y,mul_y);
  end endtask
  initial begin a=0;b=0;in_valid=0;repeat(2)@(negedge clk);rst_n=1;
    check(32'h3f800000,32'h3f800000,32'h40000000,32'h3f800000);
    check(32'h40000000,32'h3f800000,32'h40400000,32'h40000000);
    check(32'h40400000,32'hc0000000,32'h3f800000,32'hc0c00000);
    check(32'h7f800000,32'h00000000,32'h7f800000,32'h7fc00000);
    check(32'h00000000,32'h00000000,32'h00000000,32'h00000000);
    $display("PASS tb_fp32_add_mul");$finish;
  end
endmodule
