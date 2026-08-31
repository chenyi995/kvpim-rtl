`timescale 1ns/1ps
// tb for the 0830-02 dma_engine: 16-beat transfer through a latency-y
// memory model; destination must equal source.
module tb_dma_engine_0830_02;
  localparam int LEN = 16;
  logic clk=0, rst_n=0;
  always #5 clk=~clk;

  logic desc_valid, desc_ready, busy, done;
  logic [33:0] desc_src, desc_dst;
  logic [15:0] desc_len;
  logic rd_req_valid, rd_req_ready, rd_resp_valid;
  logic [33:0] rd_req_addr;
  logic [255:0] rd_resp_data;
  logic wr_req_valid, wr_req_ready;
  logic [33:0] wr_req_addr;
  logic [255:0] wr_req_data;

  dma_engine dut (.*);

  logic [255:0] src_mem [0:LEN-1];
  logic [255:0] dst_mem [0:LEN-1];

  // read side: randomized response latency, served in order
  logic [33:0] rd_q [$];
  logic [33:0] rd_pop;
  assign rd_req_ready = 1'b1;
  always @(posedge clk) begin
    rd_resp_valid <= 1'b0;
    if (rd_req_valid && rd_req_ready) rd_q.push_back(rd_req_addr);
    if (rd_q.size() > 0 && ($urandom_range(0,1) == 0)) begin
      rd_pop = rd_q.pop_front();
      rd_resp_valid <= 1'b1;
      rd_resp_data  <= src_mem[(rd_pop - 34'h1000) >> 5];
    end
  end

  // write side: randomly stall (clocked so the random draw settles per cycle)
  always @(negedge clk) wr_req_ready <= ($urandom_range(0,2) != 0);
  always @(posedge clk)
    if (wr_req_valid && wr_req_ready)
      dst_mem[(wr_req_addr - 34'h8000) >> 5] <= wr_req_data;

  initial begin
    desc_valid=0; desc_src='0; desc_dst='0; desc_len='0;
    for (int i=0;i<LEN;i++) begin
      src_mem[i] = {8{32'hA5000000 + i}};
      dst_mem[i] = '0;
    end
    repeat(3) @(negedge clk); rst_n=1; repeat(2) @(negedge clk);

    desc_valid=1; desc_src=34'h1000; desc_dst=34'h8000; desc_len=16'(LEN);
    @(negedge clk);
    while (!desc_ready) @(negedge clk);
    desc_valid=0;

    fork
      begin : wait_done
        while (!done) @(posedge clk);
      end
      begin : watchdog
        repeat (2000) @(posedge clk);
        $fatal(1, "dma timeout");
      end
    join_any
    disable watchdog;

    repeat (2) @(negedge clk);
    for (int i=0;i<LEN;i++)
      if (dst_mem[i] !== src_mem[i])
        $fatal(1, "dst[%0d]=%h != src=%h", i, dst_mem[i], src_mem[i]);
    if (busy) $fatal(1, "dma still busy after done");

    $display("PASS tb_dma_engine_0830_02");
    $finish;
  end
endmodule
