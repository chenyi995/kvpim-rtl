`timescale 1ns/1ps
module tb_mq_bg_reduce;
  logic clk=0,rst_n=0,sc_in_valid; logic [1:0] sc_in_bank; logic sc_in_slot; logic [15:0] sc_in_partial,sc_out_sum; logic sc_out_valid,sc_out_slot;
  logic cx_in_valid,cx_in_slot,cx_in_word,cx_swap,cx_drain_en,cx_drain_slot,cx_drain_word,busy; logic [255:0] cx_in_data,cx_out_data;
  always #5 clk=~clk;
  mq_bg_reduce #(.N_Q(2),.N_C(1)) dut(.*);
  task automatic score(input [1:0] bank,input [15:0] value); begin @(negedge clk);sc_in_valid=1;sc_in_bank=bank;sc_in_slot=0;sc_in_partial=value;end endtask
  initial begin sc_in_valid=0;cx_in_valid=0;cx_swap=0;cx_drain_en=0;cx_in_slot=0;cx_in_word=0;cx_drain_slot=0;cx_drain_word=0;cx_in_data='0;repeat(2)@(negedge clk);rst_n=1;
    score(0,16'h3c00);score(1,16'h3c00);score(2,16'h3c00);score(3,16'h3c00);@(negedge clk);sc_in_valid=0;while(!sc_out_valid)@(negedge clk);if(sc_out_sum!==16'h4400||sc_out_slot!==0)$fatal(1,"score reduce=%h slot=%b",sc_out_sum,sc_out_slot);
    @(negedge clk);cx_in_valid=1;cx_in_data=256'hdead_beef;cx_in_word=0;@(negedge clk);cx_in_valid=0;cx_swap=1;@(negedge clk);cx_swap=0;cx_drain_en=1;@(negedge clk);cx_drain_en=0;if(cx_out_data!==256'hdead_beef)$fatal(1,"context bypass %h",cx_out_data);
    $display("PASS tb_mq_bg_reduce");$finish;
  end
endmodule
