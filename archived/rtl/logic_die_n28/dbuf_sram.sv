// dbuf_sram.sv — SRAM-macro implementation of the double-buffered operand
// store, as a drop-in REPLACEMENT for the flop-based dbuf_16x256 (same
// module name and ports; select via the filelist: filelist_bankpe.f pulls
// dbuf_16x256.sv, filelist_bankpe_sram.f pulls this file instead).
//
// Each half (fill / drain) is built from two TSMC N28 single-port SPSRAM
// macros glued side by side for the 256-b word (2 x 128 b).  The two halves
// are separate macros, so the fill half only ever writes while the drain
// half only ever reads -- no same-cycle port conflict on the single port.
// Macro selection by half-depth (generated instances of the installed
// tsn28hpcpd127spsram_180a compiler):
//   DEPTH <= 32  -> TS1N28HPCPHVTB32X128M4SWBASO   (32  x 128)
//   DEPTH <= 64  -> TS1N28HPCPHVTB64X128M4SWBASO   (64  x 128)
//   DEPTH <= 128 -> TS1N28HPCPHVTB128X128M4SWBASO  (128 x 128)
// (8,1) uses half of a 32-deep macro; (16,2)/(32,4) fit exactly.
// Timing/area corners in tsmcn28_mmmc.tcl: ssg0p81v125c / ffg0p99vm40c /
// tt0p9v25c (the macros' own voltage grid; nearest to the logic corners).
//
// Like the rest of this repo: representative control, no functional
// sign-off.  BIST/sleep/mirror pins are tied off.
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
    logic fill_sel;   // 0 -> half0 is fill (written), half1 is drain (read)
    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n)    fill_sel <= 1'b0;
        else if (swap) fill_sel <= ~fill_sel;
    end

    // per-half port nets: h = half index, s = 128-b slice index
    logic        ceb  [2];
    logic        web  [2];
    logic [6:0]  addr [2];      // widest macro address; slices as needed
    logic [255:0] d   [2];
    logic [255:0] q   [2];

    always_comb begin
        for (int h = 0; h < 2; h++) begin
            if (fill_sel == h[0]) begin                    // write-only half
                ceb[h]  = ~wr_en;
                web[h]  = 1'b0;
                addr[h] = 7'(wr_addr);
                d[h]    = wr_data;
            end else begin                        // read-only half
                ceb[h]  = ~rd_en;
                web[h]  = 1'b1;
                addr[h] = 7'(rd_addr);
                d[h]    = '0;
            end
        end
    end
    assign rd_data = fill_sel ? q[0] : q[1];

    generate
        for (genvar h = 0; h < 2; h++) begin : g_half
            for (genvar s = 0; s < 2; s++) begin : g_slice
                if (DEPTH <= 32) begin : g_d32
                    TS1N28HPCPHVTB32X128M4SWBASO u_m (
                        .CLK(clk), .CEB(ceb[h]), .WEB(web[h]),
                        .A(addr[h][4:0]), .D(d[h][s*128 +: 128]),
                        .BWEB(128'b0), .Q(q[h][s*128 +: 128]),
                        .BIST(1'b0), .AWT(1'b0), .SLP(1'b0), .SD(1'b0),
                        .CEBM(1'b1), .WEBM(1'b1), .AM(5'b0),
                        .DM(128'b0), .BWEBM({128{1'b1}}));
                end else if (DEPTH <= 64) begin : g_d64
                    TS1N28HPCPHVTB64X128M4SWBASO u_m (
                        .CLK(clk), .CEB(ceb[h]), .WEB(web[h]),
                        .A(addr[h][5:0]), .D(d[h][s*128 +: 128]),
                        .BWEB(128'b0), .Q(q[h][s*128 +: 128]),
                        .BIST(1'b0), .AWT(1'b0), .SLP(1'b0), .SD(1'b0),
                        .CEBM(1'b1), .WEBM(1'b1), .AM(6'b0),
                        .DM(128'b0), .BWEBM({128{1'b1}}));
                end else begin : g_d128
                    TS1N28HPCPHVTB128X128M4SWBASO u_m (
                        .CLK(clk), .CEB(ceb[h]), .WEB(web[h]),
                        .A(addr[h][6:0]), .D(d[h][s*128 +: 128]),
                        .BWEB(128'b0), .Q(q[h][s*128 +: 128]),
                        .BIST(1'b0), .AWT(1'b0), .SLP(1'b0), .SD(1'b0),
                        .CEBM(1'b1), .WEBM(1'b1), .AM(7'b0),
                        .DM(128'b0), .BWEBM({128{1'b1}}));
                end
            end
        end
    endgenerate
endmodule
