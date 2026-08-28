// softmax_buffer_sram.sv -- 512 KiB ASAP7 SRAM implementation of the
// multi-context softmax store.  Score and exp/probability storage are
// independent single-port arrays, each 256 KiB.
//
// Organization per array: 4096 x 512 bits = 256 KiB, realized as
// 4 depth banks x 8 64-bit slices of srambank_256x4x64_6t122 (1024 x 64).
// Therefore the complete buffer contains 64 physical ASAP7 SRAM instances
// and exactly 512 KiB of logical score + exp/probability capacity.
module softmax_buffer_sram #(
    parameter integer NUM_CONTEXTS = 32,
    parameter integer SEQ_LEN      = 2048,
    parameter integer LANES        = 16,
    parameter integer WORDS        = (SEQ_LEN + LANES - 1) / LANES,
    parameter integer CONTEXT_W    = (NUM_CONTEXTS <= 1) ? 1 : $clog2(NUM_CONTEXTS),
    parameter integer WORD_W       = (WORDS <= 1) ? 1 : $clog2(WORDS)
) (
    input  logic                         clk,
    input  logic                         rst_n,
    input  logic                         score_wr_en,
    input  logic [CONTEXT_W-1:0]         score_wr_context,
    input  logic [WORD_W-1:0]            score_wr_word,
    input  logic [LANES-1:0][31:0]       score_wr_data,
    input  logic                         score_rd_en,
    input  logic [CONTEXT_W-1:0]         score_rd_context,
    input  logic [WORD_W-1:0]            score_rd_word,
    output logic [LANES-1:0][31:0]       score_rd_data,
    output logic                         score_rd_valid,
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
    localparam integer DATA_W       = LANES * 32;
    localparam integer MACRO_W      = 64;
    localparam integer MACRO_DEPTH  = 1024;
    localparam integer SLICES       = DATA_W / MACRO_W;
    localparam integer TOTAL_WORDS  = NUM_CONTEXTS * WORDS;
    localparam integer DEPTH_BANKS  = (TOTAL_WORDS + MACRO_DEPTH - 1) / MACRO_DEPTH;
    localparam integer ADDR_W       = (TOTAL_WORDS <= 1) ? 1 : $clog2(TOTAL_WORDS);
    localparam integer BANK_W       = (DEPTH_BANKS <= 1) ? 1 : $clog2(DEPTH_BANKS);

    // The supplied macro is 1024 x 64.  The 512 KiB configuration requires
    // NUM_CONTEXTS=32, SEQ_LEN=2048 and LANES=16: 4 banks per array, 8 slices
    // per bank, and two arrays.  Keep the wrapper generic only within this
    // physical capacity; a larger configuration needs a separate macro plan.
    initial begin
        if (DATA_W != 512 || TOTAL_WORDS > 4096)
            $error("softmax_buffer_sram supports at most 4096 x 512-bit words");
    end

    logic [ADDR_W-1:0] score_wr_addr, score_rd_addr, exp_wr_addr, exp_rd_addr;
    logic               score_read, exp_read;
    logic [BANK_W-1:0]  score_sel_bank, exp_sel_bank;
    logic [9:0]         score_sel_row, exp_sel_row;
    logic [63:0] score_q [0:DEPTH_BANKS-1][0:SLICES-1];
    logic [63:0] exp_q   [0:DEPTH_BANKS-1][0:SLICES-1];
    logic [DATA_W-1:0] score_read_word, exp_read_word;

    always_comb begin
        score_wr_addr = score_wr_context * WORDS + score_wr_word;
        score_rd_addr = score_rd_context * WORDS + score_rd_word;
        exp_wr_addr   = exp_wr_context * WORDS + exp_wr_word;
        exp_rd_addr   = exp_rd_context * WORDS + exp_rd_word;
        score_read    = !score_wr_en && score_rd_en;
        exp_read      = !exp_wr_en && exp_rd_en;
        score_sel_bank = score_rd_addr / MACRO_DEPTH;
        exp_sel_bank   = exp_rd_addr / MACRO_DEPTH;
        score_sel_row  = score_rd_addr % MACRO_DEPTH;
        exp_sel_row    = exp_rd_addr % MACRO_DEPTH;
        score_read_word = '0;
        exp_read_word   = '0;
        for (int b = 0; b < DEPTH_BANKS; b++) begin
            if (score_sel_bank == b)
                for (int s = 0; s < SLICES; s++) score_read_word[s*64 +: 64] = score_q[b][s];
            if (exp_sel_bank == b)
                for (int s = 0; s < SLICES; s++) exp_read_word[s*64 +: 64] = exp_q[b][s];
        end
        score_rd_data = score_read_word;
        exp_rd_data   = exp_read_word;
    end

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            score_rd_valid <= 1'b0;
            exp_rd_valid   <= 1'b0;
        end else begin
            // The macro has synchronous reads.  Its registered data output
            // becomes visible with these valids after the active clock edge.
            score_rd_valid <= score_read;
            exp_rd_valid   <= exp_read;
        end
    end

    generate
        for (genvar b = 0; b < DEPTH_BANKS; b++) begin : g_depth_bank
            for (genvar s = 0; s < SLICES; s++) begin : g_slice
                srambank_256x4x64_6t122 u_score (
                    .clk(clk), .ADDRESS(score_wr_en ? score_wr_addr[9:0] : score_rd_addr[9:0]),
                    .wd(score_wr_data[s*64 +: 64]),
                    .banksel((score_wr_en || score_read) && ((score_wr_en ? score_wr_addr / MACRO_DEPTH : score_rd_addr / MACRO_DEPTH) == b)),
                    .read(score_read), .write(score_wr_en), .dataout(score_q[b][s])
                );
                srambank_256x4x64_6t122 u_exp (
                    .clk(clk), .ADDRESS(exp_wr_en ? exp_wr_addr[9:0] : exp_rd_addr[9:0]),
                    .wd(exp_wr_data[s*64 +: 64]),
                    .banksel((exp_wr_en || exp_read) && ((exp_wr_en ? exp_wr_addr / MACRO_DEPTH : exp_rd_addr / MACRO_DEPTH) == b)),
                    .read(exp_read), .write(exp_wr_en), .dataout(exp_q[b][s])
                );
            end
        end
    endgenerate
endmodule
