// 16 KiB, 256 x 512-bit, synchronous 1RW softmax SRAM.
// Eight characterized 256x64 ASAP7 macros form one logical buffer.  Buffered
// softmax uses separate score and exp buffers, so no individual buffer needs a
// simultaneous read/write port.
module softmax_sram_16kb (
    input logic clk,
    input logic en, input logic we,
    input logic [7:0] addr,
    input logic [511:0] wdata,
    output logic [511:0] rdata,
    output logic rvalid
);
    logic [7:0][63:0] q;
    always_ff @(posedge clk) rvalid <= en && !we;
    generate
      for (genvar i=0; i<8; i++) begin: g_slice
        srambank_256x4x64_6t122 u_mem (
          // srambank_256x4x64 is physically 1024x64 (four 256-word banks).
          // This logical 256-word buffer selects bank/address range zero.
          .clk(clk), .ADDRESS({2'b00, addr}), .wd(wdata[i*64 +: 64]),
          .banksel(en), .read(en && !we), .write(en && we), .dataout(q[i])
        );
        assign rdata[i*64 +: 64] = q[i];
      end
    endgenerate
endmodule
