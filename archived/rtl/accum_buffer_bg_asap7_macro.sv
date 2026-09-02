// accum_buffer_bg.sv — the bank-group accumulator buffer, ASAP7 SRAM macro.
//
// Capacity (Fugue paper §4.3.1–4.3.2): the multi-query command lets every
// scanned K column serve all resident queries, so the buffer scales with the
// bank's resident-query capacity n_cap = S_gemvbuf/64 B = 8:
//   AttAcc : 1 query in flight  -> DEPTH = 8   FP16 (8-token score staging)
//   Fugue  : n_cap = 8 queries  -> DEPTH = 8*8 = 64 FP16 (same per-query
//            staging depth, one set per resident query), 8x enlargement.
// The context side streams (probabilities over TSV, partials bypassed), so
// the score side sets the size.
//
// One srambank_64x4x16_6t122 (256 x 16 b) holds either configuration; the
// single macro port serves one command per cycle (write priority — the
// scheduler must not read and write the same cycle).  Read data is
// registered inside the macro (1-cycle), like the flop version it replaces.
module accum_buffer_bg #(
    parameter integer DEPTH = 8
) (
    input  logic                     clk,
    input  logic                     rst_n,
    input  logic                     wr_en,
    input  logic [$clog2(DEPTH)-1:0] wr_addr,
    input  logic [15:0]              wr_data,
    input  logic                     rd_en,
    input  logic [$clog2(DEPTH)-1:0] rd_addr,
    output logic [15:0]              rd_data
);
    localparam integer AW = $clog2(DEPTH);

    wire [7:0] addr8 = {{(8-AW){1'b0}}, wr_en ? wr_addr : rd_addr};

    srambank_64x4x16_6t122 u_mem (
        .clk     (clk),
        .ADDRESS (addr8),
        .wd      (wr_data),
        .banksel (wr_en | rd_en),
        .read    (rd_en & ~wr_en),
        .write   (wr_en),
        .dataout (rd_data)
    );

    logic _unused;
    assign _unused = rst_n;
endmodule

// Synthesis tops for the two capacities (same macro, different used depth;
// the architectural difference is 16 B vs 128 B of staging).
module accum_buffer_bg_attacc (
    input  logic        clk,
    input  logic        rst_n,
    input  logic        wr_en,
    input  logic [2:0]  wr_addr,
    input  logic [15:0] wr_data,
    input  logic        rd_en,
    input  logic [2:0]  rd_addr,
    output logic [15:0] rd_data
);
    accum_buffer_bg #(.DEPTH(8)) u_buf (.*);
endmodule

module accum_buffer_bg_fugue (
    input  logic        clk,
    input  logic        rst_n,
    input  logic        wr_en,
    input  logic [5:0]  wr_addr,
    input  logic [15:0] wr_data,
    input  logic        rd_en,
    input  logic [5:0]  rd_addr,
    output logic [15:0] rd_data
);
    accum_buffer_bg #(.DEPTH(64)) u_buf (.*);
endmodule
