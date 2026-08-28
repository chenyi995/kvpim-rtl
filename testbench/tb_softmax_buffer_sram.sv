`timescale 1ns/1ps

// Exercises the physical 4-bank, 8-slice configuration used by Fugue.  The
// two score addresses intentionally land in different macro depth banks.
module tb_softmax_buffer_sram;
  localparam int LANES = 16;
  logic clk = 0, rst_n = 0;
  logic score_wr_en, score_rd_en, exp_wr_en, exp_rd_en;
  logic [4:0] score_wr_context, score_rd_context, exp_wr_context, exp_rd_context;
  logic [6:0] score_wr_word, score_rd_word, exp_wr_word, exp_rd_word;
  logic [LANES-1:0][31:0] score_wr_data, score_rd_data, exp_wr_data, exp_rd_data;
  logic score_rd_valid, exp_rd_valid;

  always #5 clk = ~clk;

  softmax_buffer_sram #(.NUM_CONTEXTS(32), .SEQ_LEN(2048), .LANES(LANES)) dut (.*);

  task automatic idle;
    begin
      score_wr_en = 0; score_rd_en = 0; exp_wr_en = 0; exp_rd_en = 0;
      score_wr_context = 0; score_rd_context = 0; exp_wr_context = 0; exp_rd_context = 0;
      score_wr_word = 0; score_rd_word = 0; exp_wr_word = 0; exp_rd_word = 0;
      score_wr_data = '0; exp_wr_data = '0;
    end
  endtask

  task automatic write_score(input int context, input int word, input logic [31:0] base);
    begin
      @(negedge clk);
      score_wr_en = 1; score_wr_context = context; score_wr_word = word;
      for (int lane = 0; lane < LANES; lane++) score_wr_data[lane] = base + lane;
      @(negedge clk); score_wr_en = 0;
    end
  endtask

  task automatic read_score_check(input int context, input int word, input logic [31:0] base);
    begin
      @(negedge clk);
      score_rd_en = 1; score_rd_context = context; score_rd_word = word;
      @(negedge clk); score_rd_en = 0;
      if (!score_rd_valid) $fatal(1, "score read valid missing");
      for (int lane = 0; lane < LANES; lane++)
        if (score_rd_data[lane] !== base + lane) $fatal(1, "score c%0d w%0d lane%0d", context, word, lane);
    end
  endtask

  task automatic write_exp(input int context, input int word, input logic [31:0] base);
    begin
      @(negedge clk);
      exp_wr_en = 1; exp_wr_context = context; exp_wr_word = word;
      for (int lane = 0; lane < LANES; lane++) exp_wr_data[lane] = base + lane;
      @(negedge clk); exp_wr_en = 0;
    end
  endtask

  task automatic read_exp_check(input int context, input int word, input logic [31:0] base);
    begin
      @(negedge clk);
      exp_rd_en = 1; exp_rd_context = context; exp_rd_word = word;
      @(negedge clk); exp_rd_en = 0;
      if (!exp_rd_valid) $fatal(1, "exp read valid missing");
      for (int lane = 0; lane < LANES; lane++)
        if (exp_rd_data[lane] !== base + lane) $fatal(1, "exp c%0d w%0d lane%0d", context, word, lane);
    end
  endtask

  initial begin
    idle(); repeat (2) @(negedge clk); rst_n = 1;
    write_score(0, 3,   32'h0100);
    write_score(31, 127, 32'h0200); // flat address 4095: depth bank 3
    read_score_check(0, 3, 32'h0100);
    read_score_check(31, 127, 32'h0200);
    write_exp(8, 0, 32'h0300);      // flat address 1024: depth bank 1
    read_exp_check(8, 0, 32'h0300);
    $display("PASS tb_softmax_buffer_sram");
    $finish;
  end
endmodule
