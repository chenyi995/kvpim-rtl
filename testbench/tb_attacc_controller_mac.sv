`timescale 1ns/1ps
module tb_attacc_controller_mac;
 logic clk=0,rst_n=0,instr_valid,instr_ready,idle,tlb_resp_hit,tlb_resp_valid,tlb_busy;logic[73:0]instr_word;logic[19:0]tlb_resp_ppn,tlb_base_ppn;logic tlb_req_valid;logic[25:0]tlb_req_vpn;logic[2:0]dram_cmd;logic[3:0]dram_bank;logic[15:0]dram_row;logic[5:0]dram_col;logic gemv_start,gemv_accum_en,gemv_accum_clr,rotate_start,sfm_start,acc_clr,meta_wr_en;logic[3:0]gemv_row_addr,gemv_vec_addr;logic[1:0]op_mode;logic[15:0]rotate_pos;logic[31:0]cfg_nhead,cfg_dhead,cfg_seqlen;logic[2:0]meta_wr_idx;logic[15:0]meta_wr_mask;
 always #5 clk=~clk;attacc_controller #(.QDEPTH(2)) dut(.*);
 initial begin instr_valid=0;instr_word=0;tlb_resp_hit=0;tlb_resp_valid=0;tlb_busy=0;tlb_resp_ppn=20'h31234;repeat(2)@(negedge clk);rst_n=1;
  @(negedge clk);instr_word={4'h3,2'b01,4'd0,32'h00000045,16'd1,16'd0};instr_valid=1;@(negedge clk);instr_valid=0;
  while(!tlb_req_valid)@(negedge clk); if(tlb_req_vpn!==26'h1)$fatal(1,"vpn %h",tlb_req_vpn);
  @(negedge clk);tlb_resp_valid=1;@(negedge clk);tlb_resp_valid=0;
  while(dram_cmd!==3'd1)@(negedge clk);if(dram_bank!==4'h3||dram_row!==16'h1234)$fatal(1,"ACT bank/row %h/%h",dram_bank,dram_row);
  @(negedge clk);if(dram_cmd!==3'd2||dram_col!==6'h05||!gemv_start||!gemv_accum_en||!gemv_accum_clr||op_mode!==2'b01)$fatal(1,"RD controls cmd=%h col=%h",dram_cmd,dram_col);
  $display("PASS tb_attacc_controller_mac");$finish;
 end
endmodule
