// 512-bit (16xFP32) macro-backed softmax SRAM.
// AttAcc: 256x512b = 16KiB/SRAM (6x256x80 + 1x256x32).
// Fugue: 2048x512b = 128KiB/SRAM, two 1024x512b depth banks.
module softmax_buffer_sram #(
 parameter integer NUM_CONTEXTS=4, SEQ_LEN=2048, LANES=16,
 parameter integer WORDS=(SEQ_LEN+LANES-1)/LANES,
 parameter integer CONTEXT_W=(NUM_CONTEXTS<=1)?1:$clog2(NUM_CONTEXTS),
 parameter integer WORD_W=(WORDS<=1)?1:$clog2(WORDS)
) (
 input logic clk,rst_n,
 input logic score_wr_en, input logic [CONTEXT_W-1:0] score_wr_context,
 input logic [WORD_W-1:0] score_wr_word, input logic [LANES-1:0][31:0] score_wr_data,
 input logic score_rd_en, input logic [CONTEXT_W-1:0] score_rd_context,
 input logic [WORD_W-1:0] score_rd_word, output logic [LANES-1:0][31:0] score_rd_data, output logic score_rd_valid,
 input logic exp_wr_en, input logic [CONTEXT_W-1:0] exp_wr_context,
 input logic [WORD_W-1:0] exp_wr_word, input logic [LANES-1:0][31:0] exp_wr_data,
 input logic exp_rd_en, input logic [CONTEXT_W-1:0] exp_rd_context,
 input logic [WORD_W-1:0] exp_rd_word, output logic [LANES-1:0][31:0] exp_rd_data, output logic exp_rd_valid
);
 localparam integer TW=NUM_CONTEXTS*WORDS, DEPTH=(TW<=256)?256:1024;
 localparam integer NB=(TW+DEPTH-1)/DEPTH, AW=(TW<=1)?1:$clog2(TW), BW=(NB<=1)?1:$clog2(NB);
 logic [511:0] sw,ew,sr,er; logic [AW-1:0] swa,sra,ewa,era;
 logic [BW-1:0] swb,srb,ewb,erb; logic [9:0] swr,srr,ewr,err; logic sread,eread;
 logic [79:0] sq80[0:NB-1][0:5],eq80[0:NB-1][0:5]; logic [31:0] sq32[0:NB-1],eq32[0:NB-1];
 initial if(LANES!=16 || TW>2048) $error("softmax SRAM requires <=2048x512b");
 always_comb begin
   sw=score_wr_data; ew=exp_wr_data; swa=score_wr_context*WORDS+score_wr_word; sra=score_rd_context*WORDS+score_rd_word; ewa=exp_wr_context*WORDS+exp_wr_word; era=exp_rd_context*WORDS+exp_rd_word;
   swb=swa/DEPTH;srb=sra/DEPTH;ewb=ewa/DEPTH;erb=era/DEPTH;swr=swa%DEPTH;srr=sra%DEPTH;ewr=ewa%DEPTH;err=era%DEPTH;sread=!score_wr_en&&score_rd_en;eread=!exp_wr_en&&exp_rd_en;sr='0;er='0;
   for(int b=0;b<NB;b++) begin if(srb==b) begin for(int s=0;s<6;s++)sr[s*80+:80]=sq80[b][s];sr[511:480]=sq32[b];end if(erb==b) begin for(int s=0;s<6;s++)er[s*80+:80]=eq80[b][s];er[511:480]=eq32[b];end end
   score_rd_data=sr;exp_rd_data=er;
 end
 always_ff @(posedge clk or negedge rst_n) if(!rst_n) begin score_rd_valid<=0;exp_rd_valid<=0;end else begin score_rd_valid<=sread;exp_rd_valid<=eread;end
 generate for(genvar b=0;b<NB;b++) begin:g_b for(genvar s=0;s<6;s++) begin:g_s
   if(DEPTH==256) begin
    srambank_64x4x80_6t122 us(.clk,.ADDRESS(score_wr_en?swr[7:0]:srr[7:0]),.wd(sw[s*80+:80]),.banksel((score_wr_en||sread)&&((score_wr_en?swb:srb)==b)),.read(sread),.write(score_wr_en),.dataout(sq80[b][s]));
    srambank_64x4x80_6t122 ue(.clk,.ADDRESS(exp_wr_en?ewr[7:0]:err[7:0]),.wd(ew[s*80+:80]),.banksel((exp_wr_en||eread)&&((exp_wr_en?ewb:erb)==b)),.read(eread),.write(exp_wr_en),.dataout(eq80[b][s]));
   end else begin
    srambank_256x4x80_6t122 us(.clk,.ADDRESS(score_wr_en?swr:srr),.wd(sw[s*80+:80]),.banksel((score_wr_en||sread)&&((score_wr_en?swb:srb)==b)),.read(sread),.write(score_wr_en),.dataout(sq80[b][s]));
    srambank_256x4x80_6t122 ue(.clk,.ADDRESS(exp_wr_en?ewr:err),.wd(ew[s*80+:80]),.banksel((exp_wr_en||eread)&&((exp_wr_en?ewb:erb)==b)),.read(eread),.write(exp_wr_en),.dataout(eq80[b][s]));
   end end
   if(DEPTH==256) begin
    srambank_64x4x32_6t122 us(.clk,.ADDRESS(score_wr_en?swr[7:0]:srr[7:0]),.wd(sw[511:480]),.banksel((score_wr_en||sread)&&((score_wr_en?swb:srb)==b)),.read(sread),.write(score_wr_en),.dataout(sq32[b]));
    srambank_64x4x32_6t122 ue(.clk,.ADDRESS(exp_wr_en?ewr[7:0]:err[7:0]),.wd(ew[511:480]),.banksel((exp_wr_en||eread)&&((exp_wr_en?ewb:erb)==b)),.read(eread),.write(exp_wr_en),.dataout(eq32[b]));
   end else begin
    srambank_256x4x32_6t122 us(.clk,.ADDRESS(score_wr_en?swr:srr),.wd(sw[511:480]),.banksel((score_wr_en||sread)&&((score_wr_en?swb:srb)==b)),.read(sread),.write(score_wr_en),.dataout(sq32[b]));
    srambank_256x4x32_6t122 ue(.clk,.ADDRESS(exp_wr_en?ewr:err),.wd(ew[511:480]),.banksel((exp_wr_en||eread)&&((exp_wr_en?ewb:erb)==b)),.read(eread),.write(exp_wr_en),.dataout(eq32[b]));
   end
 end endgenerate
endmodule
