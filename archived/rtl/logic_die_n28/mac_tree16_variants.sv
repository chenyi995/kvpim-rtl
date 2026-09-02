// mac_tree16_variants.sv — fixed-pipe-depth wrappers of mac_tree16_piped for the
// Fmax sweep (avoids tool-specific parameter-override syntax). Naming: pMA where
// M = multiply sub-stages, A = adder sub-stages.
module mac_tree16_p22 (
    input logic clk, rst_n, in_valid,
    input logic [255:0] a_word, b_word,
    output logic [15:0] y, output logic out_valid
);
    mac_tree16_piped #(.MPIPE(2), .APIPE(2)) u (.*);
endmodule

module mac_tree16_p23 (
    input logic clk, rst_n, in_valid,
    input logic [255:0] a_word, b_word,
    output logic [15:0] y, output logic out_valid
);
    mac_tree16_piped #(.MPIPE(2), .APIPE(3)) u (.*);
endmodule

module mac_tree16_p33 (
    input logic clk, rst_n, in_valid,
    input logic [255:0] a_word, b_word,
    output logic [15:0] y, output logic out_valid
);
    mac_tree16_piped #(.MPIPE(3), .APIPE(3)) u (.*);
endmodule
