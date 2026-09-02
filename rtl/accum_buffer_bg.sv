// accum_buffer_bg.sv — the bank-group accumulator buffer.
//
// Capacity (Fugue paper §4.3.1–4.3.2): the multi-query command lets every
// scanned K column serve all resident queries, so the buffer scales with the
// bank's resident-query capacity n_cap = S_gemvbuf/64 B = 8:
//   AttAcc : 1 query in flight  -> DEPTH = 8   FP16 (8-token score staging, 16 B)
//   Fugue  : n_cap = 8 queries  -> DEPTH = 8*8 = 64 FP16 (same per-query
//            staging depth, one set per resident query, 128 B), 8x enlargement.
// The context side streams (probabilities over TSV, partials bypassed), so
// the score side sets the size.
//
// Implementation — each configuration takes its own area-optimal choice
// (ruling chenyi9 2026-09-02, Genus/ASAP7 TT 0.7 V, same script):
//   16 B : flop array 62.0 um^2  vs  smallest macro 250.5 um^2  -> FLOP
//   128 B: flop array 448.3 um^2 vs  smallest macro 250.7 um^2  -> MACRO
// (flop ~0.42 um^2/bit; the smallest ASAP7 macro srambank_64x4x16 is a fixed
// 512 B / 249 um^2; crossover ~36 FP16 entries.)  Both implementations
// present the same port contract: one command per cycle, write priority
// (a read issued in the same cycle as a write is dropped), read data
// registered (1-cycle) and held until the next read.

// ---- flop-array implementation ------------------------------------------
module accum_buffer_bg_flop #(
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
    logic [15:0] mem [DEPTH];

    always_ff @(posedge clk) begin
        if (wr_en) mem[wr_addr] <= wr_data;
    end

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n)                rd_data <= '0;
        else if (rd_en && !wr_en)  rd_data <= mem[rd_addr];
    end
endmodule

// ---- ASAP7 SRAM-macro implementation --------------------------------------
// One srambank_64x4x16_6t122 (256 x 16 b).  Single macro port, write
// priority; read data is registered inside the macro (1-cycle).  Note the
// macro is latch-type (data out in the low clock phase): when this buffer is
// integrated in front of arithmetic, add an exit register as in
// dbuf_16x256_asap7.sv.
module accum_buffer_bg_macro #(
    parameter integer DEPTH = 64
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

// ---- synthesis tops: each capacity with its optimal implementation --------
module accum_buffer_bg_attacc (      // 8 x FP16 = 16 B, flop array
    input  logic        clk,
    input  logic        rst_n,
    input  logic        wr_en,
    input  logic [2:0]  wr_addr,
    input  logic [15:0] wr_data,
    input  logic        rd_en,
    input  logic [2:0]  rd_addr,
    output logic [15:0] rd_data
);
    accum_buffer_bg_flop #(.DEPTH(8)) u_buf (.*);
endmodule

module accum_buffer_bg_fugue (       // 64 x FP16 = 128 B, SRAM macro
    input  logic        clk,
    input  logic        rst_n,
    input  logic        wr_en,
    input  logic [5:0]  wr_addr,
    input  logic [15:0] wr_data,
    input  logic        rd_en,
    input  logic [5:0]  rd_addr,
    output logic [15:0] rd_data
);
    accum_buffer_bg_macro #(.DEPTH(64)) u_buf (.*);
endmodule
