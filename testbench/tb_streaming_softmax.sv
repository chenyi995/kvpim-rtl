`timescale 1ns/1ps
module tb_streaming_softmax;
  localparam int LANES=16, TOKENS=2048, WORDS=TOKENS/LANES;
  logic clk=0,rst_n=0,in_valid,in_ready,out_valid,busy;
  logic [0:0] in_context,out_context;
  logic [31:0] seq_len;
  logic [LANES-1:0][31:0] in_data,out_data;
  logic [LANES-1:0] out_lane_valid;
  logic [$clog2(WORDS)-1:0] out_word_idx;
  int received, cycles;
  always #5 clk=~clk;
  always @(posedge clk) if(rst_n) cycles++;
  streaming_softmax_unit #(.LANES(LANES),.MAX_TOKENS(TOKENS),.CONTEXTS(1)) dut(.*);
  initial begin
    #100000;
    $fatal(1,"streaming softmax timeout");
  end
  initial begin
    in_valid=0;in_context=0;seq_len=TOKENS;in_data='0;received=0;cycles=0;
    repeat(2) @(negedge clk); rst_n=1;
    for(int w=0;w<WORDS;w++) begin
      @(negedge clk); while(!in_ready) @(negedge clk); in_valid=1;
    end
    @(negedge clk); in_valid=0;
    while(received<TOKENS) begin
      @(negedge clk);
      if(out_valid) begin
        if(out_word_idx !== received/LANES) $fatal(1,"word order");
        for(int l=0;l<LANES;l++) begin
          if(!out_lane_valid[l]) $fatal(1,"invalid lane");
          // 128 all-zero tiles must be normalized across the full sequence.
          if(out_data[l] < 32'h39ff0000 || out_data[l] > 32'h3a010000)
            $fatal(1,"p[%0d]=%h, expected approximately 1/2048",received+l,out_data[l]);
        end
        received+=LANES;
      end
    end
    @(negedge clk); if(busy) $fatal(1,"still busy");
    $display("PASS tb_streaming_softmax (%0d tokens, %0d cycles)",TOKENS,cycles); $finish;
  end
endmodule
