// dbuf_16x256.sv — double-buffered GEMV operand buffer, per the AttAcc paper:
// "double-buffered 16 256-bit buffers that can store the input vectors"
// (ASPLOS'24 §5.1).  Two physical 16-entry x 256-bit copies (512 B each,
// 1 KiB total).  One copy is the FILL side (written by PIM_WR_GB /
// PIM_MV_SB) while the other is the COMPUTE side (read by the GEMV
// datapath); `swap` exchanges the roles, so a new vector can be loaded
// while the current one is being consumed.
//
// Each 256-bit entry holds 16 FP16 values (one 16-element d_head chunk of
// Q, or 16 attention scores).  Reads are registered (1-cycle), matching
// an SRAM-macro drop-in.
module dbuf_16x256 #(
    parameter integer DEPTH = 16,
    parameter integer WIDTH = 256
) (
    input  logic                       clk,
    input  logic                       rst_n,

    // Fill side: always writes the copy NOT selected for compute.
    input  logic                       wr_en,
    input  logic [$clog2(DEPTH)-1:0]   wr_addr,
    input  logic [WIDTH-1:0]           wr_data,

    // Compute side: always reads the selected copy.
    input  logic                       rd_en,
    input  logic [$clog2(DEPTH)-1:0]   rd_addr,
    output logic [WIDTH-1:0]           rd_data,

    // Exchange fill/compute roles (double buffering).
    input  logic                       swap
);
    logic sel;   // 0: copy0 = compute, copy1 = fill;  1: the reverse
    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n)    sel <= 1'b0;
        else if (swap) sel <= ~sel;
    end

    logic [WIDTH-1:0] mem0 [DEPTH];
    logic [WIDTH-1:0] mem1 [DEPTH];

    always_ff @(posedge clk) begin
        if (wr_en) begin
            if (sel) mem0[wr_addr] <= wr_data;   // copy0 is the fill side
            else     mem1[wr_addr] <= wr_data;   // copy1 is the fill side
        end
    end

    logic [WIDTH-1:0] rd_data_r;
    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n)     rd_data_r <= '0;
        else if (rd_en) rd_data_r <= sel ? mem1[rd_addr] : mem0[rd_addr];
    end
    assign rd_data = rd_data_r;
endmodule
