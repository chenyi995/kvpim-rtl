// softmax_buffer.sv -- score/probability storage for a streaming attention
// softmax.  The two arrays model two independent single-port SRAM banks:
// score_bank is written while scores are collected; exp_bank is written while
// score_bank is read for exp/sum.  The normalize pass reads exp_bank and can
// stream probabilities directly to the context GEMV.
//
// A word contains LANES FP32 scores.  With the defaults, one context stores
// 2048 FP32 values: WORDS=128, LANES=16, or 8 KiB per bank.  The memories are
// intentionally expressed as synchronous arrays with a RAM inference hint;
// the technology-specific macro wrapper can replace this implementation
// without changing the scheduler-facing interface.
module softmax_buffer #(
    parameter integer NUM_CONTEXTS = 1,
    parameter integer SEQ_LEN      = 2048,
    parameter integer LANES        = 16,
    parameter integer WORDS        = (SEQ_LEN + LANES - 1) / LANES,
    parameter integer CONTEXT_W    = (NUM_CONTEXTS <= 1) ? 1 : $clog2(NUM_CONTEXTS),
    parameter integer WORD_W       = (WORDS <= 1) ? 1 : $clog2(WORDS)
) (
    input  logic                         clk,
    input  logic                         rst_n,

    // score-bank command: collection writes or exp-pass reads
    input  logic                         score_wr_en,
    input  logic [CONTEXT_W-1:0]         score_wr_context,
    input  logic [WORD_W-1:0]            score_wr_word,
    input  logic [LANES-1:0][31:0]       score_wr_data,
    input  logic                         score_rd_en,
    input  logic [CONTEXT_W-1:0]         score_rd_context,
    input  logic [WORD_W-1:0]            score_rd_word,
    output logic [LANES-1:0][31:0]       score_rd_data,
    output logic                         score_rd_valid,

    // exp-bank command: exp-pass writes or normalize-pass reads
    input  logic                         exp_wr_en,
    input  logic [CONTEXT_W-1:0]         exp_wr_context,
    input  logic [WORD_W-1:0]            exp_wr_word,
    input  logic [LANES-1:0][31:0]       exp_wr_data,
    input  logic                         exp_rd_en,
    input  logic [CONTEXT_W-1:0]         exp_rd_context,
    input  logic [WORD_W-1:0]            exp_rd_word,
    output logic [LANES-1:0][31:0]       exp_rd_data,
    output logic                         exp_rd_valid
);
    // These are separate SRAM instances/banks.  A bank accepts one command per
    // cycle; a simultaneous read and write to the SAME bank is intentionally
    // not supported by this portable model.
    (* ram_style = "block" *) logic [LANES-1:0][31:0] score_bank [NUM_CONTEXTS][WORDS];
    (* ram_style = "block" *) logic [LANES-1:0][31:0] exp_bank   [NUM_CONTEXTS][WORDS];

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            score_rd_data  <= '0;
            score_rd_valid <= 1'b0;
            exp_rd_data    <= '0;
            exp_rd_valid   <= 1'b0;
        end else begin
            score_rd_valid <= 1'b0;
            exp_rd_valid   <= 1'b0;

            if (score_wr_en) begin
                score_bank[score_wr_context][score_wr_word] <= score_wr_data;
            end else if (score_rd_en) begin
                score_rd_data  <= score_bank[score_rd_context][score_rd_word];
                score_rd_valid <= 1'b1;
            end

            if (exp_wr_en) begin
                exp_bank[exp_wr_context][exp_wr_word] <= exp_wr_data;
            end else if (exp_rd_en) begin
                exp_rd_data  <= exp_bank[exp_rd_context][exp_rd_word];
                exp_rd_valid <= 1'b1;
            end
        end
    end
endmodule

// One AttAcc attention context: 2 x (2048 x FP32) SRAM banks = 16 KiB.
module softmax_buffer_attacc (
    input logic clk, input logic rst_n,
    input logic score_wr_en, input logic [6:0] score_wr_word,
    input logic [15:0][31:0] score_wr_data,
    input logic score_rd_en, input logic [6:0] score_rd_word,
    output logic [15:0][31:0] score_rd_data, output logic score_rd_valid,
    input logic exp_wr_en, input logic [6:0] exp_wr_word,
    input logic [15:0][31:0] exp_wr_data,
    input logic exp_rd_en, input logic [6:0] exp_rd_word,
    output logic [15:0][31:0] exp_rd_data, output logic exp_rd_valid
);
    softmax_buffer #(.NUM_CONTEXTS(1), .SEQ_LEN(2048), .LANES(16)) u_buf (
        .clk, .rst_n,
        .score_wr_en, .score_wr_context(1'b0), .score_wr_word, .score_wr_data,
        .score_rd_en, .score_rd_context(1'b0), .score_rd_word, .score_rd_data, .score_rd_valid,
        .exp_wr_en, .exp_wr_context(1'b0), .exp_wr_word, .exp_wr_data,
        .exp_rd_en, .exp_rd_context(1'b0), .exp_rd_word, .exp_rd_data, .exp_rd_valid
    );
endmodule

// Thirty-two resident Fugue Q contexts.  The SRAM implementation has 256 KiB
// of score storage and 256 KiB of exp/probability storage, for 512 KiB total.
module softmax_buffer_fugue #(
    parameter integer NUM_Q = 32,
    parameter integer Q_W   = (NUM_Q <= 1) ? 1 : $clog2(NUM_Q)
) (
    input logic clk, input logic rst_n,
    input logic score_wr_en, input logic [Q_W-1:0] score_wr_q,
    input logic [6:0] score_wr_word, input logic [15:0][31:0] score_wr_data,
    input logic score_rd_en, input logic [Q_W-1:0] score_rd_q,
    input logic [6:0] score_rd_word, output logic [15:0][31:0] score_rd_data,
    output logic score_rd_valid,
    input logic exp_wr_en, input logic [Q_W-1:0] exp_wr_q,
    input logic [6:0] exp_wr_word, input logic [15:0][31:0] exp_wr_data,
    input logic exp_rd_en, input logic [Q_W-1:0] exp_rd_q,
    input logic [6:0] exp_rd_word, output logic [15:0][31:0] exp_rd_data,
    output logic exp_rd_valid
);
    softmax_buffer_sram #(.NUM_CONTEXTS(NUM_Q), .SEQ_LEN(2048), .LANES(16)) u_buf (
        .clk, .rst_n,
        .score_wr_en, .score_wr_context(score_wr_q), .score_wr_word, .score_wr_data,
        .score_rd_en, .score_rd_context(score_rd_q), .score_rd_word, .score_rd_data, .score_rd_valid,
        .exp_wr_en, .exp_wr_context(exp_wr_q), .exp_wr_word, .exp_wr_data,
        .exp_rd_en, .exp_rd_context(exp_rd_q), .exp_rd_word, .exp_rd_data, .exp_rd_valid
    );
endmodule
