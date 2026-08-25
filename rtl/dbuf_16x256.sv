// Double-buffered storage: two banks, each holding 16 entries of 256 bits.
// Producer fills one bank while consumer drains the other. The "swap" pulse
// flips the role of the two banks. Implemented in flops (≈8 kbit total) so
// no SRAM macros are required for synthesis area exploration.
module dbuf_16x256 #(
    parameter integer DEPTH = 16,
    parameter integer WIDTH = 256
) (
    input  logic                       clk,
    input  logic                       rst_n,

    // Producer (write) side — always targets the "fill" bank.
    input  logic                       wr_en,
    input  logic [$clog2(DEPTH)-1:0]   wr_addr,
    input  logic [WIDTH-1:0]           wr_data,

    // Consumer (read) side — always reads from the "drain" bank.
    input  logic                       rd_en,
    input  logic [$clog2(DEPTH)-1:0]   rd_addr,
    output logic [WIDTH-1:0]           rd_data,

    // Pulse to swap fill/drain banks. Held by gemv control.
    input  logic                       swap
);
    logic [WIDTH-1:0] bank0 [DEPTH];
    logic [WIDTH-1:0] bank1 [DEPTH];
    logic             fill_sel;   // 0 -> bank0 is fill, bank1 is drain.

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n)      fill_sel <= 1'b0;
        else if (swap)   fill_sel <= ~fill_sel;
    end

    always_ff @(posedge clk) begin
        if (wr_en) begin
            if (fill_sel) bank1[wr_addr] <= wr_data;
            else          bank0[wr_addr] <= wr_data;
        end
    end

    logic [WIDTH-1:0] rd_data_r;
    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) rd_data_r <= '0;
        else if (rd_en) rd_data_r <= fill_sel ? bank0[rd_addr] : bank1[rd_addr];
    end
    assign rd_data = rd_data_r;
endmodule
