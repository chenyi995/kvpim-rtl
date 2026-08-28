`timescale 1ns/1ps
// Control-only paths of attacc_controller: config write, PIM_SET_META, ROTATE,
// PIM_ATTACH (plan port handshake).  The plan port is driven by the TB.
module tb_attacc_controller;
 import fugue_pkg::*; import kv_tlb_pkg::*;
 logic clk=0,rst_n=0,instr_valid,instr_ready,idle;logic[INSTR_W-1:0]instr_word;
 logic plan_cmd_valid,plan_cmd_ready,plan_cmd_done,plan_cmd_fault,run_valid,run_ready,addr_fault;
 logic[1:0]plan_cmd_op,plan_cmd_pools;logic[CTX_W-1:0]plan_cmd_ctx;logic[LAYER_W-1:0]plan_cmd_layer;
 logic[POS_W-1:0]plan_cmd_pos_lo,plan_cmd_pos_hi;logic[KV_ADDR_W-1:0]run_key_base;logic[CNT_W-1:0]run_count;
 dram_cmd_e dram_cmd;logic[3:0]dram_bank;logic[15:0]dram_row;logic[5:0]dram_col;
 logic gemv_start,gemv_accum_en,gemv_accum_clr,rotate_start,sfm_start,acc_clr,meta_wr_en;
 logic[3:0]gemv_row_addr,gemv_vec_addr;opmode_e op_mode;logic[15:0]rotate_pos;
 logic[31:0]cfg_nhead,cfg_dhead,cfg_seqlen,cfg_kvbase;logic[SM_WIDX_W-1:0]meta_wr_idx;logic[SM_LANES-1:0]meta_wr_mask;
 always #5 clk=~clk;
 attacc_controller #(.QDEPTH(2)) dut(.*);
 task automatic issue(input [INSTR_W-1:0] w);begin @(negedge clk);instr_word=w;instr_valid=1;@(negedge clk);instr_valid=0;end endtask
 initial begin instr_valid=0;instr_word=0;plan_cmd_ready=1;plan_cmd_done=0;plan_cmd_fault=0;run_valid=0;run_key_base=0;run_count=0;
   repeat(2)@(negedge clk);rst_n=1;
   issue({PIM_SET_CONFIG,2'b0,4'h0,32'h00001234,16'd0,16'd0}); repeat(3)@(negedge clk);if(cfg_nhead!==32'h1234)$fatal(1,"cfg write %h",cfg_nhead);
   issue({PIM_SET_CONFIG,2'b0,CFG_KVBASE,32'h00000100,16'd0,16'd0}); repeat(3)@(negedge clk);if(cfg_kvbase!==32'h100)$fatal(1,"kvbase %h",cfg_kvbase);
   issue({PIM_SET_META,2'b0,4'h0,32'h0000a55a,16'd0,16'd3}); repeat(2)@(negedge clk);if(!meta_wr_en||meta_wr_idx!==3||meta_wr_mask!==16'ha55a)$fatal(1,"meta write en=%b idx=%h mask=%h",meta_wr_en,meta_wr_idx,meta_wr_mask);
   @(negedge clk); if(meta_wr_en)$fatal(1,"meta pulse width");
   issue({PIM_ROTATE,2'b0,4'h0,32'd0,16'd0,16'h0021});repeat(2)@(negedge clk);if(!rotate_start||rotate_pos!==16'h21)$fatal(1,"rotate pulse");
   // ATTACH: expect OP_ATTACH on the plan port, then completion on cmd_done
   issue({PIM_SET_CONFIG,2'b0,CFG_KVCTX,32'h00000305,16'd0,16'd0}); repeat(2)@(negedge clk);
   issue({PIM_ATTACH,2'b0,4'h0,32'd0,16'd0,16'd0});
   while(!plan_cmd_valid)@(negedge clk);
   if(plan_cmd_op!==OP_ATTACH||plan_cmd_ctx!==8'd5||plan_cmd_layer!==7'd3)$fatal(1,"attach op=%0d ctx=%0d layer=%0d",plan_cmd_op,plan_cmd_ctx,plan_cmd_layer);
   @(negedge clk);if(plan_cmd_valid)$fatal(1,"attach cmd not accepted");
   repeat(3)@(negedge clk);plan_cmd_done=1;plan_cmd_fault=1;@(negedge clk);plan_cmd_done=0;plan_cmd_fault=0;
   repeat(2)@(negedge clk);if(!idle||!addr_fault)$fatal(1,"attach completion idle=%b fault=%b",idle,addr_fault);
   // flush variant: imm[0]=1 -> OP_FLUSH
   issue({PIM_ATTACH,2'b0,4'h0,32'd0,16'd0,16'd1});
   while(!plan_cmd_valid)@(negedge clk);if(plan_cmd_op!==OP_FLUSH)$fatal(1,"flush op");
   @(negedge clk);plan_cmd_done=1;@(negedge clk);plan_cmd_done=0;repeat(2)@(negedge clk);if(!idle||addr_fault)$fatal(1,"flush completion");
   $display("PASS tb_attacc_controller");$finish;
 end
endmodule
