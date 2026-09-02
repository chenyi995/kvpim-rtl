`timescale 1ns/1ps
// PIM_MAC_AB through the address-plan port: one OP_PLAN, two runs, ACT only on
// a DRAM row change, COLS_PER_VEC (8) 32-B column reads per K/V row.
module tb_attacc_controller_mac;
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
 // ---- monitors ----
 integer n_act=0,n_rd=0,n_gemv=0,n_take=0; logic[5:0] first_col,last_col; logic[3:0] act_bank[0:3]; logic[15:0] act_row[0:3];
 logic first_rd_ok=0; logic run_taken=0;
 always @(posedge clk) begin
   if(dram_cmd==DR_ACT)begin if(n_act<4)begin act_bank[n_act]=dram_bank;act_row[n_act]=dram_row;end n_act++;end
   if(dram_cmd==DR_RD)begin if(n_rd==0)begin first_col=dram_col;first_rd_ok=gemv_start&&gemv_accum_en&&gemv_accum_clr&&(op_mode==OP_CONTEXT);end n_rd++;last_col=dram_col;end
   if(gemv_start)n_gemv++;
   if(run_valid&&run_ready)begin run_taken=1;n_take++;end
 end
 initial begin #400000; $fatal(1,"timeout"); end
 task automatic issue(input [INSTR_W-1:0] w);begin @(negedge clk);instr_word=w;instr_valid=1;@(negedge clk);instr_valid=0;end endtask
 // present one run and hold it until the controller takes it (posedge handshake)
 task automatic give_run(input [KV_ADDR_W-1:0] key,input [CNT_W-1:0] cnt);begin
   @(negedge clk);run_taken=0;run_key_base=key;run_count=cnt;run_valid=1;
   @(negedge clk); while(!run_taken)@(negedge clk); run_valid=0; end endtask
 initial begin instr_valid=0;instr_word=0;plan_cmd_ready=1;plan_cmd_done=0;plan_cmd_fault=0;run_valid=0;run_key_base=0;run_count=0;
   repeat(2)@(negedge clk);rst_n=1;
   issue({PIM_SET_CONFIG,2'b0,CFG_KVCTX,32'h00010305,16'd0,16'd0});   // pools=01 layer=3 ctx=5
   repeat(2)@(negedge clk);
   issue({PIM_MAC_AB,2'b01,4'd0,32'h00000045,16'd3,16'd0});            // positions [0x45, 0x48)
   while(!plan_cmd_valid)@(negedge clk);
   if(plan_cmd_op!==OP_PLAN||plan_cmd_ctx!==8'd5||plan_cmd_layer!==7'd3||plan_cmd_pools!==2'b01||plan_cmd_pos_lo!==16'h45||plan_cmd_pos_hi!==16'h48)
     $fatal(1,"plan cmd op=%0d ctx=%0d layer=%0d pools=%b lo=%h hi=%h",plan_cmd_op,plan_cmd_ctx,plan_cmd_layer,plan_cmd_pools,plan_cmd_pos_lo,plan_cmd_pos_hi);
   @(negedge clk); if(plan_cmd_valid)$fatal(1,"plan cmd not accepted");
   // run 1: key 0x0_1234_5600 -> bank 0xA row 0x2468 col 48; 2 rows = 16 columns inside one DRAM row
   give_run(34'h0_1234_5600,16'd2);
   // run 2 (key 0x0_1234_8000 -> bank 0 row 0x2469 col 0) is presented while run 1 is still being consumed (planner back-pressured)
   give_run(34'h0_1234_8000,16'd1);
   repeat(2)@(negedge clk);plan_cmd_done=1;@(negedge clk);plan_cmd_done=0;
   while(!idle)@(negedge clk);
   if(n_take!==2)$fatal(1,"runs taken %0d",n_take);
   if(n_act!==2)$fatal(1,"ACT count %0d (expected 2: one per DRAM row)",n_act);
   if(act_bank[0]!==4'hA||act_row[0]!==16'h2468)$fatal(1,"ACT0 bank/row %h/%h",act_bank[0],act_row[0]);
   if(act_bank[1]!==4'h0||act_row[1]!==16'h2469)$fatal(1,"ACT1 bank/row %h/%h",act_bank[1],act_row[1]);
   if(n_rd!==24||n_gemv!==24)$fatal(1,"RD/gemv count %0d/%0d (expected 24)",n_rd,n_gemv);
   if(first_col!==6'd48||!first_rd_ok)$fatal(1,"first RD col=%0d ok=%b",first_col,first_rd_ok);
   if(last_col!==6'd7)$fatal(1,"last col %0d",last_col);
   if(addr_fault)$fatal(1,"unexpected addr_fault");
   $display("PASS tb_attacc_controller_mac");$finish;
 end
endmodule
