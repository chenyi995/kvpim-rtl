`timescale 1ns/1ps
module tb_attacc_controller;
 logic clk=0,rst_n=0,instr_valid,instr_ready,idle,tlb_resp_hit,tlb_resp_valid,tlb_busy;logic[73:0]instr_word;logic[19:0]tlb_resp_ppn,tlb_base_ppn;logic tlb_req_valid;logic[25:0]tlb_req_vpn;logic[2:0]dram_cmd;logic[3:0]dram_bank;logic[15:0]dram_row;logic[5:0]dram_col;logic gemv_start,gemv_accum_en,gemv_accum_clr,rotate_start,sfm_start,acc_clr,mac_done,meta_wr_en;logic[3:0]gemv_row_addr,gemv_vec_addr;logic[1:0]op_mode;logic[15:0]rotate_pos;logic[31:0]cfg_nhead,cfg_dhead,cfg_seqlen;logic[6:0]meta_wr_idx;logic[15:0]meta_wr_mask;
 always #5 clk=~clk;
 attacc_controller #(.QDEPTH(2)) dut(.*);
 task automatic issue(input [73:0] w);begin @(negedge clk);instr_word=w;instr_valid=1;@(negedge clk);instr_valid=0;end endtask
 initial begin instr_valid=0;instr_word=0;tlb_resp_hit=0;tlb_resp_valid=0;tlb_busy=0;tlb_resp_ppn=0;repeat(2)@(negedge clk);rst_n=1;
   issue({4'h1,2'b0,4'h0,32'h00001234,16'd0,16'd0}); repeat(3)@(negedge clk);if(cfg_nhead!==32'h1234)$fatal(1,"cfg write %h",cfg_nhead);
   issue({4'ha,2'b0,4'h0,32'h0000a55a,16'd0,16'd3}); repeat(2)@(negedge clk);if(!meta_wr_en||meta_wr_idx!==3||meta_wr_mask!==16'ha55a)$fatal(1,"meta write en=%b idx=%h mask=%h",meta_wr_en,meta_wr_idx,meta_wr_mask);
   @(negedge clk); if(meta_wr_en)$fatal(1,"meta pulse width");
   issue({4'h5,2'b0,4'h0,32'd0,16'd0,16'h0021});repeat(2)@(negedge clk);if(!rotate_start||rotate_pos!==16'h21)$fatal(1,"rotate pulse");
   $display("PASS tb_attacc_controller");$finish;
 end
endmodule
