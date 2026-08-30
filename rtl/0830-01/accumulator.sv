// accumulator.sv — FP16 partial-sum reduction across NUM_GEMV GEMV units for
// row-wise partitioning (AttAcc's per-BG / per-pCH accumulator). Reduces the N
// partial dot-products with an FP16 adder tree, then accumulates into a running
// result register (bypassed for column-wise partitioning by the caller).
//
// The tree is structural and works for any power-of-two N.  At the all-channel
// AttAcc point N=1024, so this models the complete bank->BG->pCH->channel
// reduction rather than the former four-bank slice.
module accumulator import fugue_pkg::*; #(
    parameter integer N = NUM_GEMV
) (
    input  logic               clk,
    input  logic               rst_n,
    input  logic               in_valid,
    input  logic [N-1:0][15:0] parts,   // FP16 partials from the N GEMV units
    input  logic               clr,     // clear the accumulator this beat
    output logic [15:0]        acc,
    output logic               out_valid
);
    localparam integer LEVELS = $clog2(N);
    logic [15:0] tree_data [0:LEVELS][0:N-1];
    logic        tree_valid[0:LEVELS][0:N-1];

    genvar level, node;
    generate
        for (node = 0; node < N; node++) begin : g_input
            assign tree_data[0][node]  = parts[node];
            assign tree_valid[0][node] = in_valid;
        end
        for (level = 0; level < LEVELS; level++) begin : g_level
            for (node = 0; node < (N >> (level + 1)); node++) begin : g_node
                fp16_add u_add (
                    .clk(clk), .rst_n(rst_n),
                    .in_valid(tree_valid[level][2*node]),
                    .a(tree_data[level][2*node]), .b(tree_data[level][2*node+1]),
                    .y(tree_data[level+1][node]), .out_valid(tree_valid[level+1][node])
                );
            end
        end
    endgenerate

    wire [15:0] tree_sum = tree_data[LEVELS][0];
    wire        tree_v   = tree_valid[LEVELS][0];

    // clr pipe: align to the registered adder tree latency.
    logic [LEVELS-1:0] clr_pipe;
    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) clr_pipe <= '0;
        else        clr_pipe <= {clr_pipe[LEVELS-2:0], clr};
    end
    logic clr_al;
    assign clr_al = clr_pipe[LEVELS-1];

    logic [15:0] acc_q, acc_in, acc_sum;
    logic        v_acc, out_valid_q;
    assign acc_in = clr_al ? 16'd0 : acc_q;
    fp16_add a_acc (.clk(clk),.rst_n(rst_n),.in_valid(tree_v),.a(tree_sum),.b(acc_in),.y(acc_sum),.out_valid(v_acc));

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            acc_q       <= 16'd0;
            out_valid_q <= 1'b0;
        end else begin
            out_valid_q <= v_acc;
            if (v_acc) acc_q <= acc_sum;
        end
    end

    assign acc       = acc_q;
    assign out_valid = out_valid_q;
endmodule
