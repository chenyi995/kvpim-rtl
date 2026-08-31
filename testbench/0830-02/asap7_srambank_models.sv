// Behavioral simulation models of the generated ASAP7 SRAM banks used by
// softmax_buffer_sram / dbuf_16x256_asap7 (single port, registered read).
module srambank_64x4x16_6t122 (input logic clk, input logic [7:0] ADDRESS,
  input logic [15:0] wd, input logic banksel, read, write, output logic [15:0] dataout);
  logic [15:0] m [0:255];
  always_ff @(posedge clk) if (banksel) begin
    if (write) m[ADDRESS] <= wd; else if (read) dataout <= m[ADDRESS];
  end
endmodule

module srambank_64x4x32_6t122 (input logic clk, input logic [7:0] ADDRESS,
  input logic [31:0] wd, input logic banksel, read, write, output logic [31:0] dataout);
  logic [31:0] m [0:255];
  always_ff @(posedge clk) if (banksel) begin
    if (write) m[ADDRESS] <= wd; else if (read) dataout <= m[ADDRESS];
  end
endmodule

module srambank_64x4x80_6t122 (input logic clk, input logic [7:0] ADDRESS,
  input logic [79:0] wd, input logic banksel, read, write, output logic [79:0] dataout);
  logic [79:0] m [0:255];
  always_ff @(posedge clk) if (banksel) begin
    if (write) m[ADDRESS] <= wd; else if (read) dataout <= m[ADDRESS];
  end
endmodule

module srambank_256x4x32_6t122 (input logic clk, input logic [9:0] ADDRESS,
  input logic [31:0] wd, input logic banksel, read, write, output logic [31:0] dataout);
  logic [31:0] m [0:1023];
  always_ff @(posedge clk) if (banksel) begin
    if (write) m[ADDRESS] <= wd; else if (read) dataout <= m[ADDRESS];
  end
endmodule

module srambank_256x4x80_6t122 (input logic clk, input logic [9:0] ADDRESS,
  input logic [79:0] wd, input logic banksel, read, write, output logic [79:0] dataout);
  logic [79:0] m [0:1023];
  always_ff @(posedge clk) if (banksel) begin
    if (write) m[ADDRESS] <= wd; else if (read) dataout <= m[ADDRESS];
  end
endmodule
