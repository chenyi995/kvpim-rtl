// causal_comparator.sv — the logic die's causal comparator (Fugue paper
// §4.3.3/§4.4.2, one per channel).  A bank-placed prefill scans the whole
// token range for every computed query; this unit discards the scores of
// keys that FOLLOW the query, so a computed token attends only to the
// tokens before it.  For one 16-lane score word (key positions word_base ..
// word_base+15) and the in-flight query's position, it produces the lane
// mask keep[l] = (key_pos <= q_pos), which gates the score writes into the
// softmax buffer.  Decode (q_pos = context end) keeps every lane.
module causal_comparator #(
    parameter integer LANES = 16,
    parameter integer POS_W = 16
) (
    input  logic             clk,
    input  logic             rst_n,
    input  logic             in_valid,
    input  logic [POS_W-1:0] q_pos,       // query's logical position
    input  logic [POS_W-1:0] word_base,   // logical position of lane 0
    output logic [LANES-1:0] keep_mask,   // 1 = keep score, 0 = discard
    output logic             out_valid
);
    logic [LANES-1:0] mask_c;
    always_comb begin
        for (int l = 0; l < LANES; l++)
            mask_c[l] = ((word_base + POS_W'(l)) <= q_pos);
    end

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            keep_mask <= '0;
            out_valid <= 1'b0;
        end else begin
            out_valid <= in_valid;
            if (in_valid) keep_mask <= mask_c;
        end
    end
endmodule
