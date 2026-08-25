`timescale 1ns/1ps
module tb_mq_diff_decoder;
 logic clk=0,rst_n=0,meta_wr_en,fwd_valid,rev_valid; logic [0:0] meta_wr_agent,agent_sel; logic [2:0] meta_wr_idx,fwd_word_idx,rev_word_idx,wr_word_idx; logic [3:0] meta_wr_mask,master_wr_drop,causal_drop,corrected_mask; logic [15:0] q_pos,word_base_pos; logic [3:0][31:0] master_score,diff_stream,corrected_score,prob,to_master,to_diff; logic corrected_valid,rev_valid_o;
 always #5 clk=~clk;
 mq_diff_decoder #(.AGENTS(2),.LANES(4),.NWORDS(2)) dut(.*);
 initial begin meta_wr_en=0;fwd_valid=0;rev_valid=0;meta_wr_agent=1;agent_sel=1;meta_wr_idx=0;fwd_word_idx=0;rev_word_idx=0;wr_word_idx=0;meta_wr_mask=0;q_pos=11;word_base_pos=10;master_score[0]=10;master_score[1]=11;master_score[2]=12;master_score[3]=13;diff_stream[0]=100;diff_stream[1]=101;prob[0]=20;prob[1]=21;prob[2]=22;prob[3]=23;repeat(2)@(negedge clk);rst_n=1;
  @(negedge clk);meta_wr_en=1;meta_wr_mask=4'b0101;@(negedge clk);meta_wr_en=0;fwd_valid=1;rev_valid=1;#1;
  if(master_wr_drop!==4'b0101||causal_drop!==4'b1100)$fatal(1,"masks master=%b causal=%b",master_wr_drop,causal_drop);
  if(corrected_score[0]!==100||corrected_score[1]!==11||corrected_score[2]!==101||corrected_score[3]!==13)$fatal(1,"scatter");
  if(to_diff[0]!==20||to_master[1]!==21||to_diff[2]!==22||to_master[3]!==23)$fatal(1,"split");
  $display("PASS tb_mq_diff_decoder");$finish;
 end
endmodule
