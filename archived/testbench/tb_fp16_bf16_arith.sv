`timescale 1ns/1ps
module tb_fp16_bf16_arith;
  logic clk=0, rst_n=0, in_valid;
  logic [15:0] a,b;
  logic [15:0] f16_add_y,f16_mul_y,bf16_add_y,bf16_mul_y;
  logic f16_add_v,f16_mul_v,bf16_add_v,bf16_mul_v;
  always #5 clk=~clk;
  fp16_add  u_f16a(.clk,.rst_n,.in_valid,.a,.b,.y(f16_add_y),.out_valid(f16_add_v));
  fp16_mult u_f16m(.clk,.rst_n,.in_valid,.a,.b,.y(f16_mul_y),.out_valid(f16_mul_v));
  bf16_add  u_bfa(.clk,.rst_n,.in_valid,.a,.b,.y(bf16_add_y),.out_valid(bf16_add_v));
  bf16_mult u_bfm(.clk,.rst_n,.in_valid,.a,.b,.y(bf16_mul_y),.out_valid(bf16_mul_v));
  task automatic check(input [15:0] aa,input [15:0] bb,input [15:0] ea,input [15:0] em,input [15:0] eba,input [15:0] ebm);
    begin
      @(negedge clk); a=aa; b=bb; in_valid=1;
      @(negedge clk); in_valid=0;
      if (!f16_add_v || !f16_mul_v || !bf16_add_v || !bf16_mul_v) $fatal(1,"valid latency");
      if (f16_add_y!==ea || f16_mul_y!==em || bf16_add_y!==eba || bf16_mul_y!==ebm)
        $fatal(1,"a=%h b=%h f16 add/mul=%h/%h bf16 add/mul=%h/%h",aa,bb,f16_add_y,f16_mul_y,bf16_add_y,bf16_mul_y);
    end
  endtask
  initial begin
    a=0;b=0;in_valid=0; repeat(2) @(negedge clk); rst_n=1;
    check(16'h3c00,16'h3c00,16'h4000,16'h3c00,16'h3c80,16'h3880); // FP16 1+1,1*1; BF16 encodings 1.0
    check(16'h4000,16'h3c00,16'h4200,16'h4000,16'h4000,16'h3c80); // FP16 2+1,2*1; BF16 2+1,2*1
    check(16'h0000,16'h3c00,16'h3c00,16'h0000,16'h3c00,16'h0000);
    check(16'h7c00,16'h0000,16'h7c00,16'h7e00,16'h7c00,16'h0000);
    $display("PASS tb_fp16_bf16_arith"); $finish;
  end
endmodule
