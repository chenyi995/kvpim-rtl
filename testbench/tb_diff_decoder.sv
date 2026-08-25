`timescale 1ns/1ps
module tb_diff_decoder;
  logic clk=0,rst_n=0,meta_wr_en,fwd_valid,rev_valid; logic [2:0] meta_wr_idx,fwd_word_idx,rev_word_idx; logic [3:0] meta_wr_mask;
  logic [3:0][31:0] master_score,diff_stream,corrected_score,prob,to_master,to_diff; logic [3:0] corrected_mask; logic corrected_valid,rev_valid_o;
  always #5 clk=~clk;
  diff_decoder #(.LANES(4),.NWORDS(2)) dut(.*);
  initial begin
    meta_wr_en=0;fwd_valid=0;rev_valid=0;meta_wr_idx=0;fwd_word_idx=0;rev_word_idx=0;meta_wr_mask=0; master_score[0]=10;master_score[1]=11;master_score[2]=12;master_score[3]=13;diff_stream[0]=100;diff_stream[1]=101;diff_stream[2]=102;diff_stream[3]=103;prob[0]=20;prob[1]=21;prob[2]=22;prob[3]=23;
    repeat(2)@(negedge clk);rst_n=1;
    @(negedge clk);meta_wr_en=1;meta_wr_idx=0;meta_wr_mask=4'b0101;
    @(negedge clk);meta_wr_en=0;fwd_valid=1;rev_valid=1;
    #1;
    if(!corrected_valid || !rev_valid_o || corrected_mask!==4'b0101)$fatal(1,"valid/mask");
    if(corrected_score[0]!==100 || corrected_score[1]!==11 || corrected_score[2]!==101 || corrected_score[3]!==13)$fatal(1,"forward scatter");
    if(to_diff[0]!==20 || to_master[1]!==21 || to_diff[2]!==22 || to_master[3]!==23 || to_master[0]!==0 || to_diff[1]!==0)$fatal(1,"reverse split");
    $display("PASS tb_diff_decoder");$finish;
  end
endmodule
