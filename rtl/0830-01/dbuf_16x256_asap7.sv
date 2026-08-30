// ASAP7 macro implementation of one 16 x 256-bit GEMV operand buffer (512 B).
// It deliberately has no ping-pong replica.  Sixteen 256 x 16 SRAM macros
// make the 256-bit word; addresses 0..15 are used.  The macro has one port,
// so the controller must not issue a read and a write in the same cycle.
// `swap` is retained as an ignored compatibility input.
module dbuf_16x256 #(
    parameter integer DEPTH = 16,
    parameter integer WIDTH = 256
) (
    input logic clk, input logic rst_n,
    input logic wr_en, input logic [$clog2(DEPTH)-1:0] wr_addr,
    input logic [WIDTH-1:0] wr_data,
    input logic rd_en, input logic [$clog2(DEPTH)-1:0] rd_addr,
    output logic [WIDTH-1:0] rd_data,
    input logic swap
);
    logic [15:0] q [0:15];
    logic [WIDTH-1:0] rd_data_r;
    always_comb begin
        rd_data_r = '0;
        for (int s = 0; s < 16; s++) rd_data_r[s*16 +: 16] = q[s];
    end
    // The SRAM model registers dataout on a read clock edge, matching the
    // registered read behavior of the portable implementation.
    assign rd_data = rd_data_r;
    generate
        for (genvar s = 0; s < 16; s++) begin : g_slice
            srambank_64x4x16_6t122 u_mem (
                .clk(clk),
                .ADDRESS(wr_en ? {{(8-$clog2(DEPTH)){1'b0}}, wr_addr}
                               : {{(8-$clog2(DEPTH)){1'b0}}, rd_addr}),
                .wd(wr_data[s*16 +: 16]),
                .banksel(wr_en | rd_en),
                .read(rd_en && !wr_en),
                .write(wr_en),
                .dataout(q[s])
            );
        end
    endgenerate

    logic _unused_swap;
    assign _unused_swap = swap;
endmodule
