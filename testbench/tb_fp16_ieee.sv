`timescale 1ns/1ps
// Vector-driven check of fp16_mult / fp16_add against numpy IEEE-754 golden
// results (testbench/vectors/fp16_{mul,add}.hex from gen_fp16_vectors.py).
// Any NaN matches an expected NaN; everything else must match bit-exactly.
module tb_fp16_ieee;
  logic clk = 0, rst_n = 0;
  always #5 clk = ~clk;

  logic [15:0] a, b, y_mul, y_add;
  logic iv, ov_mul, ov_add;
  fp16_mult u_mul (.clk, .rst_n, .in_valid(iv), .a, .b, .y(y_mul), .out_valid(ov_mul));
  fp16_add  u_add (.clk, .rst_n, .in_valid(iv), .a, .b, .y(y_add), .out_valid(ov_add));

  function automatic bit is_nan(input [15:0] v);
    is_nan = (v[14:10] == 5'd31) && (v[9:0] != 10'd0);
  endfunction

  task automatic run(input string fname, input bit is_add);
    int fd, n, err, code;
    logic [15:0] va, vb, vy, got;
    fd = $fopen(fname, "r");
    if (fd == 0) $fatal(1, "cannot open %s", fname);
    n = 0; err = 0;
    while (!$feof(fd)) begin
      code = $fscanf(fd, "%h %h %h\n", va, vb, vy);
      if (code != 3) break;
      @(negedge clk); a = va; b = vb; iv = 1;
      @(negedge clk); iv = 0;
      got = is_add ? y_add : y_mul;
      if (!(is_add ? ov_add : ov_mul)) $fatal(1, "%s: out_valid missing", fname);
      if (!((got === vy) || (is_nan(vy) && is_nan(got)))) begin
        err++;
        if (err <= 10) $display("MISMATCH %s: a=%h b=%h exp=%h got=%h", fname, va, vb, vy, got);
      end
      n++;
    end
    $fclose(fd);
    $display("%s: %0d vectors, %0d mismatches", fname, n, err);
    if (err != 0) $fatal(1, "FAIL %s", fname);
  endtask

  initial begin
    a = 0; b = 0; iv = 0;
    repeat (3) @(negedge clk); rst_n = 1; repeat (2) @(negedge clk);
    run("testbench/vectors/fp16_mul.hex", 0);
    run("testbench/vectors/fp16_add.hex", 1);
    $display("PASS tb_fp16_ieee");
    $finish;
  end
endmodule
