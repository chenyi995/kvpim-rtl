// Reference tops for the BG buffer implementations NOT chosen by the
// 2026-09-02 ruling (AttAcc with the macro, Fugue with flops).  Uses the
// official rtl/accum_buffer_bg.sv implementation modules.
module accum_buffer_bg_attacc_macro (input logic clk, input logic rst_n, input logic wr_en,
    input logic [2:0] wr_addr, input logic [15:0] wr_data, input logic rd_en, input logic [2:0] rd_addr,
    output logic [15:0] rd_data);
    accum_buffer_bg_macro #(.DEPTH(8)) u_buf (.*);
endmodule
module accum_buffer_bg_fugue_flop (input logic clk, input logic rst_n, input logic wr_en,
    input logic [5:0] wr_addr, input logic [15:0] wr_data, input logic rd_en, input logic [5:0] rd_addr,
    output logic [15:0] rd_data);
    accum_buffer_bg_flop #(.DEPTH(64)) u_buf (.*);
endmodule
