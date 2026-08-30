// Single 16-entry x 256-bit GEMV operand buffer (512 B).
//
// The former implementation modelled two ping-pong copies.  AttAcc's
// 512-B GEMV-buffer budget is now represented literally: one resident buffer
// per operand.  The scheduler must therefore keep writes and compute reads
// disjoint; `swap` remains only as a compatibility input for existing tops.
module dbuf_16x256 #(
    parameter integer DEPTH = 16,
    parameter integer WIDTH = 256
) (
    input  logic                       clk,
    input  logic                       rst_n,

    // Producer side.
    input  logic                       wr_en,
    input  logic [$clog2(DEPTH)-1:0]   wr_addr,
    input  logic [WIDTH-1:0]           wr_data,

    // Consumer side.
    input  logic                       rd_en,
    input  logic [$clog2(DEPTH)-1:0]   rd_addr,
    output logic [WIDTH-1:0]           rd_data,

    // Legacy compatibility input; ignored by the single-buffer implementation.
    input  logic                       swap
);
    logic [WIDTH-1:0] mem [DEPTH];

    always_ff @(posedge clk) begin
        if (wr_en) mem[wr_addr] <= wr_data;
    end

    logic [WIDTH-1:0] rd_data_r;
    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) rd_data_r <= '0;
        else if (rd_en) rd_data_r <= mem[rd_addr];
    end
    assign rd_data = rd_data_r;

    logic _unused_swap;
    assign _unused_swap = swap;
endmodule
