`timescale 1ns/1ps
module tb_tlb;
  logic clk=0,rst_n=0,req_valid; logic [25:0] req_vpn; logic [19:0] base_ppn,resp_ppn; logic resp_hit,resp_valid,busy;
  always #5 clk=~clk;
  tlb #(.ENTRIES(2),.MISS_LAT(3)) dut(.*);
  task automatic request(input [25:0] vpn,input expected_hit,input [19:0] expected_ppn);
    integer n; begin
      @(negedge clk);req_vpn=vpn;req_valid=1;@(negedge clk);req_valid=0;
      n=0;while(!resp_valid && n<10) begin @(negedge clk);n=n+1;end
      if(!resp_valid || resp_hit!==expected_hit || resp_ppn!==expected_ppn)$fatal(1,"TLB vpn=%h got valid/hit/ppn=%b/%b/%h",vpn,resp_valid,resp_hit,resp_ppn);
    end
  endtask
  initial begin req_valid=0;req_vpn=0;base_ppn=20'h120;repeat(2)@(negedge clk);rst_n=1;
    request(26'h5,0,20'h125); request(26'h5,1,20'h125); request(26'h9,0,20'h129); request(26'h5,1,20'h125); request(26'hc,0,20'h12c); request(26'h5,0,20'h125);
    $display("PASS tb_tlb");$finish;
  end
endmodule
