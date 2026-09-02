// dbuf_16x256_asap7.sv — ASAP7 SRAM-macro implementation of the
// double-buffered GEMV operand buffer (drop-in for the flop-based
// dbuf_16x256.sv: same module name and ports; the filelist/DC profile
// selects which file is compiled).
//
// Two macro groups, one per double-buffer copy, so the FILL side only ever
// writes its group while the COMPUTE side only ever reads the other — no
// same-cycle conflict on the single macro port.  Each group builds the
// 256-bit word from sixteen srambank_64x4x16_6t122 macros (256 x 16 b, one
// 16-b lane each); addresses 0..DEPTH-1 are used.  `swap` exchanges the
// fill/compute roles.  Reads are registered inside the macro (1-cycle),
// matching the flop implementation.
module dbuf_16x256 #(
    parameter integer DEPTH = 16,
    parameter integer WIDTH = 256
) (
    input  logic                       clk,
    input  logic                       rst_n,
    input  logic                       wr_en,
    input  logic [$clog2(DEPTH)-1:0]   wr_addr,
    input  logic [WIDTH-1:0]           wr_data,
    input  logic                       rd_en,
    input  logic [$clog2(DEPTH)-1:0]   rd_addr,
    output logic [WIDTH-1:0]           rd_data,
    input  logic                       swap
);
    localparam integer AW = $clog2(DEPTH);

    logic sel;   // 0: copy0 = compute, copy1 = fill;  1: the reverse
    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n)    sel <= 1'b0;
        else if (swap) sel <= ~sel;
    end

    logic [WIDTH-1:0] q [2];

    genvar h, s;
    generate
        for (h = 0; h < 2; h++) begin : g_copy
            // copy h is the FILL side when sel == (h == 0), i.e. copy1 fills
            // while sel==0 and copy0 fills while sel==1 (mirrors the flop
            // implementation's write/read select).
            wire is_fill = (h == 1) ? ~sel : sel;
            wire [7:0] addr8 = {{(8-AW){1'b0}}, is_fill ? wr_addr : rd_addr};
            wire bs = is_fill ? wr_en : rd_en;
            for (s = 0; s < 16; s++) begin : g_slice
                srambank_64x4x16_6t122 u_mem (
                    .clk     (clk),
                    .ADDRESS (addr8),
                    .wd      (wr_data[s*16 +: 16]),
                    .banksel (bs),
                    .read    (~is_fill & rd_en),
                    .write   (is_fill & wr_en),
                    .dataout (q[h][s*16 +: 16])
                );
            end
        end
    endgenerate

    // SRAM-exit pipeline register (standard practice; ruling 2026-08-31):
    // the latch-based srambank drives dataout in the clock LOW phase, so an
    // unregistered exit leaves only half a period for the downstream
    // datapath (-430 ps at 666 MHz).  Registering here restores a full-cycle
    // budget; the read latency becomes 2 cycles and gemv_unit's alignment
    // pipes carry the extra stage.
    logic [WIDTH-1:0] rd_q;
    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) rd_q <= '0;
        else        rd_q <= sel ? q[1] : q[0];
    end
    assign rd_data = rd_q;
endmodule
