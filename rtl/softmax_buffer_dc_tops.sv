// Synthesis-only tops for the two physical softmax-buffer capacities.
// Each logical buffer contains separate score and exp/probability SRAM banks.

module softmax_buffer_attacc_32kb (
    input logic clk, rst_n,
    input logic score_wr_en, input logic score_wr_context,
    input logic [6:0] score_wr_word, input logic [15:0][31:0] score_wr_data,
    input logic score_rd_en, input logic score_rd_context,
    input logic [6:0] score_rd_word, output logic [15:0][31:0] score_rd_data,
    output logic score_rd_valid,
    input logic exp_wr_en, input logic exp_wr_context,
    input logic [6:0] exp_wr_word, input logic [15:0][31:0] exp_wr_data,
    input logic exp_rd_en, input logic exp_rd_context,
    input logic [6:0] exp_rd_word, output logic [15:0][31:0] exp_rd_data,
    output logic exp_rd_valid
);
    // 2 contexts x 2048 FP32 entries x 2 banks = 32 KiB per channel.
    softmax_buffer_sram #(.NUM_CONTEXTS(2), .SEQ_LEN(2048), .LANES(16)) u_buffer (.*);
endmodule

module softmax_buffer_fugue_256kb (
    input logic clk, rst_n,
    input logic score_wr_en, input logic [3:0] score_wr_context,
    input logic [6:0] score_wr_word, input logic [15:0][31:0] score_wr_data,
    input logic score_rd_en, input logic [3:0] score_rd_context,
    input logic [6:0] score_rd_word, output logic [15:0][31:0] score_rd_data,
    output logic score_rd_valid,
    input logic exp_wr_en, input logic [3:0] exp_wr_context,
    input logic [6:0] exp_wr_word, input logic [15:0][31:0] exp_wr_data,
    input logic exp_rd_en, input logic [3:0] exp_rd_context,
    input logic [6:0] exp_rd_word, output logic [15:0][31:0] exp_rd_data,
    output logic exp_rd_valid
);
    // 16 contexts x 2048 FP32 entries x 2 banks = 256 KiB per channel.
    softmax_buffer_sram #(.NUM_CONTEXTS(16), .SEQ_LEN(2048), .LANES(16)) u_buffer (.*);
endmodule
