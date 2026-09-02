/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : P-2019.03-SP5-6
// Date      : Tue Sep  1 00:19:53 2026
/////////////////////////////////////////////////////////////


module accum_buffer_bg_DEPTH8 ( clk, rst_n, wr_en, wr_addr, wr_data, rd_en, 
        rd_addr, rd_data );
  input [2:0] wr_addr;
  input [15:0] wr_data;
  input [2:0] rd_addr;
  output [15:0] rd_data;
  input clk, rst_n, wr_en, rd_en;
  wire   _0_net_, _1_net_, n2, n3, n1;
  wire   [2:0] addr8;

  NAND2xp5_ASAP7_75t_R U4 ( .A(n2), .B(n3), .Y(_0_net_) );
  INVx1_ASAP7_75t_R U5 ( .A(wr_en), .Y(n2) );
  INVx1_ASAP7_75t_R U6 ( .A(rd_en), .Y(n3) );
  AO22x1_ASAP7_75t_R U7 ( .A1(wr_en), .A2(wr_addr[2]), .B1(rd_addr[2]), .B2(n2), .Y(addr8[2]) );
  AO22x1_ASAP7_75t_R U8 ( .A1(wr_addr[1]), .A2(wr_en), .B1(rd_addr[1]), .B2(n2), .Y(addr8[1]) );
  AO22x1_ASAP7_75t_R U9 ( .A1(wr_addr[0]), .A2(wr_en), .B1(rd_addr[0]), .B2(n2), .Y(addr8[0]) );
  NOR2xp33_ASAP7_75t_R U2 ( .A(wr_en), .B(n3), .Y(_1_net_) );
  srambank_64x4x16_6t122 u_mem ( .wd(wr_data), .ADDRESS({n1, n1, n1, n1, n1, 
        addr8}), .dataout(rd_data), .banksel(_0_net_), .clk(clk), .read(
        _1_net_), .write(wr_en) );
  TIELOx1_ASAP7_75t_R U3 ( .L(n1) );
endmodule


module accum_buffer_bg_attacc ( clk, rst_n, wr_en, wr_addr, wr_data, rd_en, 
        rd_addr, rd_data );
  input [2:0] wr_addr;
  input [15:0] wr_data;
  input [2:0] rd_addr;
  output [15:0] rd_data;
  input clk, rst_n, wr_en, rd_en;


  accum_buffer_bg_DEPTH8 u_buf ( .clk(clk), .rst_n(rst_n), .wr_en(wr_en), 
        .wr_addr(wr_addr), .wr_data(wr_data), .rd_en(rd_en), .rd_addr(rd_addr), 
        .rd_data(rd_data) );
endmodule

