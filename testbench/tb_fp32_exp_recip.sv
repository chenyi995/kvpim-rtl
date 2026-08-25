`timescale 1ns/1ps
module tb_fp32_exp_recip;
  logic clk=0,rst_n=0,exp_in_valid,rec_in_valid; logic [31:0] x,a,exp_y,rec_y; logic exp_v,rec_v;
  always #5 clk=~clk;
  fp32_exp ue(.clk,.rst_n,.in_valid(exp_in_valid),.x,.y(exp_y),.out_valid(exp_v));
  fp32_recip ur(.clk,.rst_n,.in_valid(rec_in_valid),.a,.y(rec_y),.out_valid(rec_v));
  task automatic exp_check(input [31:0] xx,ee); integer n; begin
    @(negedge clk);x=xx;exp_in_valid=1;@(negedge clk);exp_in_valid=0;n=0;while(!exp_v&&n<8)begin @(negedge clk);n=n+1;end
    if(!exp_v||exp_y!==ee)$fatal(1,"exp x=%h got=%h",xx,exp_y);end endtask
  task automatic rec_check(input [31:0] aa,ee); integer n; begin
    @(negedge clk);a=aa;rec_in_valid=1;@(negedge clk);rec_in_valid=0;n=0;while(!rec_v&&n<8)begin @(negedge clk);n=n+1;end
    if(!rec_v || ((ee==32'h3f800000) ? ((rec_y < 32'h3f7ff800) || (rec_y > 32'h3f800800)) : (rec_y!==ee))) $fatal(1,"rec a=%h got=%h",aa,rec_y);end endtask
  initial begin x=0;a=0;exp_in_valid=0;rec_in_valid=0;repeat(2)@(negedge clk);rst_n=1;
    exp_check(32'h00000000,32'h3f800000); exp_check(32'h3f800000,32'h3f800000); exp_check(32'hff800000,32'h00000000); exp_check(32'h7f800000,32'h7f800000);
    rec_check(32'h00000000,32'h7f800000); rec_check(32'h7f800000,32'h00000000); rec_check(32'h3f800000,32'h3f800000);
    $display("PASS tb_fp32_exp_recip");$finish;
  end
endmodule
