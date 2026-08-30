/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : P-2019.03-SP5-6
// Date      : Mon Aug 31 00:23:03 2026
/////////////////////////////////////////////////////////////


module fp32_exp_DW_rash_0 ( .A({\A\[23\] , \A\[22\] , \A\[21\] , \A\[20\] , 
        \A\[19\] , \A\[18\] , \A\[17\] , \A\[16\] , \A\[15\] , \A\[14\] , 
        \A\[13\] , \A\[12\] , \A\[11\] , \A\[10\] , \A\[9\] , \A\[8\] , 
        \A\[7\] , \A\[6\] , \A\[5\] , \A\[4\] , \A\[3\] , \A\[2\] , \A\[1\] , 
        \A\[0\] }), DATA_TC, .SH({\SH\[9\] , \SH\[8\] , \SH\[7\] , \SH\[6\] , 
        \SH\[5\] , \SH\[4\] , \SH\[3\] , \SH\[2\] , \SH\[1\] , \SH\[0\] }), 
        SH_TC, .B({\B\[23\] , \B\[22\] , \B\[21\] , \B\[20\] , \B\[19\] , 
        \B\[18\] , \B\[17\] , \B\[16\] , \B\[15\] , \B\[14\] , \B\[13\] , 
        \B\[12\] , \B\[11\] , \B\[10\] , \B\[9\] , \B\[8\] , \B\[7\] , 
        \B\[6\] , \B\[5\] , \B\[4\] , \B\[3\] , \B\[2\] , \B\[1\] , \B\[0\] })
 );
  input \A\[23\] , \A\[22\] , \A\[21\] , \A\[20\] , \A\[19\] , \A\[18\] ,
         \A\[17\] , \A\[16\] , \A\[15\] , \A\[14\] , \A\[13\] , \A\[12\] ,
         \A\[11\] , \A\[10\] , \A\[9\] , \A\[8\] , \A\[7\] , \A\[6\] ,
         \A\[5\] , \A\[4\] , \A\[3\] , \A\[2\] , \A\[1\] , \A\[0\] , DATA_TC,
         \SH\[9\] , \SH\[8\] , \SH\[7\] , \SH\[6\] , \SH\[5\] , \SH\[4\] ,
         \SH\[3\] , \SH\[2\] , \SH\[1\] , \SH\[0\] , SH_TC;
  output \B\[23\] , \B\[22\] , \B\[21\] , \B\[20\] , \B\[19\] , \B\[18\] ,
         \B\[17\] , \B\[16\] , \B\[15\] , \B\[14\] , \B\[13\] , \B\[12\] ,
         \B\[11\] , \B\[10\] , \B\[9\] , \B\[8\] , \B\[7\] , \B\[6\] ,
         \B\[5\] , \B\[4\] , \B\[3\] , \B\[2\] , \B\[1\] , \B\[0\] ;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72,
         n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86,
         n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100,
         n101, n102, n103, n104, n105, n106, n107, n108, n109, n110, n111,
         n112, n113, n114, n115, n116, n117, n118, n119, n120, n121, n122;

  INVx1_ASAP7_75t_R U3 ( .A(n81), .Y(n25) );
  INVx1_ASAP7_75t_R U4 ( .A(n99), .Y(n23) );
  INVx1_ASAP7_75t_R U5 ( .A(n100), .Y(n22) );
  NAND2xp5_ASAP7_75t_R U6 ( .A(n6), .B(n102), .Y(n43) );
  NOR2xp33_ASAP7_75t_R U7 ( .A(\SH\[0\] ), .B(\SH\[1\] ), .Y(n52) );
  NOR2xp33_ASAP7_75t_R U8 ( .A(n26), .B(\SH\[1\] ), .Y(n81) );
  INVx1_ASAP7_75t_R U9 ( .A(n52), .Y(n24) );
  NAND2xp5_ASAP7_75t_R U10 ( .A(n74), .B(n1), .Y(n40) );
  NOR2xp33_ASAP7_75t_R U11 ( .A(n4), .B(\SH\[9\] ), .Y(n102) );
  INVx1_ASAP7_75t_R U12 ( .A(\SH\[9\] ), .Y(n1) );
  INVx1_ASAP7_75t_R U13 ( .A(n49), .Y(n2) );
  INVx1_ASAP7_75t_R U14 ( .A(n74), .Y(n3) );
  INVx1_ASAP7_75t_R U15 ( .A(n88), .Y(n4) );
  INVx1_ASAP7_75t_R U16 ( .A(n101), .Y(n5) );
  INVx1_ASAP7_75t_R U17 ( .A(n78), .Y(n6) );
  INVx1_ASAP7_75t_R U18 ( .A(n58), .Y(n7) );
  INVx1_ASAP7_75t_R U19 ( .A(n77), .Y(n8) );
  INVx1_ASAP7_75t_R U20 ( .A(n85), .Y(n9) );
  INVx1_ASAP7_75t_R U21 ( .A(\SH\[2\] ), .Y(n10) );
  INVx1_ASAP7_75t_R U22 ( .A(\SH\[1\] ), .Y(n11) );
  INVx1_ASAP7_75t_R U23 ( .A(n69), .Y(n12) );
  INVx1_ASAP7_75t_R U24 ( .A(n70), .Y(n13) );
  INVx1_ASAP7_75t_R U25 ( .A(n68), .Y(n14) );
  INVx1_ASAP7_75t_R U26 ( .A(n60), .Y(n15) );
  INVx1_ASAP7_75t_R U27 ( .A(n61), .Y(n16) );
  INVx1_ASAP7_75t_R U28 ( .A(n54), .Y(n17) );
  INVx1_ASAP7_75t_R U29 ( .A(n50), .Y(n18) );
  INVx1_ASAP7_75t_R U30 ( .A(n64), .Y(n19) );
  INVx1_ASAP7_75t_R U31 ( .A(n91), .Y(n20) );
  INVx1_ASAP7_75t_R U32 ( .A(n65), .Y(n21) );
  INVx1_ASAP7_75t_R U33 ( .A(\SH\[0\] ), .Y(n26) );
  INVx1_ASAP7_75t_R U34 ( .A(\A\[20\] ), .Y(n27) );
  INVx1_ASAP7_75t_R U35 ( .A(\A\[19\] ), .Y(n28) );
  INVx1_ASAP7_75t_R U36 ( .A(\A\[18\] ), .Y(n29) );
  INVx1_ASAP7_75t_R U37 ( .A(\A\[17\] ), .Y(n30) );
  INVx1_ASAP7_75t_R U38 ( .A(\A\[16\] ), .Y(n31) );
  INVx1_ASAP7_75t_R U39 ( .A(\A\[15\] ), .Y(n32) );
  INVx1_ASAP7_75t_R U40 ( .A(\A\[14\] ), .Y(n33) );
  INVx1_ASAP7_75t_R U41 ( .A(\A\[13\] ), .Y(n34) );
  INVx1_ASAP7_75t_R U42 ( .A(\A\[12\] ), .Y(n35) );
  INVx1_ASAP7_75t_R U43 ( .A(\A\[4\] ), .Y(n36) );
  INVx1_ASAP7_75t_R U44 ( .A(\A\[3\] ), .Y(n37) );
  INVx1_ASAP7_75t_R U45 ( .A(\A\[2\] ), .Y(n38) );
  OAI222xp33_ASAP7_75t_R U46 ( .A1(n39), .A2(n40), .B1(n41), .B2(n42), .C1(n19), .C2(n43), .Y(\B\[9\] ) );
  OAI222xp33_ASAP7_75t_R U47 ( .A1(n44), .A2(n40), .B1(n45), .B2(n42), .C1(n14), .C2(n43), .Y(\B\[8\] ) );
  OAI221xp5_ASAP7_75t_R U48 ( .A1(n46), .A2(n40), .B1(n47), .B2(n43), .C(n48), 
        .Y(\B\[7\] ) );
  AOI222xp33_ASAP7_75t_R U49 ( .A1(n49), .A2(n50), .B1(n51), .B2(n52), .C1(n53), .C2(n54), .Y(n48) );
  OAI221xp5_ASAP7_75t_R U50 ( .A1(n55), .A2(n40), .B1(n56), .B2(n43), .C(n57), 
        .Y(\B\[6\] ) );
  AOI222xp33_ASAP7_75t_R U51 ( .A1(n58), .A2(n59), .B1(n53), .B2(n60), .C1(n49), .C2(n61), .Y(n57) );
  OAI221xp5_ASAP7_75t_R U52 ( .A1(n62), .A2(n40), .B1(n39), .B2(n43), .C(n63), 
        .Y(\B\[5\] ) );
  AOI222xp33_ASAP7_75t_R U53 ( .A1(n49), .A2(n64), .B1(n51), .B2(n20), .C1(n53), .C2(n65), .Y(n63) );
  OAI221xp5_ASAP7_75t_R U54 ( .A1(n66), .A2(n40), .B1(n44), .B2(n43), .C(n67), 
        .Y(\B\[4\] ) );
  AOI222xp33_ASAP7_75t_R U55 ( .A1(n49), .A2(n68), .B1(n51), .B2(n69), .C1(n53), .C2(n70), .Y(n67) );
  NOR2xp33_ASAP7_75t_R U56 ( .A(n42), .B(n10), .Y(n53) );
  AND2x2_ASAP7_75t_R U57 ( .A(n59), .B(n10), .Y(n51) );
  AND2x2_ASAP7_75t_R U58 ( .A(n71), .B(n1), .Y(n59) );
  O2A1O1Ixp33_ASAP7_75t_R U59 ( .A1(n72), .A2(n4), .B(n73), .C(\SH\[9\] ), .Y(
        \B\[3\] ) );
  AOI22xp33_ASAP7_75t_R U60 ( .A1(n71), .A2(n8), .B1(n74), .B2(n75), .Y(n73)
         );
  OAI221xp5_ASAP7_75t_R U61 ( .A1(n25), .A2(n36), .B1(n24), .B2(n37), .C(n76), 
        .Y(n75) );
  AOI22xp33_ASAP7_75t_R U62 ( .A1(\A\[5\] ), .A2(n22), .B1(\A\[6\] ), .B2(n23), 
        .Y(n76) );
  OA222x2_ASAP7_75t_R U63 ( .A1(n78), .A2(n46), .B1(n79), .B2(n47), .C1(n80), 
        .C2(n18), .Y(n72) );
  AOI221xp5_ASAP7_75t_R U64 ( .A1(n81), .A2(\A\[8\] ), .B1(n52), .B2(\A\[7\] ), 
        .C(n82), .Y(n46) );
  AO22x1_ASAP7_75t_R U65 ( .A1(\A\[9\] ), .A2(n22), .B1(\A\[10\] ), .B2(n23), 
        .Y(n82) );
  O2A1O1Ixp33_ASAP7_75t_R U66 ( .A1(n83), .A2(n4), .B(n84), .C(\SH\[9\] ), .Y(
        \B\[2\] ) );
  AOI22xp33_ASAP7_75t_R U67 ( .A1(n71), .A2(n85), .B1(n74), .B2(n86), .Y(n84)
         );
  OAI221xp5_ASAP7_75t_R U68 ( .A1(n25), .A2(n37), .B1(n24), .B2(n38), .C(n87), 
        .Y(n86) );
  AOI22xp33_ASAP7_75t_R U69 ( .A1(\A\[4\] ), .A2(n22), .B1(\A\[5\] ), .B2(n23), 
        .Y(n87) );
  NOR2xp33_ASAP7_75t_R U70 ( .A(n5), .B(n88), .Y(n71) );
  OA222x2_ASAP7_75t_R U71 ( .A1(n78), .A2(n55), .B1(n79), .B2(n56), .C1(n80), 
        .C2(n16), .Y(n83) );
  AOI221xp5_ASAP7_75t_R U72 ( .A1(n81), .A2(\A\[7\] ), .B1(n52), .B2(\A\[6\] ), 
        .C(n89), .Y(n55) );
  AO22x1_ASAP7_75t_R U73 ( .A1(\A\[8\] ), .A2(n22), .B1(\A\[9\] ), .B2(n23), 
        .Y(n89) );
  NOR2xp33_ASAP7_75t_R U74 ( .A(n24), .B(n40), .Y(\B\[23\] ) );
  NOR2xp33_ASAP7_75t_R U75 ( .A(n7), .B(n90), .Y(\B\[22\] ) );
  NOR2xp33_ASAP7_75t_R U76 ( .A(n91), .B(n40), .Y(\B\[21\] ) );
  NOR2xp33_ASAP7_75t_R U77 ( .A(n12), .B(n40), .Y(\B\[20\] ) );
  O2A1O1Ixp33_ASAP7_75t_R U78 ( .A1(n92), .A2(n3), .B(n93), .C(\SH\[9\] ), .Y(
        \B\[1\] ) );
  AOI22xp33_ASAP7_75t_R U79 ( .A1(n94), .A2(n4), .B1(n88), .B2(n95), .Y(n93)
         );
  OAI222xp33_ASAP7_75t_R U80 ( .A1(n19), .A2(n80), .B1(n39), .B2(n79), .C1(n62), .C2(n78), .Y(n95) );
  AOI221xp5_ASAP7_75t_R U81 ( .A1(n81), .A2(\A\[6\] ), .B1(n52), .B2(\A\[5\] ), 
        .C(n96), .Y(n62) );
  AO22x1_ASAP7_75t_R U82 ( .A1(\A\[7\] ), .A2(n22), .B1(\A\[8\] ), .B2(n23), 
        .Y(n96) );
  AOI221xp5_ASAP7_75t_R U83 ( .A1(n81), .A2(\A\[10\] ), .B1(n52), .B2(\A\[9\] ), .C(n97), .Y(n39) );
  AO22x1_ASAP7_75t_R U84 ( .A1(\A\[11\] ), .A2(n22), .B1(\A\[12\] ), .B2(n23), 
        .Y(n97) );
  AOI221xp5_ASAP7_75t_R U85 ( .A1(\A\[2\] ), .A2(n81), .B1(\A\[1\] ), .B2(n52), 
        .C(n98), .Y(n92) );
  OAI22xp33_ASAP7_75t_R U86 ( .A1(n99), .A2(n36), .B1(n100), .B2(n37), .Y(n98)
         );
  NOR2xp33_ASAP7_75t_R U87 ( .A(n77), .B(n90), .Y(\B\[19\] ) );
  NOR2xp33_ASAP7_75t_R U88 ( .A(n9), .B(n90), .Y(\B\[18\] ) );
  NAND2xp33_ASAP7_75t_R U89 ( .A(n101), .B(n102), .Y(n90) );
  AND2x2_ASAP7_75t_R U90 ( .A(n102), .B(n94), .Y(\B\[17\] ) );
  NOR2xp33_ASAP7_75t_R U91 ( .A(n5), .B(n41), .Y(n94) );
  AOI22xp33_ASAP7_75t_R U92 ( .A1(n20), .A2(\SH\[2\] ), .B1(n10), .B2(n65), 
        .Y(n41) );
  AND2x2_ASAP7_75t_R U93 ( .A(n102), .B(n103), .Y(\B\[16\] ) );
  OAI222xp33_ASAP7_75t_R U94 ( .A1(n18), .A2(n40), .B1(n24), .B2(n2), .C1(n17), 
        .C2(n43), .Y(\B\[15\] ) );
  OAI222xp33_ASAP7_75t_R U95 ( .A1(n42), .A2(n7), .B1(n16), .B2(n40), .C1(n15), 
        .C2(n43), .Y(\B\[14\] ) );
  NOR2xp33_ASAP7_75t_R U96 ( .A(n104), .B(\SH\[2\] ), .Y(n58) );
  OAI222xp33_ASAP7_75t_R U97 ( .A1(n19), .A2(n40), .B1(n91), .B2(n2), .C1(n21), 
        .C2(n43), .Y(\B\[13\] ) );
  OAI221xp5_ASAP7_75t_R U98 ( .A1(n25), .A2(n29), .B1(n24), .B2(n30), .C(n105), 
        .Y(n65) );
  AOI22xp33_ASAP7_75t_R U99 ( .A1(\A\[19\] ), .A2(n22), .B1(\A\[20\] ), .B2(
        n23), .Y(n105) );
  AOI221xp5_ASAP7_75t_R U100 ( .A1(n81), .A2(\A\[22\] ), .B1(n26), .B2(
        \A\[21\] ), .C(n22), .Y(n91) );
  OAI221xp5_ASAP7_75t_R U101 ( .A1(n25), .A2(n33), .B1(n24), .B2(n34), .C(n106), .Y(n64) );
  AOI22xp33_ASAP7_75t_R U102 ( .A1(\A\[15\] ), .A2(n22), .B1(\A\[16\] ), .B2(
        n23), .Y(n106) );
  OAI222xp33_ASAP7_75t_R U103 ( .A1(n14), .A2(n40), .B1(n12), .B2(n2), .C1(n13), .C2(n43), .Y(\B\[12\] ) );
  NOR2xp33_ASAP7_75t_R U104 ( .A(n42), .B(\SH\[2\] ), .Y(n49) );
  OAI222xp33_ASAP7_75t_R U105 ( .A1(n77), .A2(n42), .B1(n47), .B2(n40), .C1(
        n18), .C2(n43), .Y(\B\[11\] ) );
  OAI221xp5_ASAP7_75t_R U106 ( .A1(n25), .A2(n31), .B1(n24), .B2(n32), .C(n107), .Y(n50) );
  AOI22xp33_ASAP7_75t_R U107 ( .A1(\A\[17\] ), .A2(n22), .B1(\A\[18\] ), .B2(
        n23), .Y(n107) );
  AOI221xp5_ASAP7_75t_R U108 ( .A1(n81), .A2(\A\[12\] ), .B1(n52), .B2(
        \A\[11\] ), .C(n108), .Y(n47) );
  OAI22xp33_ASAP7_75t_R U109 ( .A1(n34), .A2(n100), .B1(n33), .B2(n99), .Y(
        n108) );
  AOI22xp33_ASAP7_75t_R U110 ( .A1(n10), .A2(n54), .B1(\SH\[2\] ), .B2(n52), 
        .Y(n77) );
  OAI221xp5_ASAP7_75t_R U111 ( .A1(n25), .A2(n27), .B1(n28), .B2(n24), .C(n109), .Y(n54) );
  AOI22xp33_ASAP7_75t_R U112 ( .A1(n22), .A2(\A\[21\] ), .B1(n23), .B2(
        \A\[22\] ), .Y(n109) );
  OAI222xp33_ASAP7_75t_R U113 ( .A1(n9), .A2(n42), .B1(n56), .B2(n40), .C1(n16), .C2(n43), .Y(\B\[10\] ) );
  OAI221xp5_ASAP7_75t_R U114 ( .A1(n25), .A2(n32), .B1(n24), .B2(n33), .C(n110), .Y(n61) );
  AOI22xp33_ASAP7_75t_R U115 ( .A1(\A\[16\] ), .A2(n22), .B1(\A\[17\] ), .B2(
        n23), .Y(n110) );
  AOI221xp5_ASAP7_75t_R U116 ( .A1(n81), .A2(\A\[11\] ), .B1(n52), .B2(
        \A\[10\] ), .C(n111), .Y(n56) );
  OAI22xp33_ASAP7_75t_R U117 ( .A1(n35), .A2(n100), .B1(n34), .B2(n99), .Y(
        n111) );
  NAND2xp33_ASAP7_75t_R U118 ( .A(n102), .B(n5), .Y(n42) );
  OAI22xp33_ASAP7_75t_R U119 ( .A1(n104), .A2(n10), .B1(\SH\[2\] ), .B2(n15), 
        .Y(n85) );
  OAI221xp5_ASAP7_75t_R U120 ( .A1(n25), .A2(n28), .B1(n29), .B2(n24), .C(n112), .Y(n60) );
  AOI22xp33_ASAP7_75t_R U121 ( .A1(\A\[20\] ), .A2(n22), .B1(n23), .B2(
        \A\[21\] ), .Y(n112) );
  AOI21xp33_ASAP7_75t_R U122 ( .A1(n11), .A2(\A\[22\] ), .B(n81), .Y(n104) );
  O2A1O1Ixp33_ASAP7_75t_R U123 ( .A1(n113), .A2(n3), .B(n114), .C(\SH\[9\] ), 
        .Y(\B\[0\] ) );
  AOI22xp33_ASAP7_75t_R U124 ( .A1(n103), .A2(n4), .B1(n88), .B2(n115), .Y(
        n114) );
  OAI222xp33_ASAP7_75t_R U125 ( .A1(n14), .A2(n80), .B1(n44), .B2(n79), .C1(
        n66), .C2(n78), .Y(n115) );
  NAND2xp33_ASAP7_75t_R U126 ( .A(n101), .B(\SH\[2\] ), .Y(n78) );
  AOI221xp5_ASAP7_75t_R U127 ( .A1(n81), .A2(\A\[5\] ), .B1(n52), .B2(\A\[4\] ), .C(n116), .Y(n66) );
  AO22x1_ASAP7_75t_R U128 ( .A1(\A\[6\] ), .A2(n22), .B1(\A\[7\] ), .B2(n23), 
        .Y(n116) );
  NAND2xp33_ASAP7_75t_R U129 ( .A(n5), .B(n10), .Y(n79) );
  AOI221xp5_ASAP7_75t_R U130 ( .A1(n81), .A2(\A\[9\] ), .B1(n52), .B2(\A\[8\] ), .C(n117), .Y(n44) );
  AO22x1_ASAP7_75t_R U131 ( .A1(\A\[10\] ), .A2(n22), .B1(\A\[11\] ), .B2(n23), 
        .Y(n117) );
  NAND2xp33_ASAP7_75t_R U132 ( .A(\SH\[2\] ), .B(n5), .Y(n80) );
  OAI221xp5_ASAP7_75t_R U133 ( .A1(n25), .A2(n34), .B1(n24), .B2(n35), .C(n118), .Y(n68) );
  AOI22xp33_ASAP7_75t_R U134 ( .A1(\A\[14\] ), .A2(n22), .B1(\A\[15\] ), .B2(
        n23), .Y(n118) );
  NOR2xp33_ASAP7_75t_R U135 ( .A(n5), .B(n45), .Y(n103) );
  AOI22xp33_ASAP7_75t_R U136 ( .A1(n69), .A2(\SH\[2\] ), .B1(n10), .B2(n70), 
        .Y(n45) );
  OAI221xp5_ASAP7_75t_R U137 ( .A1(n25), .A2(n30), .B1(n24), .B2(n31), .C(n119), .Y(n70) );
  AOI22xp33_ASAP7_75t_R U138 ( .A1(\A\[18\] ), .A2(n22), .B1(n23), .B2(
        \A\[19\] ), .Y(n119) );
  OAI211xp5_ASAP7_75t_R U139 ( .A1(n27), .A2(n24), .B(n99), .C(n120), .Y(n69)
         );
  AOI22xp33_ASAP7_75t_R U140 ( .A1(\A\[21\] ), .A2(\SH\[0\] ), .B1(\A\[22\] ), 
        .B2(\SH\[1\] ), .Y(n120) );
  NOR3xp33_ASAP7_75t_R U141 ( .A(n4), .B(\SH\[2\] ), .C(n5), .Y(n74) );
  NOR2xp33_ASAP7_75t_R U142 ( .A(\SH\[3\] ), .B(n121), .Y(n101) );
  NOR2xp33_ASAP7_75t_R U143 ( .A(\SH\[4\] ), .B(n121), .Y(n88) );
  OR4x1_ASAP7_75t_R U144 ( .A(\SH\[6\] ), .B(\SH\[5\] ), .C(\SH\[8\] ), .D(
        \SH\[7\] ), .Y(n121) );
  AOI221xp5_ASAP7_75t_R U145 ( .A1(\A\[1\] ), .A2(n81), .B1(\A\[0\] ), .B2(n52), .C(n122), .Y(n113) );
  OAI22xp33_ASAP7_75t_R U146 ( .A1(n99), .A2(n37), .B1(n100), .B2(n38), .Y(
        n122) );
  NAND2xp33_ASAP7_75t_R U147 ( .A(\SH\[1\] ), .B(n26), .Y(n100) );
  NAND2xp33_ASAP7_75t_R U148 ( .A(\SH\[0\] ), .B(\SH\[1\] ), .Y(n99) );
endmodule


module fp32_exp_DW01_add_21 ( .A({\A\[12\] , \A\[11\] , \A\[10\] , \A\[9\] , 
        \A\[8\] , \A\[7\] , \A\[6\] , \A\[5\] , \A\[4\] , \A\[3\] , \A\[2\] , 
        \A\[1\] , \A\[0\] }), .B({\B\[12\] , \B\[11\] , \B\[10\] , \B\[9\] , 
        \B\[8\] , \B\[7\] , \B\[6\] , \B\[5\] , \B\[4\] , \B\[3\] , \B\[2\] , 
        \B\[1\] , \B\[0\] }), CI, .SUM({\SUM\[12\] , \SUM\[11\] , \SUM\[10\] , 
        \SUM\[9\] , \SUM\[8\] , \SUM\[7\] , \SUM\[6\] , \SUM\[5\] , \SUM\[4\] , 
        \SUM\[3\] , \SUM\[2\] , \SUM\[1\] , \SUM\[0\] }), CO );
  input \A\[12\] , \A\[11\] , \A\[10\] , \A\[9\] , \A\[8\] , \A\[7\] ,
         \A\[6\] , \A\[5\] , \A\[4\] , \A\[3\] , \A\[2\] , \A\[1\] , \A\[0\] ,
         \B\[12\] , \B\[11\] , \B\[10\] , \B\[9\] , \B\[8\] , \B\[7\] ,
         \B\[6\] , \B\[5\] , \B\[4\] , \B\[3\] , \B\[2\] , \B\[1\] , \B\[0\] ,
         CI;
  output \SUM\[12\] , \SUM\[11\] , \SUM\[10\] , \SUM\[9\] , \SUM\[8\] ,
         \SUM\[7\] , \SUM\[6\] , \SUM\[5\] , \SUM\[4\] , \SUM\[3\] ,
         \SUM\[2\] , \SUM\[1\] , \SUM\[0\] , CO;
  wire   \A\[4\] , \A\[3\] , \A\[2\] , \A\[1\] , \A\[0\] , n1, n3, n4, n5, n6,
         n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20,
         n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34;
  assign \SUM\[4\]  = \A\[4\] ;
  assign \SUM\[3\]  = \A\[3\] ;
  assign \SUM\[2\]  = \A\[2\] ;
  assign \SUM\[1\]  = \A\[1\] ;
  assign \SUM\[0\]  = \A\[0\] ;

  INVx1_ASAP7_75t_R U2 ( .A(n25), .Y(n9) );
  NAND2xp5_ASAP7_75t_R U3 ( .A(\B\[5\] ), .B(\A\[5\] ), .Y(n25) );
  XNOR2xp5_ASAP7_75t_R U4 ( .A(\B\[12\] ), .B(n26), .Y(\SUM\[12\] ) );
  XOR2xp5_ASAP7_75t_R U5 ( .A(n10), .B(n11), .Y(\SUM\[9\] ) );
  XOR2xp5_ASAP7_75t_R U6 ( .A(n14), .B(n15), .Y(\SUM\[8\] ) );
  OR2x2_ASAP7_75t_R U7 ( .A(\B\[5\] ), .B(\A\[5\] ), .Y(n1) );
  AND2x2_ASAP7_75t_R U8 ( .A(n1), .B(n25), .Y(\SUM\[5\] ) );
  AOI21x1_ASAP7_75t_R U9 ( .A1(n14), .A2(n6), .B(n16), .Y(n11) );
  OAI21x1_ASAP7_75t_R U10 ( .A1(n21), .A2(n19), .B(n20), .Y(n14) );
  AOI21x1_ASAP7_75t_R U11 ( .A1(n8), .A2(n9), .B(n23), .Y(n19) );
  AOI21x1_ASAP7_75t_R U12 ( .A1(n4), .A2(n31), .B(n32), .Y(n27) );
  OAI21x1_ASAP7_75t_R U13 ( .A1(n11), .A2(n13), .B(n12), .Y(n31) );
  INVx1_ASAP7_75t_R U14 ( .A(n28), .Y(n3) );
  INVx1_ASAP7_75t_R U15 ( .A(n33), .Y(n4) );
  INVx1_ASAP7_75t_R U16 ( .A(n13), .Y(n5) );
  INVx1_ASAP7_75t_R U17 ( .A(n17), .Y(n6) );
  INVx1_ASAP7_75t_R U18 ( .A(n21), .Y(n7) );
  INVx1_ASAP7_75t_R U19 ( .A(n24), .Y(n8) );
  NAND2xp33_ASAP7_75t_R U20 ( .A(n5), .B(n12), .Y(n10) );
  NOR2xp33_ASAP7_75t_R U21 ( .A(n16), .B(n17), .Y(n15) );
  XOR2xp5_ASAP7_75t_R U22 ( .A(n18), .B(n19), .Y(\SUM\[7\] ) );
  NAND2xp33_ASAP7_75t_R U23 ( .A(n7), .B(n20), .Y(n18) );
  XOR2xp5_ASAP7_75t_R U24 ( .A(n9), .B(n22), .Y(\SUM\[6\] ) );
  NOR2xp33_ASAP7_75t_R U25 ( .A(n23), .B(n24), .Y(n22) );
  OA21x2_ASAP7_75t_R U26 ( .A1(n27), .A2(n28), .B(n29), .Y(n26) );
  XOR2xp5_ASAP7_75t_R U27 ( .A(n30), .B(n27), .Y(\SUM\[11\] ) );
  NAND2xp33_ASAP7_75t_R U28 ( .A(n3), .B(n29), .Y(n30) );
  NAND2xp33_ASAP7_75t_R U29 ( .A(\B\[11\] ), .B(\A\[11\] ), .Y(n29) );
  NOR2xp33_ASAP7_75t_R U30 ( .A(\B\[11\] ), .B(\A\[11\] ), .Y(n28) );
  XOR2xp5_ASAP7_75t_R U31 ( .A(n31), .B(n34), .Y(\SUM\[10\] ) );
  NOR2xp33_ASAP7_75t_R U32 ( .A(n32), .B(n33), .Y(n34) );
  NOR2xp33_ASAP7_75t_R U33 ( .A(\B\[10\] ), .B(\A\[10\] ), .Y(n33) );
  AND2x2_ASAP7_75t_R U34 ( .A(\B\[10\] ), .B(\A\[10\] ), .Y(n32) );
  NAND2xp33_ASAP7_75t_R U35 ( .A(\B\[9\] ), .B(\A\[9\] ), .Y(n12) );
  NOR2xp33_ASAP7_75t_R U36 ( .A(\B\[9\] ), .B(\A\[9\] ), .Y(n13) );
  AND2x2_ASAP7_75t_R U37 ( .A(\B\[8\] ), .B(\A\[8\] ), .Y(n16) );
  NOR2xp33_ASAP7_75t_R U38 ( .A(\B\[8\] ), .B(\A\[8\] ), .Y(n17) );
  NAND2xp33_ASAP7_75t_R U39 ( .A(\B\[7\] ), .B(\A\[7\] ), .Y(n20) );
  AND2x2_ASAP7_75t_R U40 ( .A(\B\[6\] ), .B(\A\[6\] ), .Y(n23) );
  NOR2xp33_ASAP7_75t_R U41 ( .A(\B\[6\] ), .B(\A\[6\] ), .Y(n24) );
  NOR2xp33_ASAP7_75t_R U42 ( .A(\B\[7\] ), .B(\A\[7\] ), .Y(n21) );
endmodule


module fp32_exp_DW02_mult_7 ( .A({\A\[5\] , \A\[4\] , \A\[3\] , \A\[2\] , 
        \A\[1\] , \A\[0\] }), .B({\B\[8\] , \B\[7\] , \B\[6\] , \B\[5\] , 
        \B\[4\] , \B\[3\] , \B\[2\] , \B\[1\] , \B\[0\] }), TC, .PRODUCT({
        \PRODUCT\[14\] , \PRODUCT\[13\] , \PRODUCT\[12\] , \PRODUCT\[11\] , 
        \PRODUCT\[10\] , \PRODUCT\[9\] , \PRODUCT\[8\] , \PRODUCT\[7\] , 
        \PRODUCT\[6\] , \PRODUCT\[5\] , \PRODUCT\[4\] , \PRODUCT\[3\] , 
        \PRODUCT\[2\] , \PRODUCT\[1\] , \PRODUCT\[0\] }) );
  input \A\[5\] , \A\[4\] , \A\[3\] , \A\[2\] , \A\[1\] , \A\[0\] , \B\[8\] ,
         \B\[7\] , \B\[6\] , \B\[5\] , \B\[4\] , \B\[3\] , \B\[2\] , \B\[1\] ,
         \B\[0\] , TC;
  output \PRODUCT\[14\] , \PRODUCT\[13\] , \PRODUCT\[12\] , \PRODUCT\[11\] ,
         \PRODUCT\[10\] , \PRODUCT\[9\] , \PRODUCT\[8\] , \PRODUCT\[7\] ,
         \PRODUCT\[6\] , \PRODUCT\[5\] , \PRODUCT\[4\] , \PRODUCT\[3\] ,
         \PRODUCT\[2\] , \PRODUCT\[1\] , \PRODUCT\[0\] ;
  wire   net27181, \ab\[5\]\[8\] , \ab\[5\]\[7\] , \ab\[5\]\[6\] ,
         \ab\[5\]\[5\] , \ab\[5\]\[4\] , \ab\[5\]\[3\] , \ab\[5\]\[2\] ,
         \ab\[5\]\[1\] , \ab\[5\]\[0\] , \ab\[4\]\[8\] , \ab\[4\]\[7\] ,
         \ab\[4\]\[6\] , \ab\[4\]\[5\] , \ab\[4\]\[4\] , \ab\[4\]\[3\] ,
         \ab\[4\]\[2\] , \ab\[4\]\[1\] , \ab\[4\]\[0\] , \ab\[3\]\[8\] ,
         \ab\[3\]\[7\] , \ab\[3\]\[6\] , \ab\[3\]\[5\] , \ab\[3\]\[4\] ,
         \ab\[3\]\[3\] , \ab\[3\]\[2\] , \ab\[3\]\[1\] , \ab\[3\]\[0\] ,
         \ab\[2\]\[8\] , \ab\[2\]\[7\] , \ab\[2\]\[6\] , \ab\[2\]\[5\] ,
         \ab\[2\]\[4\] , \ab\[2\]\[3\] , \ab\[2\]\[2\] , \ab\[2\]\[1\] ,
         \ab\[2\]\[0\] , \ab\[1\]\[8\] , \ab\[1\]\[7\] , \ab\[1\]\[6\] ,
         \ab\[1\]\[5\] , \ab\[1\]\[4\] , \ab\[1\]\[3\] , \ab\[1\]\[2\] ,
         \ab\[1\]\[1\] , \ab\[1\]\[0\] , \ab\[0\]\[8\] , \ab\[0\]\[7\] ,
         \ab\[0\]\[6\] , \ab\[0\]\[5\] , \ab\[0\]\[4\] , \ab\[0\]\[3\] ,
         \ab\[0\]\[2\] , \ab\[0\]\[1\] , n2, n3, n4, n5, n6, n7, n8, n9, n10,
         n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24,
         n25, n26, n27, n28, n29, n30, n31, n32, n34, n35, n36, n37, n38, n39,
         n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53,
         n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67,
         n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81,
         n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95,
         n96, n97, n98, n99, n100, n101, n102, n103, n104, n105, n106, n107,
         n108, n109, n110, n111, n112, n113, n114, n115, n116, n117, n118,
         n119, n120, n121, n122, n123, n124, n125, n126, n127, n128, n129,
         n130, n131, n132, n133, n134, n135, n136, n137, n138, n139, n140,
         n141, n142, n143, n144, n145, n146, n147, n148, n149, n150, n151,
         n152, n153, n154, n155, n156, n157, n158, n159, n160, n161, n162,
         n163, n164, n165, n166, n167, n168, n169, n170, n171, n172, n173,
         n174, n175, n176;

  FAx1_ASAP7_75t_R S4_0 ( .A(\ab\[5\]\[0\] ), .B(n88), .CI(n83), .CON(n113), 
        .SN(n114) );
  FAx1_ASAP7_75t_R S4_1 ( .A(\ab\[5\]\[1\] ), .B(n80), .CI(n75), .CON(n115), 
        .SN(n116) );
  FAx1_ASAP7_75t_R S4_2 ( .A(\ab\[5\]\[2\] ), .B(n72), .CI(n67), .CON(n117), 
        .SN(n118) );
  FAx1_ASAP7_75t_R S4_3 ( .A(\ab\[5\]\[3\] ), .B(n64), .CI(n59), .CON(n119), 
        .SN(n120) );
  FAx1_ASAP7_75t_R S4_4 ( .A(\ab\[5\]\[4\] ), .B(n56), .CI(n51), .CON(n121), 
        .SN(n122) );
  FAx1_ASAP7_75t_R S4_5 ( .A(\ab\[5\]\[5\] ), .B(n48), .CI(n44), .CON(n123), 
        .SN(n124) );
  FAx1_ASAP7_75t_R S4_6 ( .A(\ab\[5\]\[6\] ), .B(n41), .CI(n39), .CON(n125), 
        .SN(n126) );
  FAx1_ASAP7_75t_R S5_7 ( .A(\ab\[5\]\[7\] ), .B(n36), .CI(\ab\[4\]\[8\] ), 
        .CON(n127), .SN(n128) );
  FAx1_ASAP7_75t_R S1_4_0 ( .A(\ab\[4\]\[0\] ), .B(n93), .CI(n90), .CON(n129), 
        .SN(n130) );
  FAx1_ASAP7_75t_R S2_4_1 ( .A(\ab\[4\]\[1\] ), .B(n87), .CI(n84), .CON(n131), 
        .SN(n132) );
  FAx1_ASAP7_75t_R S2_4_2 ( .A(\ab\[4\]\[2\] ), .B(n79), .CI(n76), .CON(n133), 
        .SN(n134) );
  FAx1_ASAP7_75t_R S2_4_3 ( .A(\ab\[4\]\[3\] ), .B(n71), .CI(n68), .CON(n135), 
        .SN(n136) );
  FAx1_ASAP7_75t_R S2_4_4 ( .A(\ab\[4\]\[4\] ), .B(n63), .CI(n60), .CON(n137), 
        .SN(n138) );
  FAx1_ASAP7_75t_R S2_4_5 ( .A(\ab\[4\]\[5\] ), .B(n55), .CI(n52), .CON(n139), 
        .SN(n140) );
  FAx1_ASAP7_75t_R S2_4_6 ( .A(\ab\[4\]\[6\] ), .B(n47), .CI(n45), .CON(n141), 
        .SN(n142) );
  FAx1_ASAP7_75t_R S3_4_7 ( .A(\ab\[4\]\[7\] ), .B(n40), .CI(\ab\[3\]\[8\] ), 
        .CON(n143), .SN(n144) );
  FAx1_ASAP7_75t_R S1_3_0 ( .A(\ab\[3\]\[0\] ), .B(n96), .CI(n95), .CON(n145), 
        .SN(n146) );
  FAx1_ASAP7_75t_R S2_3_1 ( .A(\ab\[3\]\[1\] ), .B(n92), .CI(n91), .CON(n147), 
        .SN(n148) );
  FAx1_ASAP7_75t_R S2_3_2 ( .A(\ab\[3\]\[2\] ), .B(n86), .CI(n85), .CON(n149), 
        .SN(n150) );
  FAx1_ASAP7_75t_R S2_3_3 ( .A(\ab\[3\]\[3\] ), .B(n78), .CI(n77), .CON(n151), 
        .SN(n152) );
  FAx1_ASAP7_75t_R S2_3_4 ( .A(\ab\[3\]\[4\] ), .B(n70), .CI(n69), .CON(n153), 
        .SN(n154) );
  FAx1_ASAP7_75t_R S2_3_5 ( .A(\ab\[3\]\[5\] ), .B(n62), .CI(n61), .CON(n155), 
        .SN(n156) );
  FAx1_ASAP7_75t_R S2_3_6 ( .A(\ab\[3\]\[6\] ), .B(n54), .CI(n53), .CON(n157), 
        .SN(n158) );
  FAx1_ASAP7_75t_R S3_3_7 ( .A(\ab\[3\]\[7\] ), .B(n46), .CI(\ab\[2\]\[8\] ), 
        .CON(n159), .SN(n160) );
  FAx1_ASAP7_75t_R S1_2_0 ( .A(\ab\[2\]\[0\] ), .B(n12), .CI(n27), .CON(n161), 
        .SN(n162) );
  FAx1_ASAP7_75t_R S2_2_1 ( .A(\ab\[2\]\[1\] ), .B(n10), .CI(n25), .CON(n163), 
        .SN(n164) );
  FAx1_ASAP7_75t_R S2_2_2 ( .A(\ab\[2\]\[2\] ), .B(n24), .CI(n8), .CON(n165), 
        .SN(n166) );
  FAx1_ASAP7_75t_R S2_2_3 ( .A(\ab\[2\]\[3\] ), .B(n21), .CI(n7), .CON(n167), 
        .SN(n168) );
  FAx1_ASAP7_75t_R S2_2_4 ( .A(\ab\[2\]\[4\] ), .B(n20), .CI(n5), .CON(n169), 
        .SN(n170) );
  FAx1_ASAP7_75t_R S2_2_5 ( .A(\ab\[2\]\[5\] ), .B(n2), .CI(n16), .CON(n171), 
        .SN(n172) );
  FAx1_ASAP7_75t_R S2_2_6 ( .A(\ab\[2\]\[6\] ), .B(n19), .CI(n6), .CON(n173), 
        .SN(n174) );
  FAx1_ASAP7_75t_R S3_2_7 ( .A(\ab\[2\]\[7\] ), .B(n22), .CI(\ab\[1\]\[8\] ), 
        .CON(n175), .SN(n176) );
  INVx1_ASAP7_75t_R U2 ( .A(\A\[5\] ), .Y(n98) );
  NOR2xp33_ASAP7_75t_R U3 ( .A(n105), .B(n103), .Y(\ab\[0\]\[7\] ) );
  NOR2xp33_ASAP7_75t_R U4 ( .A(n106), .B(n102), .Y(\ab\[1\]\[6\] ) );
  NOR2xp33_ASAP7_75t_R U5 ( .A(n105), .B(n102), .Y(\ab\[1\]\[7\] ) );
  NOR2xp33_ASAP7_75t_R U6 ( .A(n107), .B(n102), .Y(\ab\[1\]\[5\] ) );
  INVx1_ASAP7_75t_R U7 ( .A(\A\[4\] ), .Y(n99) );
  INVx1_ASAP7_75t_R U8 ( .A(\A\[3\] ), .Y(n100) );
  INVx1_ASAP7_75t_R U9 ( .A(\A\[2\] ), .Y(n101) );
  INVx1_ASAP7_75t_R U10 ( .A(\A\[1\] ), .Y(n102) );
  INVx1_ASAP7_75t_R U11 ( .A(\A\[0\] ), .Y(n103) );
  AND2x2_ASAP7_75t_R U12 ( .A(\ab\[0\]\[6\] ), .B(\ab\[1\]\[5\] ), .Y(n2) );
  XOR2xp5_ASAP7_75t_R U13 ( .A(n66), .B(n73), .Y(n3) );
  AND2x2_ASAP7_75t_R U14 ( .A(n73), .B(n66), .Y(n4) );
  XOR2xp5_ASAP7_75t_R U15 ( .A(\ab\[1\]\[5\] ), .B(\ab\[0\]\[6\] ), .Y(n5) );
  XOR2xp5_ASAP7_75t_R U16 ( .A(\ab\[1\]\[7\] ), .B(\ab\[0\]\[8\] ), .Y(n6) );
  XOR2xp5_ASAP7_75t_R U17 ( .A(\ab\[1\]\[4\] ), .B(\ab\[0\]\[5\] ), .Y(n7) );
  XOR2xp5_ASAP7_75t_R U18 ( .A(\ab\[1\]\[3\] ), .B(\ab\[0\]\[4\] ), .Y(n8) );
  XOR2xp5_ASAP7_75t_R U19 ( .A(n50), .B(n57), .Y(n9) );
  AND2x2_ASAP7_75t_R U20 ( .A(\ab\[0\]\[2\] ), .B(\ab\[1\]\[1\] ), .Y(n10) );
  AND2x2_ASAP7_75t_R U21 ( .A(n57), .B(n50), .Y(n11) );
  AND2x2_ASAP7_75t_R U22 ( .A(\ab\[0\]\[1\] ), .B(\ab\[1\]\[0\] ), .Y(n12) );
  AND2x2_ASAP7_75t_R U23 ( .A(n49), .B(n43), .Y(n13) );
  AND2x2_ASAP7_75t_R U24 ( .A(n42), .B(n38), .Y(n14) );
  AND2x2_ASAP7_75t_R U25 ( .A(n37), .B(n35), .Y(n15) );
  XOR2xp5_ASAP7_75t_R U26 ( .A(\ab\[1\]\[6\] ), .B(\ab\[0\]\[7\] ), .Y(n16) );
  AND2x2_ASAP7_75t_R U27 ( .A(n81), .B(n74), .Y(n17) );
  XOR2xp5_ASAP7_75t_R U28 ( .A(n58), .B(n65), .Y(n18) );
  AND2x2_ASAP7_75t_R U29 ( .A(\ab\[0\]\[7\] ), .B(\ab\[1\]\[6\] ), .Y(n19) );
  AND2x2_ASAP7_75t_R U30 ( .A(\ab\[0\]\[5\] ), .B(\ab\[1\]\[4\] ), .Y(n20) );
  AND2x2_ASAP7_75t_R U31 ( .A(\ab\[0\]\[4\] ), .B(\ab\[1\]\[3\] ), .Y(n21) );
  AND2x2_ASAP7_75t_R U32 ( .A(\ab\[0\]\[8\] ), .B(\ab\[1\]\[7\] ), .Y(n22) );
  AND2x2_ASAP7_75t_R U33 ( .A(n65), .B(n58), .Y(n23) );
  AND2x2_ASAP7_75t_R U34 ( .A(\ab\[0\]\[3\] ), .B(\ab\[1\]\[2\] ), .Y(n24) );
  XOR2xp5_ASAP7_75t_R U35 ( .A(\ab\[1\]\[2\] ), .B(\ab\[0\]\[3\] ), .Y(n25) );
  XOR2xp5_ASAP7_75t_R U36 ( .A(n43), .B(n49), .Y(n26) );
  XOR2xp5_ASAP7_75t_R U37 ( .A(\ab\[1\]\[1\] ), .B(\ab\[0\]\[2\] ), .Y(n27) );
  XOR2xp5_ASAP7_75t_R U38 ( .A(n38), .B(n42), .Y(n28) );
  XOR2xp5_ASAP7_75t_R U39 ( .A(n35), .B(n37), .Y(n29) );
  XOR2xp5_ASAP7_75t_R U40 ( .A(n74), .B(n81), .Y(n30) );
  XOR2xp5_ASAP7_75t_R U41 ( .A(\ab\[5\]\[8\] ), .B(n34), .Y(n31) );
  AND2x2_ASAP7_75t_R U42 ( .A(n34), .B(\ab\[5\]\[8\] ), .Y(n32) );
  XOR2xp5_ASAP7_75t_R U43 ( .A(\ab\[1\]\[0\] ), .B(\ab\[0\]\[1\] ), .Y(
        \PRODUCT\[1\] ) );
  TIELOx1_ASAP7_75t_R U44 ( .L(net27181) );
  AND2x2_ASAP7_75t_R U45 ( .A(\B\[8\] ), .B(\A\[0\] ), .Y(\ab\[0\]\[8\] ) );
  INVxp67_ASAP7_75t_R U46 ( .A(\B\[8\] ), .Y(n104) );
  INVx1_ASAP7_75t_R U47 ( .A(n127), .Y(n34) );
  INVx1_ASAP7_75t_R U48 ( .A(n128), .Y(n35) );
  INVx1_ASAP7_75t_R U49 ( .A(n143), .Y(n36) );
  INVx1_ASAP7_75t_R U50 ( .A(n125), .Y(n37) );
  INVx1_ASAP7_75t_R U51 ( .A(n126), .Y(n38) );
  INVx1_ASAP7_75t_R U52 ( .A(n144), .Y(n39) );
  INVx1_ASAP7_75t_R U53 ( .A(n159), .Y(n40) );
  INVx1_ASAP7_75t_R U54 ( .A(n141), .Y(n41) );
  INVx1_ASAP7_75t_R U55 ( .A(n123), .Y(n42) );
  INVx1_ASAP7_75t_R U56 ( .A(n124), .Y(n43) );
  INVx1_ASAP7_75t_R U57 ( .A(n142), .Y(n44) );
  INVx1_ASAP7_75t_R U58 ( .A(n160), .Y(n45) );
  INVx1_ASAP7_75t_R U59 ( .A(n175), .Y(n46) );
  INVx1_ASAP7_75t_R U60 ( .A(n157), .Y(n47) );
  INVx1_ASAP7_75t_R U61 ( .A(n139), .Y(n48) );
  INVx1_ASAP7_75t_R U62 ( .A(n121), .Y(n49) );
  INVx1_ASAP7_75t_R U63 ( .A(n122), .Y(n50) );
  INVx1_ASAP7_75t_R U64 ( .A(n140), .Y(n51) );
  INVx1_ASAP7_75t_R U65 ( .A(n158), .Y(n52) );
  INVx1_ASAP7_75t_R U66 ( .A(n176), .Y(n53) );
  INVx1_ASAP7_75t_R U67 ( .A(n173), .Y(n54) );
  INVx1_ASAP7_75t_R U68 ( .A(n155), .Y(n55) );
  INVx1_ASAP7_75t_R U69 ( .A(n137), .Y(n56) );
  INVx1_ASAP7_75t_R U70 ( .A(n119), .Y(n57) );
  INVx1_ASAP7_75t_R U71 ( .A(n120), .Y(n58) );
  INVx1_ASAP7_75t_R U72 ( .A(n138), .Y(n59) );
  INVx1_ASAP7_75t_R U73 ( .A(n156), .Y(n60) );
  INVx1_ASAP7_75t_R U74 ( .A(n174), .Y(n61) );
  INVx1_ASAP7_75t_R U75 ( .A(n171), .Y(n62) );
  INVx1_ASAP7_75t_R U76 ( .A(n153), .Y(n63) );
  INVx1_ASAP7_75t_R U77 ( .A(n135), .Y(n64) );
  INVx1_ASAP7_75t_R U78 ( .A(n117), .Y(n65) );
  INVx1_ASAP7_75t_R U79 ( .A(n118), .Y(n66) );
  INVx1_ASAP7_75t_R U80 ( .A(n136), .Y(n67) );
  INVx1_ASAP7_75t_R U81 ( .A(n154), .Y(n68) );
  INVx1_ASAP7_75t_R U82 ( .A(n172), .Y(n69) );
  INVx1_ASAP7_75t_R U83 ( .A(n169), .Y(n70) );
  INVx1_ASAP7_75t_R U84 ( .A(n151), .Y(n71) );
  INVx1_ASAP7_75t_R U85 ( .A(n133), .Y(n72) );
  INVx1_ASAP7_75t_R U86 ( .A(n115), .Y(n73) );
  INVx1_ASAP7_75t_R U87 ( .A(n116), .Y(n74) );
  INVx1_ASAP7_75t_R U88 ( .A(n134), .Y(n75) );
  INVx1_ASAP7_75t_R U89 ( .A(n152), .Y(n76) );
  INVx1_ASAP7_75t_R U90 ( .A(n170), .Y(n77) );
  INVx1_ASAP7_75t_R U91 ( .A(n167), .Y(n78) );
  INVx1_ASAP7_75t_R U92 ( .A(n149), .Y(n79) );
  INVx1_ASAP7_75t_R U93 ( .A(n131), .Y(n80) );
  INVx1_ASAP7_75t_R U94 ( .A(n113), .Y(n81) );
  INVx1_ASAP7_75t_R U95 ( .A(n114), .Y(n82) );
  INVx1_ASAP7_75t_R U96 ( .A(n132), .Y(n83) );
  INVx1_ASAP7_75t_R U97 ( .A(n150), .Y(n84) );
  INVx1_ASAP7_75t_R U98 ( .A(n168), .Y(n85) );
  INVx1_ASAP7_75t_R U99 ( .A(n165), .Y(n86) );
  INVx1_ASAP7_75t_R U100 ( .A(n147), .Y(n87) );
  INVx1_ASAP7_75t_R U101 ( .A(n129), .Y(n88) );
  INVx1_ASAP7_75t_R U102 ( .A(n130), .Y(n89) );
  INVx1_ASAP7_75t_R U103 ( .A(n148), .Y(n90) );
  INVx1_ASAP7_75t_R U104 ( .A(n166), .Y(n91) );
  INVx1_ASAP7_75t_R U105 ( .A(n163), .Y(n92) );
  INVx1_ASAP7_75t_R U106 ( .A(n145), .Y(n93) );
  INVx1_ASAP7_75t_R U107 ( .A(n146), .Y(n94) );
  INVx1_ASAP7_75t_R U108 ( .A(n164), .Y(n95) );
  INVx1_ASAP7_75t_R U109 ( .A(n161), .Y(n96) );
  INVx1_ASAP7_75t_R U110 ( .A(n162), .Y(n97) );
  INVx1_ASAP7_75t_R U111 ( .A(\B\[7\] ), .Y(n105) );
  INVx1_ASAP7_75t_R U112 ( .A(\B\[6\] ), .Y(n106) );
  INVx1_ASAP7_75t_R U113 ( .A(\B\[5\] ), .Y(n107) );
  INVx1_ASAP7_75t_R U114 ( .A(\B\[4\] ), .Y(n108) );
  INVx1_ASAP7_75t_R U115 ( .A(\B\[3\] ), .Y(n109) );
  INVx1_ASAP7_75t_R U116 ( .A(\B\[2\] ), .Y(n110) );
  INVx1_ASAP7_75t_R U117 ( .A(\B\[1\] ), .Y(n111) );
  INVx1_ASAP7_75t_R U118 ( .A(\B\[0\] ), .Y(n112) );
  NOR2xp33_ASAP7_75t_R U119 ( .A(n98), .B(n104), .Y(\ab\[5\]\[8\] ) );
  NOR2xp33_ASAP7_75t_R U120 ( .A(n98), .B(n105), .Y(\ab\[5\]\[7\] ) );
  NOR2xp33_ASAP7_75t_R U121 ( .A(n98), .B(n106), .Y(\ab\[5\]\[6\] ) );
  NOR2xp33_ASAP7_75t_R U122 ( .A(n98), .B(n107), .Y(\ab\[5\]\[5\] ) );
  NOR2xp33_ASAP7_75t_R U123 ( .A(n98), .B(n108), .Y(\ab\[5\]\[4\] ) );
  NOR2xp33_ASAP7_75t_R U124 ( .A(n98), .B(n109), .Y(\ab\[5\]\[3\] ) );
  NOR2xp33_ASAP7_75t_R U125 ( .A(n98), .B(n110), .Y(\ab\[5\]\[2\] ) );
  NOR2xp33_ASAP7_75t_R U126 ( .A(n98), .B(n111), .Y(\ab\[5\]\[1\] ) );
  NOR2xp33_ASAP7_75t_R U127 ( .A(n98), .B(n112), .Y(\ab\[5\]\[0\] ) );
  NOR2xp33_ASAP7_75t_R U128 ( .A(n104), .B(n99), .Y(\ab\[4\]\[8\] ) );
  NOR2xp33_ASAP7_75t_R U129 ( .A(n105), .B(n99), .Y(\ab\[4\]\[7\] ) );
  NOR2xp33_ASAP7_75t_R U130 ( .A(n106), .B(n99), .Y(\ab\[4\]\[6\] ) );
  NOR2xp33_ASAP7_75t_R U131 ( .A(n107), .B(n99), .Y(\ab\[4\]\[5\] ) );
  NOR2xp33_ASAP7_75t_R U132 ( .A(n108), .B(n99), .Y(\ab\[4\]\[4\] ) );
  NOR2xp33_ASAP7_75t_R U133 ( .A(n109), .B(n99), .Y(\ab\[4\]\[3\] ) );
  NOR2xp33_ASAP7_75t_R U134 ( .A(n110), .B(n99), .Y(\ab\[4\]\[2\] ) );
  NOR2xp33_ASAP7_75t_R U135 ( .A(n111), .B(n99), .Y(\ab\[4\]\[1\] ) );
  NOR2xp33_ASAP7_75t_R U136 ( .A(n112), .B(n99), .Y(\ab\[4\]\[0\] ) );
  NOR2xp33_ASAP7_75t_R U137 ( .A(n104), .B(n100), .Y(\ab\[3\]\[8\] ) );
  NOR2xp33_ASAP7_75t_R U138 ( .A(n105), .B(n100), .Y(\ab\[3\]\[7\] ) );
  NOR2xp33_ASAP7_75t_R U139 ( .A(n106), .B(n100), .Y(\ab\[3\]\[6\] ) );
  NOR2xp33_ASAP7_75t_R U140 ( .A(n107), .B(n100), .Y(\ab\[3\]\[5\] ) );
  NOR2xp33_ASAP7_75t_R U141 ( .A(n108), .B(n100), .Y(\ab\[3\]\[4\] ) );
  NOR2xp33_ASAP7_75t_R U142 ( .A(n109), .B(n100), .Y(\ab\[3\]\[3\] ) );
  NOR2xp33_ASAP7_75t_R U143 ( .A(n110), .B(n100), .Y(\ab\[3\]\[2\] ) );
  NOR2xp33_ASAP7_75t_R U144 ( .A(n111), .B(n100), .Y(\ab\[3\]\[1\] ) );
  NOR2xp33_ASAP7_75t_R U145 ( .A(n112), .B(n100), .Y(\ab\[3\]\[0\] ) );
  NOR2xp33_ASAP7_75t_R U146 ( .A(n104), .B(n101), .Y(\ab\[2\]\[8\] ) );
  NOR2xp33_ASAP7_75t_R U147 ( .A(n105), .B(n101), .Y(\ab\[2\]\[7\] ) );
  NOR2xp33_ASAP7_75t_R U148 ( .A(n106), .B(n101), .Y(\ab\[2\]\[6\] ) );
  NOR2xp33_ASAP7_75t_R U149 ( .A(n107), .B(n101), .Y(\ab\[2\]\[5\] ) );
  NOR2xp33_ASAP7_75t_R U150 ( .A(n108), .B(n101), .Y(\ab\[2\]\[4\] ) );
  NOR2xp33_ASAP7_75t_R U151 ( .A(n109), .B(n101), .Y(\ab\[2\]\[3\] ) );
  NOR2xp33_ASAP7_75t_R U152 ( .A(n110), .B(n101), .Y(\ab\[2\]\[2\] ) );
  NOR2xp33_ASAP7_75t_R U153 ( .A(n111), .B(n101), .Y(\ab\[2\]\[1\] ) );
  NOR2xp33_ASAP7_75t_R U154 ( .A(n112), .B(n101), .Y(\ab\[2\]\[0\] ) );
  NOR2xp33_ASAP7_75t_R U155 ( .A(n104), .B(n102), .Y(\ab\[1\]\[8\] ) );
  NOR2xp33_ASAP7_75t_R U156 ( .A(n108), .B(n102), .Y(\ab\[1\]\[4\] ) );
  NOR2xp33_ASAP7_75t_R U157 ( .A(n109), .B(n102), .Y(\ab\[1\]\[3\] ) );
  NOR2xp33_ASAP7_75t_R U158 ( .A(n110), .B(n102), .Y(\ab\[1\]\[2\] ) );
  NOR2xp33_ASAP7_75t_R U159 ( .A(n111), .B(n102), .Y(\ab\[1\]\[1\] ) );
  NOR2xp33_ASAP7_75t_R U160 ( .A(n112), .B(n102), .Y(\ab\[1\]\[0\] ) );
  NOR2xp33_ASAP7_75t_R U161 ( .A(n106), .B(n103), .Y(\ab\[0\]\[6\] ) );
  NOR2xp33_ASAP7_75t_R U162 ( .A(n107), .B(n103), .Y(\ab\[0\]\[5\] ) );
  NOR2xp33_ASAP7_75t_R U163 ( .A(n108), .B(n103), .Y(\ab\[0\]\[4\] ) );
  NOR2xp33_ASAP7_75t_R U164 ( .A(n109), .B(n103), .Y(\ab\[0\]\[3\] ) );
  NOR2xp33_ASAP7_75t_R U165 ( .A(n110), .B(n103), .Y(\ab\[0\]\[2\] ) );
  NOR2xp33_ASAP7_75t_R U166 ( .A(n111), .B(n103), .Y(\ab\[0\]\[1\] ) );
  NOR2xp33_ASAP7_75t_R U167 ( .A(n112), .B(n103), .Y(\PRODUCT\[0\] ) );
  fp32_exp_DW01_add_21 FS_1 ( .A({net27181, n31, n29, n28, n26, n9, n18, n3, 
        n30, n82, n89, n94, n97}), .B({n32, n15, n14, n13, n11, n23, n4, n17, 
        net27181, net27181, net27181, net27181, net27181}), .CI(net27181), 
        .SUM({\PRODUCT\[14\] , \PRODUCT\[13\] , \PRODUCT\[12\] , 
        \PRODUCT\[11\] , \PRODUCT\[10\] , \PRODUCT\[9\] , \PRODUCT\[8\] , 
        \PRODUCT\[7\] , \PRODUCT\[6\] , \PRODUCT\[5\] , \PRODUCT\[4\] , 
        \PRODUCT\[3\] , \PRODUCT\[2\] }) );
endmodule


module fp32_exp_DW01_add_20 ( .A({\A\[12\] , \A\[11\] , \A\[10\] , \A\[9\] , 
        \A\[8\] , \A\[7\] , \A\[6\] , \A\[5\] , \A\[4\] , \A\[3\] , \A\[2\] , 
        \A\[1\] , \A\[0\] }), .B({\B\[12\] , \B\[11\] , \B\[10\] , \B\[9\] , 
        \B\[8\] , \B\[7\] , \B\[6\] , \B\[5\] , \B\[4\] , \B\[3\] , \B\[2\] , 
        \B\[1\] , \B\[0\] }), CI, .SUM({\SUM\[12\] , \SUM\[11\] , \SUM\[10\] , 
        \SUM\[9\] , \SUM\[8\] , \SUM\[7\] , \SUM\[6\] , \SUM\[5\] , \SUM\[4\] , 
        \SUM\[3\] , \SUM\[2\] , \SUM\[1\] , \SUM\[0\] }), CO );
  input \A\[12\] , \A\[11\] , \A\[10\] , \A\[9\] , \A\[8\] , \A\[7\] ,
         \A\[6\] , \A\[5\] , \A\[4\] , \A\[3\] , \A\[2\] , \A\[1\] , \A\[0\] ,
         \B\[12\] , \B\[11\] , \B\[10\] , \B\[9\] , \B\[8\] , \B\[7\] ,
         \B\[6\] , \B\[5\] , \B\[4\] , \B\[3\] , \B\[2\] , \B\[1\] , \B\[0\] ,
         CI;
  output \SUM\[12\] , \SUM\[11\] , \SUM\[10\] , \SUM\[9\] , \SUM\[8\] ,
         \SUM\[7\] , \SUM\[6\] , \SUM\[5\] , \SUM\[4\] , \SUM\[3\] ,
         \SUM\[2\] , \SUM\[1\] , \SUM\[0\] , CO;
  wire   \A\[4\] , \A\[3\] , \A\[2\] , \A\[1\] , \A\[0\] , n1, n3, n4, n5, n6,
         n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20,
         n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34;
  assign \SUM\[4\]  = \A\[4\] ;
  assign \SUM\[3\]  = \A\[3\] ;
  assign \SUM\[2\]  = \A\[2\] ;
  assign \SUM\[1\]  = \A\[1\] ;
  assign \SUM\[0\]  = \A\[0\] ;

  AOI21xp5_ASAP7_75t_R U2 ( .A1(n5), .A2(n31), .B(n32), .Y(n27) );
  OAI21xp5_ASAP7_75t_R U3 ( .A1(n12), .A2(n14), .B(n13), .Y(n31) );
  OAI21xp5_ASAP7_75t_R U4 ( .A1(n22), .A2(n20), .B(n21), .Y(n15) );
  AOI21xp5_ASAP7_75t_R U5 ( .A1(n15), .A2(n7), .B(n17), .Y(n12) );
  AOI21xp5_ASAP7_75t_R U6 ( .A1(n9), .A2(n10), .B(n24), .Y(n20) );
  NOR2xp33_ASAP7_75t_R U7 ( .A(\B\[6\] ), .B(\A\[6\] ), .Y(n25) );
  NAND2xp5_ASAP7_75t_R U8 ( .A(\B\[5\] ), .B(\A\[5\] ), .Y(n26) );
  OAI21xp5_ASAP7_75t_R U9 ( .A1(n27), .A2(n28), .B(n29), .Y(n3) );
  OR2x2_ASAP7_75t_R U10 ( .A(\B\[5\] ), .B(\A\[5\] ), .Y(n1) );
  AND2x2_ASAP7_75t_R U11 ( .A(n1), .B(n26), .Y(\SUM\[5\] ) );
  XOR2xp5_ASAP7_75t_R U12 ( .A(\B\[12\] ), .B(n3), .Y(\SUM\[12\] ) );
  INVx1_ASAP7_75t_R U13 ( .A(n28), .Y(n4) );
  INVx1_ASAP7_75t_R U14 ( .A(n33), .Y(n5) );
  INVx1_ASAP7_75t_R U15 ( .A(n14), .Y(n6) );
  INVx1_ASAP7_75t_R U16 ( .A(n18), .Y(n7) );
  INVx1_ASAP7_75t_R U17 ( .A(n22), .Y(n8) );
  INVx1_ASAP7_75t_R U18 ( .A(n25), .Y(n9) );
  INVx1_ASAP7_75t_R U19 ( .A(n26), .Y(n10) );
  XOR2xp5_ASAP7_75t_R U20 ( .A(n11), .B(n12), .Y(\SUM\[9\] ) );
  NAND2xp33_ASAP7_75t_R U21 ( .A(n6), .B(n13), .Y(n11) );
  XOR2xp5_ASAP7_75t_R U22 ( .A(n15), .B(n16), .Y(\SUM\[8\] ) );
  NOR2xp33_ASAP7_75t_R U23 ( .A(n17), .B(n18), .Y(n16) );
  XOR2xp5_ASAP7_75t_R U24 ( .A(n19), .B(n20), .Y(\SUM\[7\] ) );
  NAND2xp33_ASAP7_75t_R U25 ( .A(n8), .B(n21), .Y(n19) );
  XOR2xp5_ASAP7_75t_R U26 ( .A(n10), .B(n23), .Y(\SUM\[6\] ) );
  NOR2xp33_ASAP7_75t_R U27 ( .A(n24), .B(n25), .Y(n23) );
  XOR2xp5_ASAP7_75t_R U28 ( .A(n30), .B(n27), .Y(\SUM\[11\] ) );
  NAND2xp33_ASAP7_75t_R U29 ( .A(n4), .B(n29), .Y(n30) );
  NAND2xp33_ASAP7_75t_R U30 ( .A(\B\[11\] ), .B(\A\[11\] ), .Y(n29) );
  NOR2xp33_ASAP7_75t_R U31 ( .A(\B\[11\] ), .B(\A\[11\] ), .Y(n28) );
  XOR2xp5_ASAP7_75t_R U32 ( .A(n31), .B(n34), .Y(\SUM\[10\] ) );
  NOR2xp33_ASAP7_75t_R U33 ( .A(n32), .B(n33), .Y(n34) );
  NOR2xp33_ASAP7_75t_R U34 ( .A(\B\[10\] ), .B(\A\[10\] ), .Y(n33) );
  AND2x2_ASAP7_75t_R U35 ( .A(\B\[10\] ), .B(\A\[10\] ), .Y(n32) );
  NAND2xp33_ASAP7_75t_R U36 ( .A(\B\[9\] ), .B(\A\[9\] ), .Y(n13) );
  NOR2xp33_ASAP7_75t_R U37 ( .A(\B\[9\] ), .B(\A\[9\] ), .Y(n14) );
  AND2x2_ASAP7_75t_R U38 ( .A(\B\[8\] ), .B(\A\[8\] ), .Y(n17) );
  NOR2xp33_ASAP7_75t_R U39 ( .A(\B\[8\] ), .B(\A\[8\] ), .Y(n18) );
  NAND2xp33_ASAP7_75t_R U40 ( .A(\B\[7\] ), .B(\A\[7\] ), .Y(n21) );
  AND2x2_ASAP7_75t_R U41 ( .A(\B\[6\] ), .B(\A\[6\] ), .Y(n24) );
  NOR2xp33_ASAP7_75t_R U42 ( .A(\B\[7\] ), .B(\A\[7\] ), .Y(n22) );
endmodule


module fp32_exp_DW02_mult_6 ( .A({\A\[5\] , \A\[4\] , \A\[3\] , \A\[2\] , 
        \A\[1\] , \A\[0\] }), .B({\B\[8\] , \B\[7\] , \B\[6\] , \B\[5\] , 
        \B\[4\] , \B\[3\] , \B\[2\] , \B\[1\] , \B\[0\] }), TC, .PRODUCT({
        \PRODUCT\[14\] , \PRODUCT\[13\] , \PRODUCT\[12\] , \PRODUCT\[11\] , 
        \PRODUCT\[10\] , \PRODUCT\[9\] , \PRODUCT\[8\] , \PRODUCT\[7\] , 
        \PRODUCT\[6\] , \PRODUCT\[5\] , \PRODUCT\[4\] , \PRODUCT\[3\] , 
        \PRODUCT\[2\] , \PRODUCT\[1\] , \PRODUCT\[0\] }) );
  input \A\[5\] , \A\[4\] , \A\[3\] , \A\[2\] , \A\[1\] , \A\[0\] , \B\[8\] ,
         \B\[7\] , \B\[6\] , \B\[5\] , \B\[4\] , \B\[3\] , \B\[2\] , \B\[1\] ,
         \B\[0\] , TC;
  output \PRODUCT\[14\] , \PRODUCT\[13\] , \PRODUCT\[12\] , \PRODUCT\[11\] ,
         \PRODUCT\[10\] , \PRODUCT\[9\] , \PRODUCT\[8\] , \PRODUCT\[7\] ,
         \PRODUCT\[6\] , \PRODUCT\[5\] , \PRODUCT\[4\] , \PRODUCT\[3\] ,
         \PRODUCT\[2\] , \PRODUCT\[1\] , \PRODUCT\[0\] ;
  wire   net27173, \ab\[5\]\[8\] , \ab\[5\]\[7\] , \ab\[5\]\[6\] ,
         \ab\[5\]\[5\] , \ab\[5\]\[4\] , \ab\[5\]\[3\] , \ab\[5\]\[2\] ,
         \ab\[5\]\[1\] , \ab\[5\]\[0\] , \ab\[4\]\[8\] , \ab\[4\]\[7\] ,
         \ab\[4\]\[6\] , \ab\[4\]\[5\] , \ab\[4\]\[4\] , \ab\[4\]\[3\] ,
         \ab\[4\]\[2\] , \ab\[4\]\[1\] , \ab\[4\]\[0\] , \ab\[3\]\[8\] ,
         \ab\[3\]\[7\] , \ab\[3\]\[6\] , \ab\[3\]\[5\] , \ab\[3\]\[4\] ,
         \ab\[3\]\[3\] , \ab\[3\]\[2\] , \ab\[3\]\[1\] , \ab\[3\]\[0\] ,
         \ab\[2\]\[8\] , \ab\[2\]\[7\] , \ab\[2\]\[6\] , \ab\[2\]\[5\] ,
         \ab\[2\]\[4\] , \ab\[2\]\[3\] , \ab\[2\]\[2\] , \ab\[2\]\[1\] ,
         \ab\[2\]\[0\] , \ab\[1\]\[8\] , \ab\[1\]\[7\] , \ab\[1\]\[6\] ,
         \ab\[1\]\[5\] , \ab\[1\]\[4\] , \ab\[1\]\[3\] , \ab\[1\]\[2\] ,
         \ab\[1\]\[1\] , \ab\[1\]\[0\] , \ab\[0\]\[8\] , \ab\[0\]\[7\] ,
         \ab\[0\]\[6\] , \ab\[0\]\[5\] , \ab\[0\]\[4\] , \ab\[0\]\[3\] ,
         \ab\[0\]\[2\] , \ab\[0\]\[1\] , n2, n3, n4, n5, n6, n7, n8, n9, n10,
         n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24,
         n25, n26, n27, n28, n29, n30, n31, n32, n34, n35, n36, n37, n38, n39,
         n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53,
         n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67,
         n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81,
         n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95,
         n96, n97, n98, n99, n100, n101, n102, n103, n104, n105, n106, n107,
         n108, n109, n110, n111, n112, n113, n114, n115, n116, n117, n118,
         n119, n120, n121, n122, n123, n124, n125, n126, n127, n128, n129,
         n130, n131, n132, n133, n134, n135, n136, n137, n138, n139, n140,
         n141, n142, n143, n144, n145, n146, n147, n148, n149, n150, n151,
         n152, n153, n154, n155, n156, n157, n158, n159, n160, n161, n162,
         n163, n164, n165, n166, n167, n168, n169, n170, n171, n172, n173,
         n174, n175, n176;

  FAx1_ASAP7_75t_R S4_0 ( .A(\ab\[5\]\[0\] ), .B(n88), .CI(n83), .CON(n113), 
        .SN(n114) );
  FAx1_ASAP7_75t_R S4_1 ( .A(\ab\[5\]\[1\] ), .B(n80), .CI(n75), .CON(n115), 
        .SN(n116) );
  FAx1_ASAP7_75t_R S4_2 ( .A(\ab\[5\]\[2\] ), .B(n72), .CI(n67), .CON(n117), 
        .SN(n118) );
  FAx1_ASAP7_75t_R S4_3 ( .A(\ab\[5\]\[3\] ), .B(n64), .CI(n59), .CON(n119), 
        .SN(n120) );
  FAx1_ASAP7_75t_R S4_4 ( .A(\ab\[5\]\[4\] ), .B(n56), .CI(n51), .CON(n121), 
        .SN(n122) );
  FAx1_ASAP7_75t_R S4_5 ( .A(\ab\[5\]\[5\] ), .B(n48), .CI(n44), .CON(n123), 
        .SN(n124) );
  FAx1_ASAP7_75t_R S4_6 ( .A(\ab\[5\]\[6\] ), .B(n41), .CI(n39), .CON(n125), 
        .SN(n126) );
  FAx1_ASAP7_75t_R S5_7 ( .A(\ab\[5\]\[7\] ), .B(n36), .CI(\ab\[4\]\[8\] ), 
        .CON(n127), .SN(n128) );
  FAx1_ASAP7_75t_R S1_4_0 ( .A(\ab\[4\]\[0\] ), .B(n93), .CI(n90), .CON(n129), 
        .SN(n130) );
  FAx1_ASAP7_75t_R S2_4_1 ( .A(\ab\[4\]\[1\] ), .B(n87), .CI(n84), .CON(n131), 
        .SN(n132) );
  FAx1_ASAP7_75t_R S2_4_2 ( .A(\ab\[4\]\[2\] ), .B(n79), .CI(n76), .CON(n133), 
        .SN(n134) );
  FAx1_ASAP7_75t_R S2_4_3 ( .A(\ab\[4\]\[3\] ), .B(n71), .CI(n68), .CON(n135), 
        .SN(n136) );
  FAx1_ASAP7_75t_R S2_4_4 ( .A(\ab\[4\]\[4\] ), .B(n63), .CI(n60), .CON(n137), 
        .SN(n138) );
  FAx1_ASAP7_75t_R S2_4_5 ( .A(\ab\[4\]\[5\] ), .B(n55), .CI(n52), .CON(n139), 
        .SN(n140) );
  FAx1_ASAP7_75t_R S2_4_6 ( .A(\ab\[4\]\[6\] ), .B(n47), .CI(n45), .CON(n141), 
        .SN(n142) );
  FAx1_ASAP7_75t_R S3_4_7 ( .A(\ab\[4\]\[7\] ), .B(n40), .CI(\ab\[3\]\[8\] ), 
        .CON(n143), .SN(n144) );
  FAx1_ASAP7_75t_R S1_3_0 ( .A(\ab\[3\]\[0\] ), .B(n96), .CI(n95), .CON(n145), 
        .SN(n146) );
  FAx1_ASAP7_75t_R S2_3_1 ( .A(\ab\[3\]\[1\] ), .B(n92), .CI(n91), .CON(n147), 
        .SN(n148) );
  FAx1_ASAP7_75t_R S2_3_2 ( .A(\ab\[3\]\[2\] ), .B(n86), .CI(n85), .CON(n149), 
        .SN(n150) );
  FAx1_ASAP7_75t_R S2_3_3 ( .A(\ab\[3\]\[3\] ), .B(n78), .CI(n77), .CON(n151), 
        .SN(n152) );
  FAx1_ASAP7_75t_R S2_3_4 ( .A(\ab\[3\]\[4\] ), .B(n70), .CI(n69), .CON(n153), 
        .SN(n154) );
  FAx1_ASAP7_75t_R S2_3_5 ( .A(\ab\[3\]\[5\] ), .B(n62), .CI(n61), .CON(n155), 
        .SN(n156) );
  FAx1_ASAP7_75t_R S2_3_6 ( .A(\ab\[3\]\[6\] ), .B(n54), .CI(n53), .CON(n157), 
        .SN(n158) );
  FAx1_ASAP7_75t_R S3_3_7 ( .A(\ab\[3\]\[7\] ), .B(n46), .CI(\ab\[2\]\[8\] ), 
        .CON(n159), .SN(n160) );
  FAx1_ASAP7_75t_R S1_2_0 ( .A(\ab\[2\]\[0\] ), .B(n12), .CI(n27), .CON(n161), 
        .SN(n162) );
  FAx1_ASAP7_75t_R S2_2_1 ( .A(\ab\[2\]\[1\] ), .B(n25), .CI(n10), .CON(n163), 
        .SN(n164) );
  FAx1_ASAP7_75t_R S2_2_2 ( .A(\ab\[2\]\[2\] ), .B(n24), .CI(n9), .CON(n165), 
        .SN(n166) );
  FAx1_ASAP7_75t_R S2_2_3 ( .A(\ab\[2\]\[3\] ), .B(n21), .CI(n7), .CON(n167), 
        .SN(n168) );
  FAx1_ASAP7_75t_R S2_2_4 ( .A(\ab\[2\]\[4\] ), .B(n18), .CI(n4), .CON(n169), 
        .SN(n170) );
  FAx1_ASAP7_75t_R S2_2_5 ( .A(\ab\[2\]\[5\] ), .B(n2), .CI(n16), .CON(n171), 
        .SN(n172) );
  FAx1_ASAP7_75t_R S2_2_6 ( .A(\ab\[2\]\[6\] ), .B(n19), .CI(n6), .CON(n173), 
        .SN(n174) );
  FAx1_ASAP7_75t_R S3_2_7 ( .A(\ab\[2\]\[7\] ), .B(n22), .CI(\ab\[1\]\[8\] ), 
        .CON(n175), .SN(n176) );
  INVx1_ASAP7_75t_R U2 ( .A(\A\[5\] ), .Y(n98) );
  NOR2xp33_ASAP7_75t_R U3 ( .A(n106), .B(n102), .Y(\ab\[1\]\[6\] ) );
  NOR2xp33_ASAP7_75t_R U4 ( .A(n105), .B(n103), .Y(\ab\[0\]\[7\] ) );
  NOR2xp33_ASAP7_75t_R U5 ( .A(n105), .B(n102), .Y(\ab\[1\]\[7\] ) );
  NOR2xp33_ASAP7_75t_R U6 ( .A(n104), .B(n103), .Y(\ab\[0\]\[8\] ) );
  NOR2xp33_ASAP7_75t_R U7 ( .A(n107), .B(n102), .Y(\ab\[1\]\[5\] ) );
  INVx1_ASAP7_75t_R U8 ( .A(\A\[4\] ), .Y(n99) );
  INVx1_ASAP7_75t_R U9 ( .A(\A\[3\] ), .Y(n100) );
  INVx1_ASAP7_75t_R U10 ( .A(\A\[2\] ), .Y(n101) );
  INVx1_ASAP7_75t_R U11 ( .A(\A\[1\] ), .Y(n102) );
  INVx1_ASAP7_75t_R U12 ( .A(\A\[0\] ), .Y(n103) );
  AND2x2_ASAP7_75t_R U13 ( .A(\ab\[0\]\[6\] ), .B(\ab\[1\]\[5\] ), .Y(n2) );
  XOR2xp5_ASAP7_75t_R U14 ( .A(n66), .B(n73), .Y(n3) );
  XOR2xp5_ASAP7_75t_R U15 ( .A(\ab\[1\]\[5\] ), .B(\ab\[0\]\[6\] ), .Y(n4) );
  XOR2xp5_ASAP7_75t_R U16 ( .A(n58), .B(n65), .Y(n5) );
  XOR2xp5_ASAP7_75t_R U17 ( .A(\ab\[1\]\[7\] ), .B(\ab\[0\]\[8\] ), .Y(n6) );
  XOR2xp5_ASAP7_75t_R U18 ( .A(\ab\[1\]\[4\] ), .B(\ab\[0\]\[5\] ), .Y(n7) );
  XOR2xp5_ASAP7_75t_R U19 ( .A(n50), .B(n57), .Y(n8) );
  XOR2xp5_ASAP7_75t_R U20 ( .A(\ab\[1\]\[3\] ), .B(\ab\[0\]\[4\] ), .Y(n9) );
  XOR2xp5_ASAP7_75t_R U21 ( .A(\ab\[1\]\[2\] ), .B(\ab\[0\]\[3\] ), .Y(n10) );
  AND2x2_ASAP7_75t_R U22 ( .A(n57), .B(n50), .Y(n11) );
  AND2x2_ASAP7_75t_R U23 ( .A(\ab\[0\]\[1\] ), .B(\ab\[1\]\[0\] ), .Y(n12) );
  AND2x2_ASAP7_75t_R U24 ( .A(n49), .B(n43), .Y(n13) );
  AND2x2_ASAP7_75t_R U25 ( .A(n42), .B(n38), .Y(n14) );
  AND2x2_ASAP7_75t_R U26 ( .A(n37), .B(n35), .Y(n15) );
  XOR2xp5_ASAP7_75t_R U27 ( .A(\ab\[1\]\[6\] ), .B(\ab\[0\]\[7\] ), .Y(n16) );
  AND2x2_ASAP7_75t_R U28 ( .A(n81), .B(n74), .Y(n17) );
  AND2x2_ASAP7_75t_R U29 ( .A(\ab\[0\]\[5\] ), .B(\ab\[1\]\[4\] ), .Y(n18) );
  AND2x2_ASAP7_75t_R U30 ( .A(\ab\[0\]\[7\] ), .B(\ab\[1\]\[6\] ), .Y(n19) );
  AND2x2_ASAP7_75t_R U31 ( .A(n73), .B(n66), .Y(n20) );
  AND2x2_ASAP7_75t_R U32 ( .A(\ab\[0\]\[4\] ), .B(\ab\[1\]\[3\] ), .Y(n21) );
  AND2x2_ASAP7_75t_R U33 ( .A(\ab\[0\]\[8\] ), .B(\ab\[1\]\[7\] ), .Y(n22) );
  AND2x2_ASAP7_75t_R U34 ( .A(n65), .B(n58), .Y(n23) );
  AND2x2_ASAP7_75t_R U35 ( .A(\ab\[0\]\[3\] ), .B(\ab\[1\]\[2\] ), .Y(n24) );
  AND2x2_ASAP7_75t_R U36 ( .A(\ab\[0\]\[2\] ), .B(\ab\[1\]\[1\] ), .Y(n25) );
  XOR2xp5_ASAP7_75t_R U37 ( .A(n43), .B(n49), .Y(n26) );
  XOR2xp5_ASAP7_75t_R U38 ( .A(\ab\[1\]\[1\] ), .B(\ab\[0\]\[2\] ), .Y(n27) );
  XOR2xp5_ASAP7_75t_R U39 ( .A(n38), .B(n42), .Y(n28) );
  XOR2xp5_ASAP7_75t_R U40 ( .A(n35), .B(n37), .Y(n29) );
  XOR2xp5_ASAP7_75t_R U41 ( .A(\ab\[5\]\[8\] ), .B(n34), .Y(n30) );
  XOR2xp5_ASAP7_75t_R U42 ( .A(n74), .B(n81), .Y(n31) );
  AND2x2_ASAP7_75t_R U43 ( .A(n34), .B(\ab\[5\]\[8\] ), .Y(n32) );
  XOR2xp5_ASAP7_75t_R U44 ( .A(\ab\[1\]\[0\] ), .B(\ab\[0\]\[1\] ), .Y(
        \PRODUCT\[1\] ) );
  TIELOx1_ASAP7_75t_R U45 ( .L(net27173) );
  INVxp67_ASAP7_75t_R U46 ( .A(\B\[7\] ), .Y(n105) );
  INVx1_ASAP7_75t_R U47 ( .A(n127), .Y(n34) );
  INVx1_ASAP7_75t_R U48 ( .A(n128), .Y(n35) );
  INVx1_ASAP7_75t_R U49 ( .A(n143), .Y(n36) );
  INVx1_ASAP7_75t_R U50 ( .A(n125), .Y(n37) );
  INVx1_ASAP7_75t_R U51 ( .A(n126), .Y(n38) );
  INVx1_ASAP7_75t_R U52 ( .A(n144), .Y(n39) );
  INVx1_ASAP7_75t_R U53 ( .A(n159), .Y(n40) );
  INVx1_ASAP7_75t_R U54 ( .A(n141), .Y(n41) );
  INVx1_ASAP7_75t_R U55 ( .A(n123), .Y(n42) );
  INVx1_ASAP7_75t_R U56 ( .A(n124), .Y(n43) );
  INVx1_ASAP7_75t_R U57 ( .A(n142), .Y(n44) );
  INVx1_ASAP7_75t_R U58 ( .A(n160), .Y(n45) );
  INVx1_ASAP7_75t_R U59 ( .A(n175), .Y(n46) );
  INVx1_ASAP7_75t_R U60 ( .A(n157), .Y(n47) );
  INVx1_ASAP7_75t_R U61 ( .A(n139), .Y(n48) );
  INVx1_ASAP7_75t_R U62 ( .A(n121), .Y(n49) );
  INVx1_ASAP7_75t_R U63 ( .A(n122), .Y(n50) );
  INVx1_ASAP7_75t_R U64 ( .A(n140), .Y(n51) );
  INVx1_ASAP7_75t_R U65 ( .A(n158), .Y(n52) );
  INVx1_ASAP7_75t_R U66 ( .A(n176), .Y(n53) );
  INVx1_ASAP7_75t_R U67 ( .A(n173), .Y(n54) );
  INVx1_ASAP7_75t_R U68 ( .A(n155), .Y(n55) );
  INVx1_ASAP7_75t_R U69 ( .A(n137), .Y(n56) );
  INVx1_ASAP7_75t_R U70 ( .A(n119), .Y(n57) );
  INVx1_ASAP7_75t_R U71 ( .A(n120), .Y(n58) );
  INVx1_ASAP7_75t_R U72 ( .A(n138), .Y(n59) );
  INVx1_ASAP7_75t_R U73 ( .A(n156), .Y(n60) );
  INVx1_ASAP7_75t_R U74 ( .A(n174), .Y(n61) );
  INVx1_ASAP7_75t_R U75 ( .A(n171), .Y(n62) );
  INVx1_ASAP7_75t_R U76 ( .A(n153), .Y(n63) );
  INVx1_ASAP7_75t_R U77 ( .A(n135), .Y(n64) );
  INVx1_ASAP7_75t_R U78 ( .A(n117), .Y(n65) );
  INVx1_ASAP7_75t_R U79 ( .A(n118), .Y(n66) );
  INVx1_ASAP7_75t_R U80 ( .A(n136), .Y(n67) );
  INVx1_ASAP7_75t_R U81 ( .A(n154), .Y(n68) );
  INVx1_ASAP7_75t_R U82 ( .A(n172), .Y(n69) );
  INVx1_ASAP7_75t_R U83 ( .A(n169), .Y(n70) );
  INVx1_ASAP7_75t_R U84 ( .A(n151), .Y(n71) );
  INVx1_ASAP7_75t_R U85 ( .A(n133), .Y(n72) );
  INVx1_ASAP7_75t_R U86 ( .A(n115), .Y(n73) );
  INVx1_ASAP7_75t_R U87 ( .A(n116), .Y(n74) );
  INVx1_ASAP7_75t_R U88 ( .A(n134), .Y(n75) );
  INVx1_ASAP7_75t_R U89 ( .A(n152), .Y(n76) );
  INVx1_ASAP7_75t_R U90 ( .A(n170), .Y(n77) );
  INVx1_ASAP7_75t_R U91 ( .A(n167), .Y(n78) );
  INVx1_ASAP7_75t_R U92 ( .A(n149), .Y(n79) );
  INVx1_ASAP7_75t_R U93 ( .A(n131), .Y(n80) );
  INVx1_ASAP7_75t_R U94 ( .A(n113), .Y(n81) );
  INVx1_ASAP7_75t_R U95 ( .A(n114), .Y(n82) );
  INVx1_ASAP7_75t_R U96 ( .A(n132), .Y(n83) );
  INVx1_ASAP7_75t_R U97 ( .A(n150), .Y(n84) );
  INVx1_ASAP7_75t_R U98 ( .A(n168), .Y(n85) );
  INVx1_ASAP7_75t_R U99 ( .A(n165), .Y(n86) );
  INVx1_ASAP7_75t_R U100 ( .A(n147), .Y(n87) );
  INVx1_ASAP7_75t_R U101 ( .A(n129), .Y(n88) );
  INVx1_ASAP7_75t_R U102 ( .A(n130), .Y(n89) );
  INVx1_ASAP7_75t_R U103 ( .A(n148), .Y(n90) );
  INVx1_ASAP7_75t_R U104 ( .A(n166), .Y(n91) );
  INVx1_ASAP7_75t_R U105 ( .A(n163), .Y(n92) );
  INVx1_ASAP7_75t_R U106 ( .A(n145), .Y(n93) );
  INVx1_ASAP7_75t_R U107 ( .A(n146), .Y(n94) );
  INVx1_ASAP7_75t_R U108 ( .A(n164), .Y(n95) );
  INVx1_ASAP7_75t_R U109 ( .A(n161), .Y(n96) );
  INVx1_ASAP7_75t_R U110 ( .A(n162), .Y(n97) );
  INVx1_ASAP7_75t_R U111 ( .A(\B\[8\] ), .Y(n104) );
  INVx1_ASAP7_75t_R U112 ( .A(\B\[6\] ), .Y(n106) );
  INVx1_ASAP7_75t_R U113 ( .A(\B\[5\] ), .Y(n107) );
  INVx1_ASAP7_75t_R U114 ( .A(\B\[4\] ), .Y(n108) );
  INVx1_ASAP7_75t_R U115 ( .A(\B\[3\] ), .Y(n109) );
  INVx1_ASAP7_75t_R U116 ( .A(\B\[2\] ), .Y(n110) );
  INVx1_ASAP7_75t_R U117 ( .A(\B\[1\] ), .Y(n111) );
  INVx1_ASAP7_75t_R U118 ( .A(\B\[0\] ), .Y(n112) );
  NOR2xp33_ASAP7_75t_R U119 ( .A(n98), .B(n104), .Y(\ab\[5\]\[8\] ) );
  NOR2xp33_ASAP7_75t_R U120 ( .A(n98), .B(n105), .Y(\ab\[5\]\[7\] ) );
  NOR2xp33_ASAP7_75t_R U121 ( .A(n98), .B(n106), .Y(\ab\[5\]\[6\] ) );
  NOR2xp33_ASAP7_75t_R U122 ( .A(n98), .B(n107), .Y(\ab\[5\]\[5\] ) );
  NOR2xp33_ASAP7_75t_R U123 ( .A(n98), .B(n108), .Y(\ab\[5\]\[4\] ) );
  NOR2xp33_ASAP7_75t_R U124 ( .A(n98), .B(n109), .Y(\ab\[5\]\[3\] ) );
  NOR2xp33_ASAP7_75t_R U125 ( .A(n98), .B(n110), .Y(\ab\[5\]\[2\] ) );
  NOR2xp33_ASAP7_75t_R U126 ( .A(n98), .B(n111), .Y(\ab\[5\]\[1\] ) );
  NOR2xp33_ASAP7_75t_R U127 ( .A(n98), .B(n112), .Y(\ab\[5\]\[0\] ) );
  NOR2xp33_ASAP7_75t_R U128 ( .A(n104), .B(n99), .Y(\ab\[4\]\[8\] ) );
  NOR2xp33_ASAP7_75t_R U129 ( .A(n105), .B(n99), .Y(\ab\[4\]\[7\] ) );
  NOR2xp33_ASAP7_75t_R U130 ( .A(n106), .B(n99), .Y(\ab\[4\]\[6\] ) );
  NOR2xp33_ASAP7_75t_R U131 ( .A(n107), .B(n99), .Y(\ab\[4\]\[5\] ) );
  NOR2xp33_ASAP7_75t_R U132 ( .A(n108), .B(n99), .Y(\ab\[4\]\[4\] ) );
  NOR2xp33_ASAP7_75t_R U133 ( .A(n109), .B(n99), .Y(\ab\[4\]\[3\] ) );
  NOR2xp33_ASAP7_75t_R U134 ( .A(n110), .B(n99), .Y(\ab\[4\]\[2\] ) );
  NOR2xp33_ASAP7_75t_R U135 ( .A(n111), .B(n99), .Y(\ab\[4\]\[1\] ) );
  NOR2xp33_ASAP7_75t_R U136 ( .A(n112), .B(n99), .Y(\ab\[4\]\[0\] ) );
  NOR2xp33_ASAP7_75t_R U137 ( .A(n104), .B(n100), .Y(\ab\[3\]\[8\] ) );
  NOR2xp33_ASAP7_75t_R U138 ( .A(n105), .B(n100), .Y(\ab\[3\]\[7\] ) );
  NOR2xp33_ASAP7_75t_R U139 ( .A(n106), .B(n100), .Y(\ab\[3\]\[6\] ) );
  NOR2xp33_ASAP7_75t_R U140 ( .A(n107), .B(n100), .Y(\ab\[3\]\[5\] ) );
  NOR2xp33_ASAP7_75t_R U141 ( .A(n108), .B(n100), .Y(\ab\[3\]\[4\] ) );
  NOR2xp33_ASAP7_75t_R U142 ( .A(n109), .B(n100), .Y(\ab\[3\]\[3\] ) );
  NOR2xp33_ASAP7_75t_R U143 ( .A(n110), .B(n100), .Y(\ab\[3\]\[2\] ) );
  NOR2xp33_ASAP7_75t_R U144 ( .A(n111), .B(n100), .Y(\ab\[3\]\[1\] ) );
  NOR2xp33_ASAP7_75t_R U145 ( .A(n112), .B(n100), .Y(\ab\[3\]\[0\] ) );
  NOR2xp33_ASAP7_75t_R U146 ( .A(n104), .B(n101), .Y(\ab\[2\]\[8\] ) );
  NOR2xp33_ASAP7_75t_R U147 ( .A(n105), .B(n101), .Y(\ab\[2\]\[7\] ) );
  NOR2xp33_ASAP7_75t_R U148 ( .A(n106), .B(n101), .Y(\ab\[2\]\[6\] ) );
  NOR2xp33_ASAP7_75t_R U149 ( .A(n107), .B(n101), .Y(\ab\[2\]\[5\] ) );
  NOR2xp33_ASAP7_75t_R U150 ( .A(n108), .B(n101), .Y(\ab\[2\]\[4\] ) );
  NOR2xp33_ASAP7_75t_R U151 ( .A(n109), .B(n101), .Y(\ab\[2\]\[3\] ) );
  NOR2xp33_ASAP7_75t_R U152 ( .A(n110), .B(n101), .Y(\ab\[2\]\[2\] ) );
  NOR2xp33_ASAP7_75t_R U153 ( .A(n111), .B(n101), .Y(\ab\[2\]\[1\] ) );
  NOR2xp33_ASAP7_75t_R U154 ( .A(n112), .B(n101), .Y(\ab\[2\]\[0\] ) );
  NOR2xp33_ASAP7_75t_R U155 ( .A(n104), .B(n102), .Y(\ab\[1\]\[8\] ) );
  NOR2xp33_ASAP7_75t_R U156 ( .A(n108), .B(n102), .Y(\ab\[1\]\[4\] ) );
  NOR2xp33_ASAP7_75t_R U157 ( .A(n109), .B(n102), .Y(\ab\[1\]\[3\] ) );
  NOR2xp33_ASAP7_75t_R U158 ( .A(n110), .B(n102), .Y(\ab\[1\]\[2\] ) );
  NOR2xp33_ASAP7_75t_R U159 ( .A(n111), .B(n102), .Y(\ab\[1\]\[1\] ) );
  NOR2xp33_ASAP7_75t_R U160 ( .A(n112), .B(n102), .Y(\ab\[1\]\[0\] ) );
  NOR2xp33_ASAP7_75t_R U161 ( .A(n106), .B(n103), .Y(\ab\[0\]\[6\] ) );
  NOR2xp33_ASAP7_75t_R U162 ( .A(n107), .B(n103), .Y(\ab\[0\]\[5\] ) );
  NOR2xp33_ASAP7_75t_R U163 ( .A(n108), .B(n103), .Y(\ab\[0\]\[4\] ) );
  NOR2xp33_ASAP7_75t_R U164 ( .A(n109), .B(n103), .Y(\ab\[0\]\[3\] ) );
  NOR2xp33_ASAP7_75t_R U165 ( .A(n110), .B(n103), .Y(\ab\[0\]\[2\] ) );
  NOR2xp33_ASAP7_75t_R U166 ( .A(n111), .B(n103), .Y(\ab\[0\]\[1\] ) );
  NOR2xp33_ASAP7_75t_R U167 ( .A(n112), .B(n103), .Y(\PRODUCT\[0\] ) );
  fp32_exp_DW01_add_20 FS_1 ( .A({net27173, n30, n29, n28, n26, n8, n5, n3, 
        n31, n82, n89, n94, n97}), .B({n32, n15, n14, n13, n11, n23, n20, n17, 
        net27173, net27173, net27173, net27173, net27173}), .CI(net27173), 
        .SUM({\PRODUCT\[14\] , \PRODUCT\[13\] , \PRODUCT\[12\] , 
        \PRODUCT\[11\] , \PRODUCT\[10\] , \PRODUCT\[9\] , \PRODUCT\[8\] , 
        \PRODUCT\[7\] , \PRODUCT\[6\] , \PRODUCT\[5\] , \PRODUCT\[4\] , 
        \PRODUCT\[3\] , \PRODUCT\[2\] }) );
endmodule


module fp32_exp_DW01_add_19 ( .A({\A\[12\] , \A\[11\] , \A\[10\] , \A\[9\] , 
        \A\[8\] , \A\[7\] , \A\[6\] , \A\[5\] , \A\[4\] , \A\[3\] , \A\[2\] , 
        \A\[1\] , \A\[0\] }), .B({\B\[12\] , \B\[11\] , \B\[10\] , \B\[9\] , 
        \B\[8\] , \B\[7\] , \B\[6\] , \B\[5\] , \B\[4\] , \B\[3\] , \B\[2\] , 
        \B\[1\] , \B\[0\] }), CI, .SUM({\SUM\[12\] , \SUM\[11\] , \SUM\[10\] , 
        \SUM\[9\] , \SUM\[8\] , \SUM\[7\] , \SUM\[6\] , \SUM\[5\] , \SUM\[4\] , 
        \SUM\[3\] , \SUM\[2\] , \SUM\[1\] , \SUM\[0\] }), CO );
  input \A\[12\] , \A\[11\] , \A\[10\] , \A\[9\] , \A\[8\] , \A\[7\] ,
         \A\[6\] , \A\[5\] , \A\[4\] , \A\[3\] , \A\[2\] , \A\[1\] , \A\[0\] ,
         \B\[12\] , \B\[11\] , \B\[10\] , \B\[9\] , \B\[8\] , \B\[7\] ,
         \B\[6\] , \B\[5\] , \B\[4\] , \B\[3\] , \B\[2\] , \B\[1\] , \B\[0\] ,
         CI;
  output \SUM\[12\] , \SUM\[11\] , \SUM\[10\] , \SUM\[9\] , \SUM\[8\] ,
         \SUM\[7\] , \SUM\[6\] , \SUM\[5\] , \SUM\[4\] , \SUM\[3\] ,
         \SUM\[2\] , \SUM\[1\] , \SUM\[0\] , CO;
  wire   \A\[4\] , \A\[3\] , \A\[2\] , \A\[1\] , \A\[0\] , n1, n3, n4, n5, n6,
         n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20,
         n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34;
  assign \SUM\[4\]  = \A\[4\] ;
  assign \SUM\[3\]  = \A\[3\] ;
  assign \SUM\[2\]  = \A\[2\] ;
  assign \SUM\[1\]  = \A\[1\] ;
  assign \SUM\[0\]  = \A\[0\] ;

  OAI21xp5_ASAP7_75t_R U2 ( .A1(n11), .A2(n13), .B(n12), .Y(n31) );
  AOI21xp5_ASAP7_75t_R U3 ( .A1(n4), .A2(n31), .B(n32), .Y(n27) );
  AOI21xp5_ASAP7_75t_R U4 ( .A1(n14), .A2(n6), .B(n16), .Y(n11) );
  OAI21xp5_ASAP7_75t_R U5 ( .A1(n21), .A2(n19), .B(n20), .Y(n14) );
  AOI21xp5_ASAP7_75t_R U6 ( .A1(n8), .A2(n9), .B(n23), .Y(n19) );
  INVx1_ASAP7_75t_R U7 ( .A(n24), .Y(n8) );
  INVx1_ASAP7_75t_R U8 ( .A(n25), .Y(n9) );
  NAND2xp5_ASAP7_75t_R U9 ( .A(\B\[5\] ), .B(\A\[5\] ), .Y(n25) );
  NOR2xp33_ASAP7_75t_R U10 ( .A(\B\[6\] ), .B(\A\[6\] ), .Y(n24) );
  XNOR2xp5_ASAP7_75t_R U11 ( .A(\B\[12\] ), .B(n26), .Y(\SUM\[12\] ) );
  XOR2xp5_ASAP7_75t_R U12 ( .A(n30), .B(n27), .Y(\SUM\[11\] ) );
  XOR2xp5_ASAP7_75t_R U13 ( .A(n31), .B(n34), .Y(\SUM\[10\] ) );
  XOR2xp5_ASAP7_75t_R U14 ( .A(n14), .B(n15), .Y(\SUM\[8\] ) );
  XOR2xp5_ASAP7_75t_R U15 ( .A(n18), .B(n19), .Y(\SUM\[7\] ) );
  OR2x2_ASAP7_75t_R U16 ( .A(\B\[5\] ), .B(\A\[5\] ), .Y(n1) );
  AND2x2_ASAP7_75t_R U17 ( .A(n1), .B(n25), .Y(\SUM\[5\] ) );
  INVx1_ASAP7_75t_R U18 ( .A(n28), .Y(n3) );
  INVx1_ASAP7_75t_R U19 ( .A(n33), .Y(n4) );
  INVx1_ASAP7_75t_R U20 ( .A(n13), .Y(n5) );
  INVx1_ASAP7_75t_R U21 ( .A(n17), .Y(n6) );
  INVx1_ASAP7_75t_R U22 ( .A(n21), .Y(n7) );
  XOR2xp5_ASAP7_75t_R U23 ( .A(n10), .B(n11), .Y(\SUM\[9\] ) );
  NAND2xp33_ASAP7_75t_R U24 ( .A(n5), .B(n12), .Y(n10) );
  NOR2xp33_ASAP7_75t_R U25 ( .A(n16), .B(n17), .Y(n15) );
  NAND2xp33_ASAP7_75t_R U26 ( .A(n7), .B(n20), .Y(n18) );
  XOR2xp5_ASAP7_75t_R U27 ( .A(n9), .B(n22), .Y(\SUM\[6\] ) );
  NOR2xp33_ASAP7_75t_R U28 ( .A(n23), .B(n24), .Y(n22) );
  OA21x2_ASAP7_75t_R U29 ( .A1(n27), .A2(n28), .B(n29), .Y(n26) );
  NAND2xp33_ASAP7_75t_R U30 ( .A(n3), .B(n29), .Y(n30) );
  NAND2xp33_ASAP7_75t_R U31 ( .A(\B\[11\] ), .B(\A\[11\] ), .Y(n29) );
  NOR2xp33_ASAP7_75t_R U32 ( .A(\B\[11\] ), .B(\A\[11\] ), .Y(n28) );
  NOR2xp33_ASAP7_75t_R U33 ( .A(n32), .B(n33), .Y(n34) );
  NOR2xp33_ASAP7_75t_R U34 ( .A(\B\[10\] ), .B(\A\[10\] ), .Y(n33) );
  AND2x2_ASAP7_75t_R U35 ( .A(\B\[10\] ), .B(\A\[10\] ), .Y(n32) );
  NAND2xp33_ASAP7_75t_R U36 ( .A(\B\[9\] ), .B(\A\[9\] ), .Y(n12) );
  NOR2xp33_ASAP7_75t_R U37 ( .A(\B\[9\] ), .B(\A\[9\] ), .Y(n13) );
  AND2x2_ASAP7_75t_R U38 ( .A(\B\[8\] ), .B(\A\[8\] ), .Y(n16) );
  NOR2xp33_ASAP7_75t_R U39 ( .A(\B\[8\] ), .B(\A\[8\] ), .Y(n17) );
  NAND2xp33_ASAP7_75t_R U40 ( .A(\B\[7\] ), .B(\A\[7\] ), .Y(n20) );
  AND2x2_ASAP7_75t_R U41 ( .A(\B\[6\] ), .B(\A\[6\] ), .Y(n23) );
  NOR2xp33_ASAP7_75t_R U42 ( .A(\B\[7\] ), .B(\A\[7\] ), .Y(n21) );
endmodule


module fp32_exp_DW02_mult_5 ( .A({\A\[5\] , \A\[4\] , \A\[3\] , \A\[2\] , 
        \A\[1\] , \A\[0\] }), .B({\B\[8\] , \B\[7\] , \B\[6\] , \B\[5\] , 
        \B\[4\] , \B\[3\] , \B\[2\] , \B\[1\] , \B\[0\] }), TC, .PRODUCT({
        \PRODUCT\[14\] , \PRODUCT\[13\] , \PRODUCT\[12\] , \PRODUCT\[11\] , 
        \PRODUCT\[10\] , \PRODUCT\[9\] , \PRODUCT\[8\] , \PRODUCT\[7\] , 
        \PRODUCT\[6\] , \PRODUCT\[5\] , \PRODUCT\[4\] , \PRODUCT\[3\] , 
        \PRODUCT\[2\] , \PRODUCT\[1\] , \PRODUCT\[0\] }) );
  input \A\[5\] , \A\[4\] , \A\[3\] , \A\[2\] , \A\[1\] , \A\[0\] , \B\[8\] ,
         \B\[7\] , \B\[6\] , \B\[5\] , \B\[4\] , \B\[3\] , \B\[2\] , \B\[1\] ,
         \B\[0\] , TC;
  output \PRODUCT\[14\] , \PRODUCT\[13\] , \PRODUCT\[12\] , \PRODUCT\[11\] ,
         \PRODUCT\[10\] , \PRODUCT\[9\] , \PRODUCT\[8\] , \PRODUCT\[7\] ,
         \PRODUCT\[6\] , \PRODUCT\[5\] , \PRODUCT\[4\] , \PRODUCT\[3\] ,
         \PRODUCT\[2\] , \PRODUCT\[1\] , \PRODUCT\[0\] ;
  wire   net27165, \ab\[5\]\[8\] , \ab\[5\]\[7\] , \ab\[5\]\[6\] ,
         \ab\[5\]\[5\] , \ab\[5\]\[4\] , \ab\[5\]\[3\] , \ab\[5\]\[2\] ,
         \ab\[5\]\[1\] , \ab\[5\]\[0\] , \ab\[4\]\[8\] , \ab\[4\]\[7\] ,
         \ab\[4\]\[6\] , \ab\[4\]\[5\] , \ab\[4\]\[4\] , \ab\[4\]\[3\] ,
         \ab\[4\]\[2\] , \ab\[4\]\[1\] , \ab\[4\]\[0\] , \ab\[3\]\[8\] ,
         \ab\[3\]\[7\] , \ab\[3\]\[6\] , \ab\[3\]\[5\] , \ab\[3\]\[4\] ,
         \ab\[3\]\[3\] , \ab\[3\]\[2\] , \ab\[3\]\[1\] , \ab\[3\]\[0\] ,
         \ab\[2\]\[8\] , \ab\[2\]\[7\] , \ab\[2\]\[6\] , \ab\[2\]\[5\] ,
         \ab\[2\]\[4\] , \ab\[2\]\[3\] , \ab\[2\]\[2\] , \ab\[2\]\[1\] ,
         \ab\[2\]\[0\] , \ab\[1\]\[8\] , \ab\[1\]\[7\] , \ab\[1\]\[6\] ,
         \ab\[1\]\[5\] , \ab\[1\]\[4\] , \ab\[1\]\[3\] , \ab\[1\]\[2\] ,
         \ab\[1\]\[1\] , \ab\[1\]\[0\] , \ab\[0\]\[8\] , \ab\[0\]\[7\] ,
         \ab\[0\]\[6\] , \ab\[0\]\[5\] , \ab\[0\]\[4\] , \ab\[0\]\[3\] ,
         \ab\[0\]\[2\] , \ab\[0\]\[1\] , n2, n3, n4, n5, n6, n7, n8, n9, n10,
         n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24,
         n25, n26, n27, n28, n29, n30, n31, n32, n34, n35, n36, n37, n38, n39,
         n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53,
         n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67,
         n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81,
         n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95,
         n96, n97, n98, n99, n100, n101, n102, n103, n104, n105, n106, n107,
         n108, n109, n110, n111, n112, n113, n114, n115, n116, n117, n118,
         n119, n120, n121, n122, n123, n124, n125, n126, n127, n128, n129,
         n130, n131, n132, n133, n134, n135, n136, n137, n138, n139, n140,
         n141, n142, n143, n144, n145, n146, n147, n148, n149, n150, n151,
         n152, n153, n154, n155, n156, n157, n158, n159, n160, n161, n162,
         n163, n164, n165, n166, n167, n168, n169, n170, n171, n172, n173,
         n174, n175, n176;

  FAx1_ASAP7_75t_R S4_0 ( .A(\ab\[5\]\[0\] ), .B(n88), .CI(n83), .CON(n113), 
        .SN(n114) );
  FAx1_ASAP7_75t_R S4_1 ( .A(\ab\[5\]\[1\] ), .B(n80), .CI(n75), .CON(n115), 
        .SN(n116) );
  FAx1_ASAP7_75t_R S4_2 ( .A(\ab\[5\]\[2\] ), .B(n72), .CI(n67), .CON(n117), 
        .SN(n118) );
  FAx1_ASAP7_75t_R S4_3 ( .A(\ab\[5\]\[3\] ), .B(n64), .CI(n59), .CON(n119), 
        .SN(n120) );
  FAx1_ASAP7_75t_R S4_4 ( .A(\ab\[5\]\[4\] ), .B(n56), .CI(n51), .CON(n121), 
        .SN(n122) );
  FAx1_ASAP7_75t_R S4_5 ( .A(\ab\[5\]\[5\] ), .B(n48), .CI(n44), .CON(n123), 
        .SN(n124) );
  FAx1_ASAP7_75t_R S4_6 ( .A(\ab\[5\]\[6\] ), .B(n41), .CI(n39), .CON(n125), 
        .SN(n126) );
  FAx1_ASAP7_75t_R S5_7 ( .A(\ab\[5\]\[7\] ), .B(n36), .CI(\ab\[4\]\[8\] ), 
        .CON(n127), .SN(n128) );
  FAx1_ASAP7_75t_R S1_4_0 ( .A(\ab\[4\]\[0\] ), .B(n93), .CI(n90), .CON(n129), 
        .SN(n130) );
  FAx1_ASAP7_75t_R S2_4_1 ( .A(\ab\[4\]\[1\] ), .B(n87), .CI(n84), .CON(n131), 
        .SN(n132) );
  FAx1_ASAP7_75t_R S2_4_2 ( .A(\ab\[4\]\[2\] ), .B(n79), .CI(n76), .CON(n133), 
        .SN(n134) );
  FAx1_ASAP7_75t_R S2_4_3 ( .A(\ab\[4\]\[3\] ), .B(n71), .CI(n68), .CON(n135), 
        .SN(n136) );
  FAx1_ASAP7_75t_R S2_4_4 ( .A(\ab\[4\]\[4\] ), .B(n63), .CI(n60), .CON(n137), 
        .SN(n138) );
  FAx1_ASAP7_75t_R S2_4_5 ( .A(\ab\[4\]\[5\] ), .B(n55), .CI(n52), .CON(n139), 
        .SN(n140) );
  FAx1_ASAP7_75t_R S2_4_6 ( .A(\ab\[4\]\[6\] ), .B(n47), .CI(n45), .CON(n141), 
        .SN(n142) );
  FAx1_ASAP7_75t_R S3_4_7 ( .A(\ab\[4\]\[7\] ), .B(n40), .CI(\ab\[3\]\[8\] ), 
        .CON(n143), .SN(n144) );
  FAx1_ASAP7_75t_R S1_3_0 ( .A(\ab\[3\]\[0\] ), .B(n96), .CI(n95), .CON(n145), 
        .SN(n146) );
  FAx1_ASAP7_75t_R S2_3_1 ( .A(\ab\[3\]\[1\] ), .B(n92), .CI(n91), .CON(n147), 
        .SN(n148) );
  FAx1_ASAP7_75t_R S2_3_2 ( .A(\ab\[3\]\[2\] ), .B(n86), .CI(n85), .CON(n149), 
        .SN(n150) );
  FAx1_ASAP7_75t_R S2_3_3 ( .A(\ab\[3\]\[3\] ), .B(n78), .CI(n77), .CON(n151), 
        .SN(n152) );
  FAx1_ASAP7_75t_R S2_3_4 ( .A(\ab\[3\]\[4\] ), .B(n70), .CI(n69), .CON(n153), 
        .SN(n154) );
  FAx1_ASAP7_75t_R S2_3_5 ( .A(\ab\[3\]\[5\] ), .B(n62), .CI(n61), .CON(n155), 
        .SN(n156) );
  FAx1_ASAP7_75t_R S2_3_6 ( .A(\ab\[3\]\[6\] ), .B(n54), .CI(n53), .CON(n157), 
        .SN(n158) );
  FAx1_ASAP7_75t_R S3_3_7 ( .A(\ab\[3\]\[7\] ), .B(n46), .CI(\ab\[2\]\[8\] ), 
        .CON(n159), .SN(n160) );
  FAx1_ASAP7_75t_R S1_2_0 ( .A(\ab\[2\]\[0\] ), .B(n13), .CI(n27), .CON(n161), 
        .SN(n162) );
  FAx1_ASAP7_75t_R S2_2_1 ( .A(\ab\[2\]\[1\] ), .B(n11), .CI(n25), .CON(n163), 
        .SN(n164) );
  FAx1_ASAP7_75t_R S2_2_2 ( .A(\ab\[2\]\[2\] ), .B(n24), .CI(n9), .CON(n165), 
        .SN(n166) );
  FAx1_ASAP7_75t_R S2_2_3 ( .A(\ab\[2\]\[3\] ), .B(n22), .CI(n8), .CON(n167), 
        .SN(n168) );
  FAx1_ASAP7_75t_R S2_2_4 ( .A(\ab\[2\]\[4\] ), .B(n19), .CI(n6), .CON(n169), 
        .SN(n170) );
  FAx1_ASAP7_75t_R S2_2_5 ( .A(\ab\[2\]\[5\] ), .B(n3), .CI(n17), .CON(n171), 
        .SN(n172) );
  FAx1_ASAP7_75t_R S2_2_6 ( .A(\ab\[2\]\[6\] ), .B(n20), .CI(n4), .CON(n173), 
        .SN(n174) );
  FAx1_ASAP7_75t_R S3_2_7 ( .A(\ab\[2\]\[7\] ), .B(n21), .CI(\ab\[1\]\[8\] ), 
        .CON(n175), .SN(n176) );
  INVx2_ASAP7_75t_R U2 ( .A(\A\[0\] ), .Y(n103) );
  INVx2_ASAP7_75t_R U3 ( .A(\A\[1\] ), .Y(n102) );
  INVx1_ASAP7_75t_R U4 ( .A(\A\[5\] ), .Y(n98) );
  NOR2xp33_ASAP7_75t_R U5 ( .A(n106), .B(n102), .Y(\ab\[1\]\[6\] ) );
  NOR2xp33_ASAP7_75t_R U6 ( .A(n105), .B(n103), .Y(\ab\[0\]\[7\] ) );
  NOR2xp33_ASAP7_75t_R U7 ( .A(n105), .B(n102), .Y(\ab\[1\]\[7\] ) );
  NOR2xp33_ASAP7_75t_R U8 ( .A(n104), .B(n103), .Y(\ab\[0\]\[8\] ) );
  NOR2xp33_ASAP7_75t_R U9 ( .A(n107), .B(n102), .Y(\ab\[1\]\[5\] ) );
  INVx1_ASAP7_75t_R U10 ( .A(\A\[4\] ), .Y(n99) );
  INVx1_ASAP7_75t_R U11 ( .A(\A\[3\] ), .Y(n100) );
  INVx1_ASAP7_75t_R U12 ( .A(\A\[2\] ), .Y(n101) );
  XOR2xp5_ASAP7_75t_R U13 ( .A(n66), .B(n73), .Y(n2) );
  AND2x2_ASAP7_75t_R U14 ( .A(\ab\[0\]\[6\] ), .B(\ab\[1\]\[5\] ), .Y(n3) );
  XOR2xp5_ASAP7_75t_R U15 ( .A(\ab\[1\]\[7\] ), .B(\ab\[0\]\[8\] ), .Y(n4) );
  XOR2xp5_ASAP7_75t_R U16 ( .A(n58), .B(n65), .Y(n5) );
  XOR2xp5_ASAP7_75t_R U17 ( .A(\ab\[1\]\[5\] ), .B(\ab\[0\]\[6\] ), .Y(n6) );
  AND2x2_ASAP7_75t_R U18 ( .A(n81), .B(n74), .Y(n7) );
  XOR2xp5_ASAP7_75t_R U19 ( .A(\ab\[1\]\[4\] ), .B(\ab\[0\]\[5\] ), .Y(n8) );
  XOR2xp5_ASAP7_75t_R U20 ( .A(\ab\[1\]\[3\] ), .B(\ab\[0\]\[4\] ), .Y(n9) );
  XOR2xp5_ASAP7_75t_R U21 ( .A(n50), .B(n57), .Y(n10) );
  AND2x2_ASAP7_75t_R U22 ( .A(\ab\[0\]\[2\] ), .B(\ab\[1\]\[1\] ), .Y(n11) );
  AND2x2_ASAP7_75t_R U23 ( .A(n57), .B(n50), .Y(n12) );
  AND2x2_ASAP7_75t_R U24 ( .A(\ab\[0\]\[1\] ), .B(\ab\[1\]\[0\] ), .Y(n13) );
  AND2x2_ASAP7_75t_R U25 ( .A(n49), .B(n43), .Y(n14) );
  AND2x2_ASAP7_75t_R U26 ( .A(n42), .B(n38), .Y(n15) );
  AND2x2_ASAP7_75t_R U27 ( .A(n37), .B(n35), .Y(n16) );
  XOR2xp5_ASAP7_75t_R U28 ( .A(\ab\[1\]\[6\] ), .B(\ab\[0\]\[7\] ), .Y(n17) );
  AND2x2_ASAP7_75t_R U29 ( .A(n73), .B(n66), .Y(n18) );
  AND2x2_ASAP7_75t_R U30 ( .A(\ab\[0\]\[5\] ), .B(\ab\[1\]\[4\] ), .Y(n19) );
  AND2x2_ASAP7_75t_R U31 ( .A(\ab\[0\]\[7\] ), .B(\ab\[1\]\[6\] ), .Y(n20) );
  AND2x2_ASAP7_75t_R U32 ( .A(\ab\[0\]\[8\] ), .B(\ab\[1\]\[7\] ), .Y(n21) );
  AND2x2_ASAP7_75t_R U33 ( .A(\ab\[0\]\[4\] ), .B(\ab\[1\]\[3\] ), .Y(n22) );
  AND2x2_ASAP7_75t_R U34 ( .A(n65), .B(n58), .Y(n23) );
  AND2x2_ASAP7_75t_R U35 ( .A(\ab\[0\]\[3\] ), .B(\ab\[1\]\[2\] ), .Y(n24) );
  XOR2xp5_ASAP7_75t_R U36 ( .A(\ab\[1\]\[2\] ), .B(\ab\[0\]\[3\] ), .Y(n25) );
  XOR2xp5_ASAP7_75t_R U37 ( .A(n43), .B(n49), .Y(n26) );
  XOR2xp5_ASAP7_75t_R U38 ( .A(\ab\[1\]\[1\] ), .B(\ab\[0\]\[2\] ), .Y(n27) );
  XOR2xp5_ASAP7_75t_R U39 ( .A(n38), .B(n42), .Y(n28) );
  XOR2xp5_ASAP7_75t_R U40 ( .A(n35), .B(n37), .Y(n29) );
  XOR2xp5_ASAP7_75t_R U41 ( .A(\ab\[5\]\[8\] ), .B(n34), .Y(n30) );
  XOR2xp5_ASAP7_75t_R U42 ( .A(n74), .B(n81), .Y(n31) );
  AND2x2_ASAP7_75t_R U43 ( .A(n34), .B(\ab\[5\]\[8\] ), .Y(n32) );
  XOR2xp5_ASAP7_75t_R U44 ( .A(\ab\[1\]\[0\] ), .B(\ab\[0\]\[1\] ), .Y(
        \PRODUCT\[1\] ) );
  TIELOx1_ASAP7_75t_R U45 ( .L(net27165) );
  INVx1_ASAP7_75t_R U46 ( .A(\B\[7\] ), .Y(n105) );
  INVx1_ASAP7_75t_R U47 ( .A(n127), .Y(n34) );
  INVx1_ASAP7_75t_R U48 ( .A(n128), .Y(n35) );
  INVx1_ASAP7_75t_R U49 ( .A(n143), .Y(n36) );
  INVx1_ASAP7_75t_R U50 ( .A(n125), .Y(n37) );
  INVx1_ASAP7_75t_R U51 ( .A(n126), .Y(n38) );
  INVx1_ASAP7_75t_R U52 ( .A(n144), .Y(n39) );
  INVx1_ASAP7_75t_R U53 ( .A(n159), .Y(n40) );
  INVx1_ASAP7_75t_R U54 ( .A(n141), .Y(n41) );
  INVx1_ASAP7_75t_R U55 ( .A(n123), .Y(n42) );
  INVx1_ASAP7_75t_R U56 ( .A(n124), .Y(n43) );
  INVx1_ASAP7_75t_R U57 ( .A(n142), .Y(n44) );
  INVx1_ASAP7_75t_R U58 ( .A(n160), .Y(n45) );
  INVx1_ASAP7_75t_R U59 ( .A(n175), .Y(n46) );
  INVx1_ASAP7_75t_R U60 ( .A(n157), .Y(n47) );
  INVx1_ASAP7_75t_R U61 ( .A(n139), .Y(n48) );
  INVx1_ASAP7_75t_R U62 ( .A(n121), .Y(n49) );
  INVx1_ASAP7_75t_R U63 ( .A(n122), .Y(n50) );
  INVx1_ASAP7_75t_R U64 ( .A(n140), .Y(n51) );
  INVx1_ASAP7_75t_R U65 ( .A(n158), .Y(n52) );
  INVx1_ASAP7_75t_R U66 ( .A(n176), .Y(n53) );
  INVx1_ASAP7_75t_R U67 ( .A(n173), .Y(n54) );
  INVx1_ASAP7_75t_R U68 ( .A(n155), .Y(n55) );
  INVx1_ASAP7_75t_R U69 ( .A(n137), .Y(n56) );
  INVx1_ASAP7_75t_R U70 ( .A(n119), .Y(n57) );
  INVx1_ASAP7_75t_R U71 ( .A(n120), .Y(n58) );
  INVx1_ASAP7_75t_R U72 ( .A(n138), .Y(n59) );
  INVx1_ASAP7_75t_R U73 ( .A(n156), .Y(n60) );
  INVx1_ASAP7_75t_R U74 ( .A(n174), .Y(n61) );
  INVx1_ASAP7_75t_R U75 ( .A(n171), .Y(n62) );
  INVx1_ASAP7_75t_R U76 ( .A(n153), .Y(n63) );
  INVx1_ASAP7_75t_R U77 ( .A(n135), .Y(n64) );
  INVx1_ASAP7_75t_R U78 ( .A(n117), .Y(n65) );
  INVx1_ASAP7_75t_R U79 ( .A(n118), .Y(n66) );
  INVx1_ASAP7_75t_R U80 ( .A(n136), .Y(n67) );
  INVx1_ASAP7_75t_R U81 ( .A(n154), .Y(n68) );
  INVx1_ASAP7_75t_R U82 ( .A(n172), .Y(n69) );
  INVx1_ASAP7_75t_R U83 ( .A(n169), .Y(n70) );
  INVx1_ASAP7_75t_R U84 ( .A(n151), .Y(n71) );
  INVx1_ASAP7_75t_R U85 ( .A(n133), .Y(n72) );
  INVx1_ASAP7_75t_R U86 ( .A(n115), .Y(n73) );
  INVx1_ASAP7_75t_R U87 ( .A(n116), .Y(n74) );
  INVx1_ASAP7_75t_R U88 ( .A(n134), .Y(n75) );
  INVx1_ASAP7_75t_R U89 ( .A(n152), .Y(n76) );
  INVx1_ASAP7_75t_R U90 ( .A(n170), .Y(n77) );
  INVx1_ASAP7_75t_R U91 ( .A(n167), .Y(n78) );
  INVx1_ASAP7_75t_R U92 ( .A(n149), .Y(n79) );
  INVx1_ASAP7_75t_R U93 ( .A(n131), .Y(n80) );
  INVx1_ASAP7_75t_R U94 ( .A(n113), .Y(n81) );
  INVx1_ASAP7_75t_R U95 ( .A(n114), .Y(n82) );
  INVx1_ASAP7_75t_R U96 ( .A(n132), .Y(n83) );
  INVx1_ASAP7_75t_R U97 ( .A(n150), .Y(n84) );
  INVx1_ASAP7_75t_R U98 ( .A(n168), .Y(n85) );
  INVx1_ASAP7_75t_R U99 ( .A(n165), .Y(n86) );
  INVx1_ASAP7_75t_R U100 ( .A(n147), .Y(n87) );
  INVx1_ASAP7_75t_R U101 ( .A(n129), .Y(n88) );
  INVx1_ASAP7_75t_R U102 ( .A(n130), .Y(n89) );
  INVx1_ASAP7_75t_R U103 ( .A(n148), .Y(n90) );
  INVx1_ASAP7_75t_R U104 ( .A(n166), .Y(n91) );
  INVx1_ASAP7_75t_R U105 ( .A(n163), .Y(n92) );
  INVx1_ASAP7_75t_R U106 ( .A(n145), .Y(n93) );
  INVx1_ASAP7_75t_R U107 ( .A(n146), .Y(n94) );
  INVx1_ASAP7_75t_R U108 ( .A(n164), .Y(n95) );
  INVx1_ASAP7_75t_R U109 ( .A(n161), .Y(n96) );
  INVx1_ASAP7_75t_R U110 ( .A(n162), .Y(n97) );
  INVx1_ASAP7_75t_R U111 ( .A(\B\[8\] ), .Y(n104) );
  INVx1_ASAP7_75t_R U112 ( .A(\B\[6\] ), .Y(n106) );
  INVx1_ASAP7_75t_R U113 ( .A(\B\[5\] ), .Y(n107) );
  INVx1_ASAP7_75t_R U114 ( .A(\B\[4\] ), .Y(n108) );
  INVx1_ASAP7_75t_R U115 ( .A(\B\[3\] ), .Y(n109) );
  INVx1_ASAP7_75t_R U116 ( .A(\B\[2\] ), .Y(n110) );
  INVx1_ASAP7_75t_R U117 ( .A(\B\[1\] ), .Y(n111) );
  INVx1_ASAP7_75t_R U118 ( .A(\B\[0\] ), .Y(n112) );
  NOR2xp33_ASAP7_75t_R U119 ( .A(n98), .B(n104), .Y(\ab\[5\]\[8\] ) );
  NOR2xp33_ASAP7_75t_R U120 ( .A(n98), .B(n105), .Y(\ab\[5\]\[7\] ) );
  NOR2xp33_ASAP7_75t_R U121 ( .A(n98), .B(n106), .Y(\ab\[5\]\[6\] ) );
  NOR2xp33_ASAP7_75t_R U122 ( .A(n98), .B(n107), .Y(\ab\[5\]\[5\] ) );
  NOR2xp33_ASAP7_75t_R U123 ( .A(n98), .B(n108), .Y(\ab\[5\]\[4\] ) );
  NOR2xp33_ASAP7_75t_R U124 ( .A(n98), .B(n109), .Y(\ab\[5\]\[3\] ) );
  NOR2xp33_ASAP7_75t_R U125 ( .A(n98), .B(n110), .Y(\ab\[5\]\[2\] ) );
  NOR2xp33_ASAP7_75t_R U126 ( .A(n98), .B(n111), .Y(\ab\[5\]\[1\] ) );
  NOR2xp33_ASAP7_75t_R U127 ( .A(n98), .B(n112), .Y(\ab\[5\]\[0\] ) );
  NOR2xp33_ASAP7_75t_R U128 ( .A(n104), .B(n99), .Y(\ab\[4\]\[8\] ) );
  NOR2xp33_ASAP7_75t_R U129 ( .A(n105), .B(n99), .Y(\ab\[4\]\[7\] ) );
  NOR2xp33_ASAP7_75t_R U130 ( .A(n106), .B(n99), .Y(\ab\[4\]\[6\] ) );
  NOR2xp33_ASAP7_75t_R U131 ( .A(n107), .B(n99), .Y(\ab\[4\]\[5\] ) );
  NOR2xp33_ASAP7_75t_R U132 ( .A(n108), .B(n99), .Y(\ab\[4\]\[4\] ) );
  NOR2xp33_ASAP7_75t_R U133 ( .A(n109), .B(n99), .Y(\ab\[4\]\[3\] ) );
  NOR2xp33_ASAP7_75t_R U134 ( .A(n110), .B(n99), .Y(\ab\[4\]\[2\] ) );
  NOR2xp33_ASAP7_75t_R U135 ( .A(n111), .B(n99), .Y(\ab\[4\]\[1\] ) );
  NOR2xp33_ASAP7_75t_R U136 ( .A(n112), .B(n99), .Y(\ab\[4\]\[0\] ) );
  NOR2xp33_ASAP7_75t_R U137 ( .A(n104), .B(n100), .Y(\ab\[3\]\[8\] ) );
  NOR2xp33_ASAP7_75t_R U138 ( .A(n105), .B(n100), .Y(\ab\[3\]\[7\] ) );
  NOR2xp33_ASAP7_75t_R U139 ( .A(n106), .B(n100), .Y(\ab\[3\]\[6\] ) );
  NOR2xp33_ASAP7_75t_R U140 ( .A(n107), .B(n100), .Y(\ab\[3\]\[5\] ) );
  NOR2xp33_ASAP7_75t_R U141 ( .A(n108), .B(n100), .Y(\ab\[3\]\[4\] ) );
  NOR2xp33_ASAP7_75t_R U142 ( .A(n109), .B(n100), .Y(\ab\[3\]\[3\] ) );
  NOR2xp33_ASAP7_75t_R U143 ( .A(n110), .B(n100), .Y(\ab\[3\]\[2\] ) );
  NOR2xp33_ASAP7_75t_R U144 ( .A(n111), .B(n100), .Y(\ab\[3\]\[1\] ) );
  NOR2xp33_ASAP7_75t_R U145 ( .A(n112), .B(n100), .Y(\ab\[3\]\[0\] ) );
  NOR2xp33_ASAP7_75t_R U146 ( .A(n104), .B(n101), .Y(\ab\[2\]\[8\] ) );
  NOR2xp33_ASAP7_75t_R U147 ( .A(n105), .B(n101), .Y(\ab\[2\]\[7\] ) );
  NOR2xp33_ASAP7_75t_R U148 ( .A(n106), .B(n101), .Y(\ab\[2\]\[6\] ) );
  NOR2xp33_ASAP7_75t_R U149 ( .A(n107), .B(n101), .Y(\ab\[2\]\[5\] ) );
  NOR2xp33_ASAP7_75t_R U150 ( .A(n108), .B(n101), .Y(\ab\[2\]\[4\] ) );
  NOR2xp33_ASAP7_75t_R U151 ( .A(n109), .B(n101), .Y(\ab\[2\]\[3\] ) );
  NOR2xp33_ASAP7_75t_R U152 ( .A(n110), .B(n101), .Y(\ab\[2\]\[2\] ) );
  NOR2xp33_ASAP7_75t_R U153 ( .A(n111), .B(n101), .Y(\ab\[2\]\[1\] ) );
  NOR2xp33_ASAP7_75t_R U154 ( .A(n112), .B(n101), .Y(\ab\[2\]\[0\] ) );
  NOR2xp33_ASAP7_75t_R U155 ( .A(n104), .B(n102), .Y(\ab\[1\]\[8\] ) );
  NOR2xp33_ASAP7_75t_R U156 ( .A(n108), .B(n102), .Y(\ab\[1\]\[4\] ) );
  NOR2xp33_ASAP7_75t_R U157 ( .A(n109), .B(n102), .Y(\ab\[1\]\[3\] ) );
  NOR2xp33_ASAP7_75t_R U158 ( .A(n110), .B(n102), .Y(\ab\[1\]\[2\] ) );
  NOR2xp33_ASAP7_75t_R U159 ( .A(n111), .B(n102), .Y(\ab\[1\]\[1\] ) );
  NOR2xp33_ASAP7_75t_R U160 ( .A(n112), .B(n102), .Y(\ab\[1\]\[0\] ) );
  NOR2xp33_ASAP7_75t_R U161 ( .A(n106), .B(n103), .Y(\ab\[0\]\[6\] ) );
  NOR2xp33_ASAP7_75t_R U162 ( .A(n107), .B(n103), .Y(\ab\[0\]\[5\] ) );
  NOR2xp33_ASAP7_75t_R U163 ( .A(n108), .B(n103), .Y(\ab\[0\]\[4\] ) );
  NOR2xp33_ASAP7_75t_R U164 ( .A(n109), .B(n103), .Y(\ab\[0\]\[3\] ) );
  NOR2xp33_ASAP7_75t_R U165 ( .A(n110), .B(n103), .Y(\ab\[0\]\[2\] ) );
  NOR2xp33_ASAP7_75t_R U166 ( .A(n111), .B(n103), .Y(\ab\[0\]\[1\] ) );
  NOR2xp33_ASAP7_75t_R U167 ( .A(n112), .B(n103), .Y(\PRODUCT\[0\] ) );
  fp32_exp_DW01_add_19 FS_1 ( .A({net27165, n30, n29, n28, n26, n10, n5, n2, 
        n31, n82, n89, n94, n97}), .B({n32, n16, n15, n14, n12, n23, n18, n7, 
        net27165, net27165, net27165, net27165, net27165}), .CI(net27165), 
        .SUM({\PRODUCT\[14\] , \PRODUCT\[13\] , \PRODUCT\[12\] , 
        \PRODUCT\[11\] , \PRODUCT\[10\] , \PRODUCT\[9\] , \PRODUCT\[8\] , 
        \PRODUCT\[7\] , \PRODUCT\[6\] , \PRODUCT\[5\] , \PRODUCT\[4\] , 
        \PRODUCT\[3\] , \PRODUCT\[2\] }) );
endmodule


module fp32_exp_DW01_add_18 ( .A({\A\[12\] , \A\[11\] , \A\[10\] , \A\[9\] , 
        \A\[8\] , \A\[7\] , \A\[6\] , \A\[5\] , \A\[4\] , \A\[3\] , \A\[2\] , 
        \A\[1\] , \A\[0\] }), .B({\B\[12\] , \B\[11\] , \B\[10\] , \B\[9\] , 
        \B\[8\] , \B\[7\] , \B\[6\] , \B\[5\] , \B\[4\] , \B\[3\] , \B\[2\] , 
        \B\[1\] , \B\[0\] }), CI, .SUM({\SUM\[12\] , \SUM\[11\] , \SUM\[10\] , 
        \SUM\[9\] , \SUM\[8\] , \SUM\[7\] , \SUM\[6\] , \SUM\[5\] , \SUM\[4\] , 
        \SUM\[3\] , \SUM\[2\] , \SUM\[1\] , \SUM\[0\] }), CO );
  input \A\[12\] , \A\[11\] , \A\[10\] , \A\[9\] , \A\[8\] , \A\[7\] ,
         \A\[6\] , \A\[5\] , \A\[4\] , \A\[3\] , \A\[2\] , \A\[1\] , \A\[0\] ,
         \B\[12\] , \B\[11\] , \B\[10\] , \B\[9\] , \B\[8\] , \B\[7\] ,
         \B\[6\] , \B\[5\] , \B\[4\] , \B\[3\] , \B\[2\] , \B\[1\] , \B\[0\] ,
         CI;
  output \SUM\[12\] , \SUM\[11\] , \SUM\[10\] , \SUM\[9\] , \SUM\[8\] ,
         \SUM\[7\] , \SUM\[6\] , \SUM\[5\] , \SUM\[4\] , \SUM\[3\] ,
         \SUM\[2\] , \SUM\[1\] , \SUM\[0\] , CO;
  wire   \A\[4\] , \A\[3\] , \A\[2\] , \A\[1\] , \A\[0\] , n2, n3, n4, n5, n6,
         n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20,
         n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34;
  assign \SUM\[4\]  = \A\[4\] ;
  assign \SUM\[3\]  = \A\[3\] ;
  assign \SUM\[2\]  = \A\[2\] ;
  assign \SUM\[1\]  = \A\[1\] ;
  assign \SUM\[0\]  = \A\[0\] ;

  AOI21xp5_ASAP7_75t_R U2 ( .A1(n7), .A2(n31), .B(n32), .Y(n27) );
  OAI21xp5_ASAP7_75t_R U3 ( .A1(n13), .A2(n15), .B(n14), .Y(n31) );
  AOI21xp5_ASAP7_75t_R U4 ( .A1(n11), .A2(n4), .B(n25), .Y(n21) );
  OAI21xp5_ASAP7_75t_R U5 ( .A1(n27), .A2(n28), .B(n29), .Y(n3) );
  XOR2xp5_ASAP7_75t_R U6 ( .A(n16), .B(n17), .Y(\SUM\[8\] ) );
  XOR2xp5_ASAP7_75t_R U7 ( .A(n20), .B(n21), .Y(\SUM\[7\] ) );
  AND2x2_ASAP7_75t_R U8 ( .A(n2), .B(n26), .Y(\SUM\[5\] ) );
  OR2x2_ASAP7_75t_R U9 ( .A(\B\[5\] ), .B(\A\[5\] ), .Y(n2) );
  INVx1_ASAP7_75t_R U10 ( .A(n26), .Y(n11) );
  NAND2xp5_ASAP7_75t_R U11 ( .A(\B\[5\] ), .B(\A\[5\] ), .Y(n26) );
  AOI21xp5_ASAP7_75t_R U12 ( .A1(n16), .A2(n9), .B(n18), .Y(n13) );
  OAI21xp5_ASAP7_75t_R U13 ( .A1(n23), .A2(n21), .B(n22), .Y(n16) );
  XOR2xp5_ASAP7_75t_R U14 ( .A(\B\[12\] ), .B(n3), .Y(\SUM\[12\] ) );
  OR2x2_ASAP7_75t_R U15 ( .A(\B\[6\] ), .B(\A\[6\] ), .Y(n4) );
  INVxp33_ASAP7_75t_R U16 ( .A(n4), .Y(n5) );
  INVx1_ASAP7_75t_R U17 ( .A(n28), .Y(n6) );
  INVx1_ASAP7_75t_R U18 ( .A(n33), .Y(n7) );
  INVx1_ASAP7_75t_R U19 ( .A(n15), .Y(n8) );
  INVx1_ASAP7_75t_R U20 ( .A(n19), .Y(n9) );
  INVx1_ASAP7_75t_R U21 ( .A(n23), .Y(n10) );
  XOR2xp5_ASAP7_75t_R U22 ( .A(n12), .B(n13), .Y(\SUM\[9\] ) );
  NAND2xp33_ASAP7_75t_R U23 ( .A(n8), .B(n14), .Y(n12) );
  NOR2xp33_ASAP7_75t_R U24 ( .A(n18), .B(n19), .Y(n17) );
  NAND2xp33_ASAP7_75t_R U25 ( .A(n10), .B(n22), .Y(n20) );
  XOR2xp5_ASAP7_75t_R U26 ( .A(n11), .B(n24), .Y(\SUM\[6\] ) );
  NOR2xp33_ASAP7_75t_R U27 ( .A(n25), .B(n5), .Y(n24) );
  XOR2xp5_ASAP7_75t_R U28 ( .A(n30), .B(n27), .Y(\SUM\[11\] ) );
  NAND2xp33_ASAP7_75t_R U29 ( .A(n6), .B(n29), .Y(n30) );
  NAND2xp33_ASAP7_75t_R U30 ( .A(\B\[11\] ), .B(\A\[11\] ), .Y(n29) );
  NOR2xp33_ASAP7_75t_R U31 ( .A(\B\[11\] ), .B(\A\[11\] ), .Y(n28) );
  XOR2xp5_ASAP7_75t_R U32 ( .A(n31), .B(n34), .Y(\SUM\[10\] ) );
  NOR2xp33_ASAP7_75t_R U33 ( .A(n32), .B(n33), .Y(n34) );
  NOR2xp33_ASAP7_75t_R U34 ( .A(\B\[10\] ), .B(\A\[10\] ), .Y(n33) );
  AND2x2_ASAP7_75t_R U35 ( .A(\B\[10\] ), .B(\A\[10\] ), .Y(n32) );
  NAND2xp33_ASAP7_75t_R U36 ( .A(\B\[9\] ), .B(\A\[9\] ), .Y(n14) );
  NOR2xp33_ASAP7_75t_R U37 ( .A(\B\[9\] ), .B(\A\[9\] ), .Y(n15) );
  AND2x2_ASAP7_75t_R U38 ( .A(\B\[8\] ), .B(\A\[8\] ), .Y(n18) );
  NOR2xp33_ASAP7_75t_R U39 ( .A(\B\[8\] ), .B(\A\[8\] ), .Y(n19) );
  NAND2xp33_ASAP7_75t_R U40 ( .A(\B\[7\] ), .B(\A\[7\] ), .Y(n22) );
  AND2x2_ASAP7_75t_R U41 ( .A(\B\[6\] ), .B(\A\[6\] ), .Y(n25) );
  NOR2xp33_ASAP7_75t_R U42 ( .A(\B\[7\] ), .B(\A\[7\] ), .Y(n23) );
endmodule


module fp32_exp_DW02_mult_4 ( .A({\A\[5\] , \A\[4\] , \A\[3\] , \A\[2\] , 
        \A\[1\] , \A\[0\] }), .B({\B\[8\] , \B\[7\] , \B\[6\] , \B\[5\] , 
        \B\[4\] , \B\[3\] , \B\[2\] , \B\[1\] , \B\[0\] }), TC, .PRODUCT({
        \PRODUCT\[14\] , \PRODUCT\[13\] , \PRODUCT\[12\] , \PRODUCT\[11\] , 
        \PRODUCT\[10\] , \PRODUCT\[9\] , \PRODUCT\[8\] , \PRODUCT\[7\] , 
        \PRODUCT\[6\] , \PRODUCT\[5\] , \PRODUCT\[4\] , \PRODUCT\[3\] , 
        \PRODUCT\[2\] , \PRODUCT\[1\] , \PRODUCT\[0\] }) );
  input \A\[5\] , \A\[4\] , \A\[3\] , \A\[2\] , \A\[1\] , \A\[0\] , \B\[8\] ,
         \B\[7\] , \B\[6\] , \B\[5\] , \B\[4\] , \B\[3\] , \B\[2\] , \B\[1\] ,
         \B\[0\] , TC;
  output \PRODUCT\[14\] , \PRODUCT\[13\] , \PRODUCT\[12\] , \PRODUCT\[11\] ,
         \PRODUCT\[10\] , \PRODUCT\[9\] , \PRODUCT\[8\] , \PRODUCT\[7\] ,
         \PRODUCT\[6\] , \PRODUCT\[5\] , \PRODUCT\[4\] , \PRODUCT\[3\] ,
         \PRODUCT\[2\] , \PRODUCT\[1\] , \PRODUCT\[0\] ;
  wire   net27157, \ab\[5\]\[8\] , \ab\[5\]\[7\] , \ab\[5\]\[6\] ,
         \ab\[5\]\[5\] , \ab\[5\]\[4\] , \ab\[5\]\[3\] , \ab\[5\]\[2\] ,
         \ab\[5\]\[1\] , \ab\[5\]\[0\] , \ab\[4\]\[8\] , \ab\[4\]\[7\] ,
         \ab\[4\]\[6\] , \ab\[4\]\[5\] , \ab\[4\]\[4\] , \ab\[4\]\[3\] ,
         \ab\[4\]\[2\] , \ab\[4\]\[1\] , \ab\[4\]\[0\] , \ab\[3\]\[8\] ,
         \ab\[3\]\[7\] , \ab\[3\]\[6\] , \ab\[3\]\[5\] , \ab\[3\]\[4\] ,
         \ab\[3\]\[3\] , \ab\[3\]\[2\] , \ab\[3\]\[1\] , \ab\[3\]\[0\] ,
         \ab\[2\]\[8\] , \ab\[2\]\[7\] , \ab\[2\]\[6\] , \ab\[2\]\[5\] ,
         \ab\[2\]\[4\] , \ab\[2\]\[3\] , \ab\[2\]\[2\] , \ab\[2\]\[1\] ,
         \ab\[2\]\[0\] , \ab\[1\]\[8\] , \ab\[1\]\[7\] , \ab\[1\]\[6\] ,
         \ab\[1\]\[5\] , \ab\[1\]\[4\] , \ab\[1\]\[3\] , \ab\[1\]\[2\] ,
         \ab\[1\]\[1\] , \ab\[1\]\[0\] , \ab\[0\]\[8\] , \ab\[0\]\[7\] ,
         \ab\[0\]\[6\] , \ab\[0\]\[5\] , \ab\[0\]\[4\] , \ab\[0\]\[3\] ,
         \ab\[0\]\[2\] , \ab\[0\]\[1\] , n2, n3, n4, n5, n6, n7, n8, n9, n10,
         n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24,
         n25, n26, n27, n28, n29, n30, n31, n32, n34, n35, n36, n37, n38, n39,
         n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53,
         n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67,
         n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81,
         n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95,
         n96, n97, n98, n99, n100, n101, n102, n103, n104, n105, n106, n107,
         n108, n109, n110, n111, n112, n113, n114, n115, n116, n117, n118,
         n119, n120, n121, n122, n123, n124, n125, n126, n127, n128, n129,
         n130, n131, n132, n133, n134, n135, n136, n137, n138, n139, n140,
         n141, n142, n143, n144, n145, n146, n147, n148, n149, n150, n151,
         n152, n153, n154, n155, n156, n157, n158, n159, n160, n161, n162,
         n163, n164, n165, n166, n167, n168, n169, n170, n171, n172, n173,
         n174, n175, n176;

  FAx1_ASAP7_75t_R S4_0 ( .A(\ab\[5\]\[0\] ), .B(n88), .CI(n83), .CON(n113), 
        .SN(n114) );
  FAx1_ASAP7_75t_R S4_1 ( .A(\ab\[5\]\[1\] ), .B(n80), .CI(n75), .CON(n115), 
        .SN(n116) );
  FAx1_ASAP7_75t_R S4_2 ( .A(\ab\[5\]\[2\] ), .B(n72), .CI(n67), .CON(n117), 
        .SN(n118) );
  FAx1_ASAP7_75t_R S4_3 ( .A(\ab\[5\]\[3\] ), .B(n64), .CI(n59), .CON(n119), 
        .SN(n120) );
  FAx1_ASAP7_75t_R S4_4 ( .A(\ab\[5\]\[4\] ), .B(n56), .CI(n51), .CON(n121), 
        .SN(n122) );
  FAx1_ASAP7_75t_R S4_5 ( .A(\ab\[5\]\[5\] ), .B(n48), .CI(n44), .CON(n123), 
        .SN(n124) );
  FAx1_ASAP7_75t_R S4_6 ( .A(\ab\[5\]\[6\] ), .B(n41), .CI(n39), .CON(n125), 
        .SN(n126) );
  FAx1_ASAP7_75t_R S5_7 ( .A(\ab\[5\]\[7\] ), .B(n36), .CI(\ab\[4\]\[8\] ), 
        .CON(n127), .SN(n128) );
  FAx1_ASAP7_75t_R S1_4_0 ( .A(\ab\[4\]\[0\] ), .B(n93), .CI(n90), .CON(n129), 
        .SN(n130) );
  FAx1_ASAP7_75t_R S2_4_1 ( .A(\ab\[4\]\[1\] ), .B(n87), .CI(n84), .CON(n131), 
        .SN(n132) );
  FAx1_ASAP7_75t_R S2_4_2 ( .A(\ab\[4\]\[2\] ), .B(n79), .CI(n76), .CON(n133), 
        .SN(n134) );
  FAx1_ASAP7_75t_R S2_4_3 ( .A(\ab\[4\]\[3\] ), .B(n71), .CI(n68), .CON(n135), 
        .SN(n136) );
  FAx1_ASAP7_75t_R S2_4_4 ( .A(\ab\[4\]\[4\] ), .B(n63), .CI(n60), .CON(n137), 
        .SN(n138) );
  FAx1_ASAP7_75t_R S2_4_5 ( .A(\ab\[4\]\[5\] ), .B(n55), .CI(n52), .CON(n139), 
        .SN(n140) );
  FAx1_ASAP7_75t_R S2_4_6 ( .A(\ab\[4\]\[6\] ), .B(n47), .CI(n45), .CON(n141), 
        .SN(n142) );
  FAx1_ASAP7_75t_R S3_4_7 ( .A(\ab\[4\]\[7\] ), .B(n40), .CI(\ab\[3\]\[8\] ), 
        .CON(n143), .SN(n144) );
  FAx1_ASAP7_75t_R S1_3_0 ( .A(\ab\[3\]\[0\] ), .B(n96), .CI(n95), .CON(n145), 
        .SN(n146) );
  FAx1_ASAP7_75t_R S2_3_1 ( .A(\ab\[3\]\[1\] ), .B(n92), .CI(n91), .CON(n147), 
        .SN(n148) );
  FAx1_ASAP7_75t_R S2_3_2 ( .A(\ab\[3\]\[2\] ), .B(n86), .CI(n85), .CON(n149), 
        .SN(n150) );
  FAx1_ASAP7_75t_R S2_3_3 ( .A(\ab\[3\]\[3\] ), .B(n78), .CI(n77), .CON(n151), 
        .SN(n152) );
  FAx1_ASAP7_75t_R S2_3_4 ( .A(\ab\[3\]\[4\] ), .B(n70), .CI(n69), .CON(n153), 
        .SN(n154) );
  FAx1_ASAP7_75t_R S2_3_5 ( .A(\ab\[3\]\[5\] ), .B(n62), .CI(n61), .CON(n155), 
        .SN(n156) );
  FAx1_ASAP7_75t_R S2_3_6 ( .A(\ab\[3\]\[6\] ), .B(n54), .CI(n53), .CON(n157), 
        .SN(n158) );
  FAx1_ASAP7_75t_R S3_3_7 ( .A(\ab\[3\]\[7\] ), .B(n46), .CI(\ab\[2\]\[8\] ), 
        .CON(n159), .SN(n160) );
  FAx1_ASAP7_75t_R S1_2_0 ( .A(\ab\[2\]\[0\] ), .B(n25), .CI(n12), .CON(n161), 
        .SN(n162) );
  FAx1_ASAP7_75t_R S2_2_1 ( .A(\ab\[2\]\[1\] ), .B(n11), .CI(n26), .CON(n163), 
        .SN(n164) );
  FAx1_ASAP7_75t_R S2_2_2 ( .A(\ab\[2\]\[2\] ), .B(n24), .CI(n9), .CON(n165), 
        .SN(n166) );
  FAx1_ASAP7_75t_R S2_2_3 ( .A(\ab\[2\]\[3\] ), .B(n20), .CI(n8), .CON(n167), 
        .SN(n168) );
  FAx1_ASAP7_75t_R S2_2_4 ( .A(\ab\[2\]\[4\] ), .B(n4), .CI(n18), .CON(n169), 
        .SN(n170) );
  FAx1_ASAP7_75t_R S2_2_5 ( .A(\ab\[2\]\[5\] ), .B(n17), .CI(n3), .CON(n171), 
        .SN(n172) );
  FAx1_ASAP7_75t_R S2_2_6 ( .A(\ab\[2\]\[6\] ), .B(n19), .CI(n7), .CON(n173), 
        .SN(n174) );
  FAx1_ASAP7_75t_R S3_2_7 ( .A(\ab\[2\]\[7\] ), .B(n22), .CI(\ab\[1\]\[8\] ), 
        .CON(n175), .SN(n176) );
  INVx1_ASAP7_75t_R U2 ( .A(\A\[5\] ), .Y(n98) );
  NOR2xp33_ASAP7_75t_R U3 ( .A(n106), .B(n102), .Y(\ab\[1\]\[6\] ) );
  NOR2xp33_ASAP7_75t_R U4 ( .A(n105), .B(n103), .Y(\ab\[0\]\[7\] ) );
  NOR2xp33_ASAP7_75t_R U5 ( .A(n105), .B(n102), .Y(\ab\[1\]\[7\] ) );
  NOR2xp33_ASAP7_75t_R U6 ( .A(n104), .B(n103), .Y(\ab\[0\]\[8\] ) );
  NOR2xp33_ASAP7_75t_R U7 ( .A(n107), .B(n102), .Y(\ab\[1\]\[5\] ) );
  INVx1_ASAP7_75t_R U8 ( .A(\B\[6\] ), .Y(n106) );
  INVx1_ASAP7_75t_R U9 ( .A(\A\[4\] ), .Y(n99) );
  INVx1_ASAP7_75t_R U10 ( .A(\A\[3\] ), .Y(n100) );
  INVx1_ASAP7_75t_R U11 ( .A(\A\[2\] ), .Y(n101) );
  INVx1_ASAP7_75t_R U12 ( .A(\A\[0\] ), .Y(n103) );
  XOR2xp5_ASAP7_75t_R U13 ( .A(n66), .B(n73), .Y(n2) );
  XOR2xp5_ASAP7_75t_R U14 ( .A(\ab\[1\]\[6\] ), .B(\ab\[0\]\[7\] ), .Y(n3) );
  AND2x2_ASAP7_75t_R U15 ( .A(\ab\[0\]\[5\] ), .B(\ab\[1\]\[4\] ), .Y(n4) );
  AND2x2_ASAP7_75t_R U16 ( .A(n81), .B(n74), .Y(n5) );
  XOR2xp5_ASAP7_75t_R U17 ( .A(n58), .B(n65), .Y(n6) );
  XOR2xp5_ASAP7_75t_R U18 ( .A(\ab\[1\]\[7\] ), .B(\ab\[0\]\[8\] ), .Y(n7) );
  XOR2xp5_ASAP7_75t_R U19 ( .A(\ab\[1\]\[4\] ), .B(\ab\[0\]\[5\] ), .Y(n8) );
  XOR2xp5_ASAP7_75t_R U20 ( .A(\ab\[1\]\[3\] ), .B(\ab\[0\]\[4\] ), .Y(n9) );
  XOR2xp5_ASAP7_75t_R U21 ( .A(n50), .B(n57), .Y(n10) );
  AND2x2_ASAP7_75t_R U22 ( .A(\ab\[0\]\[2\] ), .B(\ab\[1\]\[1\] ), .Y(n11) );
  XOR2xp5_ASAP7_75t_R U23 ( .A(\ab\[1\]\[1\] ), .B(\ab\[0\]\[2\] ), .Y(n12) );
  AND2x2_ASAP7_75t_R U24 ( .A(n57), .B(n50), .Y(n13) );
  AND2x2_ASAP7_75t_R U25 ( .A(n49), .B(n43), .Y(n14) );
  AND2x2_ASAP7_75t_R U26 ( .A(n42), .B(n38), .Y(n15) );
  AND2x2_ASAP7_75t_R U27 ( .A(n37), .B(n35), .Y(n16) );
  AND2x2_ASAP7_75t_R U28 ( .A(\ab\[0\]\[6\] ), .B(\ab\[1\]\[5\] ), .Y(n17) );
  XOR2xp5_ASAP7_75t_R U29 ( .A(\ab\[1\]\[5\] ), .B(\ab\[0\]\[6\] ), .Y(n18) );
  AND2x2_ASAP7_75t_R U30 ( .A(\ab\[0\]\[7\] ), .B(\ab\[1\]\[6\] ), .Y(n19) );
  INVx1_ASAP7_75t_R U31 ( .A(\A\[1\] ), .Y(n102) );
  AND2x2_ASAP7_75t_R U32 ( .A(\ab\[0\]\[4\] ), .B(\ab\[1\]\[3\] ), .Y(n20) );
  AND2x2_ASAP7_75t_R U33 ( .A(n73), .B(n66), .Y(n21) );
  AND2x2_ASAP7_75t_R U34 ( .A(\ab\[0\]\[8\] ), .B(\ab\[1\]\[7\] ), .Y(n22) );
  AND2x2_ASAP7_75t_R U35 ( .A(n65), .B(n58), .Y(n23) );
  AND2x2_ASAP7_75t_R U36 ( .A(\ab\[0\]\[3\] ), .B(\ab\[1\]\[2\] ), .Y(n24) );
  AND2x2_ASAP7_75t_R U37 ( .A(\ab\[0\]\[1\] ), .B(\ab\[1\]\[0\] ), .Y(n25) );
  XOR2xp5_ASAP7_75t_R U38 ( .A(\ab\[1\]\[2\] ), .B(\ab\[0\]\[3\] ), .Y(n26) );
  XOR2xp5_ASAP7_75t_R U39 ( .A(n43), .B(n49), .Y(n27) );
  XOR2xp5_ASAP7_75t_R U40 ( .A(n38), .B(n42), .Y(n28) );
  XOR2xp5_ASAP7_75t_R U41 ( .A(n35), .B(n37), .Y(n29) );
  XOR2xp5_ASAP7_75t_R U42 ( .A(\ab\[5\]\[8\] ), .B(n34), .Y(n30) );
  XOR2xp5_ASAP7_75t_R U43 ( .A(n74), .B(n81), .Y(n31) );
  AND2x2_ASAP7_75t_R U44 ( .A(n34), .B(\ab\[5\]\[8\] ), .Y(n32) );
  XOR2xp5_ASAP7_75t_R U45 ( .A(\ab\[1\]\[0\] ), .B(\ab\[0\]\[1\] ), .Y(
        \PRODUCT\[1\] ) );
  TIELOx1_ASAP7_75t_R U46 ( .L(net27157) );
  INVxp67_ASAP7_75t_R U47 ( .A(n153), .Y(n63) );
  INVx1_ASAP7_75t_R U48 ( .A(\B\[7\] ), .Y(n105) );
  INVx1_ASAP7_75t_R U49 ( .A(n156), .Y(n60) );
  INVx1_ASAP7_75t_R U50 ( .A(n127), .Y(n34) );
  INVx1_ASAP7_75t_R U51 ( .A(n128), .Y(n35) );
  INVx1_ASAP7_75t_R U52 ( .A(n143), .Y(n36) );
  INVx1_ASAP7_75t_R U53 ( .A(n125), .Y(n37) );
  INVx1_ASAP7_75t_R U54 ( .A(n126), .Y(n38) );
  INVx1_ASAP7_75t_R U55 ( .A(n144), .Y(n39) );
  INVx1_ASAP7_75t_R U56 ( .A(n159), .Y(n40) );
  INVx1_ASAP7_75t_R U57 ( .A(n141), .Y(n41) );
  INVx1_ASAP7_75t_R U58 ( .A(n123), .Y(n42) );
  INVx1_ASAP7_75t_R U59 ( .A(n124), .Y(n43) );
  INVx1_ASAP7_75t_R U60 ( .A(n142), .Y(n44) );
  INVx1_ASAP7_75t_R U61 ( .A(n160), .Y(n45) );
  INVx1_ASAP7_75t_R U62 ( .A(n175), .Y(n46) );
  INVx1_ASAP7_75t_R U63 ( .A(n157), .Y(n47) );
  INVx1_ASAP7_75t_R U64 ( .A(n139), .Y(n48) );
  INVx1_ASAP7_75t_R U65 ( .A(n121), .Y(n49) );
  INVx1_ASAP7_75t_R U66 ( .A(n122), .Y(n50) );
  INVx1_ASAP7_75t_R U67 ( .A(n140), .Y(n51) );
  INVx1_ASAP7_75t_R U68 ( .A(n158), .Y(n52) );
  INVx1_ASAP7_75t_R U69 ( .A(n176), .Y(n53) );
  INVx1_ASAP7_75t_R U70 ( .A(n173), .Y(n54) );
  INVx1_ASAP7_75t_R U71 ( .A(n155), .Y(n55) );
  INVx1_ASAP7_75t_R U72 ( .A(n137), .Y(n56) );
  INVx1_ASAP7_75t_R U73 ( .A(n119), .Y(n57) );
  INVx1_ASAP7_75t_R U74 ( .A(n120), .Y(n58) );
  INVx1_ASAP7_75t_R U75 ( .A(n138), .Y(n59) );
  INVx1_ASAP7_75t_R U76 ( .A(n174), .Y(n61) );
  INVx1_ASAP7_75t_R U77 ( .A(n171), .Y(n62) );
  INVx1_ASAP7_75t_R U78 ( .A(n135), .Y(n64) );
  INVx1_ASAP7_75t_R U79 ( .A(n117), .Y(n65) );
  INVx1_ASAP7_75t_R U80 ( .A(n118), .Y(n66) );
  INVx1_ASAP7_75t_R U81 ( .A(n136), .Y(n67) );
  INVx1_ASAP7_75t_R U82 ( .A(n154), .Y(n68) );
  INVx1_ASAP7_75t_R U83 ( .A(n172), .Y(n69) );
  INVx1_ASAP7_75t_R U84 ( .A(n169), .Y(n70) );
  INVx1_ASAP7_75t_R U85 ( .A(n151), .Y(n71) );
  INVx1_ASAP7_75t_R U86 ( .A(n133), .Y(n72) );
  INVx1_ASAP7_75t_R U87 ( .A(n115), .Y(n73) );
  INVx1_ASAP7_75t_R U88 ( .A(n116), .Y(n74) );
  INVx1_ASAP7_75t_R U89 ( .A(n134), .Y(n75) );
  INVx1_ASAP7_75t_R U90 ( .A(n152), .Y(n76) );
  INVx1_ASAP7_75t_R U91 ( .A(n170), .Y(n77) );
  INVx1_ASAP7_75t_R U92 ( .A(n167), .Y(n78) );
  INVx1_ASAP7_75t_R U93 ( .A(n149), .Y(n79) );
  INVx1_ASAP7_75t_R U94 ( .A(n131), .Y(n80) );
  INVx1_ASAP7_75t_R U95 ( .A(n113), .Y(n81) );
  INVx1_ASAP7_75t_R U96 ( .A(n114), .Y(n82) );
  INVx1_ASAP7_75t_R U97 ( .A(n132), .Y(n83) );
  INVx1_ASAP7_75t_R U98 ( .A(n150), .Y(n84) );
  INVx1_ASAP7_75t_R U99 ( .A(n168), .Y(n85) );
  INVx1_ASAP7_75t_R U100 ( .A(n165), .Y(n86) );
  INVx1_ASAP7_75t_R U101 ( .A(n147), .Y(n87) );
  INVx1_ASAP7_75t_R U102 ( .A(n129), .Y(n88) );
  INVx1_ASAP7_75t_R U103 ( .A(n130), .Y(n89) );
  INVx1_ASAP7_75t_R U104 ( .A(n148), .Y(n90) );
  INVx1_ASAP7_75t_R U105 ( .A(n166), .Y(n91) );
  INVx1_ASAP7_75t_R U106 ( .A(n163), .Y(n92) );
  INVx1_ASAP7_75t_R U107 ( .A(n145), .Y(n93) );
  INVx1_ASAP7_75t_R U108 ( .A(n146), .Y(n94) );
  INVx1_ASAP7_75t_R U109 ( .A(n164), .Y(n95) );
  INVx1_ASAP7_75t_R U110 ( .A(n161), .Y(n96) );
  INVx1_ASAP7_75t_R U111 ( .A(n162), .Y(n97) );
  INVx1_ASAP7_75t_R U112 ( .A(\B\[8\] ), .Y(n104) );
  INVx1_ASAP7_75t_R U113 ( .A(\B\[5\] ), .Y(n107) );
  INVx1_ASAP7_75t_R U114 ( .A(\B\[4\] ), .Y(n108) );
  INVx1_ASAP7_75t_R U115 ( .A(\B\[3\] ), .Y(n109) );
  INVx1_ASAP7_75t_R U116 ( .A(\B\[2\] ), .Y(n110) );
  INVx1_ASAP7_75t_R U117 ( .A(\B\[1\] ), .Y(n111) );
  INVx1_ASAP7_75t_R U118 ( .A(\B\[0\] ), .Y(n112) );
  NOR2xp33_ASAP7_75t_R U119 ( .A(n98), .B(n104), .Y(\ab\[5\]\[8\] ) );
  NOR2xp33_ASAP7_75t_R U120 ( .A(n98), .B(n105), .Y(\ab\[5\]\[7\] ) );
  NOR2xp33_ASAP7_75t_R U121 ( .A(n98), .B(n106), .Y(\ab\[5\]\[6\] ) );
  NOR2xp33_ASAP7_75t_R U122 ( .A(n98), .B(n107), .Y(\ab\[5\]\[5\] ) );
  NOR2xp33_ASAP7_75t_R U123 ( .A(n98), .B(n108), .Y(\ab\[5\]\[4\] ) );
  NOR2xp33_ASAP7_75t_R U124 ( .A(n98), .B(n109), .Y(\ab\[5\]\[3\] ) );
  NOR2xp33_ASAP7_75t_R U125 ( .A(n98), .B(n110), .Y(\ab\[5\]\[2\] ) );
  NOR2xp33_ASAP7_75t_R U126 ( .A(n98), .B(n111), .Y(\ab\[5\]\[1\] ) );
  NOR2xp33_ASAP7_75t_R U127 ( .A(n98), .B(n112), .Y(\ab\[5\]\[0\] ) );
  NOR2xp33_ASAP7_75t_R U128 ( .A(n104), .B(n99), .Y(\ab\[4\]\[8\] ) );
  NOR2xp33_ASAP7_75t_R U129 ( .A(n105), .B(n99), .Y(\ab\[4\]\[7\] ) );
  NOR2xp33_ASAP7_75t_R U130 ( .A(n106), .B(n99), .Y(\ab\[4\]\[6\] ) );
  NOR2xp33_ASAP7_75t_R U131 ( .A(n107), .B(n99), .Y(\ab\[4\]\[5\] ) );
  NOR2xp33_ASAP7_75t_R U132 ( .A(n108), .B(n99), .Y(\ab\[4\]\[4\] ) );
  NOR2xp33_ASAP7_75t_R U133 ( .A(n109), .B(n99), .Y(\ab\[4\]\[3\] ) );
  NOR2xp33_ASAP7_75t_R U134 ( .A(n110), .B(n99), .Y(\ab\[4\]\[2\] ) );
  NOR2xp33_ASAP7_75t_R U135 ( .A(n111), .B(n99), .Y(\ab\[4\]\[1\] ) );
  NOR2xp33_ASAP7_75t_R U136 ( .A(n112), .B(n99), .Y(\ab\[4\]\[0\] ) );
  NOR2xp33_ASAP7_75t_R U137 ( .A(n104), .B(n100), .Y(\ab\[3\]\[8\] ) );
  NOR2xp33_ASAP7_75t_R U138 ( .A(n105), .B(n100), .Y(\ab\[3\]\[7\] ) );
  NOR2xp33_ASAP7_75t_R U139 ( .A(n106), .B(n100), .Y(\ab\[3\]\[6\] ) );
  NOR2xp33_ASAP7_75t_R U140 ( .A(n107), .B(n100), .Y(\ab\[3\]\[5\] ) );
  NOR2xp33_ASAP7_75t_R U141 ( .A(n108), .B(n100), .Y(\ab\[3\]\[4\] ) );
  NOR2xp33_ASAP7_75t_R U142 ( .A(n109), .B(n100), .Y(\ab\[3\]\[3\] ) );
  NOR2xp33_ASAP7_75t_R U143 ( .A(n110), .B(n100), .Y(\ab\[3\]\[2\] ) );
  NOR2xp33_ASAP7_75t_R U144 ( .A(n111), .B(n100), .Y(\ab\[3\]\[1\] ) );
  NOR2xp33_ASAP7_75t_R U145 ( .A(n112), .B(n100), .Y(\ab\[3\]\[0\] ) );
  NOR2xp33_ASAP7_75t_R U146 ( .A(n104), .B(n101), .Y(\ab\[2\]\[8\] ) );
  NOR2xp33_ASAP7_75t_R U147 ( .A(n105), .B(n101), .Y(\ab\[2\]\[7\] ) );
  NOR2xp33_ASAP7_75t_R U148 ( .A(n106), .B(n101), .Y(\ab\[2\]\[6\] ) );
  NOR2xp33_ASAP7_75t_R U149 ( .A(n107), .B(n101), .Y(\ab\[2\]\[5\] ) );
  NOR2xp33_ASAP7_75t_R U150 ( .A(n108), .B(n101), .Y(\ab\[2\]\[4\] ) );
  NOR2xp33_ASAP7_75t_R U151 ( .A(n109), .B(n101), .Y(\ab\[2\]\[3\] ) );
  NOR2xp33_ASAP7_75t_R U152 ( .A(n110), .B(n101), .Y(\ab\[2\]\[2\] ) );
  NOR2xp33_ASAP7_75t_R U153 ( .A(n111), .B(n101), .Y(\ab\[2\]\[1\] ) );
  NOR2xp33_ASAP7_75t_R U154 ( .A(n112), .B(n101), .Y(\ab\[2\]\[0\] ) );
  NOR2xp33_ASAP7_75t_R U155 ( .A(n104), .B(n102), .Y(\ab\[1\]\[8\] ) );
  NOR2xp33_ASAP7_75t_R U156 ( .A(n108), .B(n102), .Y(\ab\[1\]\[4\] ) );
  NOR2xp33_ASAP7_75t_R U157 ( .A(n109), .B(n102), .Y(\ab\[1\]\[3\] ) );
  NOR2xp33_ASAP7_75t_R U158 ( .A(n110), .B(n102), .Y(\ab\[1\]\[2\] ) );
  NOR2xp33_ASAP7_75t_R U159 ( .A(n111), .B(n102), .Y(\ab\[1\]\[1\] ) );
  NOR2xp33_ASAP7_75t_R U160 ( .A(n112), .B(n102), .Y(\ab\[1\]\[0\] ) );
  NOR2xp33_ASAP7_75t_R U161 ( .A(n106), .B(n103), .Y(\ab\[0\]\[6\] ) );
  NOR2xp33_ASAP7_75t_R U162 ( .A(n107), .B(n103), .Y(\ab\[0\]\[5\] ) );
  NOR2xp33_ASAP7_75t_R U163 ( .A(n108), .B(n103), .Y(\ab\[0\]\[4\] ) );
  NOR2xp33_ASAP7_75t_R U164 ( .A(n109), .B(n103), .Y(\ab\[0\]\[3\] ) );
  NOR2xp33_ASAP7_75t_R U165 ( .A(n110), .B(n103), .Y(\ab\[0\]\[2\] ) );
  NOR2xp33_ASAP7_75t_R U166 ( .A(n111), .B(n103), .Y(\ab\[0\]\[1\] ) );
  NOR2xp33_ASAP7_75t_R U167 ( .A(n112), .B(n103), .Y(\PRODUCT\[0\] ) );
  fp32_exp_DW01_add_18 FS_1 ( .A({net27157, n30, n29, n28, n27, n10, n6, n2, 
        n31, n82, n89, n94, n97}), .B({n32, n16, n15, n14, n13, n23, n21, n5, 
        net27157, net27157, net27157, net27157, net27157}), .CI(net27157), 
        .SUM({\PRODUCT\[14\] , \PRODUCT\[13\] , \PRODUCT\[12\] , 
        \PRODUCT\[11\] , \PRODUCT\[10\] , \PRODUCT\[9\] , \PRODUCT\[8\] , 
        \PRODUCT\[7\] , \PRODUCT\[6\] , \PRODUCT\[5\] , \PRODUCT\[4\] , 
        \PRODUCT\[3\] , \PRODUCT\[2\] }) );
endmodule


module fp32_exp_DW01_add_38 ( .A({\A\[11\] , \A\[10\] , \A\[9\] , \A\[8\] , 
        \A\[7\] , \A\[6\] , \A\[5\] , \A\[4\] , \A\[3\] , \A\[2\] , \A\[1\] , 
        \A\[0\] }), .B({\B\[11\] , \B\[10\] , \B\[9\] , \B\[8\] , \B\[7\] , 
        \B\[6\] , \B\[5\] , \B\[4\] , \B\[3\] , \B\[2\] , \B\[1\] , \B\[0\] }), 
        CI, .SUM({\SUM\[11\] , \SUM\[10\] , \SUM\[9\] , \SUM\[8\] , \SUM\[7\] , 
        \SUM\[6\] , \SUM\[5\] , \SUM\[4\] , \SUM\[3\] , \SUM\[2\] , \SUM\[1\] , 
        \SUM\[0\] }), CO );
  input \A\[11\] , \A\[10\] , \A\[9\] , \A\[8\] , \A\[7\] , \A\[6\] , \A\[5\] ,
         \A\[4\] , \A\[3\] , \A\[2\] , \A\[1\] , \A\[0\] , \B\[11\] ,
         \B\[10\] , \B\[9\] , \B\[8\] , \B\[7\] , \B\[6\] , \B\[5\] , \B\[4\] ,
         \B\[3\] , \B\[2\] , \B\[1\] , \B\[0\] , CI;
  output \SUM\[11\] , \SUM\[10\] , \SUM\[9\] , \SUM\[8\] , \SUM\[7\] ,
         \SUM\[6\] , \SUM\[5\] , \SUM\[4\] , \SUM\[3\] , \SUM\[2\] ,
         \SUM\[1\] , \SUM\[0\] , CO;
  wire   \A\[4\] , \A\[3\] , \A\[2\] , \A\[1\] , \A\[0\] , n1, n2, n4, n5, n6,
         n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20,
         n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32;
  assign \SUM\[4\]  = \A\[4\] ;
  assign \SUM\[3\]  = \A\[3\] ;
  assign \SUM\[2\]  = \A\[2\] ;
  assign \SUM\[1\]  = \A\[1\] ;
  assign \SUM\[0\]  = \A\[0\] ;

  NAND2xp5_ASAP7_75t_R U2 ( .A(n21), .B(n22), .Y(n18) );
  OAI21xp5_ASAP7_75t_R U3 ( .A1(\A\[9\] ), .A2(\B\[9\] ), .B(n5), .Y(n22) );
  OAI21xp5_ASAP7_75t_R U4 ( .A1(n1), .A2(n23), .B(n24), .Y(n5) );
  NOR2xp33_ASAP7_75t_R U5 ( .A(\A\[8\] ), .B(\B\[8\] ), .Y(n23) );
  OA21x2_ASAP7_75t_R U6 ( .A1(n25), .A2(n2), .B(n8), .Y(n1) );
  AOI21xp5_ASAP7_75t_R U7 ( .A1(n9), .A2(n11), .B(n26), .Y(n2) );
  AND2x2_ASAP7_75t_R U8 ( .A(n13), .B(n14), .Y(\SUM\[5\] ) );
  INVx1_ASAP7_75t_R U9 ( .A(n13), .Y(n9) );
  XOR2xp5_ASAP7_75t_R U10 ( .A(\B\[11\] ), .B(n15), .Y(\SUM\[11\] ) );
  INVxp33_ASAP7_75t_R U11 ( .A(\A\[5\] ), .Y(n30) );
  INVxp67_ASAP7_75t_R U12 ( .A(n5), .Y(n4) );
  FAx1_ASAP7_75t_R U13 ( .A(\B\[9\] ), .B(\A\[9\] ), .CI(n4), .SN(\SUM\[9\] )
         );
  FAx1_ASAP7_75t_R U14 ( .A(\B\[8\] ), .B(\A\[8\] ), .CI(n1), .SN(\SUM\[8\] )
         );
  XOR2xp5_ASAP7_75t_R U15 ( .A(n6), .B(n2), .Y(\SUM\[7\] ) );
  NAND2xp5_ASAP7_75t_R U16 ( .A(n7), .B(n8), .Y(n6) );
  XNOR2xp5_ASAP7_75t_R U17 ( .A(n9), .B(n10), .Y(\SUM\[6\] ) );
  NAND2xp5_ASAP7_75t_R U18 ( .A(n11), .B(n12), .Y(n10) );
  NAND2xp5_ASAP7_75t_R U19 ( .A(n16), .B(n17), .Y(n15) );
  NAND2xp5_ASAP7_75t_R U20 ( .A(\B\[10\] ), .B(\A\[10\] ), .Y(n17) );
  OAI21xp5_ASAP7_75t_R U21 ( .A1(\A\[10\] ), .A2(\B\[10\] ), .B(n18), .Y(n16)
         );
  XNOR2xp5_ASAP7_75t_R U22 ( .A(n19), .B(n20), .Y(\SUM\[10\] ) );
  XOR2xp5_ASAP7_75t_R U23 ( .A(\B\[10\] ), .B(\A\[10\] ), .Y(n20) );
  INVx1_ASAP7_75t_R U24 ( .A(n18), .Y(n19) );
  NAND2xp5_ASAP7_75t_R U25 ( .A(\B\[8\] ), .B(\A\[8\] ), .Y(n24) );
  NAND2xp5_ASAP7_75t_R U26 ( .A(\B\[7\] ), .B(\A\[7\] ), .Y(n8) );
  INVx1_ASAP7_75t_R U27 ( .A(n12), .Y(n26) );
  NAND2xp5_ASAP7_75t_R U28 ( .A(\B\[6\] ), .B(\A\[6\] ), .Y(n12) );
  NAND2xp5_ASAP7_75t_R U29 ( .A(n27), .B(n28), .Y(n11) );
  INVx1_ASAP7_75t_R U30 ( .A(\A\[6\] ), .Y(n28) );
  INVx1_ASAP7_75t_R U31 ( .A(\B\[6\] ), .Y(n27) );
  NAND2xp5_ASAP7_75t_R U32 ( .A(\B\[5\] ), .B(\A\[5\] ), .Y(n13) );
  NAND2xp5_ASAP7_75t_R U33 ( .A(n29), .B(n30), .Y(n14) );
  INVx1_ASAP7_75t_R U34 ( .A(\B\[5\] ), .Y(n29) );
  INVx1_ASAP7_75t_R U35 ( .A(n7), .Y(n25) );
  NAND2xp5_ASAP7_75t_R U36 ( .A(n31), .B(n32), .Y(n7) );
  INVx1_ASAP7_75t_R U37 ( .A(\A\[7\] ), .Y(n32) );
  INVx1_ASAP7_75t_R U38 ( .A(\B\[7\] ), .Y(n31) );
  NAND2xp5_ASAP7_75t_R U39 ( .A(\A\[9\] ), .B(\B\[9\] ), .Y(n21) );
endmodule


module fp32_exp_DW02_mult_3 ( .A({\A\[5\] , \A\[4\] , \A\[3\] , \A\[2\] , 
        \A\[1\] , \A\[0\] }), .B({\B\[7\] , \B\[6\] , \B\[5\] , \B\[4\] , 
        \B\[3\] , \B\[2\] , \B\[1\] , \B\[0\] }), TC, .PRODUCT({
        \PRODUCT\[13\] , \PRODUCT\[12\] , \PRODUCT\[11\] , \PRODUCT\[10\] , 
        \PRODUCT\[9\] , \PRODUCT\[8\] , \PRODUCT\[7\] , \PRODUCT\[6\] , 
        \PRODUCT\[5\] , \PRODUCT\[4\] , \PRODUCT\[3\] , \PRODUCT\[2\] , 
        \PRODUCT\[1\] , \PRODUCT\[0\] }) );
  input \A\[5\] , \A\[4\] , \A\[3\] , \A\[2\] , \A\[1\] , \A\[0\] , \B\[7\] ,
         \B\[6\] , \B\[5\] , \B\[4\] , \B\[3\] , \B\[2\] , \B\[1\] , \B\[0\] ,
         TC;
  output \PRODUCT\[13\] , \PRODUCT\[12\] , \PRODUCT\[11\] , \PRODUCT\[10\] ,
         \PRODUCT\[9\] , \PRODUCT\[8\] , \PRODUCT\[7\] , \PRODUCT\[6\] ,
         \PRODUCT\[5\] , \PRODUCT\[4\] , \PRODUCT\[3\] , \PRODUCT\[2\] ,
         \PRODUCT\[1\] , \PRODUCT\[0\] ;
  wire   net27149, \ab\[5\]\[7\] , \ab\[5\]\[6\] , \ab\[5\]\[5\] ,
         \ab\[5\]\[4\] , \ab\[5\]\[3\] , \ab\[5\]\[2\] , \ab\[5\]\[1\] ,
         \ab\[5\]\[0\] , \ab\[4\]\[7\] , \ab\[4\]\[6\] , \ab\[4\]\[5\] ,
         \ab\[4\]\[4\] , \ab\[4\]\[3\] , \ab\[4\]\[2\] , \ab\[4\]\[1\] ,
         \ab\[4\]\[0\] , \ab\[3\]\[7\] , \ab\[3\]\[6\] , \ab\[3\]\[5\] ,
         \ab\[3\]\[4\] , \ab\[3\]\[3\] , \ab\[3\]\[2\] , \ab\[3\]\[1\] ,
         \ab\[3\]\[0\] , \ab\[2\]\[7\] , \ab\[2\]\[6\] , \ab\[2\]\[5\] ,
         \ab\[2\]\[4\] , \ab\[2\]\[3\] , \ab\[2\]\[2\] , \ab\[2\]\[1\] ,
         \ab\[2\]\[0\] , \ab\[1\]\[7\] , \ab\[1\]\[6\] , \ab\[1\]\[5\] ,
         \ab\[1\]\[4\] , \ab\[1\]\[3\] , \ab\[1\]\[2\] , \ab\[1\]\[1\] ,
         \ab\[1\]\[0\] , \ab\[0\]\[7\] , \ab\[0\]\[6\] , \ab\[0\]\[5\] ,
         \ab\[0\]\[4\] , \ab\[0\]\[3\] , \ab\[0\]\[2\] , \ab\[0\]\[1\] , n2,
         n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17,
         n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46,
         n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60,
         n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74,
         n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88,
         n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101,
         n102, n103, n104, n105, n106, n107, n108, n109, n110, n111, n112,
         n113, n114, n115, n116, n117, n118, n119, n120, n121, n122, n123,
         n124, n125, n126, n127, n128, n129, n130, n131, n132, n133, n134,
         n135, n136, n137, n138, n139, n140, n141, n142, n143, n144, n145,
         n146, n147, n148, n149, n150, n151, n152, n153, n154, n155;

  FAx1_ASAP7_75t_R S4_0 ( .A(\ab\[5\]\[0\] ), .B(n83), .CI(n78), .CON(n100), 
        .SN(n101) );
  FAx1_ASAP7_75t_R S4_1 ( .A(\ab\[5\]\[1\] ), .B(n75), .CI(n70), .CON(n102), 
        .SN(n103) );
  FAx1_ASAP7_75t_R S4_2 ( .A(\ab\[5\]\[2\] ), .B(n67), .CI(n62), .CON(n104), 
        .SN(n105) );
  FAx1_ASAP7_75t_R S4_3 ( .A(\ab\[5\]\[3\] ), .B(n59), .CI(n54), .CON(n106), 
        .SN(n107) );
  FAx1_ASAP7_75t_R S4_4 ( .A(\ab\[5\]\[4\] ), .B(n51), .CI(n47), .CON(n108), 
        .SN(n109) );
  FAx1_ASAP7_75t_R S4_5 ( .A(\ab\[5\]\[5\] ), .B(n44), .CI(n42), .CON(n110), 
        .SN(n111) );
  FAx1_ASAP7_75t_R S5_6 ( .A(\ab\[5\]\[6\] ), .B(n39), .CI(\ab\[4\]\[7\] ), 
        .CON(n112), .SN(n113) );
  FAx1_ASAP7_75t_R S1_4_0 ( .A(\ab\[4\]\[0\] ), .B(n88), .CI(n85), .CON(n114), 
        .SN(n115) );
  FAx1_ASAP7_75t_R S2_4_1 ( .A(\ab\[4\]\[1\] ), .B(n82), .CI(n79), .CON(n116), 
        .SN(n117) );
  FAx1_ASAP7_75t_R S2_4_2 ( .A(\ab\[4\]\[2\] ), .B(n74), .CI(n71), .CON(n118), 
        .SN(n119) );
  FAx1_ASAP7_75t_R S2_4_3 ( .A(\ab\[4\]\[3\] ), .B(n66), .CI(n63), .CON(n120), 
        .SN(n121) );
  FAx1_ASAP7_75t_R S2_4_4 ( .A(\ab\[4\]\[4\] ), .B(n58), .CI(n55), .CON(n122), 
        .SN(n123) );
  FAx1_ASAP7_75t_R S2_4_5 ( .A(\ab\[4\]\[5\] ), .B(n50), .CI(n48), .CON(n124), 
        .SN(n125) );
  FAx1_ASAP7_75t_R S3_4_6 ( .A(\ab\[4\]\[6\] ), .B(n43), .CI(\ab\[3\]\[7\] ), 
        .CON(n126), .SN(n127) );
  FAx1_ASAP7_75t_R S1_3_0 ( .A(\ab\[3\]\[0\] ), .B(n91), .CI(n90), .CON(n128), 
        .SN(n129) );
  FAx1_ASAP7_75t_R S2_3_1 ( .A(\ab\[3\]\[1\] ), .B(n87), .CI(n86), .CON(n130), 
        .SN(n131) );
  FAx1_ASAP7_75t_R S2_3_2 ( .A(\ab\[3\]\[2\] ), .B(n81), .CI(n80), .CON(n132), 
        .SN(n133) );
  FAx1_ASAP7_75t_R S2_3_3 ( .A(\ab\[3\]\[3\] ), .B(n73), .CI(n72), .CON(n134), 
        .SN(n135) );
  FAx1_ASAP7_75t_R S2_3_4 ( .A(\ab\[3\]\[4\] ), .B(n65), .CI(n64), .CON(n136), 
        .SN(n137) );
  FAx1_ASAP7_75t_R S2_3_5 ( .A(\ab\[3\]\[5\] ), .B(n57), .CI(n56), .CON(n138), 
        .SN(n139) );
  FAx1_ASAP7_75t_R S3_3_6 ( .A(\ab\[3\]\[6\] ), .B(n49), .CI(\ab\[2\]\[7\] ), 
        .CON(n140), .SN(n141) );
  FAx1_ASAP7_75t_R S1_2_0 ( .A(\ab\[2\]\[0\] ), .B(n8), .CI(n17), .CON(n142), 
        .SN(n143) );
  FAx1_ASAP7_75t_R S2_2_1 ( .A(\ab\[2\]\[1\] ), .B(n2), .CI(n22), .CON(n144), 
        .SN(n145) );
  FAx1_ASAP7_75t_R S2_2_2 ( .A(\ab\[2\]\[2\] ), .B(n21), .CI(n9), .CON(n146), 
        .SN(n147) );
  FAx1_ASAP7_75t_R S2_2_3 ( .A(\ab\[2\]\[3\] ), .B(n20), .CI(n7), .CON(n148), 
        .SN(n149) );
  FAx1_ASAP7_75t_R S2_2_4 ( .A(\ab\[2\]\[4\] ), .B(n16), .CI(n4), .CON(n150), 
        .SN(n151) );
  FAx1_ASAP7_75t_R S2_2_5 ( .A(\ab\[2\]\[5\] ), .B(n15), .CI(n5), .CON(n152), 
        .SN(n153) );
  FAx1_ASAP7_75t_R S3_2_6 ( .A(\ab\[2\]\[6\] ), .B(n18), .CI(\ab\[1\]\[7\] ), 
        .CON(n154), .SN(n155) );
  NOR2xp33_ASAP7_75t_R U2 ( .A(n95), .B(n33), .Y(\ab\[3\]\[4\] ) );
  NOR2xp33_ASAP7_75t_R U3 ( .A(n94), .B(n34), .Y(\ab\[4\]\[3\] ) );
  NOR2xp33_ASAP7_75t_R U4 ( .A(n96), .B(n32), .Y(\ab\[2\]\[5\] ) );
  NOR2xp33_ASAP7_75t_R U5 ( .A(n96), .B(n31), .Y(\ab\[2\]\[6\] ) );
  NOR2xp33_ASAP7_75t_R U6 ( .A(n94), .B(n32), .Y(\ab\[4\]\[5\] ) );
  NOR2xp33_ASAP7_75t_R U7 ( .A(n94), .B(n33), .Y(\ab\[4\]\[4\] ) );
  NOR2xp33_ASAP7_75t_R U8 ( .A(n95), .B(n34), .Y(\ab\[3\]\[3\] ) );
  NOR2xp33_ASAP7_75t_R U9 ( .A(n94), .B(n31), .Y(\ab\[4\]\[6\] ) );
  NOR2xp33_ASAP7_75t_R U10 ( .A(n95), .B(n35), .Y(\ab\[3\]\[7\] ) );
  NOR2xp33_ASAP7_75t_R U11 ( .A(n95), .B(n32), .Y(\ab\[3\]\[5\] ) );
  NOR2xp33_ASAP7_75t_R U12 ( .A(n96), .B(n33), .Y(\ab\[2\]\[4\] ) );
  NOR2xp33_ASAP7_75t_R U13 ( .A(n95), .B(n31), .Y(\ab\[3\]\[6\] ) );
  NOR2xp33_ASAP7_75t_R U14 ( .A(n96), .B(n35), .Y(\ab\[2\]\[7\] ) );
  NOR2xp33_ASAP7_75t_R U15 ( .A(n96), .B(n34), .Y(\ab\[2\]\[3\] ) );
  NOR2xp33_ASAP7_75t_R U16 ( .A(n93), .B(n32), .Y(\ab\[5\]\[5\] ) );
  NOR2xp33_ASAP7_75t_R U17 ( .A(n93), .B(n33), .Y(\ab\[5\]\[4\] ) );
  NOR2xp33_ASAP7_75t_R U18 ( .A(n93), .B(n34), .Y(\ab\[5\]\[3\] ) );
  NOR2xp33_ASAP7_75t_R U19 ( .A(n97), .B(n30), .Y(\ab\[1\]\[2\] ) );
  NOR2xp33_ASAP7_75t_R U20 ( .A(n93), .B(n31), .Y(\ab\[5\]\[6\] ) );
  NOR2xp33_ASAP7_75t_R U21 ( .A(n94), .B(n35), .Y(\ab\[4\]\[7\] ) );
  NOR2xp33_ASAP7_75t_R U22 ( .A(n97), .B(n36), .Y(\ab\[0\]\[2\] ) );
  NOR2xp33_ASAP7_75t_R U23 ( .A(n98), .B(n30), .Y(\ab\[1\]\[1\] ) );
  NOR2xp33_ASAP7_75t_R U24 ( .A(n93), .B(n35), .Y(\ab\[5\]\[7\] ) );
  NOR2xp33_ASAP7_75t_R U25 ( .A(n98), .B(n36), .Y(\ab\[0\]\[1\] ) );
  NOR2xp33_ASAP7_75t_R U26 ( .A(n99), .B(n30), .Y(\ab\[1\]\[0\] ) );
  NOR2xp33_ASAP7_75t_R U27 ( .A(n99), .B(n36), .Y(\PRODUCT\[0\] ) );
  AND2x2_ASAP7_75t_R U28 ( .A(\ab\[0\]\[2\] ), .B(\ab\[1\]\[1\] ), .Y(n2) );
  AND2x2_ASAP7_75t_R U29 ( .A(n76), .B(n69), .Y(n3) );
  XOR2xp5_ASAP7_75t_R U30 ( .A(\ab\[1\]\[5\] ), .B(\ab\[0\]\[6\] ), .Y(n4) );
  XOR2xp5_ASAP7_75t_R U31 ( .A(\ab\[1\]\[6\] ), .B(\ab\[0\]\[7\] ), .Y(n5) );
  XOR2xp5_ASAP7_75t_R U32 ( .A(n53), .B(n60), .Y(n6) );
  XOR2xp5_ASAP7_75t_R U33 ( .A(\ab\[1\]\[4\] ), .B(\ab\[0\]\[5\] ), .Y(n7) );
  AND2x2_ASAP7_75t_R U34 ( .A(\ab\[0\]\[1\] ), .B(\ab\[1\]\[0\] ), .Y(n8) );
  XOR2xp5_ASAP7_75t_R U35 ( .A(\ab\[1\]\[3\] ), .B(\ab\[0\]\[4\] ), .Y(n9) );
  AND2x2_ASAP7_75t_R U36 ( .A(n60), .B(n53), .Y(n10) );
  XOR2xp5_ASAP7_75t_R U37 ( .A(n41), .B(n45), .Y(n11) );
  AND2x2_ASAP7_75t_R U38 ( .A(n45), .B(n41), .Y(n12) );
  AND2x2_ASAP7_75t_R U39 ( .A(n40), .B(n38), .Y(n13) );
  XOR2xp5_ASAP7_75t_R U40 ( .A(n61), .B(n68), .Y(n14) );
  AND2x2_ASAP7_75t_R U41 ( .A(\ab\[0\]\[6\] ), .B(\ab\[1\]\[5\] ), .Y(n15) );
  AND2x2_ASAP7_75t_R U42 ( .A(\ab\[0\]\[5\] ), .B(\ab\[1\]\[4\] ), .Y(n16) );
  XOR2xp5_ASAP7_75t_R U43 ( .A(\ab\[1\]\[1\] ), .B(\ab\[0\]\[2\] ), .Y(n17) );
  AND2x2_ASAP7_75t_R U44 ( .A(\ab\[0\]\[7\] ), .B(\ab\[1\]\[6\] ), .Y(n18) );
  AND2x2_ASAP7_75t_R U45 ( .A(n68), .B(n61), .Y(n19) );
  AND2x2_ASAP7_75t_R U46 ( .A(\ab\[0\]\[4\] ), .B(\ab\[1\]\[3\] ), .Y(n20) );
  AND2x2_ASAP7_75t_R U47 ( .A(\ab\[0\]\[3\] ), .B(\ab\[1\]\[2\] ), .Y(n21) );
  XOR2xp5_ASAP7_75t_R U48 ( .A(\ab\[1\]\[2\] ), .B(\ab\[0\]\[3\] ), .Y(n22) );
  XOR2xp5_ASAP7_75t_R U49 ( .A(n46), .B(n52), .Y(n23) );
  AND2x2_ASAP7_75t_R U50 ( .A(n52), .B(n46), .Y(n24) );
  XOR2xp5_ASAP7_75t_R U51 ( .A(n38), .B(n40), .Y(n25) );
  AND2x2_ASAP7_75t_R U52 ( .A(n37), .B(\ab\[5\]\[7\] ), .Y(n26) );
  XOR2xp5_ASAP7_75t_R U53 ( .A(n69), .B(n76), .Y(n27) );
  XOR2xp5_ASAP7_75t_R U54 ( .A(\ab\[5\]\[7\] ), .B(n37), .Y(n28) );
  XOR2xp5_ASAP7_75t_R U55 ( .A(\ab\[1\]\[0\] ), .B(\ab\[0\]\[1\] ), .Y(
        \PRODUCT\[1\] ) );
  TIELOx1_ASAP7_75t_R U56 ( .L(net27149) );
  INVxp33_ASAP7_75t_R U57 ( .A(\B\[7\] ), .Y(n35) );
  INVxp33_ASAP7_75t_R U58 ( .A(\A\[0\] ), .Y(n36) );
  INVx1_ASAP7_75t_R U59 ( .A(n153), .Y(n64) );
  INVxp67_ASAP7_75t_R U60 ( .A(\B\[6\] ), .Y(n31) );
  INVx1_ASAP7_75t_R U61 ( .A(n105), .Y(n61) );
  AND2x2_ASAP7_75t_R U62 ( .A(\B\[7\] ), .B(\A\[0\] ), .Y(\ab\[0\]\[7\] ) );
  AND2x2_ASAP7_75t_R U63 ( .A(\A\[1\] ), .B(\B\[6\] ), .Y(\ab\[1\]\[6\] ) );
  AND2x2_ASAP7_75t_R U64 ( .A(\B\[6\] ), .B(\A\[0\] ), .Y(\ab\[0\]\[6\] ) );
  AND2x2_ASAP7_75t_R U65 ( .A(\A\[1\] ), .B(\B\[5\] ), .Y(\ab\[1\]\[5\] ) );
  AND2x2_ASAP7_75t_R U66 ( .A(\B\[5\] ), .B(\A\[0\] ), .Y(\ab\[0\]\[5\] ) );
  AND2x2_ASAP7_75t_R U67 ( .A(\A\[1\] ), .B(\B\[4\] ), .Y(\ab\[1\]\[4\] ) );
  AND2x2_ASAP7_75t_R U68 ( .A(\B\[4\] ), .B(\A\[0\] ), .Y(\ab\[0\]\[4\] ) );
  AND2x2_ASAP7_75t_R U69 ( .A(\A\[1\] ), .B(\B\[3\] ), .Y(\ab\[1\]\[3\] ) );
  AND2x2_ASAP7_75t_R U70 ( .A(\B\[3\] ), .B(\A\[0\] ), .Y(\ab\[0\]\[3\] ) );
  INVx1_ASAP7_75t_R U71 ( .A(\A\[1\] ), .Y(n30) );
  AND2x2_ASAP7_75t_R U72 ( .A(\A\[1\] ), .B(\B\[7\] ), .Y(\ab\[1\]\[7\] ) );
  INVx1_ASAP7_75t_R U73 ( .A(\B\[5\] ), .Y(n32) );
  INVx1_ASAP7_75t_R U74 ( .A(\B\[4\] ), .Y(n33) );
  INVx1_ASAP7_75t_R U75 ( .A(\B\[3\] ), .Y(n34) );
  INVx1_ASAP7_75t_R U76 ( .A(n152), .Y(n57) );
  INVx1_ASAP7_75t_R U77 ( .A(n155), .Y(n56) );
  INVx1_ASAP7_75t_R U78 ( .A(n150), .Y(n65) );
  INVx1_ASAP7_75t_R U79 ( .A(n148), .Y(n73) );
  INVx1_ASAP7_75t_R U80 ( .A(n151), .Y(n72) );
  INVx1_ASAP7_75t_R U81 ( .A(n146), .Y(n81) );
  INVx1_ASAP7_75t_R U82 ( .A(n149), .Y(n80) );
  INVx1_ASAP7_75t_R U83 ( .A(n147), .Y(n86) );
  INVx1_ASAP7_75t_R U84 ( .A(n136), .Y(n58) );
  INVx1_ASAP7_75t_R U85 ( .A(n139), .Y(n55) );
  INVx1_ASAP7_75t_R U86 ( .A(n134), .Y(n66) );
  INVx1_ASAP7_75t_R U87 ( .A(n137), .Y(n63) );
  INVx1_ASAP7_75t_R U88 ( .A(n132), .Y(n74) );
  INVx1_ASAP7_75t_R U89 ( .A(n135), .Y(n71) );
  INVx1_ASAP7_75t_R U90 ( .A(n130), .Y(n82) );
  INVx1_ASAP7_75t_R U91 ( .A(n133), .Y(n79) );
  INVx1_ASAP7_75t_R U92 ( .A(n120), .Y(n59) );
  INVx1_ASAP7_75t_R U93 ( .A(n123), .Y(n54) );
  INVx1_ASAP7_75t_R U94 ( .A(n118), .Y(n67) );
  INVx1_ASAP7_75t_R U95 ( .A(n121), .Y(n62) );
  INVx1_ASAP7_75t_R U96 ( .A(n116), .Y(n75) );
  INVx1_ASAP7_75t_R U97 ( .A(n119), .Y(n70) );
  INVx1_ASAP7_75t_R U98 ( .A(n117), .Y(n78) );
  INVx1_ASAP7_75t_R U99 ( .A(n104), .Y(n60) );
  INVx1_ASAP7_75t_R U100 ( .A(n107), .Y(n53) );
  INVx1_ASAP7_75t_R U101 ( .A(n102), .Y(n68) );
  INVx1_ASAP7_75t_R U102 ( .A(n100), .Y(n76) );
  INVx1_ASAP7_75t_R U103 ( .A(n103), .Y(n69) );
  INVx1_ASAP7_75t_R U104 ( .A(n101), .Y(n77) );
  INVx1_ASAP7_75t_R U105 ( .A(n115), .Y(n84) );
  INVx1_ASAP7_75t_R U106 ( .A(n129), .Y(n89) );
  INVx1_ASAP7_75t_R U107 ( .A(n143), .Y(n92) );
  INVx1_ASAP7_75t_R U108 ( .A(n112), .Y(n37) );
  INVx1_ASAP7_75t_R U109 ( .A(n113), .Y(n38) );
  INVx1_ASAP7_75t_R U110 ( .A(n126), .Y(n39) );
  INVx1_ASAP7_75t_R U111 ( .A(n110), .Y(n40) );
  INVx1_ASAP7_75t_R U112 ( .A(n111), .Y(n41) );
  INVx1_ASAP7_75t_R U113 ( .A(n127), .Y(n42) );
  INVx1_ASAP7_75t_R U114 ( .A(n140), .Y(n43) );
  INVx1_ASAP7_75t_R U115 ( .A(n124), .Y(n44) );
  INVx1_ASAP7_75t_R U116 ( .A(n108), .Y(n45) );
  INVx1_ASAP7_75t_R U117 ( .A(n109), .Y(n46) );
  INVx1_ASAP7_75t_R U118 ( .A(n125), .Y(n47) );
  INVx1_ASAP7_75t_R U119 ( .A(n141), .Y(n48) );
  INVx1_ASAP7_75t_R U120 ( .A(n154), .Y(n49) );
  INVx1_ASAP7_75t_R U121 ( .A(n138), .Y(n50) );
  INVx1_ASAP7_75t_R U122 ( .A(n122), .Y(n51) );
  INVx1_ASAP7_75t_R U123 ( .A(n106), .Y(n52) );
  INVx1_ASAP7_75t_R U124 ( .A(n114), .Y(n83) );
  INVx1_ASAP7_75t_R U125 ( .A(n131), .Y(n85) );
  INVx1_ASAP7_75t_R U126 ( .A(n144), .Y(n87) );
  INVx1_ASAP7_75t_R U127 ( .A(n128), .Y(n88) );
  INVx1_ASAP7_75t_R U128 ( .A(n145), .Y(n90) );
  INVx1_ASAP7_75t_R U129 ( .A(n142), .Y(n91) );
  INVx1_ASAP7_75t_R U130 ( .A(\A\[5\] ), .Y(n93) );
  INVx1_ASAP7_75t_R U131 ( .A(\A\[4\] ), .Y(n94) );
  INVx1_ASAP7_75t_R U132 ( .A(\A\[3\] ), .Y(n95) );
  INVx1_ASAP7_75t_R U133 ( .A(\A\[2\] ), .Y(n96) );
  INVx1_ASAP7_75t_R U134 ( .A(\B\[2\] ), .Y(n97) );
  INVx1_ASAP7_75t_R U135 ( .A(\B\[1\] ), .Y(n98) );
  INVx1_ASAP7_75t_R U136 ( .A(\B\[0\] ), .Y(n99) );
  NOR2xp33_ASAP7_75t_R U137 ( .A(n93), .B(n97), .Y(\ab\[5\]\[2\] ) );
  NOR2xp33_ASAP7_75t_R U138 ( .A(n93), .B(n98), .Y(\ab\[5\]\[1\] ) );
  NOR2xp33_ASAP7_75t_R U139 ( .A(n93), .B(n99), .Y(\ab\[5\]\[0\] ) );
  NOR2xp33_ASAP7_75t_R U140 ( .A(n97), .B(n94), .Y(\ab\[4\]\[2\] ) );
  NOR2xp33_ASAP7_75t_R U141 ( .A(n98), .B(n94), .Y(\ab\[4\]\[1\] ) );
  NOR2xp33_ASAP7_75t_R U142 ( .A(n99), .B(n94), .Y(\ab\[4\]\[0\] ) );
  NOR2xp33_ASAP7_75t_R U143 ( .A(n97), .B(n95), .Y(\ab\[3\]\[2\] ) );
  NOR2xp33_ASAP7_75t_R U144 ( .A(n98), .B(n95), .Y(\ab\[3\]\[1\] ) );
  NOR2xp33_ASAP7_75t_R U145 ( .A(n99), .B(n95), .Y(\ab\[3\]\[0\] ) );
  NOR2xp33_ASAP7_75t_R U146 ( .A(n97), .B(n96), .Y(\ab\[2\]\[2\] ) );
  NOR2xp33_ASAP7_75t_R U147 ( .A(n98), .B(n96), .Y(\ab\[2\]\[1\] ) );
  NOR2xp33_ASAP7_75t_R U148 ( .A(n99), .B(n96), .Y(\ab\[2\]\[0\] ) );
  fp32_exp_DW01_add_38 FS_1 ( .A({net27149, n28, n25, n11, n23, n6, n14, n27, 
        n77, n84, n89, n92}), .B({n26, n13, n12, n24, n10, n19, n3, net27149, 
        net27149, net27149, net27149, net27149}), .CI(net27149), .SUM({
        \PRODUCT\[13\] , \PRODUCT\[12\] , \PRODUCT\[11\] , \PRODUCT\[10\] , 
        \PRODUCT\[9\] , \PRODUCT\[8\] , \PRODUCT\[7\] , \PRODUCT\[6\] , 
        \PRODUCT\[5\] , \PRODUCT\[4\] , \PRODUCT\[3\] , \PRODUCT\[2\] }) );
endmodule


module fp32_exp_DW01_add_J8_0 ( .A({\A\[11\] , \A\[10\] , \A\[9\] , \A\[8\] , 
        \A\[7\] , \A\[6\] , \A\[5\] , \A\[4\] , \A\[3\] , \A\[2\] , \A\[1\] , 
        \A\[0\] }), .B({\B\[11\] , \B\[10\] , \B\[9\] , \B\[8\] , \B\[7\] , 
        \B\[6\] , \B\[5\] , \B\[4\] , \B\[3\] , \B\[2\] , \B\[1\] , \B\[0\] }), 
        CI, .SUM({\SUM\[11\] , \SUM\[10\] , \SUM\[9\] , \SUM\[8\] , \SUM\[7\] , 
        \SUM\[6\] , \SUM\[5\] , \SUM\[4\] , \SUM\[3\] , \SUM\[2\] , \SUM\[1\] , 
        \SUM\[0\] }), CO );
  input \A\[11\] , \A\[10\] , \A\[9\] , \A\[8\] , \A\[7\] , \A\[6\] , \A\[5\] ,
         \A\[4\] , \A\[3\] , \A\[2\] , \A\[1\] , \A\[0\] , \B\[11\] ,
         \B\[10\] , \B\[9\] , \B\[8\] , \B\[7\] , \B\[6\] , \B\[5\] , \B\[4\] ,
         \B\[3\] , \B\[2\] , \B\[1\] , \B\[0\] , CI;
  output \SUM\[11\] , \SUM\[10\] , \SUM\[9\] , \SUM\[8\] , \SUM\[7\] ,
         \SUM\[6\] , \SUM\[5\] , \SUM\[4\] , \SUM\[3\] , \SUM\[2\] ,
         \SUM\[1\] , \SUM\[0\] , CO;
  wire   \A\[4\] , \A\[3\] , \A\[2\] , \A\[1\] , \A\[0\] , n1, n2, n4, n5, n6,
         n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20,
         n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33;
  assign \SUM\[4\]  = \A\[4\] ;
  assign \SUM\[3\]  = \A\[3\] ;
  assign \SUM\[2\]  = \A\[2\] ;
  assign \SUM\[1\]  = \A\[1\] ;
  assign \SUM\[0\]  = \A\[0\] ;

  OAI21xp5_ASAP7_75t_R U2 ( .A1(\A\[10\] ), .A2(\B\[10\] ), .B(n19), .Y(n17)
         );
  NAND2xp5_ASAP7_75t_R U3 ( .A(n22), .B(n23), .Y(n19) );
  OAI21xp5_ASAP7_75t_R U4 ( .A1(n2), .A2(n24), .B(n25), .Y(n5) );
  NOR2xp33_ASAP7_75t_R U5 ( .A(\A\[8\] ), .B(\B\[8\] ), .Y(n24) );
  NAND2xp5_ASAP7_75t_R U6 ( .A(n17), .B(n18), .Y(n16) );
  AOI21xp5_ASAP7_75t_R U7 ( .A1(n9), .A2(n11), .B(n27), .Y(n1) );
  OA21x2_ASAP7_75t_R U8 ( .A1(n26), .A2(n1), .B(n8), .Y(n2) );
  AND2x2_ASAP7_75t_R U9 ( .A(n13), .B(n14), .Y(\SUM\[5\] ) );
  INVx1_ASAP7_75t_R U10 ( .A(n13), .Y(n9) );
  INVx1_ASAP7_75t_R U11 ( .A(\B\[11\] ), .Y(n15) );
  INVxp33_ASAP7_75t_R U12 ( .A(\A\[5\] ), .Y(n31) );
  INVxp67_ASAP7_75t_R U13 ( .A(n5), .Y(n4) );
  FAx1_ASAP7_75t_R U14 ( .A(\B\[9\] ), .B(\A\[9\] ), .CI(n4), .SN(\SUM\[9\] )
         );
  FAx1_ASAP7_75t_R U15 ( .A(\B\[8\] ), .B(\A\[8\] ), .CI(n2), .SN(\SUM\[8\] )
         );
  XOR2xp5_ASAP7_75t_R U16 ( .A(n6), .B(n1), .Y(\SUM\[7\] ) );
  NAND2xp5_ASAP7_75t_R U17 ( .A(n7), .B(n8), .Y(n6) );
  XNOR2xp5_ASAP7_75t_R U18 ( .A(n9), .B(n10), .Y(\SUM\[6\] ) );
  NAND2xp5_ASAP7_75t_R U19 ( .A(n11), .B(n12), .Y(n10) );
  XNOR2xp5_ASAP7_75t_R U20 ( .A(n15), .B(n16), .Y(\SUM\[11\] ) );
  NAND2xp5_ASAP7_75t_R U21 ( .A(\B\[10\] ), .B(\A\[10\] ), .Y(n18) );
  XNOR2xp5_ASAP7_75t_R U22 ( .A(n20), .B(n21), .Y(\SUM\[10\] ) );
  XOR2xp5_ASAP7_75t_R U23 ( .A(\B\[10\] ), .B(\A\[10\] ), .Y(n21) );
  INVx1_ASAP7_75t_R U24 ( .A(n19), .Y(n20) );
  OAI21xp5_ASAP7_75t_R U25 ( .A1(\A\[9\] ), .A2(\B\[9\] ), .B(n5), .Y(n23) );
  NAND2xp5_ASAP7_75t_R U26 ( .A(\B\[8\] ), .B(\A\[8\] ), .Y(n25) );
  NAND2xp5_ASAP7_75t_R U27 ( .A(\B\[7\] ), .B(\A\[7\] ), .Y(n8) );
  INVx1_ASAP7_75t_R U28 ( .A(n12), .Y(n27) );
  NAND2xp5_ASAP7_75t_R U29 ( .A(\B\[6\] ), .B(\A\[6\] ), .Y(n12) );
  NAND2xp5_ASAP7_75t_R U30 ( .A(n28), .B(n29), .Y(n11) );
  INVx1_ASAP7_75t_R U31 ( .A(\A\[6\] ), .Y(n29) );
  INVx1_ASAP7_75t_R U32 ( .A(\B\[6\] ), .Y(n28) );
  NAND2xp5_ASAP7_75t_R U33 ( .A(\B\[5\] ), .B(\A\[5\] ), .Y(n13) );
  NAND2xp5_ASAP7_75t_R U34 ( .A(n30), .B(n31), .Y(n14) );
  INVx1_ASAP7_75t_R U35 ( .A(\B\[5\] ), .Y(n30) );
  INVx1_ASAP7_75t_R U36 ( .A(n7), .Y(n26) );
  NAND2xp5_ASAP7_75t_R U37 ( .A(n32), .B(n33), .Y(n7) );
  INVx1_ASAP7_75t_R U38 ( .A(\A\[7\] ), .Y(n33) );
  INVx1_ASAP7_75t_R U39 ( .A(\B\[7\] ), .Y(n32) );
  NAND2xp5_ASAP7_75t_R U40 ( .A(\A\[9\] ), .B(\B\[9\] ), .Y(n22) );
endmodule


module fp32_exp_DW02_mult_2 ( .A({\A\[5\] , \A\[4\] , \A\[3\] , \A\[2\] , 
        \A\[1\] , \A\[0\] }), .B({\B\[7\] , \B\[6\] , \B\[5\] , \B\[4\] , 
        \B\[3\] , \B\[2\] , \B\[1\] , \B\[0\] }), TC, .PRODUCT({
        \PRODUCT\[13\] , \PRODUCT\[12\] , \PRODUCT\[11\] , \PRODUCT\[10\] , 
        \PRODUCT\[9\] , \PRODUCT\[8\] , \PRODUCT\[7\] , \PRODUCT\[6\] , 
        \PRODUCT\[5\] , \PRODUCT\[4\] , \PRODUCT\[3\] , \PRODUCT\[2\] , 
        \PRODUCT\[1\] , \PRODUCT\[0\] }) );
  input \A\[5\] , \A\[4\] , \A\[3\] , \A\[2\] , \A\[1\] , \A\[0\] , \B\[7\] ,
         \B\[6\] , \B\[5\] , \B\[4\] , \B\[3\] , \B\[2\] , \B\[1\] , \B\[0\] ,
         TC;
  output \PRODUCT\[13\] , \PRODUCT\[12\] , \PRODUCT\[11\] , \PRODUCT\[10\] ,
         \PRODUCT\[9\] , \PRODUCT\[8\] , \PRODUCT\[7\] , \PRODUCT\[6\] ,
         \PRODUCT\[5\] , \PRODUCT\[4\] , \PRODUCT\[3\] , \PRODUCT\[2\] ,
         \PRODUCT\[1\] , \PRODUCT\[0\] ;
  wire   net27141, \ab\[5\]\[7\] , \ab\[5\]\[6\] , \ab\[5\]\[5\] ,
         \ab\[5\]\[4\] , \ab\[5\]\[3\] , \ab\[5\]\[2\] , \ab\[5\]\[1\] ,
         \ab\[5\]\[0\] , \ab\[4\]\[7\] , \ab\[4\]\[6\] , \ab\[4\]\[5\] ,
         \ab\[4\]\[4\] , \ab\[4\]\[3\] , \ab\[4\]\[2\] , \ab\[4\]\[1\] ,
         \ab\[4\]\[0\] , \ab\[3\]\[7\] , \ab\[3\]\[6\] , \ab\[3\]\[5\] ,
         \ab\[3\]\[4\] , \ab\[3\]\[3\] , \ab\[3\]\[2\] , \ab\[3\]\[1\] ,
         \ab\[3\]\[0\] , \ab\[2\]\[7\] , \ab\[2\]\[6\] , \ab\[2\]\[5\] ,
         \ab\[2\]\[4\] , \ab\[2\]\[3\] , \ab\[2\]\[2\] , \ab\[2\]\[1\] ,
         \ab\[2\]\[0\] , \ab\[1\]\[7\] , \ab\[1\]\[6\] , \ab\[1\]\[5\] ,
         \ab\[1\]\[4\] , \ab\[1\]\[3\] , \ab\[1\]\[2\] , \ab\[1\]\[1\] ,
         \ab\[1\]\[0\] , \ab\[0\]\[7\] , \ab\[0\]\[6\] , \ab\[0\]\[5\] ,
         \ab\[0\]\[4\] , \ab\[0\]\[3\] , \ab\[0\]\[2\] , \ab\[0\]\[1\] , n2,
         n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17,
         n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46,
         n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60,
         n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74,
         n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88,
         n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101,
         n102, n103, n104, n105, n106, n107, n108, n109, n110, n111, n112,
         n113, n114, n115, n116, n117, n118, n119, n120, n121, n122, n123,
         n124, n125, n126, n127, n128, n129, n130, n131, n132, n133, n134,
         n135, n136, n137, n138, n139, n140, n141, n142, n143, n144, n145,
         n146, n147, n148, n149, n150, n151, n152, n153, n154, n155;

  FAx1_ASAP7_75t_R S4_0 ( .A(\ab\[5\]\[0\] ), .B(n83), .CI(n78), .CON(n100), 
        .SN(n101) );
  FAx1_ASAP7_75t_R S4_1 ( .A(\ab\[5\]\[1\] ), .B(n75), .CI(n70), .CON(n102), 
        .SN(n103) );
  FAx1_ASAP7_75t_R S4_2 ( .A(\ab\[5\]\[2\] ), .B(n67), .CI(n62), .CON(n104), 
        .SN(n105) );
  FAx1_ASAP7_75t_R S4_3 ( .A(\ab\[5\]\[3\] ), .B(n59), .CI(n54), .CON(n106), 
        .SN(n107) );
  FAx1_ASAP7_75t_R S4_4 ( .A(\ab\[5\]\[4\] ), .B(n51), .CI(n47), .CON(n108), 
        .SN(n109) );
  FAx1_ASAP7_75t_R S4_5 ( .A(\ab\[5\]\[5\] ), .B(n44), .CI(n42), .CON(n110), 
        .SN(n111) );
  FAx1_ASAP7_75t_R S5_6 ( .A(\ab\[5\]\[6\] ), .B(n39), .CI(\ab\[4\]\[7\] ), 
        .CON(n112), .SN(n113) );
  FAx1_ASAP7_75t_R S1_4_0 ( .A(\ab\[4\]\[0\] ), .B(n88), .CI(n85), .CON(n114), 
        .SN(n115) );
  FAx1_ASAP7_75t_R S2_4_1 ( .A(\ab\[4\]\[1\] ), .B(n82), .CI(n79), .CON(n116), 
        .SN(n117) );
  FAx1_ASAP7_75t_R S2_4_2 ( .A(\ab\[4\]\[2\] ), .B(n74), .CI(n71), .CON(n118), 
        .SN(n119) );
  FAx1_ASAP7_75t_R S2_4_3 ( .A(\ab\[4\]\[3\] ), .B(n66), .CI(n63), .CON(n120), 
        .SN(n121) );
  FAx1_ASAP7_75t_R S2_4_4 ( .A(\ab\[4\]\[4\] ), .B(n58), .CI(n55), .CON(n122), 
        .SN(n123) );
  FAx1_ASAP7_75t_R S2_4_5 ( .A(\ab\[4\]\[5\] ), .B(n50), .CI(n48), .CON(n124), 
        .SN(n125) );
  FAx1_ASAP7_75t_R S3_4_6 ( .A(\ab\[4\]\[6\] ), .B(n43), .CI(\ab\[3\]\[7\] ), 
        .CON(n126), .SN(n127) );
  FAx1_ASAP7_75t_R S1_3_0 ( .A(\ab\[3\]\[0\] ), .B(n91), .CI(n90), .CON(n128), 
        .SN(n129) );
  FAx1_ASAP7_75t_R S2_3_1 ( .A(\ab\[3\]\[1\] ), .B(n87), .CI(n86), .CON(n130), 
        .SN(n131) );
  FAx1_ASAP7_75t_R S2_3_2 ( .A(\ab\[3\]\[2\] ), .B(n81), .CI(n80), .CON(n132), 
        .SN(n133) );
  FAx1_ASAP7_75t_R S2_3_3 ( .A(\ab\[3\]\[3\] ), .B(n73), .CI(n72), .CON(n134), 
        .SN(n135) );
  FAx1_ASAP7_75t_R S2_3_4 ( .A(\ab\[3\]\[4\] ), .B(n65), .CI(n64), .CON(n136), 
        .SN(n137) );
  FAx1_ASAP7_75t_R S2_3_5 ( .A(\ab\[3\]\[5\] ), .B(n57), .CI(n56), .CON(n138), 
        .SN(n139) );
  FAx1_ASAP7_75t_R S3_3_6 ( .A(\ab\[3\]\[6\] ), .B(n49), .CI(\ab\[2\]\[7\] ), 
        .CON(n140), .SN(n141) );
  FAx1_ASAP7_75t_R S1_2_0 ( .A(\ab\[2\]\[0\] ), .B(n23), .CI(n10), .CON(n142), 
        .SN(n143) );
  FAx1_ASAP7_75t_R S2_2_1 ( .A(\ab\[2\]\[1\] ), .B(n8), .CI(n21), .CON(n144), 
        .SN(n145) );
  FAx1_ASAP7_75t_R S2_2_2 ( .A(\ab\[2\]\[2\] ), .B(n7), .CI(n20), .CON(n146), 
        .SN(n147) );
  FAx1_ASAP7_75t_R S2_2_3 ( .A(\ab\[2\]\[3\] ), .B(n19), .CI(n6), .CON(n148), 
        .SN(n149) );
  FAx1_ASAP7_75t_R S2_2_4 ( .A(\ab\[2\]\[4\] ), .B(n16), .CI(n4), .CON(n150), 
        .SN(n151) );
  FAx1_ASAP7_75t_R S2_2_5 ( .A(\ab\[2\]\[5\] ), .B(n15), .CI(n3), .CON(n152), 
        .SN(n153) );
  FAx1_ASAP7_75t_R S3_2_6 ( .A(\ab\[2\]\[6\] ), .B(n17), .CI(\ab\[1\]\[7\] ), 
        .CON(n154), .SN(n155) );
  NOR2xp33_ASAP7_75t_R U2 ( .A(n95), .B(n33), .Y(\ab\[3\]\[4\] ) );
  NOR2xp33_ASAP7_75t_R U3 ( .A(n94), .B(n34), .Y(\ab\[4\]\[3\] ) );
  NOR2xp33_ASAP7_75t_R U4 ( .A(n96), .B(n31), .Y(\ab\[2\]\[6\] ) );
  NOR2xp33_ASAP7_75t_R U5 ( .A(n96), .B(n32), .Y(\ab\[2\]\[5\] ) );
  NOR2xp33_ASAP7_75t_R U6 ( .A(n94), .B(n31), .Y(\ab\[4\]\[6\] ) );
  NOR2xp33_ASAP7_75t_R U7 ( .A(n95), .B(n35), .Y(\ab\[3\]\[7\] ) );
  NOR2xp33_ASAP7_75t_R U8 ( .A(n94), .B(n32), .Y(\ab\[4\]\[5\] ) );
  NOR2xp33_ASAP7_75t_R U9 ( .A(n94), .B(n33), .Y(\ab\[4\]\[4\] ) );
  NOR2xp33_ASAP7_75t_R U10 ( .A(n95), .B(n34), .Y(\ab\[3\]\[3\] ) );
  NOR2xp33_ASAP7_75t_R U11 ( .A(n95), .B(n31), .Y(\ab\[3\]\[6\] ) );
  NOR2xp33_ASAP7_75t_R U12 ( .A(n96), .B(n35), .Y(\ab\[2\]\[7\] ) );
  NOR2xp33_ASAP7_75t_R U13 ( .A(n95), .B(n32), .Y(\ab\[3\]\[5\] ) );
  NOR2xp33_ASAP7_75t_R U14 ( .A(n96), .B(n33), .Y(\ab\[2\]\[4\] ) );
  NOR2xp33_ASAP7_75t_R U15 ( .A(n96), .B(n34), .Y(\ab\[2\]\[3\] ) );
  NOR2xp33_ASAP7_75t_R U16 ( .A(n93), .B(n31), .Y(\ab\[5\]\[6\] ) );
  NOR2xp33_ASAP7_75t_R U17 ( .A(n94), .B(n35), .Y(\ab\[4\]\[7\] ) );
  NOR2xp33_ASAP7_75t_R U18 ( .A(n93), .B(n32), .Y(\ab\[5\]\[5\] ) );
  NOR2xp33_ASAP7_75t_R U19 ( .A(n93), .B(n33), .Y(\ab\[5\]\[4\] ) );
  NOR2xp33_ASAP7_75t_R U20 ( .A(n93), .B(n34), .Y(\ab\[5\]\[3\] ) );
  NOR2xp33_ASAP7_75t_R U21 ( .A(n97), .B(n30), .Y(\ab\[1\]\[2\] ) );
  NOR2xp33_ASAP7_75t_R U22 ( .A(n93), .B(n35), .Y(\ab\[5\]\[7\] ) );
  NOR2xp33_ASAP7_75t_R U23 ( .A(n97), .B(n36), .Y(\ab\[0\]\[2\] ) );
  NOR2xp33_ASAP7_75t_R U24 ( .A(n98), .B(n30), .Y(\ab\[1\]\[1\] ) );
  NOR2xp33_ASAP7_75t_R U25 ( .A(n98), .B(n36), .Y(\ab\[0\]\[1\] ) );
  NOR2xp33_ASAP7_75t_R U26 ( .A(n99), .B(n30), .Y(\ab\[1\]\[0\] ) );
  NOR2xp33_ASAP7_75t_R U27 ( .A(n99), .B(n36), .Y(\PRODUCT\[0\] ) );
  XOR2xp5_ASAP7_75t_R U28 ( .A(n61), .B(n68), .Y(n2) );
  XOR2xp5_ASAP7_75t_R U29 ( .A(\ab\[1\]\[6\] ), .B(\ab\[0\]\[7\] ), .Y(n3) );
  XOR2xp5_ASAP7_75t_R U30 ( .A(\ab\[1\]\[5\] ), .B(\ab\[0\]\[6\] ), .Y(n4) );
  XOR2xp5_ASAP7_75t_R U31 ( .A(n53), .B(n60), .Y(n5) );
  XOR2xp5_ASAP7_75t_R U32 ( .A(\ab\[1\]\[4\] ), .B(\ab\[0\]\[5\] ), .Y(n6) );
  AND2x2_ASAP7_75t_R U33 ( .A(\ab\[0\]\[3\] ), .B(\ab\[1\]\[2\] ), .Y(n7) );
  AND2x2_ASAP7_75t_R U34 ( .A(\ab\[0\]\[2\] ), .B(\ab\[1\]\[1\] ), .Y(n8) );
  AND2x2_ASAP7_75t_R U35 ( .A(n60), .B(n53), .Y(n9) );
  XOR2xp5_ASAP7_75t_R U36 ( .A(\ab\[1\]\[1\] ), .B(\ab\[0\]\[2\] ), .Y(n10) );
  XOR2xp5_ASAP7_75t_R U37 ( .A(n41), .B(n45), .Y(n11) );
  AND2x2_ASAP7_75t_R U38 ( .A(n45), .B(n41), .Y(n12) );
  AND2x2_ASAP7_75t_R U39 ( .A(n40), .B(n38), .Y(n13) );
  AND2x2_ASAP7_75t_R U40 ( .A(n76), .B(n69), .Y(n14) );
  AND2x2_ASAP7_75t_R U41 ( .A(\ab\[0\]\[6\] ), .B(\ab\[1\]\[5\] ), .Y(n15) );
  AND2x2_ASAP7_75t_R U42 ( .A(\ab\[0\]\[5\] ), .B(\ab\[1\]\[4\] ), .Y(n16) );
  AND2x2_ASAP7_75t_R U43 ( .A(\ab\[0\]\[7\] ), .B(\ab\[1\]\[6\] ), .Y(n17) );
  AND2x2_ASAP7_75t_R U44 ( .A(n68), .B(n61), .Y(n18) );
  AND2x2_ASAP7_75t_R U45 ( .A(\ab\[0\]\[4\] ), .B(\ab\[1\]\[3\] ), .Y(n19) );
  XOR2xp5_ASAP7_75t_R U46 ( .A(\ab\[1\]\[3\] ), .B(\ab\[0\]\[4\] ), .Y(n20) );
  XOR2xp5_ASAP7_75t_R U47 ( .A(\ab\[1\]\[2\] ), .B(\ab\[0\]\[3\] ), .Y(n21) );
  XOR2xp5_ASAP7_75t_R U48 ( .A(n46), .B(n52), .Y(n22) );
  AND2x2_ASAP7_75t_R U49 ( .A(\ab\[0\]\[1\] ), .B(\ab\[1\]\[0\] ), .Y(n23) );
  AND2x2_ASAP7_75t_R U50 ( .A(n52), .B(n46), .Y(n24) );
  XOR2xp5_ASAP7_75t_R U51 ( .A(n38), .B(n40), .Y(n25) );
  XOR2xp5_ASAP7_75t_R U52 ( .A(n69), .B(n76), .Y(n26) );
  XOR2xp5_ASAP7_75t_R U53 ( .A(\ab\[5\]\[7\] ), .B(n37), .Y(n27) );
  AND2x2_ASAP7_75t_R U54 ( .A(n37), .B(\ab\[5\]\[7\] ), .Y(n28) );
  XOR2xp5_ASAP7_75t_R U55 ( .A(\ab\[1\]\[0\] ), .B(\ab\[0\]\[1\] ), .Y(
        \PRODUCT\[1\] ) );
  TIELOx1_ASAP7_75t_R U56 ( .L(net27141) );
  INVxp33_ASAP7_75t_R U57 ( .A(\B\[7\] ), .Y(n35) );
  INVx1_ASAP7_75t_R U58 ( .A(n153), .Y(n64) );
  INVx1_ASAP7_75t_R U59 ( .A(n105), .Y(n61) );
  INVxp67_ASAP7_75t_R U60 ( .A(\B\[6\] ), .Y(n31) );
  AND2x2_ASAP7_75t_R U61 ( .A(\B\[7\] ), .B(\A\[0\] ), .Y(\ab\[0\]\[7\] ) );
  AND2x2_ASAP7_75t_R U62 ( .A(\A\[1\] ), .B(\B\[6\] ), .Y(\ab\[1\]\[6\] ) );
  AND2x2_ASAP7_75t_R U63 ( .A(\B\[6\] ), .B(\A\[0\] ), .Y(\ab\[0\]\[6\] ) );
  AND2x2_ASAP7_75t_R U64 ( .A(\A\[1\] ), .B(\B\[5\] ), .Y(\ab\[1\]\[5\] ) );
  AND2x2_ASAP7_75t_R U65 ( .A(\B\[5\] ), .B(\A\[0\] ), .Y(\ab\[0\]\[5\] ) );
  AND2x2_ASAP7_75t_R U66 ( .A(\A\[1\] ), .B(\B\[4\] ), .Y(\ab\[1\]\[4\] ) );
  AND2x2_ASAP7_75t_R U67 ( .A(\B\[4\] ), .B(\A\[0\] ), .Y(\ab\[0\]\[4\] ) );
  AND2x2_ASAP7_75t_R U68 ( .A(\A\[1\] ), .B(\B\[3\] ), .Y(\ab\[1\]\[3\] ) );
  AND2x2_ASAP7_75t_R U69 ( .A(\B\[3\] ), .B(\A\[0\] ), .Y(\ab\[0\]\[3\] ) );
  INVx1_ASAP7_75t_R U70 ( .A(\A\[1\] ), .Y(n30) );
  INVx1_ASAP7_75t_R U71 ( .A(\A\[0\] ), .Y(n36) );
  AND2x2_ASAP7_75t_R U72 ( .A(\A\[1\] ), .B(\B\[7\] ), .Y(\ab\[1\]\[7\] ) );
  INVx1_ASAP7_75t_R U73 ( .A(\B\[5\] ), .Y(n32) );
  INVx1_ASAP7_75t_R U74 ( .A(\B\[4\] ), .Y(n33) );
  INVx1_ASAP7_75t_R U75 ( .A(\B\[3\] ), .Y(n34) );
  INVx1_ASAP7_75t_R U76 ( .A(n152), .Y(n57) );
  INVx1_ASAP7_75t_R U77 ( .A(n155), .Y(n56) );
  INVx1_ASAP7_75t_R U78 ( .A(n150), .Y(n65) );
  INVx1_ASAP7_75t_R U79 ( .A(n148), .Y(n73) );
  INVx1_ASAP7_75t_R U80 ( .A(n151), .Y(n72) );
  INVx1_ASAP7_75t_R U81 ( .A(n146), .Y(n81) );
  INVx1_ASAP7_75t_R U82 ( .A(n149), .Y(n80) );
  INVx1_ASAP7_75t_R U83 ( .A(n147), .Y(n86) );
  INVx1_ASAP7_75t_R U84 ( .A(n136), .Y(n58) );
  INVx1_ASAP7_75t_R U85 ( .A(n139), .Y(n55) );
  INVx1_ASAP7_75t_R U86 ( .A(n134), .Y(n66) );
  INVx1_ASAP7_75t_R U87 ( .A(n137), .Y(n63) );
  INVx1_ASAP7_75t_R U88 ( .A(n132), .Y(n74) );
  INVx1_ASAP7_75t_R U89 ( .A(n135), .Y(n71) );
  INVx1_ASAP7_75t_R U90 ( .A(n130), .Y(n82) );
  INVx1_ASAP7_75t_R U91 ( .A(n133), .Y(n79) );
  INVx1_ASAP7_75t_R U92 ( .A(n120), .Y(n59) );
  INVx1_ASAP7_75t_R U93 ( .A(n123), .Y(n54) );
  INVx1_ASAP7_75t_R U94 ( .A(n118), .Y(n67) );
  INVx1_ASAP7_75t_R U95 ( .A(n121), .Y(n62) );
  INVx1_ASAP7_75t_R U96 ( .A(n116), .Y(n75) );
  INVx1_ASAP7_75t_R U97 ( .A(n119), .Y(n70) );
  INVx1_ASAP7_75t_R U98 ( .A(n117), .Y(n78) );
  INVx1_ASAP7_75t_R U99 ( .A(n104), .Y(n60) );
  INVx1_ASAP7_75t_R U100 ( .A(n107), .Y(n53) );
  INVx1_ASAP7_75t_R U101 ( .A(n102), .Y(n68) );
  INVx1_ASAP7_75t_R U102 ( .A(n100), .Y(n76) );
  INVx1_ASAP7_75t_R U103 ( .A(n103), .Y(n69) );
  INVx1_ASAP7_75t_R U104 ( .A(n101), .Y(n77) );
  INVx1_ASAP7_75t_R U105 ( .A(n115), .Y(n84) );
  INVx1_ASAP7_75t_R U106 ( .A(n129), .Y(n89) );
  INVx1_ASAP7_75t_R U107 ( .A(n143), .Y(n92) );
  INVx1_ASAP7_75t_R U108 ( .A(n112), .Y(n37) );
  INVx1_ASAP7_75t_R U109 ( .A(n113), .Y(n38) );
  INVx1_ASAP7_75t_R U110 ( .A(n126), .Y(n39) );
  INVx1_ASAP7_75t_R U111 ( .A(n110), .Y(n40) );
  INVx1_ASAP7_75t_R U112 ( .A(n111), .Y(n41) );
  INVx1_ASAP7_75t_R U113 ( .A(n127), .Y(n42) );
  INVx1_ASAP7_75t_R U114 ( .A(n140), .Y(n43) );
  INVx1_ASAP7_75t_R U115 ( .A(n124), .Y(n44) );
  INVx1_ASAP7_75t_R U116 ( .A(n108), .Y(n45) );
  INVx1_ASAP7_75t_R U117 ( .A(n109), .Y(n46) );
  INVx1_ASAP7_75t_R U118 ( .A(n125), .Y(n47) );
  INVx1_ASAP7_75t_R U119 ( .A(n141), .Y(n48) );
  INVx1_ASAP7_75t_R U120 ( .A(n154), .Y(n49) );
  INVx1_ASAP7_75t_R U121 ( .A(n138), .Y(n50) );
  INVx1_ASAP7_75t_R U122 ( .A(n122), .Y(n51) );
  INVx1_ASAP7_75t_R U123 ( .A(n106), .Y(n52) );
  INVx1_ASAP7_75t_R U124 ( .A(n114), .Y(n83) );
  INVx1_ASAP7_75t_R U125 ( .A(n131), .Y(n85) );
  INVx1_ASAP7_75t_R U126 ( .A(n144), .Y(n87) );
  INVx1_ASAP7_75t_R U127 ( .A(n128), .Y(n88) );
  INVx1_ASAP7_75t_R U128 ( .A(n145), .Y(n90) );
  INVx1_ASAP7_75t_R U129 ( .A(n142), .Y(n91) );
  INVx1_ASAP7_75t_R U130 ( .A(\A\[5\] ), .Y(n93) );
  INVx1_ASAP7_75t_R U131 ( .A(\A\[4\] ), .Y(n94) );
  INVx1_ASAP7_75t_R U132 ( .A(\A\[3\] ), .Y(n95) );
  INVx1_ASAP7_75t_R U133 ( .A(\A\[2\] ), .Y(n96) );
  INVx1_ASAP7_75t_R U134 ( .A(\B\[2\] ), .Y(n97) );
  INVx1_ASAP7_75t_R U135 ( .A(\B\[1\] ), .Y(n98) );
  INVx1_ASAP7_75t_R U136 ( .A(\B\[0\] ), .Y(n99) );
  NOR2xp33_ASAP7_75t_R U137 ( .A(n93), .B(n97), .Y(\ab\[5\]\[2\] ) );
  NOR2xp33_ASAP7_75t_R U138 ( .A(n93), .B(n98), .Y(\ab\[5\]\[1\] ) );
  NOR2xp33_ASAP7_75t_R U139 ( .A(n93), .B(n99), .Y(\ab\[5\]\[0\] ) );
  NOR2xp33_ASAP7_75t_R U140 ( .A(n97), .B(n94), .Y(\ab\[4\]\[2\] ) );
  NOR2xp33_ASAP7_75t_R U141 ( .A(n98), .B(n94), .Y(\ab\[4\]\[1\] ) );
  NOR2xp33_ASAP7_75t_R U142 ( .A(n99), .B(n94), .Y(\ab\[4\]\[0\] ) );
  NOR2xp33_ASAP7_75t_R U143 ( .A(n97), .B(n95), .Y(\ab\[3\]\[2\] ) );
  NOR2xp33_ASAP7_75t_R U144 ( .A(n98), .B(n95), .Y(\ab\[3\]\[1\] ) );
  NOR2xp33_ASAP7_75t_R U145 ( .A(n99), .B(n95), .Y(\ab\[3\]\[0\] ) );
  NOR2xp33_ASAP7_75t_R U146 ( .A(n97), .B(n96), .Y(\ab\[2\]\[2\] ) );
  NOR2xp33_ASAP7_75t_R U147 ( .A(n98), .B(n96), .Y(\ab\[2\]\[1\] ) );
  NOR2xp33_ASAP7_75t_R U148 ( .A(n99), .B(n96), .Y(\ab\[2\]\[0\] ) );
  fp32_exp_DW01_add_J8_0 FS_1 ( .A({net27141, n27, n25, n11, n22, n5, n2, n26, 
        n77, n84, n89, n92}), .B({n28, n13, n12, n24, n9, n18, n14, net27141, 
        net27141, net27141, net27141, net27141}), .CI(net27141), .SUM({
        \PRODUCT\[13\] , \PRODUCT\[12\] , \PRODUCT\[11\] , \PRODUCT\[10\] , 
        \PRODUCT\[9\] , \PRODUCT\[8\] , \PRODUCT\[7\] , \PRODUCT\[6\] , 
        \PRODUCT\[5\] , \PRODUCT\[4\] , \PRODUCT\[3\] , \PRODUCT\[2\] }) );
endmodule


module fp32_exp_DW01_add_39 ( .A({\A\[11\] , \A\[10\] , \A\[9\] , \A\[8\] , 
        \A\[7\] , \A\[6\] , \A\[5\] , \A\[4\] , \A\[3\] , \A\[2\] , \A\[1\] , 
        \A\[0\] }), .B({\B\[11\] , \B\[10\] , \B\[9\] , \B\[8\] , \B\[7\] , 
        \B\[6\] , \B\[5\] , \B\[4\] , \B\[3\] , \B\[2\] , \B\[1\] , \B\[0\] }), 
        CI, .SUM({\SUM\[11\] , \SUM\[10\] , \SUM\[9\] , \SUM\[8\] , \SUM\[7\] , 
        \SUM\[6\] , \SUM\[5\] , \SUM\[4\] , \SUM\[3\] , \SUM\[2\] , \SUM\[1\] , 
        \SUM\[0\] }), CO );
  input \A\[11\] , \A\[10\] , \A\[9\] , \A\[8\] , \A\[7\] , \A\[6\] , \A\[5\] ,
         \A\[4\] , \A\[3\] , \A\[2\] , \A\[1\] , \A\[0\] , \B\[11\] ,
         \B\[10\] , \B\[9\] , \B\[8\] , \B\[7\] , \B\[6\] , \B\[5\] , \B\[4\] ,
         \B\[3\] , \B\[2\] , \B\[1\] , \B\[0\] , CI;
  output \SUM\[11\] , \SUM\[10\] , \SUM\[9\] , \SUM\[8\] , \SUM\[7\] ,
         \SUM\[6\] , \SUM\[5\] , \SUM\[4\] , \SUM\[3\] , \SUM\[2\] ,
         \SUM\[1\] , \SUM\[0\] , CO;
  wire   \A\[4\] , \A\[3\] , \A\[2\] , \A\[1\] , \A\[0\] , n1, n2, n4, n5, n6,
         n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20,
         n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33;
  assign \SUM\[4\]  = \A\[4\] ;
  assign \SUM\[3\]  = \A\[3\] ;
  assign \SUM\[2\]  = \A\[2\] ;
  assign \SUM\[1\]  = \A\[1\] ;
  assign \SUM\[0\]  = \A\[0\] ;

  OAI21xp5_ASAP7_75t_R U2 ( .A1(\A\[10\] ), .A2(\B\[10\] ), .B(n19), .Y(n17)
         );
  NAND2xp5_ASAP7_75t_R U3 ( .A(n22), .B(n23), .Y(n19) );
  OAI21xp5_ASAP7_75t_R U4 ( .A1(\A\[9\] ), .A2(\B\[9\] ), .B(n5), .Y(n23) );
  OAI21xp5_ASAP7_75t_R U5 ( .A1(n2), .A2(n24), .B(n25), .Y(n5) );
  NOR2xp33_ASAP7_75t_R U6 ( .A(\A\[8\] ), .B(\B\[8\] ), .Y(n24) );
  NAND2xp5_ASAP7_75t_R U7 ( .A(\B\[5\] ), .B(\A\[5\] ), .Y(n13) );
  NAND2xp5_ASAP7_75t_R U8 ( .A(n17), .B(n18), .Y(n16) );
  AOI21xp5_ASAP7_75t_R U9 ( .A1(n9), .A2(n11), .B(n27), .Y(n1) );
  OA21x2_ASAP7_75t_R U10 ( .A1(n26), .A2(n1), .B(n8), .Y(n2) );
  AND2x2_ASAP7_75t_R U11 ( .A(n13), .B(n14), .Y(\SUM\[5\] ) );
  INVx1_ASAP7_75t_R U12 ( .A(n13), .Y(n9) );
  INVx1_ASAP7_75t_R U13 ( .A(\B\[11\] ), .Y(n15) );
  FAx1_ASAP7_75t_R U14 ( .A(\B\[9\] ), .B(\A\[9\] ), .CI(n4), .SN(\SUM\[9\] )
         );
  INVx1_ASAP7_75t_R U15 ( .A(n5), .Y(n4) );
  FAx1_ASAP7_75t_R U16 ( .A(\B\[8\] ), .B(\A\[8\] ), .CI(n2), .SN(\SUM\[8\] )
         );
  XOR2xp5_ASAP7_75t_R U17 ( .A(n6), .B(n1), .Y(\SUM\[7\] ) );
  NAND2xp5_ASAP7_75t_R U18 ( .A(n7), .B(n8), .Y(n6) );
  XNOR2xp5_ASAP7_75t_R U19 ( .A(n9), .B(n10), .Y(\SUM\[6\] ) );
  NAND2xp5_ASAP7_75t_R U20 ( .A(n11), .B(n12), .Y(n10) );
  XNOR2xp5_ASAP7_75t_R U21 ( .A(n15), .B(n16), .Y(\SUM\[11\] ) );
  NAND2xp5_ASAP7_75t_R U22 ( .A(\B\[10\] ), .B(\A\[10\] ), .Y(n18) );
  XNOR2xp5_ASAP7_75t_R U23 ( .A(n20), .B(n21), .Y(\SUM\[10\] ) );
  XOR2xp5_ASAP7_75t_R U24 ( .A(\B\[10\] ), .B(\A\[10\] ), .Y(n21) );
  INVx1_ASAP7_75t_R U25 ( .A(n19), .Y(n20) );
  NAND2xp5_ASAP7_75t_R U26 ( .A(\B\[8\] ), .B(\A\[8\] ), .Y(n25) );
  NAND2xp5_ASAP7_75t_R U27 ( .A(\B\[7\] ), .B(\A\[7\] ), .Y(n8) );
  INVx1_ASAP7_75t_R U28 ( .A(n12), .Y(n27) );
  NAND2xp5_ASAP7_75t_R U29 ( .A(\B\[6\] ), .B(\A\[6\] ), .Y(n12) );
  NAND2xp5_ASAP7_75t_R U30 ( .A(n28), .B(n29), .Y(n11) );
  INVx1_ASAP7_75t_R U31 ( .A(\A\[6\] ), .Y(n29) );
  INVx1_ASAP7_75t_R U32 ( .A(\B\[6\] ), .Y(n28) );
  NAND2xp5_ASAP7_75t_R U33 ( .A(n30), .B(n31), .Y(n14) );
  INVx1_ASAP7_75t_R U34 ( .A(\A\[5\] ), .Y(n31) );
  INVx1_ASAP7_75t_R U35 ( .A(\B\[5\] ), .Y(n30) );
  INVx1_ASAP7_75t_R U36 ( .A(n7), .Y(n26) );
  NAND2xp5_ASAP7_75t_R U37 ( .A(n32), .B(n33), .Y(n7) );
  INVx1_ASAP7_75t_R U38 ( .A(\A\[7\] ), .Y(n33) );
  INVx1_ASAP7_75t_R U39 ( .A(\B\[7\] ), .Y(n32) );
  NAND2xp5_ASAP7_75t_R U40 ( .A(\A\[9\] ), .B(\B\[9\] ), .Y(n22) );
endmodule


module fp32_exp_DW02_mult_1 ( .A({\A\[5\] , \A\[4\] , \A\[3\] , \A\[2\] , 
        \A\[1\] , \A\[0\] }), .B({\B\[7\] , \B\[6\] , \B\[5\] , \B\[4\] , 
        \B\[3\] , \B\[2\] , \B\[1\] , \B\[0\] }), TC, .PRODUCT({
        \PRODUCT\[13\] , \PRODUCT\[12\] , \PRODUCT\[11\] , \PRODUCT\[10\] , 
        \PRODUCT\[9\] , \PRODUCT\[8\] , \PRODUCT\[7\] , \PRODUCT\[6\] , 
        \PRODUCT\[5\] , \PRODUCT\[4\] , \PRODUCT\[3\] , \PRODUCT\[2\] , 
        \PRODUCT\[1\] , \PRODUCT\[0\] }) );
  input \A\[5\] , \A\[4\] , \A\[3\] , \A\[2\] , \A\[1\] , \A\[0\] , \B\[7\] ,
         \B\[6\] , \B\[5\] , \B\[4\] , \B\[3\] , \B\[2\] , \B\[1\] , \B\[0\] ,
         TC;
  output \PRODUCT\[13\] , \PRODUCT\[12\] , \PRODUCT\[11\] , \PRODUCT\[10\] ,
         \PRODUCT\[9\] , \PRODUCT\[8\] , \PRODUCT\[7\] , \PRODUCT\[6\] ,
         \PRODUCT\[5\] , \PRODUCT\[4\] , \PRODUCT\[3\] , \PRODUCT\[2\] ,
         \PRODUCT\[1\] , \PRODUCT\[0\] ;
  wire   net27133, \ab\[5\]\[7\] , \ab\[5\]\[6\] , \ab\[5\]\[5\] ,
         \ab\[5\]\[4\] , \ab\[5\]\[3\] , \ab\[5\]\[2\] , \ab\[5\]\[1\] ,
         \ab\[5\]\[0\] , \ab\[4\]\[7\] , \ab\[4\]\[6\] , \ab\[4\]\[5\] ,
         \ab\[4\]\[4\] , \ab\[4\]\[3\] , \ab\[4\]\[2\] , \ab\[4\]\[1\] ,
         \ab\[4\]\[0\] , \ab\[3\]\[7\] , \ab\[3\]\[6\] , \ab\[3\]\[5\] ,
         \ab\[3\]\[4\] , \ab\[3\]\[3\] , \ab\[3\]\[2\] , \ab\[3\]\[1\] ,
         \ab\[3\]\[0\] , \ab\[2\]\[7\] , \ab\[2\]\[6\] , \ab\[2\]\[5\] ,
         \ab\[2\]\[4\] , \ab\[2\]\[3\] , \ab\[2\]\[2\] , \ab\[2\]\[1\] ,
         \ab\[2\]\[0\] , \ab\[1\]\[7\] , \ab\[1\]\[6\] , \ab\[1\]\[5\] ,
         \ab\[1\]\[4\] , \ab\[1\]\[3\] , \ab\[1\]\[2\] , \ab\[1\]\[1\] ,
         \ab\[1\]\[0\] , \ab\[0\]\[7\] , \ab\[0\]\[6\] , \ab\[0\]\[5\] ,
         \ab\[0\]\[4\] , \ab\[0\]\[3\] , \ab\[0\]\[2\] , \ab\[0\]\[1\] , n2,
         n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17,
         n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46,
         n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60,
         n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74,
         n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88,
         n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101,
         n102, n103, n104, n105, n106, n107, n108, n109, n110, n111, n112,
         n113, n114, n115, n116, n117, n118, n119, n120, n121, n122, n123,
         n124, n125, n126, n127, n128, n129, n130, n131, n132, n133, n134,
         n135, n136, n137, n138, n139, n140, n141, n142, n143, n144, n145,
         n146, n147, n148, n149, n150, n151, n152, n153, n154, n155;

  FAx1_ASAP7_75t_R S4_0 ( .A(\ab\[5\]\[0\] ), .B(n83), .CI(n78), .CON(n100), 
        .SN(n101) );
  FAx1_ASAP7_75t_R S4_1 ( .A(\ab\[5\]\[1\] ), .B(n75), .CI(n70), .CON(n102), 
        .SN(n103) );
  FAx1_ASAP7_75t_R S4_2 ( .A(\ab\[5\]\[2\] ), .B(n67), .CI(n62), .CON(n104), 
        .SN(n105) );
  FAx1_ASAP7_75t_R S4_3 ( .A(\ab\[5\]\[3\] ), .B(n59), .CI(n54), .CON(n106), 
        .SN(n107) );
  FAx1_ASAP7_75t_R S4_4 ( .A(\ab\[5\]\[4\] ), .B(n51), .CI(n47), .CON(n108), 
        .SN(n109) );
  FAx1_ASAP7_75t_R S4_5 ( .A(\ab\[5\]\[5\] ), .B(n44), .CI(n42), .CON(n110), 
        .SN(n111) );
  FAx1_ASAP7_75t_R S5_6 ( .A(\ab\[5\]\[6\] ), .B(n39), .CI(\ab\[4\]\[7\] ), 
        .CON(n112), .SN(n113) );
  FAx1_ASAP7_75t_R S1_4_0 ( .A(\ab\[4\]\[0\] ), .B(n88), .CI(n85), .CON(n114), 
        .SN(n115) );
  FAx1_ASAP7_75t_R S2_4_1 ( .A(\ab\[4\]\[1\] ), .B(n82), .CI(n79), .CON(n116), 
        .SN(n117) );
  FAx1_ASAP7_75t_R S2_4_2 ( .A(\ab\[4\]\[2\] ), .B(n74), .CI(n71), .CON(n118), 
        .SN(n119) );
  FAx1_ASAP7_75t_R S2_4_3 ( .A(\ab\[4\]\[3\] ), .B(n66), .CI(n63), .CON(n120), 
        .SN(n121) );
  FAx1_ASAP7_75t_R S2_4_4 ( .A(\ab\[4\]\[4\] ), .B(n58), .CI(n55), .CON(n122), 
        .SN(n123) );
  FAx1_ASAP7_75t_R S2_4_5 ( .A(\ab\[4\]\[5\] ), .B(n50), .CI(n48), .CON(n124), 
        .SN(n125) );
  FAx1_ASAP7_75t_R S3_4_6 ( .A(\ab\[4\]\[6\] ), .B(n43), .CI(\ab\[3\]\[7\] ), 
        .CON(n126), .SN(n127) );
  FAx1_ASAP7_75t_R S1_3_0 ( .A(\ab\[3\]\[0\] ), .B(n91), .CI(n90), .CON(n128), 
        .SN(n129) );
  FAx1_ASAP7_75t_R S2_3_1 ( .A(\ab\[3\]\[1\] ), .B(n87), .CI(n86), .CON(n130), 
        .SN(n131) );
  FAx1_ASAP7_75t_R S2_3_2 ( .A(\ab\[3\]\[2\] ), .B(n81), .CI(n80), .CON(n132), 
        .SN(n133) );
  FAx1_ASAP7_75t_R S2_3_3 ( .A(\ab\[3\]\[3\] ), .B(n73), .CI(n72), .CON(n134), 
        .SN(n135) );
  FAx1_ASAP7_75t_R S2_3_4 ( .A(\ab\[3\]\[4\] ), .B(n65), .CI(n64), .CON(n136), 
        .SN(n137) );
  FAx1_ASAP7_75t_R S2_3_5 ( .A(\ab\[3\]\[5\] ), .B(n57), .CI(n56), .CON(n138), 
        .SN(n139) );
  FAx1_ASAP7_75t_R S3_3_6 ( .A(\ab\[3\]\[6\] ), .B(n49), .CI(\ab\[2\]\[7\] ), 
        .CON(n140), .SN(n141) );
  FAx1_ASAP7_75t_R S1_2_0 ( .A(\ab\[2\]\[0\] ), .B(n8), .CI(n19), .CON(n142), 
        .SN(n143) );
  FAx1_ASAP7_75t_R S2_2_1 ( .A(\ab\[2\]\[1\] ), .B(n4), .CI(n22), .CON(n144), 
        .SN(n145) );
  FAx1_ASAP7_75t_R S2_2_2 ( .A(\ab\[2\]\[2\] ), .B(n21), .CI(n9), .CON(n146), 
        .SN(n147) );
  FAx1_ASAP7_75t_R S2_2_3 ( .A(\ab\[2\]\[3\] ), .B(n20), .CI(n7), .CON(n148), 
        .SN(n149) );
  FAx1_ASAP7_75t_R S2_2_4 ( .A(\ab\[2\]\[4\] ), .B(n16), .CI(n5), .CON(n150), 
        .SN(n151) );
  FAx1_ASAP7_75t_R S2_2_5 ( .A(\ab\[2\]\[5\] ), .B(n15), .CI(n2), .CON(n152), 
        .SN(n153) );
  FAx1_ASAP7_75t_R S3_2_6 ( .A(\ab\[2\]\[6\] ), .B(n18), .CI(\ab\[1\]\[7\] ), 
        .CON(n154), .SN(n155) );
  NOR2xp33_ASAP7_75t_R U2 ( .A(n95), .B(n33), .Y(\ab\[3\]\[4\] ) );
  NOR2xp33_ASAP7_75t_R U3 ( .A(n94), .B(n34), .Y(\ab\[4\]\[3\] ) );
  NOR2xp33_ASAP7_75t_R U4 ( .A(n96), .B(n31), .Y(\ab\[2\]\[6\] ) );
  NOR2xp33_ASAP7_75t_R U5 ( .A(n96), .B(n32), .Y(\ab\[2\]\[5\] ) );
  NOR2xp33_ASAP7_75t_R U6 ( .A(n94), .B(n31), .Y(\ab\[4\]\[6\] ) );
  NOR2xp33_ASAP7_75t_R U7 ( .A(n95), .B(n35), .Y(\ab\[3\]\[7\] ) );
  NOR2xp33_ASAP7_75t_R U8 ( .A(n94), .B(n32), .Y(\ab\[4\]\[5\] ) );
  NOR2xp33_ASAP7_75t_R U9 ( .A(n94), .B(n33), .Y(\ab\[4\]\[4\] ) );
  NOR2xp33_ASAP7_75t_R U10 ( .A(n95), .B(n34), .Y(\ab\[3\]\[3\] ) );
  NOR2xp33_ASAP7_75t_R U11 ( .A(n95), .B(n31), .Y(\ab\[3\]\[6\] ) );
  NOR2xp33_ASAP7_75t_R U12 ( .A(n96), .B(n35), .Y(\ab\[2\]\[7\] ) );
  NOR2xp33_ASAP7_75t_R U13 ( .A(n95), .B(n32), .Y(\ab\[3\]\[5\] ) );
  NOR2xp33_ASAP7_75t_R U14 ( .A(n96), .B(n33), .Y(\ab\[2\]\[4\] ) );
  NOR2xp33_ASAP7_75t_R U15 ( .A(n96), .B(n34), .Y(\ab\[2\]\[3\] ) );
  NOR2xp33_ASAP7_75t_R U16 ( .A(n93), .B(n31), .Y(\ab\[5\]\[6\] ) );
  NOR2xp33_ASAP7_75t_R U17 ( .A(n94), .B(n35), .Y(\ab\[4\]\[7\] ) );
  NOR2xp33_ASAP7_75t_R U18 ( .A(n93), .B(n32), .Y(\ab\[5\]\[5\] ) );
  NOR2xp33_ASAP7_75t_R U19 ( .A(n93), .B(n33), .Y(\ab\[5\]\[4\] ) );
  NOR2xp33_ASAP7_75t_R U20 ( .A(n93), .B(n34), .Y(\ab\[5\]\[3\] ) );
  NOR2xp33_ASAP7_75t_R U21 ( .A(n97), .B(n30), .Y(\ab\[1\]\[2\] ) );
  NOR2xp33_ASAP7_75t_R U22 ( .A(n93), .B(n35), .Y(\ab\[5\]\[7\] ) );
  NOR2xp33_ASAP7_75t_R U23 ( .A(n97), .B(n36), .Y(\ab\[0\]\[2\] ) );
  NOR2xp33_ASAP7_75t_R U24 ( .A(n98), .B(n30), .Y(\ab\[1\]\[1\] ) );
  NOR2xp33_ASAP7_75t_R U25 ( .A(n98), .B(n36), .Y(\ab\[0\]\[1\] ) );
  NOR2xp33_ASAP7_75t_R U26 ( .A(n99), .B(n30), .Y(\ab\[1\]\[0\] ) );
  NOR2xp33_ASAP7_75t_R U27 ( .A(n99), .B(n36), .Y(\PRODUCT\[0\] ) );
  XOR2xp5_ASAP7_75t_R U28 ( .A(\ab\[1\]\[6\] ), .B(\ab\[0\]\[7\] ), .Y(n2) );
  AND2x2_ASAP7_75t_R U29 ( .A(n76), .B(n69), .Y(n3) );
  AND2x2_ASAP7_75t_R U30 ( .A(\ab\[0\]\[2\] ), .B(\ab\[1\]\[1\] ), .Y(n4) );
  XOR2xp5_ASAP7_75t_R U31 ( .A(\ab\[1\]\[5\] ), .B(\ab\[0\]\[6\] ), .Y(n5) );
  XOR2xp5_ASAP7_75t_R U32 ( .A(n53), .B(n60), .Y(n6) );
  XOR2xp5_ASAP7_75t_R U33 ( .A(\ab\[1\]\[4\] ), .B(\ab\[0\]\[5\] ), .Y(n7) );
  AND2x2_ASAP7_75t_R U34 ( .A(\ab\[0\]\[1\] ), .B(\ab\[1\]\[0\] ), .Y(n8) );
  XOR2xp5_ASAP7_75t_R U35 ( .A(\ab\[1\]\[3\] ), .B(\ab\[0\]\[4\] ), .Y(n9) );
  AND2x2_ASAP7_75t_R U36 ( .A(n60), .B(n53), .Y(n10) );
  XOR2xp5_ASAP7_75t_R U37 ( .A(n41), .B(n45), .Y(n11) );
  AND2x2_ASAP7_75t_R U38 ( .A(n45), .B(n41), .Y(n12) );
  AND2x2_ASAP7_75t_R U39 ( .A(n40), .B(n38), .Y(n13) );
  XOR2xp5_ASAP7_75t_R U40 ( .A(n61), .B(n68), .Y(n14) );
  AND2x2_ASAP7_75t_R U41 ( .A(\ab\[0\]\[6\] ), .B(\ab\[1\]\[5\] ), .Y(n15) );
  AND2x2_ASAP7_75t_R U42 ( .A(\ab\[0\]\[5\] ), .B(\ab\[1\]\[4\] ), .Y(n16) );
  AND2x2_ASAP7_75t_R U43 ( .A(n68), .B(n61), .Y(n17) );
  AND2x2_ASAP7_75t_R U44 ( .A(\ab\[0\]\[7\] ), .B(\ab\[1\]\[6\] ), .Y(n18) );
  XOR2xp5_ASAP7_75t_R U45 ( .A(\ab\[1\]\[1\] ), .B(\ab\[0\]\[2\] ), .Y(n19) );
  AND2x2_ASAP7_75t_R U46 ( .A(\ab\[0\]\[4\] ), .B(\ab\[1\]\[3\] ), .Y(n20) );
  AND2x2_ASAP7_75t_R U47 ( .A(\ab\[0\]\[3\] ), .B(\ab\[1\]\[2\] ), .Y(n21) );
  XOR2xp5_ASAP7_75t_R U48 ( .A(\ab\[1\]\[2\] ), .B(\ab\[0\]\[3\] ), .Y(n22) );
  XOR2xp5_ASAP7_75t_R U49 ( .A(n46), .B(n52), .Y(n23) );
  AND2x2_ASAP7_75t_R U50 ( .A(n52), .B(n46), .Y(n24) );
  XOR2xp5_ASAP7_75t_R U51 ( .A(n38), .B(n40), .Y(n25) );
  XOR2xp5_ASAP7_75t_R U52 ( .A(n69), .B(n76), .Y(n26) );
  XOR2xp5_ASAP7_75t_R U53 ( .A(\ab\[5\]\[7\] ), .B(n37), .Y(n27) );
  AND2x2_ASAP7_75t_R U54 ( .A(n37), .B(\ab\[5\]\[7\] ), .Y(n28) );
  XOR2xp5_ASAP7_75t_R U55 ( .A(\ab\[1\]\[0\] ), .B(\ab\[0\]\[1\] ), .Y(
        \PRODUCT\[1\] ) );
  TIELOx1_ASAP7_75t_R U56 ( .L(net27133) );
  INVxp33_ASAP7_75t_R U57 ( .A(\B\[7\] ), .Y(n35) );
  INVxp33_ASAP7_75t_R U58 ( .A(\A\[0\] ), .Y(n36) );
  AND2x2_ASAP7_75t_R U59 ( .A(\B\[7\] ), .B(\A\[0\] ), .Y(\ab\[0\]\[7\] ) );
  INVxp67_ASAP7_75t_R U60 ( .A(\B\[6\] ), .Y(n31) );
  AND2x2_ASAP7_75t_R U61 ( .A(\A\[1\] ), .B(\B\[6\] ), .Y(\ab\[1\]\[6\] ) );
  AND2x2_ASAP7_75t_R U62 ( .A(\B\[6\] ), .B(\A\[0\] ), .Y(\ab\[0\]\[6\] ) );
  AND2x2_ASAP7_75t_R U63 ( .A(\A\[1\] ), .B(\B\[5\] ), .Y(\ab\[1\]\[5\] ) );
  AND2x2_ASAP7_75t_R U64 ( .A(\B\[5\] ), .B(\A\[0\] ), .Y(\ab\[0\]\[5\] ) );
  AND2x2_ASAP7_75t_R U65 ( .A(\A\[1\] ), .B(\B\[4\] ), .Y(\ab\[1\]\[4\] ) );
  AND2x2_ASAP7_75t_R U66 ( .A(\B\[4\] ), .B(\A\[0\] ), .Y(\ab\[0\]\[4\] ) );
  AND2x2_ASAP7_75t_R U67 ( .A(\A\[1\] ), .B(\B\[3\] ), .Y(\ab\[1\]\[3\] ) );
  AND2x2_ASAP7_75t_R U68 ( .A(\B\[3\] ), .B(\A\[0\] ), .Y(\ab\[0\]\[3\] ) );
  INVx1_ASAP7_75t_R U69 ( .A(\A\[1\] ), .Y(n30) );
  AND2x2_ASAP7_75t_R U70 ( .A(\A\[1\] ), .B(\B\[7\] ), .Y(\ab\[1\]\[7\] ) );
  INVx1_ASAP7_75t_R U71 ( .A(\B\[5\] ), .Y(n32) );
  INVx1_ASAP7_75t_R U72 ( .A(\B\[4\] ), .Y(n33) );
  INVx1_ASAP7_75t_R U73 ( .A(\B\[3\] ), .Y(n34) );
  INVx1_ASAP7_75t_R U74 ( .A(n152), .Y(n57) );
  INVx1_ASAP7_75t_R U75 ( .A(n155), .Y(n56) );
  INVx1_ASAP7_75t_R U76 ( .A(n150), .Y(n65) );
  INVx1_ASAP7_75t_R U77 ( .A(n153), .Y(n64) );
  INVx1_ASAP7_75t_R U78 ( .A(n148), .Y(n73) );
  INVx1_ASAP7_75t_R U79 ( .A(n151), .Y(n72) );
  INVx1_ASAP7_75t_R U80 ( .A(n146), .Y(n81) );
  INVx1_ASAP7_75t_R U81 ( .A(n149), .Y(n80) );
  INVx1_ASAP7_75t_R U82 ( .A(n147), .Y(n86) );
  INVx1_ASAP7_75t_R U83 ( .A(n136), .Y(n58) );
  INVx1_ASAP7_75t_R U84 ( .A(n139), .Y(n55) );
  INVx1_ASAP7_75t_R U85 ( .A(n134), .Y(n66) );
  INVx1_ASAP7_75t_R U86 ( .A(n137), .Y(n63) );
  INVx1_ASAP7_75t_R U87 ( .A(n132), .Y(n74) );
  INVx1_ASAP7_75t_R U88 ( .A(n135), .Y(n71) );
  INVx1_ASAP7_75t_R U89 ( .A(n130), .Y(n82) );
  INVx1_ASAP7_75t_R U90 ( .A(n133), .Y(n79) );
  INVx1_ASAP7_75t_R U91 ( .A(n120), .Y(n59) );
  INVx1_ASAP7_75t_R U92 ( .A(n123), .Y(n54) );
  INVx1_ASAP7_75t_R U93 ( .A(n118), .Y(n67) );
  INVx1_ASAP7_75t_R U94 ( .A(n121), .Y(n62) );
  INVx1_ASAP7_75t_R U95 ( .A(n116), .Y(n75) );
  INVx1_ASAP7_75t_R U96 ( .A(n119), .Y(n70) );
  INVx1_ASAP7_75t_R U97 ( .A(n117), .Y(n78) );
  INVx1_ASAP7_75t_R U98 ( .A(n104), .Y(n60) );
  INVx1_ASAP7_75t_R U99 ( .A(n107), .Y(n53) );
  INVx1_ASAP7_75t_R U100 ( .A(n102), .Y(n68) );
  INVx1_ASAP7_75t_R U101 ( .A(n105), .Y(n61) );
  INVx1_ASAP7_75t_R U102 ( .A(n100), .Y(n76) );
  INVx1_ASAP7_75t_R U103 ( .A(n103), .Y(n69) );
  INVx1_ASAP7_75t_R U104 ( .A(n101), .Y(n77) );
  INVx1_ASAP7_75t_R U105 ( .A(n115), .Y(n84) );
  INVx1_ASAP7_75t_R U106 ( .A(n129), .Y(n89) );
  INVx1_ASAP7_75t_R U107 ( .A(n143), .Y(n92) );
  INVx1_ASAP7_75t_R U108 ( .A(n112), .Y(n37) );
  INVx1_ASAP7_75t_R U109 ( .A(n113), .Y(n38) );
  INVx1_ASAP7_75t_R U110 ( .A(n126), .Y(n39) );
  INVx1_ASAP7_75t_R U111 ( .A(n110), .Y(n40) );
  INVx1_ASAP7_75t_R U112 ( .A(n111), .Y(n41) );
  INVx1_ASAP7_75t_R U113 ( .A(n127), .Y(n42) );
  INVx1_ASAP7_75t_R U114 ( .A(n140), .Y(n43) );
  INVx1_ASAP7_75t_R U115 ( .A(n124), .Y(n44) );
  INVx1_ASAP7_75t_R U116 ( .A(n108), .Y(n45) );
  INVx1_ASAP7_75t_R U117 ( .A(n109), .Y(n46) );
  INVx1_ASAP7_75t_R U118 ( .A(n125), .Y(n47) );
  INVx1_ASAP7_75t_R U119 ( .A(n141), .Y(n48) );
  INVx1_ASAP7_75t_R U120 ( .A(n154), .Y(n49) );
  INVx1_ASAP7_75t_R U121 ( .A(n138), .Y(n50) );
  INVx1_ASAP7_75t_R U122 ( .A(n122), .Y(n51) );
  INVx1_ASAP7_75t_R U123 ( .A(n106), .Y(n52) );
  INVx1_ASAP7_75t_R U124 ( .A(n114), .Y(n83) );
  INVx1_ASAP7_75t_R U125 ( .A(n131), .Y(n85) );
  INVx1_ASAP7_75t_R U126 ( .A(n144), .Y(n87) );
  INVx1_ASAP7_75t_R U127 ( .A(n128), .Y(n88) );
  INVx1_ASAP7_75t_R U128 ( .A(n145), .Y(n90) );
  INVx1_ASAP7_75t_R U129 ( .A(n142), .Y(n91) );
  INVx1_ASAP7_75t_R U130 ( .A(\A\[5\] ), .Y(n93) );
  INVx1_ASAP7_75t_R U131 ( .A(\A\[4\] ), .Y(n94) );
  INVx1_ASAP7_75t_R U132 ( .A(\A\[3\] ), .Y(n95) );
  INVx1_ASAP7_75t_R U133 ( .A(\A\[2\] ), .Y(n96) );
  INVx1_ASAP7_75t_R U134 ( .A(\B\[2\] ), .Y(n97) );
  INVx1_ASAP7_75t_R U135 ( .A(\B\[1\] ), .Y(n98) );
  INVx1_ASAP7_75t_R U136 ( .A(\B\[0\] ), .Y(n99) );
  NOR2xp33_ASAP7_75t_R U137 ( .A(n93), .B(n97), .Y(\ab\[5\]\[2\] ) );
  NOR2xp33_ASAP7_75t_R U138 ( .A(n93), .B(n98), .Y(\ab\[5\]\[1\] ) );
  NOR2xp33_ASAP7_75t_R U139 ( .A(n93), .B(n99), .Y(\ab\[5\]\[0\] ) );
  NOR2xp33_ASAP7_75t_R U140 ( .A(n97), .B(n94), .Y(\ab\[4\]\[2\] ) );
  NOR2xp33_ASAP7_75t_R U141 ( .A(n98), .B(n94), .Y(\ab\[4\]\[1\] ) );
  NOR2xp33_ASAP7_75t_R U142 ( .A(n99), .B(n94), .Y(\ab\[4\]\[0\] ) );
  NOR2xp33_ASAP7_75t_R U143 ( .A(n97), .B(n95), .Y(\ab\[3\]\[2\] ) );
  NOR2xp33_ASAP7_75t_R U144 ( .A(n98), .B(n95), .Y(\ab\[3\]\[1\] ) );
  NOR2xp33_ASAP7_75t_R U145 ( .A(n99), .B(n95), .Y(\ab\[3\]\[0\] ) );
  NOR2xp33_ASAP7_75t_R U146 ( .A(n97), .B(n96), .Y(\ab\[2\]\[2\] ) );
  NOR2xp33_ASAP7_75t_R U147 ( .A(n98), .B(n96), .Y(\ab\[2\]\[1\] ) );
  NOR2xp33_ASAP7_75t_R U148 ( .A(n99), .B(n96), .Y(\ab\[2\]\[0\] ) );
  fp32_exp_DW01_add_39 FS_1 ( .A({net27133, n27, n25, n11, n23, n6, n14, n26, 
        n77, n84, n89, n92}), .B({n28, n13, n12, n24, n10, n17, n3, net27133, 
        net27133, net27133, net27133, net27133}), .CI(net27133), .SUM({
        \PRODUCT\[13\] , \PRODUCT\[12\] , \PRODUCT\[11\] , \PRODUCT\[10\] , 
        \PRODUCT\[9\] , \PRODUCT\[8\] , \PRODUCT\[7\] , \PRODUCT\[6\] , 
        \PRODUCT\[5\] , \PRODUCT\[4\] , \PRODUCT\[3\] , \PRODUCT\[2\] }) );
endmodule


module fp32_exp_DW01_add_J8_1 ( .A({\A\[11\] , \A\[10\] , \A\[9\] , \A\[8\] , 
        \A\[7\] , \A\[6\] , \A\[5\] , \A\[4\] , \A\[3\] , \A\[2\] , \A\[1\] , 
        \A\[0\] }), .B({\B\[11\] , \B\[10\] , \B\[9\] , \B\[8\] , \B\[7\] , 
        \B\[6\] , \B\[5\] , \B\[4\] , \B\[3\] , \B\[2\] , \B\[1\] , \B\[0\] }), 
        CI, .SUM({\SUM\[11\] , \SUM\[10\] , \SUM\[9\] , \SUM\[8\] , \SUM\[7\] , 
        \SUM\[6\] , \SUM\[5\] , \SUM\[4\] , \SUM\[3\] , \SUM\[2\] , \SUM\[1\] , 
        \SUM\[0\] }), CO );
  input \A\[11\] , \A\[10\] , \A\[9\] , \A\[8\] , \A\[7\] , \A\[6\] , \A\[5\] ,
         \A\[4\] , \A\[3\] , \A\[2\] , \A\[1\] , \A\[0\] , \B\[11\] ,
         \B\[10\] , \B\[9\] , \B\[8\] , \B\[7\] , \B\[6\] , \B\[5\] , \B\[4\] ,
         \B\[3\] , \B\[2\] , \B\[1\] , \B\[0\] , CI;
  output \SUM\[11\] , \SUM\[10\] , \SUM\[9\] , \SUM\[8\] , \SUM\[7\] ,
         \SUM\[6\] , \SUM\[5\] , \SUM\[4\] , \SUM\[3\] , \SUM\[2\] ,
         \SUM\[1\] , \SUM\[0\] , CO;
  wire   \A\[4\] , \A\[3\] , \A\[2\] , \A\[1\] , \A\[0\] , n1, n2, n3, n5, n6,
         n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20,
         n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33;
  assign \SUM\[4\]  = \A\[4\] ;
  assign \SUM\[3\]  = \A\[3\] ;
  assign \SUM\[2\]  = \A\[2\] ;
  assign \SUM\[1\]  = \A\[1\] ;
  assign \SUM\[0\]  = \A\[0\] ;

  NAND2xp5_ASAP7_75t_R U2 ( .A(n22), .B(n23), .Y(n20) );
  OAI21xp5_ASAP7_75t_R U3 ( .A1(\A\[9\] ), .A2(\B\[9\] ), .B(n6), .Y(n23) );
  OAI21xp5_ASAP7_75t_R U4 ( .A1(n1), .A2(n24), .B(n25), .Y(n6) );
  NOR2xp33_ASAP7_75t_R U5 ( .A(\A\[8\] ), .B(\B\[8\] ), .Y(n24) );
  NAND2xp5_ASAP7_75t_R U6 ( .A(\B\[5\] ), .B(\A\[5\] ), .Y(n14) );
  NAND2xp5_ASAP7_75t_R U7 ( .A(n18), .B(n19), .Y(n17) );
  XOR2xp5_ASAP7_75t_R U8 ( .A(n7), .B(n2), .Y(\SUM\[7\] ) );
  OA21x2_ASAP7_75t_R U9 ( .A1(n26), .A2(n2), .B(n9), .Y(n1) );
  AOI21xp5_ASAP7_75t_R U10 ( .A1(n10), .A2(n12), .B(n27), .Y(n2) );
  AND2x2_ASAP7_75t_R U11 ( .A(n22), .B(n23), .Y(n3) );
  AND2x2_ASAP7_75t_R U12 ( .A(n14), .B(n15), .Y(\SUM\[5\] ) );
  INVx1_ASAP7_75t_R U13 ( .A(n14), .Y(n10) );
  INVx1_ASAP7_75t_R U14 ( .A(\B\[11\] ), .Y(n16) );
  INVxp67_ASAP7_75t_R U15 ( .A(n6), .Y(n5) );
  FAx1_ASAP7_75t_R U16 ( .A(\B\[9\] ), .B(\A\[9\] ), .CI(n5), .SN(\SUM\[9\] )
         );
  FAx1_ASAP7_75t_R U17 ( .A(\B\[8\] ), .B(\A\[8\] ), .CI(n1), .SN(\SUM\[8\] )
         );
  NAND2xp5_ASAP7_75t_R U18 ( .A(n8), .B(n9), .Y(n7) );
  XNOR2xp5_ASAP7_75t_R U19 ( .A(n10), .B(n11), .Y(\SUM\[6\] ) );
  NAND2xp5_ASAP7_75t_R U20 ( .A(n12), .B(n13), .Y(n11) );
  XNOR2xp5_ASAP7_75t_R U21 ( .A(n16), .B(n17), .Y(\SUM\[11\] ) );
  NAND2xp5_ASAP7_75t_R U22 ( .A(\B\[10\] ), .B(\A\[10\] ), .Y(n19) );
  OAI21xp5_ASAP7_75t_R U23 ( .A1(\A\[10\] ), .A2(\B\[10\] ), .B(n20), .Y(n18)
         );
  XNOR2xp5_ASAP7_75t_R U24 ( .A(n3), .B(n21), .Y(\SUM\[10\] ) );
  XOR2xp5_ASAP7_75t_R U25 ( .A(\B\[10\] ), .B(\A\[10\] ), .Y(n21) );
  NAND2xp5_ASAP7_75t_R U26 ( .A(\B\[8\] ), .B(\A\[8\] ), .Y(n25) );
  NAND2xp5_ASAP7_75t_R U27 ( .A(\B\[7\] ), .B(\A\[7\] ), .Y(n9) );
  INVx1_ASAP7_75t_R U28 ( .A(n13), .Y(n27) );
  NAND2xp5_ASAP7_75t_R U29 ( .A(\B\[6\] ), .B(\A\[6\] ), .Y(n13) );
  NAND2xp5_ASAP7_75t_R U30 ( .A(n28), .B(n29), .Y(n12) );
  INVx1_ASAP7_75t_R U31 ( .A(\A\[6\] ), .Y(n29) );
  INVx1_ASAP7_75t_R U32 ( .A(\B\[6\] ), .Y(n28) );
  NAND2xp5_ASAP7_75t_R U33 ( .A(n30), .B(n31), .Y(n15) );
  INVx1_ASAP7_75t_R U34 ( .A(\A\[5\] ), .Y(n31) );
  INVx1_ASAP7_75t_R U35 ( .A(\B\[5\] ), .Y(n30) );
  INVx1_ASAP7_75t_R U36 ( .A(n8), .Y(n26) );
  NAND2xp5_ASAP7_75t_R U37 ( .A(n32), .B(n33), .Y(n8) );
  INVx1_ASAP7_75t_R U38 ( .A(\A\[7\] ), .Y(n33) );
  INVx1_ASAP7_75t_R U39 ( .A(\B\[7\] ), .Y(n32) );
  NAND2xp5_ASAP7_75t_R U40 ( .A(\A\[9\] ), .B(\B\[9\] ), .Y(n22) );
endmodule


module fp32_exp_DW02_mult_0 ( .A({\A\[5\] , \A\[4\] , \A\[3\] , \A\[2\] , 
        \A\[1\] , \A\[0\] }), .B({\B\[7\] , \B\[6\] , \B\[5\] , \B\[4\] , 
        \B\[3\] , \B\[2\] , \B\[1\] , \B\[0\] }), TC, .PRODUCT({
        \PRODUCT\[13\] , \PRODUCT\[12\] , \PRODUCT\[11\] , \PRODUCT\[10\] , 
        \PRODUCT\[9\] , \PRODUCT\[8\] , \PRODUCT\[7\] , \PRODUCT\[6\] , 
        \PRODUCT\[5\] , \PRODUCT\[4\] , \PRODUCT\[3\] , \PRODUCT\[2\] , 
        \PRODUCT\[1\] , \PRODUCT\[0\] }) );
  input \A\[5\] , \A\[4\] , \A\[3\] , \A\[2\] , \A\[1\] , \A\[0\] , \B\[7\] ,
         \B\[6\] , \B\[5\] , \B\[4\] , \B\[3\] , \B\[2\] , \B\[1\] , \B\[0\] ,
         TC;
  output \PRODUCT\[13\] , \PRODUCT\[12\] , \PRODUCT\[11\] , \PRODUCT\[10\] ,
         \PRODUCT\[9\] , \PRODUCT\[8\] , \PRODUCT\[7\] , \PRODUCT\[6\] ,
         \PRODUCT\[5\] , \PRODUCT\[4\] , \PRODUCT\[3\] , \PRODUCT\[2\] ,
         \PRODUCT\[1\] , \PRODUCT\[0\] ;
  wire   net27125, \ab\[5\]\[7\] , \ab\[5\]\[6\] , \ab\[5\]\[5\] ,
         \ab\[5\]\[4\] , \ab\[5\]\[3\] , \ab\[5\]\[2\] , \ab\[5\]\[1\] ,
         \ab\[5\]\[0\] , \ab\[4\]\[7\] , \ab\[4\]\[6\] , \ab\[4\]\[5\] ,
         \ab\[4\]\[4\] , \ab\[4\]\[3\] , \ab\[4\]\[2\] , \ab\[4\]\[1\] ,
         \ab\[4\]\[0\] , \ab\[3\]\[7\] , \ab\[3\]\[6\] , \ab\[3\]\[5\] ,
         \ab\[3\]\[4\] , \ab\[3\]\[3\] , \ab\[3\]\[2\] , \ab\[3\]\[1\] ,
         \ab\[3\]\[0\] , \ab\[2\]\[7\] , \ab\[2\]\[6\] , \ab\[2\]\[5\] ,
         \ab\[2\]\[4\] , \ab\[2\]\[3\] , \ab\[2\]\[2\] , \ab\[2\]\[1\] ,
         \ab\[2\]\[0\] , \ab\[1\]\[7\] , \ab\[1\]\[6\] , \ab\[1\]\[5\] ,
         \ab\[1\]\[4\] , \ab\[1\]\[3\] , \ab\[1\]\[2\] , \ab\[1\]\[1\] ,
         \ab\[1\]\[0\] , \ab\[0\]\[7\] , \ab\[0\]\[6\] , \ab\[0\]\[5\] ,
         \ab\[0\]\[4\] , \ab\[0\]\[3\] , \ab\[0\]\[2\] , \ab\[0\]\[1\] , n2,
         n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17,
         n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46,
         n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60,
         n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74,
         n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88,
         n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101,
         n102, n103, n104, n105, n106, n107, n108, n109, n110, n111, n112,
         n113, n114, n115, n116, n117, n118, n119, n120, n121, n122, n123,
         n124, n125, n126, n127, n128, n129, n130, n131, n132, n133, n134,
         n135, n136, n137, n138, n139, n140, n141, n142, n143, n144, n145,
         n146, n147, n148, n149, n150, n151, n152, n153, n154, n155;

  FAx1_ASAP7_75t_R S4_0 ( .A(\ab\[5\]\[0\] ), .B(n83), .CI(n78), .CON(n100), 
        .SN(n101) );
  FAx1_ASAP7_75t_R S4_1 ( .A(\ab\[5\]\[1\] ), .B(n75), .CI(n70), .CON(n102), 
        .SN(n103) );
  FAx1_ASAP7_75t_R S4_2 ( .A(\ab\[5\]\[2\] ), .B(n67), .CI(n62), .CON(n104), 
        .SN(n105) );
  FAx1_ASAP7_75t_R S4_3 ( .A(\ab\[5\]\[3\] ), .B(n59), .CI(n54), .CON(n106), 
        .SN(n107) );
  FAx1_ASAP7_75t_R S4_4 ( .A(\ab\[5\]\[4\] ), .B(n51), .CI(n47), .CON(n108), 
        .SN(n109) );
  FAx1_ASAP7_75t_R S4_5 ( .A(\ab\[5\]\[5\] ), .B(n44), .CI(n42), .CON(n110), 
        .SN(n111) );
  FAx1_ASAP7_75t_R S5_6 ( .A(\ab\[5\]\[6\] ), .B(n39), .CI(\ab\[4\]\[7\] ), 
        .CON(n112), .SN(n113) );
  FAx1_ASAP7_75t_R S1_4_0 ( .A(\ab\[4\]\[0\] ), .B(n88), .CI(n85), .CON(n114), 
        .SN(n115) );
  FAx1_ASAP7_75t_R S2_4_1 ( .A(\ab\[4\]\[1\] ), .B(n82), .CI(n79), .CON(n116), 
        .SN(n117) );
  FAx1_ASAP7_75t_R S2_4_2 ( .A(\ab\[4\]\[2\] ), .B(n74), .CI(n71), .CON(n118), 
        .SN(n119) );
  FAx1_ASAP7_75t_R S2_4_3 ( .A(\ab\[4\]\[3\] ), .B(n66), .CI(n63), .CON(n120), 
        .SN(n121) );
  FAx1_ASAP7_75t_R S2_4_4 ( .A(\ab\[4\]\[4\] ), .B(n58), .CI(n55), .CON(n122), 
        .SN(n123) );
  FAx1_ASAP7_75t_R S2_4_5 ( .A(\ab\[4\]\[5\] ), .B(n50), .CI(n48), .CON(n124), 
        .SN(n125) );
  FAx1_ASAP7_75t_R S3_4_6 ( .A(\ab\[4\]\[6\] ), .B(n43), .CI(\ab\[3\]\[7\] ), 
        .CON(n126), .SN(n127) );
  FAx1_ASAP7_75t_R S1_3_0 ( .A(\ab\[3\]\[0\] ), .B(n91), .CI(n90), .CON(n128), 
        .SN(n129) );
  FAx1_ASAP7_75t_R S2_3_1 ( .A(\ab\[3\]\[1\] ), .B(n87), .CI(n86), .CON(n130), 
        .SN(n131) );
  FAx1_ASAP7_75t_R S2_3_2 ( .A(\ab\[3\]\[2\] ), .B(n81), .CI(n80), .CON(n132), 
        .SN(n133) );
  FAx1_ASAP7_75t_R S2_3_3 ( .A(\ab\[3\]\[3\] ), .B(n73), .CI(n72), .CON(n134), 
        .SN(n135) );
  FAx1_ASAP7_75t_R S2_3_4 ( .A(\ab\[3\]\[4\] ), .B(n65), .CI(n64), .CON(n136), 
        .SN(n137) );
  FAx1_ASAP7_75t_R S2_3_5 ( .A(\ab\[3\]\[5\] ), .B(n57), .CI(n56), .CON(n138), 
        .SN(n139) );
  FAx1_ASAP7_75t_R S3_3_6 ( .A(\ab\[3\]\[6\] ), .B(n49), .CI(\ab\[2\]\[7\] ), 
        .CON(n140), .SN(n141) );
  FAx1_ASAP7_75t_R S1_2_0 ( .A(\ab\[2\]\[0\] ), .B(n23), .CI(n10), .CON(n142), 
        .SN(n143) );
  FAx1_ASAP7_75t_R S2_2_1 ( .A(\ab\[2\]\[1\] ), .B(n21), .CI(n9), .CON(n144), 
        .SN(n145) );
  FAx1_ASAP7_75t_R S2_2_2 ( .A(\ab\[2\]\[2\] ), .B(n7), .CI(n20), .CON(n146), 
        .SN(n147) );
  FAx1_ASAP7_75t_R S2_2_3 ( .A(\ab\[2\]\[3\] ), .B(n19), .CI(n6), .CON(n148), 
        .SN(n149) );
  FAx1_ASAP7_75t_R S2_2_4 ( .A(\ab\[2\]\[4\] ), .B(n16), .CI(n4), .CON(n150), 
        .SN(n151) );
  FAx1_ASAP7_75t_R S2_2_5 ( .A(\ab\[2\]\[5\] ), .B(n15), .CI(n3), .CON(n152), 
        .SN(n153) );
  FAx1_ASAP7_75t_R S3_2_6 ( .A(\ab\[2\]\[6\] ), .B(n17), .CI(\ab\[1\]\[7\] ), 
        .CON(n154), .SN(n155) );
  NOR2xp33_ASAP7_75t_R U2 ( .A(n95), .B(n33), .Y(\ab\[3\]\[4\] ) );
  NOR2xp33_ASAP7_75t_R U3 ( .A(n94), .B(n34), .Y(\ab\[4\]\[3\] ) );
  NOR2xp33_ASAP7_75t_R U4 ( .A(n96), .B(n31), .Y(\ab\[2\]\[6\] ) );
  NOR2xp33_ASAP7_75t_R U5 ( .A(n96), .B(n32), .Y(\ab\[2\]\[5\] ) );
  NOR2xp33_ASAP7_75t_R U6 ( .A(n94), .B(n31), .Y(\ab\[4\]\[6\] ) );
  NOR2xp33_ASAP7_75t_R U7 ( .A(n95), .B(n35), .Y(\ab\[3\]\[7\] ) );
  NOR2xp33_ASAP7_75t_R U8 ( .A(n94), .B(n32), .Y(\ab\[4\]\[5\] ) );
  NOR2xp33_ASAP7_75t_R U9 ( .A(n94), .B(n33), .Y(\ab\[4\]\[4\] ) );
  NOR2xp33_ASAP7_75t_R U10 ( .A(n95), .B(n34), .Y(\ab\[3\]\[3\] ) );
  NOR2xp33_ASAP7_75t_R U11 ( .A(n95), .B(n31), .Y(\ab\[3\]\[6\] ) );
  NOR2xp33_ASAP7_75t_R U12 ( .A(n96), .B(n35), .Y(\ab\[2\]\[7\] ) );
  NOR2xp33_ASAP7_75t_R U13 ( .A(n95), .B(n32), .Y(\ab\[3\]\[5\] ) );
  NOR2xp33_ASAP7_75t_R U14 ( .A(n96), .B(n33), .Y(\ab\[2\]\[4\] ) );
  NOR2xp33_ASAP7_75t_R U15 ( .A(n96), .B(n34), .Y(\ab\[2\]\[3\] ) );
  NOR2xp33_ASAP7_75t_R U16 ( .A(n93), .B(n31), .Y(\ab\[5\]\[6\] ) );
  NOR2xp33_ASAP7_75t_R U17 ( .A(n94), .B(n35), .Y(\ab\[4\]\[7\] ) );
  NOR2xp33_ASAP7_75t_R U18 ( .A(n93), .B(n32), .Y(\ab\[5\]\[5\] ) );
  NOR2xp33_ASAP7_75t_R U19 ( .A(n93), .B(n33), .Y(\ab\[5\]\[4\] ) );
  NOR2xp33_ASAP7_75t_R U20 ( .A(n93), .B(n34), .Y(\ab\[5\]\[3\] ) );
  NOR2xp33_ASAP7_75t_R U21 ( .A(n97), .B(n30), .Y(\ab\[1\]\[2\] ) );
  NOR2xp33_ASAP7_75t_R U22 ( .A(n93), .B(n35), .Y(\ab\[5\]\[7\] ) );
  NOR2xp33_ASAP7_75t_R U23 ( .A(n97), .B(n36), .Y(\ab\[0\]\[2\] ) );
  NOR2xp33_ASAP7_75t_R U24 ( .A(n98), .B(n30), .Y(\ab\[1\]\[1\] ) );
  NOR2xp33_ASAP7_75t_R U25 ( .A(n98), .B(n36), .Y(\ab\[0\]\[1\] ) );
  NOR2xp33_ASAP7_75t_R U26 ( .A(n99), .B(n30), .Y(\ab\[1\]\[0\] ) );
  NOR2xp33_ASAP7_75t_R U27 ( .A(n99), .B(n36), .Y(\PRODUCT\[0\] ) );
  XOR2xp5_ASAP7_75t_R U28 ( .A(n61), .B(n68), .Y(n2) );
  XOR2xp5_ASAP7_75t_R U29 ( .A(\ab\[1\]\[6\] ), .B(\ab\[0\]\[7\] ), .Y(n3) );
  XOR2xp5_ASAP7_75t_R U30 ( .A(\ab\[1\]\[5\] ), .B(\ab\[0\]\[6\] ), .Y(n4) );
  XOR2xp5_ASAP7_75t_R U31 ( .A(n53), .B(n60), .Y(n5) );
  XOR2xp5_ASAP7_75t_R U32 ( .A(\ab\[1\]\[4\] ), .B(\ab\[0\]\[5\] ), .Y(n6) );
  AND2x2_ASAP7_75t_R U33 ( .A(\ab\[0\]\[3\] ), .B(\ab\[1\]\[2\] ), .Y(n7) );
  AND2x2_ASAP7_75t_R U34 ( .A(n60), .B(n53), .Y(n8) );
  XOR2xp5_ASAP7_75t_R U35 ( .A(\ab\[1\]\[2\] ), .B(\ab\[0\]\[3\] ), .Y(n9) );
  XOR2xp5_ASAP7_75t_R U36 ( .A(\ab\[1\]\[1\] ), .B(\ab\[0\]\[2\] ), .Y(n10) );
  XOR2xp5_ASAP7_75t_R U37 ( .A(n41), .B(n45), .Y(n11) );
  AND2x2_ASAP7_75t_R U38 ( .A(n45), .B(n41), .Y(n12) );
  AND2x2_ASAP7_75t_R U39 ( .A(n40), .B(n38), .Y(n13) );
  AND2x2_ASAP7_75t_R U40 ( .A(n76), .B(n69), .Y(n14) );
  AND2x2_ASAP7_75t_R U41 ( .A(\ab\[0\]\[6\] ), .B(\ab\[1\]\[5\] ), .Y(n15) );
  AND2x2_ASAP7_75t_R U42 ( .A(\ab\[0\]\[5\] ), .B(\ab\[1\]\[4\] ), .Y(n16) );
  AND2x2_ASAP7_75t_R U43 ( .A(\ab\[0\]\[7\] ), .B(\ab\[1\]\[6\] ), .Y(n17) );
  AND2x2_ASAP7_75t_R U44 ( .A(n68), .B(n61), .Y(n18) );
  AND2x2_ASAP7_75t_R U45 ( .A(\ab\[0\]\[4\] ), .B(\ab\[1\]\[3\] ), .Y(n19) );
  XOR2xp5_ASAP7_75t_R U46 ( .A(\ab\[1\]\[3\] ), .B(\ab\[0\]\[4\] ), .Y(n20) );
  AND2x2_ASAP7_75t_R U47 ( .A(\ab\[0\]\[2\] ), .B(\ab\[1\]\[1\] ), .Y(n21) );
  XOR2xp5_ASAP7_75t_R U48 ( .A(n46), .B(n52), .Y(n22) );
  AND2x2_ASAP7_75t_R U49 ( .A(\ab\[0\]\[1\] ), .B(\ab\[1\]\[0\] ), .Y(n23) );
  AND2x2_ASAP7_75t_R U50 ( .A(n52), .B(n46), .Y(n24) );
  XOR2xp5_ASAP7_75t_R U51 ( .A(n38), .B(n40), .Y(n25) );
  XOR2xp5_ASAP7_75t_R U52 ( .A(n69), .B(n76), .Y(n26) );
  XOR2xp5_ASAP7_75t_R U53 ( .A(\ab\[5\]\[7\] ), .B(n37), .Y(n27) );
  AND2x2_ASAP7_75t_R U54 ( .A(n37), .B(\ab\[5\]\[7\] ), .Y(n28) );
  XOR2xp5_ASAP7_75t_R U55 ( .A(\ab\[1\]\[0\] ), .B(\ab\[0\]\[1\] ), .Y(
        \PRODUCT\[1\] ) );
  TIELOx1_ASAP7_75t_R U56 ( .L(net27125) );
  INVxp67_ASAP7_75t_R U57 ( .A(\A\[1\] ), .Y(n30) );
  INVxp67_ASAP7_75t_R U58 ( .A(\B\[6\] ), .Y(n31) );
  INVxp67_ASAP7_75t_R U59 ( .A(\B\[7\] ), .Y(n35) );
  INVxp67_ASAP7_75t_R U60 ( .A(\A\[0\] ), .Y(n36) );
  AND2x2_ASAP7_75t_R U61 ( .A(\B\[7\] ), .B(\A\[0\] ), .Y(\ab\[0\]\[7\] ) );
  AND2x2_ASAP7_75t_R U62 ( .A(\A\[1\] ), .B(\B\[6\] ), .Y(\ab\[1\]\[6\] ) );
  AND2x2_ASAP7_75t_R U63 ( .A(\B\[6\] ), .B(\A\[0\] ), .Y(\ab\[0\]\[6\] ) );
  AND2x2_ASAP7_75t_R U64 ( .A(\A\[1\] ), .B(\B\[5\] ), .Y(\ab\[1\]\[5\] ) );
  AND2x2_ASAP7_75t_R U65 ( .A(\B\[5\] ), .B(\A\[0\] ), .Y(\ab\[0\]\[5\] ) );
  AND2x2_ASAP7_75t_R U66 ( .A(\A\[1\] ), .B(\B\[4\] ), .Y(\ab\[1\]\[4\] ) );
  AND2x2_ASAP7_75t_R U67 ( .A(\B\[4\] ), .B(\A\[0\] ), .Y(\ab\[0\]\[4\] ) );
  AND2x2_ASAP7_75t_R U68 ( .A(\A\[1\] ), .B(\B\[3\] ), .Y(\ab\[1\]\[3\] ) );
  AND2x2_ASAP7_75t_R U69 ( .A(\B\[3\] ), .B(\A\[0\] ), .Y(\ab\[0\]\[3\] ) );
  AND2x2_ASAP7_75t_R U70 ( .A(\A\[1\] ), .B(\B\[7\] ), .Y(\ab\[1\]\[7\] ) );
  INVx1_ASAP7_75t_R U71 ( .A(\B\[5\] ), .Y(n32) );
  INVx1_ASAP7_75t_R U72 ( .A(\B\[4\] ), .Y(n33) );
  INVx1_ASAP7_75t_R U73 ( .A(\B\[3\] ), .Y(n34) );
  INVx1_ASAP7_75t_R U74 ( .A(n152), .Y(n57) );
  INVx1_ASAP7_75t_R U75 ( .A(n155), .Y(n56) );
  INVx1_ASAP7_75t_R U76 ( .A(n150), .Y(n65) );
  INVx1_ASAP7_75t_R U77 ( .A(n153), .Y(n64) );
  INVx1_ASAP7_75t_R U78 ( .A(n148), .Y(n73) );
  INVx1_ASAP7_75t_R U79 ( .A(n151), .Y(n72) );
  INVx1_ASAP7_75t_R U80 ( .A(n146), .Y(n81) );
  INVx1_ASAP7_75t_R U81 ( .A(n149), .Y(n80) );
  INVx1_ASAP7_75t_R U82 ( .A(n147), .Y(n86) );
  INVx1_ASAP7_75t_R U83 ( .A(n136), .Y(n58) );
  INVx1_ASAP7_75t_R U84 ( .A(n139), .Y(n55) );
  INVx1_ASAP7_75t_R U85 ( .A(n134), .Y(n66) );
  INVx1_ASAP7_75t_R U86 ( .A(n137), .Y(n63) );
  INVx1_ASAP7_75t_R U87 ( .A(n132), .Y(n74) );
  INVx1_ASAP7_75t_R U88 ( .A(n135), .Y(n71) );
  INVx1_ASAP7_75t_R U89 ( .A(n130), .Y(n82) );
  INVx1_ASAP7_75t_R U90 ( .A(n133), .Y(n79) );
  INVx1_ASAP7_75t_R U91 ( .A(n120), .Y(n59) );
  INVx1_ASAP7_75t_R U92 ( .A(n123), .Y(n54) );
  INVx1_ASAP7_75t_R U93 ( .A(n118), .Y(n67) );
  INVx1_ASAP7_75t_R U94 ( .A(n121), .Y(n62) );
  INVx1_ASAP7_75t_R U95 ( .A(n116), .Y(n75) );
  INVx1_ASAP7_75t_R U96 ( .A(n119), .Y(n70) );
  INVx1_ASAP7_75t_R U97 ( .A(n117), .Y(n78) );
  INVx1_ASAP7_75t_R U98 ( .A(n104), .Y(n60) );
  INVx1_ASAP7_75t_R U99 ( .A(n107), .Y(n53) );
  INVx1_ASAP7_75t_R U100 ( .A(n102), .Y(n68) );
  INVx1_ASAP7_75t_R U101 ( .A(n105), .Y(n61) );
  INVx1_ASAP7_75t_R U102 ( .A(n100), .Y(n76) );
  INVx1_ASAP7_75t_R U103 ( .A(n103), .Y(n69) );
  INVx1_ASAP7_75t_R U104 ( .A(n101), .Y(n77) );
  INVx1_ASAP7_75t_R U105 ( .A(n115), .Y(n84) );
  INVx1_ASAP7_75t_R U106 ( .A(n129), .Y(n89) );
  INVx1_ASAP7_75t_R U107 ( .A(n143), .Y(n92) );
  INVx1_ASAP7_75t_R U108 ( .A(n112), .Y(n37) );
  INVx1_ASAP7_75t_R U109 ( .A(n113), .Y(n38) );
  INVx1_ASAP7_75t_R U110 ( .A(n126), .Y(n39) );
  INVx1_ASAP7_75t_R U111 ( .A(n110), .Y(n40) );
  INVx1_ASAP7_75t_R U112 ( .A(n111), .Y(n41) );
  INVx1_ASAP7_75t_R U113 ( .A(n127), .Y(n42) );
  INVx1_ASAP7_75t_R U114 ( .A(n140), .Y(n43) );
  INVx1_ASAP7_75t_R U115 ( .A(n124), .Y(n44) );
  INVx1_ASAP7_75t_R U116 ( .A(n108), .Y(n45) );
  INVx1_ASAP7_75t_R U117 ( .A(n109), .Y(n46) );
  INVx1_ASAP7_75t_R U118 ( .A(n125), .Y(n47) );
  INVx1_ASAP7_75t_R U119 ( .A(n141), .Y(n48) );
  INVx1_ASAP7_75t_R U120 ( .A(n154), .Y(n49) );
  INVx1_ASAP7_75t_R U121 ( .A(n138), .Y(n50) );
  INVx1_ASAP7_75t_R U122 ( .A(n122), .Y(n51) );
  INVx1_ASAP7_75t_R U123 ( .A(n106), .Y(n52) );
  INVx1_ASAP7_75t_R U124 ( .A(n114), .Y(n83) );
  INVx1_ASAP7_75t_R U125 ( .A(n131), .Y(n85) );
  INVx1_ASAP7_75t_R U126 ( .A(n144), .Y(n87) );
  INVx1_ASAP7_75t_R U127 ( .A(n128), .Y(n88) );
  INVx1_ASAP7_75t_R U128 ( .A(n145), .Y(n90) );
  INVx1_ASAP7_75t_R U129 ( .A(n142), .Y(n91) );
  INVx1_ASAP7_75t_R U130 ( .A(\A\[5\] ), .Y(n93) );
  INVx1_ASAP7_75t_R U131 ( .A(\A\[4\] ), .Y(n94) );
  INVx1_ASAP7_75t_R U132 ( .A(\A\[3\] ), .Y(n95) );
  INVx1_ASAP7_75t_R U133 ( .A(\A\[2\] ), .Y(n96) );
  INVx1_ASAP7_75t_R U134 ( .A(\B\[2\] ), .Y(n97) );
  INVx1_ASAP7_75t_R U135 ( .A(\B\[1\] ), .Y(n98) );
  INVx1_ASAP7_75t_R U136 ( .A(\B\[0\] ), .Y(n99) );
  NOR2xp33_ASAP7_75t_R U137 ( .A(n93), .B(n97), .Y(\ab\[5\]\[2\] ) );
  NOR2xp33_ASAP7_75t_R U138 ( .A(n93), .B(n98), .Y(\ab\[5\]\[1\] ) );
  NOR2xp33_ASAP7_75t_R U139 ( .A(n93), .B(n99), .Y(\ab\[5\]\[0\] ) );
  NOR2xp33_ASAP7_75t_R U140 ( .A(n97), .B(n94), .Y(\ab\[4\]\[2\] ) );
  NOR2xp33_ASAP7_75t_R U141 ( .A(n98), .B(n94), .Y(\ab\[4\]\[1\] ) );
  NOR2xp33_ASAP7_75t_R U142 ( .A(n99), .B(n94), .Y(\ab\[4\]\[0\] ) );
  NOR2xp33_ASAP7_75t_R U143 ( .A(n97), .B(n95), .Y(\ab\[3\]\[2\] ) );
  NOR2xp33_ASAP7_75t_R U144 ( .A(n98), .B(n95), .Y(\ab\[3\]\[1\] ) );
  NOR2xp33_ASAP7_75t_R U145 ( .A(n99), .B(n95), .Y(\ab\[3\]\[0\] ) );
  NOR2xp33_ASAP7_75t_R U146 ( .A(n97), .B(n96), .Y(\ab\[2\]\[2\] ) );
  NOR2xp33_ASAP7_75t_R U147 ( .A(n98), .B(n96), .Y(\ab\[2\]\[1\] ) );
  NOR2xp33_ASAP7_75t_R U148 ( .A(n99), .B(n96), .Y(\ab\[2\]\[0\] ) );
  fp32_exp_DW01_add_J8_1 FS_1 ( .A({net27125, n27, n25, n11, n22, n5, n2, n26, 
        n77, n84, n89, n92}), .B({n28, n13, n12, n24, n8, n18, n14, net27125, 
        net27125, net27125, net27125, net27125}), .CI(net27125), .SUM({
        \PRODUCT\[13\] , \PRODUCT\[12\] , \PRODUCT\[11\] , \PRODUCT\[10\] , 
        \PRODUCT\[9\] , \PRODUCT\[8\] , \PRODUCT\[7\] , \PRODUCT\[6\] , 
        \PRODUCT\[5\] , \PRODUCT\[4\] , \PRODUCT\[3\] , \PRODUCT\[2\] }) );
endmodule


module fp32_exp_DW01_add_40 ( .A({\A\[25\] , \A\[24\] , \A\[23\] , \A\[22\] , 
        \A\[21\] , \A\[20\] , \A\[19\] , \A\[18\] , \A\[17\] , \A\[16\] , 
        \A\[15\] , \A\[14\] , \A\[13\] , \A\[12\] , \A\[11\] , \A\[10\] , 
        \A\[9\] , \A\[8\] , \A\[7\] , \A\[6\] , \A\[5\] , \A\[4\] , \A\[3\] , 
        \A\[2\] , \A\[1\] , \A\[0\] }), .B({\B\[25\] , \B\[24\] , \B\[23\] , 
        \B\[22\] , \B\[21\] , \B\[20\] , \B\[19\] , \B\[18\] , \B\[17\] , 
        \B\[16\] , \B\[15\] , \B\[14\] , \B\[13\] , \B\[12\] , \B\[11\] , 
        \B\[10\] , \B\[9\] , \B\[8\] , \B\[7\] , \B\[6\] , \B\[5\] , \B\[4\] , 
        \B\[3\] , \B\[2\] , \B\[1\] , \B\[0\] }), CI, .SUM({\SUM\[25\] , 
        \SUM\[24\] , \SUM\[23\] , \SUM\[22\] , \SUM\[21\] , \SUM\[20\] , 
        \SUM\[19\] , \SUM\[18\] , \SUM\[17\] , \SUM\[16\] , \SUM\[15\] , 
        \SUM\[14\] , \SUM\[13\] , \SUM\[12\] , \SUM\[11\] , \SUM\[10\] , 
        \SUM\[9\] , \SUM\[8\] , \SUM\[7\] , \SUM\[6\] , \SUM\[5\] , \SUM\[4\] , 
        \SUM\[3\] , \SUM\[2\] , \SUM\[1\] , \SUM\[0\] }), CO );
  input \A\[25\] , \A\[24\] , \A\[23\] , \A\[22\] , \A\[21\] , \A\[20\] ,
         \A\[19\] , \A\[18\] , \A\[17\] , \A\[16\] , \A\[15\] , \A\[14\] ,
         \A\[13\] , \A\[12\] , \A\[11\] , \A\[10\] , \A\[9\] , \A\[8\] ,
         \A\[7\] , \A\[6\] , \A\[5\] , \A\[4\] , \A\[3\] , \A\[2\] , \A\[1\] ,
         \A\[0\] , \B\[25\] , \B\[24\] , \B\[23\] , \B\[22\] , \B\[21\] ,
         \B\[20\] , \B\[19\] , \B\[18\] , \B\[17\] , \B\[16\] , \B\[15\] ,
         \B\[14\] , \B\[13\] , \B\[12\] , \B\[11\] , \B\[10\] , \B\[9\] ,
         \B\[8\] , \B\[7\] , \B\[6\] , \B\[5\] , \B\[4\] , \B\[3\] , \B\[2\] ,
         \B\[1\] , \B\[0\] , CI;
  output \SUM\[25\] , \SUM\[24\] , \SUM\[23\] , \SUM\[22\] , \SUM\[21\] ,
         \SUM\[20\] , \SUM\[19\] , \SUM\[18\] , \SUM\[17\] , \SUM\[16\] ,
         \SUM\[15\] , \SUM\[14\] , \SUM\[13\] , \SUM\[12\] , \SUM\[11\] ,
         \SUM\[10\] , \SUM\[9\] , \SUM\[8\] , \SUM\[7\] , \SUM\[6\] ,
         \SUM\[5\] , \SUM\[4\] , \SUM\[3\] , \SUM\[2\] , \SUM\[1\] ,
         \SUM\[0\] , CO;
  wire   \A\[2\] , \A\[1\] , \A\[0\] , n1, n2, n3, n4, n5, n6, n7, n8, n11,
         n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25,
         n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39,
         n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53,
         n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67,
         n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81,
         n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94;
  assign \SUM\[2\]  = \A\[2\] ;
  assign \SUM\[1\]  = \A\[1\] ;
  assign \SUM\[0\]  = \A\[0\] ;

  AOI21xp5_ASAP7_75t_R U2 ( .A1(\B\[24\] ), .A2(\A\[24\] ), .B(n33), .Y(n31)
         );
  NOR2xp33_ASAP7_75t_R U3 ( .A(n79), .B(n6), .Y(n76) );
  AOI21xp5_ASAP7_75t_R U4 ( .A1(n59), .A2(n60), .B(n4), .Y(n55) );
  AOI211xp5_ASAP7_75t_R U5 ( .A1(n63), .A2(n64), .B(n65), .C(n66), .Y(n60) );
  NOR2xp33_ASAP7_75t_R U6 ( .A(\A\[24\] ), .B(\B\[16\] ), .Y(n54) );
  AOI21xp5_ASAP7_75t_R U7 ( .A1(n70), .A2(n71), .B(n72), .Y(n69) );
  NOR2xp33_ASAP7_75t_R U8 ( .A(n84), .B(n85), .Y(n83) );
  NOR3xp33_ASAP7_75t_R U9 ( .A(n24), .B(n92), .C(n16), .Y(n91) );
  NOR2xp33_ASAP7_75t_R U10 ( .A(n52), .B(n8), .Y(n51) );
  NOR2xp33_ASAP7_75t_R U11 ( .A(n5), .B(n63), .Y(n81) );
  NOR2xp33_ASAP7_75t_R U12 ( .A(n5), .B(n84), .Y(n11) );
  O2A1O1Ixp33_ASAP7_75t_R U13 ( .A1(n29), .A2(n30), .B(n31), .C(n32), .Y(
        \SUM\[25\] ) );
  NOR2xp33_ASAP7_75t_R U14 ( .A(\B\[24\] ), .B(\A\[24\] ), .Y(n32) );
  AOI21xp5_ASAP7_75t_R U15 ( .A1(n34), .A2(n37), .B(n33), .Y(n36) );
  AOI21xp5_ASAP7_75t_R U16 ( .A1(n76), .A2(n62), .B(n61), .Y(n75) );
  NOR2xp33_ASAP7_75t_R U17 ( .A(n88), .B(n7), .Y(n86) );
  NOR2xp33_ASAP7_75t_R U18 ( .A(n58), .B(n54), .Y(n57) );
  OR2x2_ASAP7_75t_R U19 ( .A(n48), .B(n2), .Y(n1) );
  OR2x2_ASAP7_75t_R U20 ( .A(n49), .B(n50), .Y(n2) );
  OA21x2_ASAP7_75t_R U21 ( .A1(n54), .A2(n55), .B(n56), .Y(n3) );
  AND2x2_ASAP7_75t_R U22 ( .A(n61), .B(\A\[15\] ), .Y(n4) );
  OA21x2_ASAP7_75t_R U23 ( .A1(n28), .A2(n73), .B(n68), .Y(n5) );
  OA21x2_ASAP7_75t_R U24 ( .A1(n65), .A2(n80), .B(n64), .Y(n6) );
  OR2x2_ASAP7_75t_R U25 ( .A(n89), .B(n85), .Y(n7) );
  OR2x2_ASAP7_75t_R U26 ( .A(n53), .B(n3), .Y(n8) );
  AND2x2_ASAP7_75t_R U27 ( .A(n27), .B(n28), .Y(\SUM\[3\] ) );
  NAND2xp5_ASAP7_75t_R U28 ( .A(n68), .B(n69), .Y(n59) );
  INVx1_ASAP7_75t_R U29 ( .A(n21), .Y(n18) );
  NOR2x1_ASAP7_75t_R U30 ( .A(n45), .B(n1), .Y(n40) );
  INVx1_ASAP7_75t_R U31 ( .A(\A\[15\] ), .Y(n74) );
  INVx1_ASAP7_75t_R U32 ( .A(n28), .Y(n71) );
  OAI21xp5_ASAP7_75t_R U33 ( .A1(n90), .A2(n91), .B(n14), .Y(n68) );
  NAND2xp5_ASAP7_75t_R U34 ( .A(\A\[5\] ), .B(n14), .Y(n94) );
  INVx1_ASAP7_75t_R U35 ( .A(\A\[11\] ), .Y(n87) );
  INVx1_ASAP7_75t_R U36 ( .A(\A\[7\] ), .Y(n53) );
  INVx1_ASAP7_75t_R U37 ( .A(\A\[18\] ), .Y(n52) );
  INVx1_ASAP7_75t_R U38 ( .A(\A\[19\] ), .Y(n49) );
  INVx1_ASAP7_75t_R U39 ( .A(\A\[20\] ), .Y(n48) );
  INVx1_ASAP7_75t_R U40 ( .A(\A\[21\] ), .Y(n45) );
  NAND2xp5_ASAP7_75t_R U41 ( .A(\A\[5\] ), .B(n22), .Y(n21) );
  XNOR2xp5_ASAP7_75t_R U42 ( .A(n11), .B(n85), .Y(\SUM\[9\] ) );
  XOR2xp5_ASAP7_75t_R U43 ( .A(n84), .B(n5), .Y(\SUM\[8\] ) );
  XNOR2xp5_ASAP7_75t_R U44 ( .A(n12), .B(n13), .Y(\SUM\[7\] ) );
  NAND2xp5_ASAP7_75t_R U45 ( .A(n14), .B(n15), .Y(n13) );
  OAI21xp5_ASAP7_75t_R U46 ( .A1(n16), .A2(n21), .B(n17), .Y(n12) );
  XNOR2xp5_ASAP7_75t_R U47 ( .A(n18), .B(n19), .Y(\SUM\[6\] ) );
  NAND2xp5_ASAP7_75t_R U48 ( .A(n20), .B(n17), .Y(n19) );
  XNOR2xp5_ASAP7_75t_R U49 ( .A(n92), .B(n22), .Y(\SUM\[5\] ) );
  OAI21xp5_ASAP7_75t_R U50 ( .A1(n28), .A2(n23), .B(n24), .Y(n22) );
  INVx1_ASAP7_75t_R U51 ( .A(n25), .Y(n23) );
  XNOR2xp5_ASAP7_75t_R U52 ( .A(n71), .B(n26), .Y(\SUM\[4\] ) );
  NAND2xp5_ASAP7_75t_R U53 ( .A(n24), .B(n25), .Y(n26) );
  INVx1_ASAP7_75t_R U54 ( .A(n34), .Y(n30) );
  XOR2xp5_ASAP7_75t_R U55 ( .A(n35), .B(n36), .Y(\SUM\[24\] ) );
  INVx1_ASAP7_75t_R U56 ( .A(n38), .Y(n33) );
  XNOR2xp5_ASAP7_75t_R U57 ( .A(\B\[24\] ), .B(\A\[24\] ), .Y(n35) );
  XOR2xp5_ASAP7_75t_R U58 ( .A(n39), .B(n29), .Y(\SUM\[23\] ) );
  INVx1_ASAP7_75t_R U59 ( .A(n37), .Y(n29) );
  AO21x1_ASAP7_75t_R U60 ( .A1(n40), .A2(n41), .B(n42), .Y(n37) );
  INVx1_ASAP7_75t_R U61 ( .A(n43), .Y(n42) );
  NAND2xp5_ASAP7_75t_R U62 ( .A(n34), .B(n38), .Y(n39) );
  NAND2xp5_ASAP7_75t_R U63 ( .A(\B\[23\] ), .B(\A\[23\] ), .Y(n38) );
  OR2x2_ASAP7_75t_R U64 ( .A(\A\[23\] ), .B(\B\[23\] ), .Y(n34) );
  XNOR2xp5_ASAP7_75t_R U65 ( .A(n44), .B(n40), .Y(\SUM\[22\] ) );
  NAND2xp5_ASAP7_75t_R U66 ( .A(n41), .B(n43), .Y(n44) );
  NAND2xp5_ASAP7_75t_R U67 ( .A(\B\[22\] ), .B(\A\[22\] ), .Y(n43) );
  NAND2xp5_ASAP7_75t_R U68 ( .A(n46), .B(n47), .Y(n41) );
  INVx1_ASAP7_75t_R U69 ( .A(\A\[22\] ), .Y(n47) );
  INVx1_ASAP7_75t_R U70 ( .A(\B\[22\] ), .Y(n46) );
  XOR2xp5_ASAP7_75t_R U71 ( .A(n45), .B(n1), .Y(\SUM\[21\] ) );
  XOR2xp5_ASAP7_75t_R U72 ( .A(n48), .B(n2), .Y(\SUM\[20\] ) );
  INVx1_ASAP7_75t_R U73 ( .A(n51), .Y(n50) );
  XNOR2xp5_ASAP7_75t_R U74 ( .A(n51), .B(n49), .Y(\SUM\[19\] ) );
  XOR2xp5_ASAP7_75t_R U75 ( .A(n52), .B(n8), .Y(\SUM\[18\] ) );
  XNOR2xp5_ASAP7_75t_R U76 ( .A(n3), .B(\A\[17\] ), .Y(\SUM\[17\] ) );
  XNOR2xp5_ASAP7_75t_R U77 ( .A(n55), .B(n57), .Y(\SUM\[16\] ) );
  INVx1_ASAP7_75t_R U78 ( .A(n56), .Y(n58) );
  NAND2xp5_ASAP7_75t_R U79 ( .A(\B\[16\] ), .B(\A\[24\] ), .Y(n56) );
  NAND3xp33_ASAP7_75t_R U80 ( .A(n62), .B(\A\[13\] ), .C(\A\[15\] ), .Y(n66)
         );
  INVx1_ASAP7_75t_R U81 ( .A(n67), .Y(n65) );
  INVx1_ASAP7_75t_R U82 ( .A(n64), .Y(n72) );
  INVx1_ASAP7_75t_R U83 ( .A(n73), .Y(n70) );
  XOR2xp5_ASAP7_75t_R U84 ( .A(n74), .B(n75), .Y(\SUM\[15\] ) );
  INVx1_ASAP7_75t_R U85 ( .A(n77), .Y(n61) );
  XNOR2xp5_ASAP7_75t_R U86 ( .A(n76), .B(n78), .Y(\SUM\[14\] ) );
  NAND2xp5_ASAP7_75t_R U87 ( .A(n62), .B(n77), .Y(n78) );
  NAND2xp5_ASAP7_75t_R U88 ( .A(\B\[14\] ), .B(\A\[14\] ), .Y(n77) );
  OR2x2_ASAP7_75t_R U89 ( .A(\A\[14\] ), .B(\B\[14\] ), .Y(n62) );
  INVx1_ASAP7_75t_R U90 ( .A(\A\[13\] ), .Y(n79) );
  XOR2xp5_ASAP7_75t_R U91 ( .A(n79), .B(n6), .Y(\SUM\[13\] ) );
  INVx1_ASAP7_75t_R U92 ( .A(n81), .Y(n80) );
  XNOR2xp5_ASAP7_75t_R U93 ( .A(n81), .B(n82), .Y(\SUM\[12\] ) );
  NAND2xp5_ASAP7_75t_R U94 ( .A(n67), .B(n64), .Y(n82) );
  NAND2xp5_ASAP7_75t_R U95 ( .A(\B\[12\] ), .B(\A\[12\] ), .Y(n64) );
  OR2x2_ASAP7_75t_R U96 ( .A(\A\[12\] ), .B(\B\[12\] ), .Y(n67) );
  NAND3xp33_ASAP7_75t_R U97 ( .A(n83), .B(\A\[10\] ), .C(\A\[11\] ), .Y(n63)
         );
  XNOR2xp5_ASAP7_75t_R U98 ( .A(n86), .B(n87), .Y(\SUM\[11\] ) );
  INVx1_ASAP7_75t_R U99 ( .A(\A\[10\] ), .Y(n88) );
  XOR2xp5_ASAP7_75t_R U100 ( .A(n88), .B(n7), .Y(\SUM\[10\] ) );
  INVx1_ASAP7_75t_R U101 ( .A(\A\[9\] ), .Y(n85) );
  INVx1_ASAP7_75t_R U102 ( .A(n11), .Y(n89) );
  INVx1_ASAP7_75t_R U103 ( .A(\A\[8\] ), .Y(n84) );
  NAND2xp5_ASAP7_75t_R U104 ( .A(\B\[4\] ), .B(\A\[4\] ), .Y(n24) );
  INVx1_ASAP7_75t_R U105 ( .A(n20), .Y(n16) );
  INVx1_ASAP7_75t_R U106 ( .A(\A\[5\] ), .Y(n92) );
  NAND2xp5_ASAP7_75t_R U107 ( .A(n15), .B(n17), .Y(n90) );
  NAND2xp5_ASAP7_75t_R U108 ( .A(\B\[6\] ), .B(\A\[6\] ), .Y(n17) );
  NAND2xp5_ASAP7_75t_R U109 ( .A(\B\[7\] ), .B(\A\[7\] ), .Y(n15) );
  OR2x2_ASAP7_75t_R U110 ( .A(n93), .B(n94), .Y(n73) );
  OR2x2_ASAP7_75t_R U111 ( .A(\A\[7\] ), .B(\B\[7\] ), .Y(n14) );
  NAND2xp5_ASAP7_75t_R U112 ( .A(n20), .B(n25), .Y(n93) );
  OR2x2_ASAP7_75t_R U113 ( .A(\A\[4\] ), .B(\B\[4\] ), .Y(n25) );
  OR2x2_ASAP7_75t_R U114 ( .A(\A\[6\] ), .B(\B\[6\] ), .Y(n20) );
  OR2x2_ASAP7_75t_R U115 ( .A(\A\[3\] ), .B(\B\[3\] ), .Y(n27) );
  NAND2xp5_ASAP7_75t_R U116 ( .A(\B\[3\] ), .B(\A\[3\] ), .Y(n28) );
endmodule


module fp32_exp_DW02_mult_15 ( .A({\A\[3\] , \A\[2\] , \A\[1\] , \A\[0\] }), 
    .B({\B\[23\] , \B\[22\] , \B\[21\] , \B\[20\] , \B\[19\] , \B\[18\] , 
        \B\[17\] , \B\[16\] , \B\[15\] , \B\[14\] , \B\[13\] , \B\[12\] , 
        \B\[11\] , \B\[10\] , \B\[9\] , \B\[8\] , \B\[7\] , \B\[6\] , \B\[5\] , 
        \B\[4\] , \B\[3\] , \B\[2\] , \B\[1\] , \B\[0\] }), TC, .PRODUCT({
        \PRODUCT\[27\] , \PRODUCT\[26\] , \PRODUCT\[25\] , \PRODUCT\[24\] , 
        \PRODUCT\[23\] , \PRODUCT\[22\] , \PRODUCT\[21\] , \PRODUCT\[20\] , 
        \PRODUCT\[19\] , \PRODUCT\[18\] , \PRODUCT\[17\] , \PRODUCT\[16\] , 
        \PRODUCT\[15\] , \PRODUCT\[14\] , \PRODUCT\[13\] , \PRODUCT\[12\] , 
        \PRODUCT\[11\] , \PRODUCT\[10\] , \PRODUCT\[9\] , \PRODUCT\[8\] , 
        \PRODUCT\[7\] , \PRODUCT\[6\] , \PRODUCT\[5\] , \PRODUCT\[4\] , 
        \PRODUCT\[3\] , \PRODUCT\[2\] , \PRODUCT\[1\] , \PRODUCT\[0\] }) );
  input \A\[3\] , \A\[2\] , \A\[1\] , \A\[0\] , \B\[23\] , \B\[22\] ,
         \B\[21\] , \B\[20\] , \B\[19\] , \B\[18\] , \B\[17\] , \B\[16\] ,
         \B\[15\] , \B\[14\] , \B\[13\] , \B\[12\] , \B\[11\] , \B\[10\] ,
         \B\[9\] , \B\[8\] , \B\[7\] , \B\[6\] , \B\[5\] , \B\[4\] , \B\[3\] ,
         \B\[2\] , \B\[1\] , \B\[0\] , TC;
  output \PRODUCT\[27\] , \PRODUCT\[26\] , \PRODUCT\[25\] , \PRODUCT\[24\] ,
         \PRODUCT\[23\] , \PRODUCT\[22\] , \PRODUCT\[21\] , \PRODUCT\[20\] ,
         \PRODUCT\[19\] , \PRODUCT\[18\] , \PRODUCT\[17\] , \PRODUCT\[16\] ,
         \PRODUCT\[15\] , \PRODUCT\[14\] , \PRODUCT\[13\] , \PRODUCT\[12\] ,
         \PRODUCT\[11\] , \PRODUCT\[10\] , \PRODUCT\[9\] , \PRODUCT\[8\] ,
         \PRODUCT\[7\] , \PRODUCT\[6\] , \PRODUCT\[5\] , \PRODUCT\[4\] ,
         \PRODUCT\[3\] , \PRODUCT\[2\] , \PRODUCT\[1\] , \PRODUCT\[0\] ;
  wire   net27245, \ab\[3\]\[9\] , \ab\[2\]\[9\] , \ab\[1\]\[9\] ,
         \ab\[0\]\[9\] , n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13,
         n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27,
         n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41,
         n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n55, n56,
         n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70,
         n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84,
         n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98,
         n99, n100, n101, n102, n103, n104, n105, n106;
  assign \ab\[3\]\[9\]  = \A\[3\] ;
  assign \ab\[2\]\[9\]  = \A\[2\] ;
  assign \ab\[1\]\[9\]  = \A\[1\] ;
  assign \ab\[0\]\[9\]  = \A\[0\] ;

  FAx1_ASAP7_75t_R S4_0 ( .A(\ab\[3\]\[9\] ), .B(n62), .CI(n61), .CON(n65), 
        .SN(n66) );
  FAx1_ASAP7_75t_R S4_1 ( .A(\ab\[3\]\[9\] ), .B(n58), .CI(\PRODUCT\[1\] ), 
        .CON(n67), .SN(n68) );
  FAx1_ASAP7_75t_R S4_3 ( .A(\ab\[3\]\[9\] ), .B(n52), .CI(n50), .CON(n69), 
        .SN(n70) );
  FAx1_ASAP7_75t_R S4_4 ( .A(\ab\[3\]\[9\] ), .B(n47), .CI(\ab\[2\]\[9\] ), 
        .CON(n71), .SN(n72) );
  FAx1_ASAP7_75t_R S4_9 ( .A(\ab\[3\]\[9\] ), .B(n44), .CI(n22), .CON(n73), 
        .SN(n74) );
  FAx1_ASAP7_75t_R S4_11 ( .A(\ab\[3\]\[9\] ), .B(n41), .CI(n22), .CON(n75), 
        .SN(n76) );
  FAx1_ASAP7_75t_R S4_13 ( .A(\ab\[3\]\[9\] ), .B(n38), .CI(n22), .CON(n77), 
        .SN(n78) );
  FAx1_ASAP7_75t_R S4_19 ( .A(\ab\[3\]\[9\] ), .B(n33), .CI(n31), .CON(n79), 
        .SN(n80) );
  FAx1_ASAP7_75t_R S4_20 ( .A(\ab\[3\]\[9\] ), .B(n28), .CI(n61), .CON(n81), 
        .SN(n82) );
  FAx1_ASAP7_75t_R S4_21 ( .A(\ab\[3\]\[9\] ), .B(n25), .CI(n22), .CON(n83), 
        .SN(n84) );
  FAx1_ASAP7_75t_R S1_2_0 ( .A(\ab\[2\]\[9\] ), .B(n64), .CI(n22), .CON(n85), 
        .SN(n86) );
  FAx1_ASAP7_75t_R S2_2_3 ( .A(\ab\[2\]\[9\] ), .B(n55), .CI(\PRODUCT\[1\] ), 
        .CON(n89), .SN(n90) );
  FAx1_ASAP7_75t_R S2_2_4 ( .A(\ab\[2\]\[9\] ), .B(n51), .CI(n22), .CON(n91), 
        .SN(n92) );
  FAx1_ASAP7_75t_R S2_2_19 ( .A(\ab\[2\]\[9\] ), .B(n35), .CI(\PRODUCT\[1\] ), 
        .CON(n96), .SN(n97) );
  FAx1_ASAP7_75t_R S2_2_20 ( .A(\ab\[2\]\[9\] ), .B(n32), .CI(n22), .CON(n98), 
        .SN(n99) );
  AND2x2_ASAP7_75t_R U2 ( .A(n59), .B(n57), .Y(n2) );
  XOR2xp5_ASAP7_75t_R U3 ( .A(n53), .B(n56), .Y(n3) );
  XOR2xp5_ASAP7_75t_R U4 ( .A(n61), .B(n42), .Y(n4) );
  AND2x2_ASAP7_75t_R U5 ( .A(n48), .B(n46), .Y(n5) );
  XOR2xp5_ASAP7_75t_R U6 ( .A(n46), .B(n48), .Y(n6) );
  AND2x2_ASAP7_75t_R U7 ( .A(n42), .B(n61), .Y(n7) );
  XOR2xp5_ASAP7_75t_R U8 ( .A(n61), .B(n39), .Y(n8) );
  XOR2xp5_ASAP7_75t_R U9 ( .A(n27), .B(n29), .Y(n9) );
  AND2x2_ASAP7_75t_R U10 ( .A(n29), .B(n27), .Y(n10) );
  AND2x2_ASAP7_75t_R U11 ( .A(n26), .B(n24), .Y(n11) );
  XOR2xp5_ASAP7_75t_R U12 ( .A(\ab\[3\]\[9\] ), .B(n45), .Y(n12) );
  AND2x2_ASAP7_75t_R U13 ( .A(n45), .B(\ab\[3\]\[9\] ), .Y(n13) );
  AND2x2_ASAP7_75t_R U14 ( .A(n56), .B(n53), .Y(n14) );
  AND2x2_ASAP7_75t_R U15 ( .A(n39), .B(n61), .Y(n15) );
  XOR2xp5_ASAP7_75t_R U16 ( .A(\ab\[2\]\[9\] ), .B(n36), .Y(n16) );
  AND2x2_ASAP7_75t_R U17 ( .A(n36), .B(\ab\[2\]\[9\] ), .Y(n17) );
  XOR2xp5_ASAP7_75t_R U18 ( .A(n24), .B(n26), .Y(n18) );
  XOR2xp5_ASAP7_75t_R U19 ( .A(\ab\[2\]\[9\] ), .B(n23), .Y(n19) );
  AND2x2_ASAP7_75t_R U20 ( .A(n23), .B(\ab\[2\]\[9\] ), .Y(n20) );
  XOR2xp5_ASAP7_75t_R U21 ( .A(n57), .B(n59), .Y(n21) );
  BUFx2_ASAP7_75t_R U22 ( .A(\ab\[1\]\[9\] ), .Y(n22) );
  TIELOx1_ASAP7_75t_R U23 ( .L(net27245) );
  NAND2xp5_ASAP7_75t_R U24 ( .A(\ab\[0\]\[9\] ), .B(n22), .Y(n101) );
  NAND2xp5_ASAP7_75t_R U25 ( .A(\ab\[0\]\[9\] ), .B(n22), .Y(n102) );
  NAND2xp5_ASAP7_75t_R U26 ( .A(\ab\[0\]\[9\] ), .B(n22), .Y(n103) );
  XNOR2xp5_ASAP7_75t_R U27 ( .A(n22), .B(\ab\[0\]\[9\] ), .Y(n104) );
  NAND2xp5_ASAP7_75t_R U28 ( .A(\ab\[0\]\[9\] ), .B(n22), .Y(n105) );
  NAND2xp5_ASAP7_75t_R U29 ( .A(\ab\[0\]\[9\] ), .B(n22), .Y(n106) );
  NAND2xp5_ASAP7_75t_R U30 ( .A(\ab\[2\]\[9\] ), .B(\ab\[0\]\[9\] ), .Y(n87)
         );
  XNOR2xp5_ASAP7_75t_R U31 ( .A(\ab\[0\]\[9\] ), .B(\ab\[2\]\[9\] ), .Y(n88)
         );
  NAND2xp5_ASAP7_75t_R U32 ( .A(\ab\[2\]\[9\] ), .B(\ab\[0\]\[9\] ), .Y(n93)
         );
  NAND2xp5_ASAP7_75t_R U33 ( .A(\ab\[2\]\[9\] ), .B(\ab\[0\]\[9\] ), .Y(n94)
         );
  NAND2xp5_ASAP7_75t_R U34 ( .A(\ab\[2\]\[9\] ), .B(\ab\[0\]\[9\] ), .Y(n95)
         );
  NAND2xp5_ASAP7_75t_R U35 ( .A(\ab\[2\]\[9\] ), .B(\ab\[0\]\[9\] ), .Y(n100)
         );
  INVxp67_ASAP7_75t_R U36 ( .A(n71), .Y(n45) );
  INVx1_ASAP7_75t_R U37 ( .A(n103), .Y(n51) );
  INVx1_ASAP7_75t_R U38 ( .A(n102), .Y(n55) );
  INVx1_ASAP7_75t_R U39 ( .A(n104), .Y(\PRODUCT\[1\] ) );
  INVx1_ASAP7_75t_R U40 ( .A(n101), .Y(n64) );
  INVx1_ASAP7_75t_R U41 ( .A(n91), .Y(n47) );
  INVx1_ASAP7_75t_R U42 ( .A(n89), .Y(n52) );
  INVx1_ASAP7_75t_R U43 ( .A(n92), .Y(n50) );
  INVx1_ASAP7_75t_R U44 ( .A(n85), .Y(n62) );
  INVx1_ASAP7_75t_R U45 ( .A(n69), .Y(n48) );
  INVx1_ASAP7_75t_R U46 ( .A(n72), .Y(n46) );
  INVx1_ASAP7_75t_R U47 ( .A(n67), .Y(n56) );
  INVx1_ASAP7_75t_R U48 ( .A(n90), .Y(n53) );
  INVx1_ASAP7_75t_R U49 ( .A(n65), .Y(n59) );
  INVx1_ASAP7_75t_R U50 ( .A(n68), .Y(n57) );
  INVx1_ASAP7_75t_R U51 ( .A(n80), .Y(n30) );
  INVx1_ASAP7_75t_R U52 ( .A(n97), .Y(n34) );
  INVx1_ASAP7_75t_R U53 ( .A(n78), .Y(n37) );
  INVx1_ASAP7_75t_R U54 ( .A(n76), .Y(n40) );
  INVx1_ASAP7_75t_R U55 ( .A(n74), .Y(n43) );
  INVx1_ASAP7_75t_R U56 ( .A(n70), .Y(n49) );
  INVx1_ASAP7_75t_R U57 ( .A(n66), .Y(n60) );
  INVx1_ASAP7_75t_R U58 ( .A(n86), .Y(n63) );
  INVx1_ASAP7_75t_R U59 ( .A(n83), .Y(n23) );
  INVx1_ASAP7_75t_R U60 ( .A(n84), .Y(n24) );
  INVx1_ASAP7_75t_R U61 ( .A(n100), .Y(n25) );
  INVx1_ASAP7_75t_R U62 ( .A(n81), .Y(n26) );
  INVx1_ASAP7_75t_R U63 ( .A(n82), .Y(n27) );
  INVx1_ASAP7_75t_R U64 ( .A(n98), .Y(n28) );
  INVx1_ASAP7_75t_R U65 ( .A(n79), .Y(n29) );
  INVx1_ASAP7_75t_R U66 ( .A(n99), .Y(n31) );
  INVx1_ASAP7_75t_R U67 ( .A(n106), .Y(n32) );
  INVx1_ASAP7_75t_R U68 ( .A(n96), .Y(n33) );
  INVx1_ASAP7_75t_R U69 ( .A(n105), .Y(n35) );
  INVx1_ASAP7_75t_R U70 ( .A(n77), .Y(n36) );
  INVx1_ASAP7_75t_R U71 ( .A(n95), .Y(n38) );
  INVx1_ASAP7_75t_R U72 ( .A(n75), .Y(n39) );
  INVx1_ASAP7_75t_R U73 ( .A(n94), .Y(n41) );
  INVx1_ASAP7_75t_R U74 ( .A(n73), .Y(n42) );
  INVx1_ASAP7_75t_R U75 ( .A(n93), .Y(n44) );
  INVx1_ASAP7_75t_R U76 ( .A(n87), .Y(n58) );
  INVx1_ASAP7_75t_R U77 ( .A(n88), .Y(n61) );
  fp32_exp_DW01_add_40 FS_1 ( .A({net27245, \ab\[3\]\[9\] , n19, n18, n9, n30, 
        n34, \PRODUCT\[1\] , \ab\[0\]\[9\] , \ab\[3\]\[9\] , n16, n37, n8, n40, 
        n4, n43, n61, n22, \ab\[0\]\[9\] , n12, n6, n49, n3, n21, n60, n63}), 
        .B({net27245, n20, n11, n10, net27245, net27245, net27245, net27245, 
        net27245, n17, net27245, n15, net27245, n7, net27245, net27245, 
        net27245, net27245, n13, n5, net27245, n14, n2, net27245, net27245, 
        net27245}), .CI(net27245), .SUM({\PRODUCT\[27\] , \PRODUCT\[26\] , 
        \PRODUCT\[25\] , \PRODUCT\[24\] , \PRODUCT\[23\] , \PRODUCT\[22\] , 
        \PRODUCT\[21\] , \PRODUCT\[20\] , \PRODUCT\[19\] , \PRODUCT\[18\] , 
        \PRODUCT\[17\] , \PRODUCT\[16\] , \PRODUCT\[15\] , \PRODUCT\[14\] , 
        \PRODUCT\[13\] , \PRODUCT\[12\] , \PRODUCT\[11\] , \PRODUCT\[10\] , 
        \PRODUCT\[9\] , \PRODUCT\[8\] , \PRODUCT\[7\] , \PRODUCT\[6\] , 
        \PRODUCT\[5\] , \PRODUCT\[4\] , \PRODUCT\[3\] , \PRODUCT\[2\] }) );
endmodule


module fp32_exp_DW01_add_J8_2 ( .A({\A\[25\] , \A\[24\] , \A\[23\] , \A\[22\] , 
        \A\[21\] , \A\[20\] , \A\[19\] , \A\[18\] , \A\[17\] , \A\[16\] , 
        \A\[15\] , \A\[14\] , \A\[13\] , \A\[12\] , \A\[11\] , \A\[10\] , 
        \A\[9\] , \A\[8\] , \A\[7\] , \A\[6\] , \A\[5\] , \A\[4\] , \A\[3\] , 
        \A\[2\] , \A\[1\] , \A\[0\] }), .B({\B\[25\] , \B\[24\] , \B\[23\] , 
        \B\[22\] , \B\[21\] , \B\[20\] , \B\[19\] , \B\[18\] , \B\[17\] , 
        \B\[16\] , \B\[15\] , \B\[14\] , \B\[13\] , \B\[12\] , \B\[11\] , 
        \B\[10\] , \B\[9\] , \B\[8\] , \B\[7\] , \B\[6\] , \B\[5\] , \B\[4\] , 
        \B\[3\] , \B\[2\] , \B\[1\] , \B\[0\] }), CI, .SUM({\SUM\[25\] , 
        \SUM\[24\] , \SUM\[23\] , \SUM\[22\] , \SUM\[21\] , \SUM\[20\] , 
        \SUM\[19\] , \SUM\[18\] , \SUM\[17\] , \SUM\[16\] , \SUM\[15\] , 
        \SUM\[14\] , \SUM\[13\] , \SUM\[12\] , \SUM\[11\] , \SUM\[10\] , 
        \SUM\[9\] , \SUM\[8\] , \SUM\[7\] , \SUM\[6\] , \SUM\[5\] , \SUM\[4\] , 
        \SUM\[3\] , \SUM\[2\] , \SUM\[1\] , \SUM\[0\] }), CO );
  input \A\[25\] , \A\[24\] , \A\[23\] , \A\[22\] , \A\[21\] , \A\[20\] ,
         \A\[19\] , \A\[18\] , \A\[17\] , \A\[16\] , \A\[15\] , \A\[14\] ,
         \A\[13\] , \A\[12\] , \A\[11\] , \A\[10\] , \A\[9\] , \A\[8\] ,
         \A\[7\] , \A\[6\] , \A\[5\] , \A\[4\] , \A\[3\] , \A\[2\] , \A\[1\] ,
         \A\[0\] , \B\[25\] , \B\[24\] , \B\[23\] , \B\[22\] , \B\[21\] ,
         \B\[20\] , \B\[19\] , \B\[18\] , \B\[17\] , \B\[16\] , \B\[15\] ,
         \B\[14\] , \B\[13\] , \B\[12\] , \B\[11\] , \B\[10\] , \B\[9\] ,
         \B\[8\] , \B\[7\] , \B\[6\] , \B\[5\] , \B\[4\] , \B\[3\] , \B\[2\] ,
         \B\[1\] , \B\[0\] , CI;
  output \SUM\[25\] , \SUM\[24\] , \SUM\[23\] , \SUM\[22\] , \SUM\[21\] ,
         \SUM\[20\] , \SUM\[19\] , \SUM\[18\] , \SUM\[17\] , \SUM\[16\] ,
         \SUM\[15\] , \SUM\[14\] , \SUM\[13\] , \SUM\[12\] , \SUM\[11\] ,
         \SUM\[10\] , \SUM\[9\] , \SUM\[8\] , \SUM\[7\] , \SUM\[6\] ,
         \SUM\[5\] , \SUM\[4\] , \SUM\[3\] , \SUM\[2\] , \SUM\[1\] ,
         \SUM\[0\] , CO;
  wire   \A\[2\] , \A\[1\] , \A\[0\] , n1, n2, n3, n4, n5, n6, n7, n8, n11,
         n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25,
         n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39,
         n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53,
         n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67,
         n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81,
         n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94;
  assign \SUM\[2\]  = \A\[2\] ;
  assign \SUM\[1\]  = \A\[1\] ;
  assign \SUM\[0\]  = \A\[0\] ;

  AOI21xp5_ASAP7_75t_R U2 ( .A1(\B\[24\] ), .A2(\A\[24\] ), .B(n33), .Y(n31)
         );
  INVxp67_ASAP7_75t_R U3 ( .A(n37), .Y(n29) );
  NOR2xp33_ASAP7_75t_R U4 ( .A(n79), .B(n6), .Y(n76) );
  AOI21xp5_ASAP7_75t_R U5 ( .A1(n59), .A2(n60), .B(n4), .Y(n55) );
  AOI211xp5_ASAP7_75t_R U6 ( .A1(n63), .A2(n64), .B(n65), .C(n66), .Y(n60) );
  NOR2xp33_ASAP7_75t_R U7 ( .A(\A\[24\] ), .B(\B\[16\] ), .Y(n54) );
  AOI21xp5_ASAP7_75t_R U8 ( .A1(n70), .A2(n71), .B(n72), .Y(n69) );
  NOR2xp33_ASAP7_75t_R U9 ( .A(n84), .B(n85), .Y(n83) );
  NOR3xp33_ASAP7_75t_R U10 ( .A(n24), .B(n92), .C(n16), .Y(n91) );
  NOR2xp33_ASAP7_75t_R U11 ( .A(n52), .B(n8), .Y(n51) );
  NOR2xp33_ASAP7_75t_R U12 ( .A(n5), .B(n63), .Y(n81) );
  NOR2xp33_ASAP7_75t_R U13 ( .A(n5), .B(n84), .Y(n11) );
  AOI21xp5_ASAP7_75t_R U14 ( .A1(n34), .A2(n37), .B(n33), .Y(n36) );
  NOR2xp33_ASAP7_75t_R U15 ( .A(\B\[24\] ), .B(\A\[24\] ), .Y(n32) );
  AOI21xp5_ASAP7_75t_R U16 ( .A1(n76), .A2(n62), .B(n61), .Y(n75) );
  NOR2xp33_ASAP7_75t_R U17 ( .A(n88), .B(n7), .Y(n86) );
  NOR2xp33_ASAP7_75t_R U18 ( .A(n58), .B(n54), .Y(n57) );
  OR2x2_ASAP7_75t_R U19 ( .A(n48), .B(n2), .Y(n1) );
  OR2x2_ASAP7_75t_R U20 ( .A(n49), .B(n50), .Y(n2) );
  OA21x2_ASAP7_75t_R U21 ( .A1(n54), .A2(n55), .B(n56), .Y(n3) );
  AND2x2_ASAP7_75t_R U22 ( .A(n61), .B(\A\[15\] ), .Y(n4) );
  OA21x2_ASAP7_75t_R U23 ( .A1(n28), .A2(n73), .B(n68), .Y(n5) );
  OA21x2_ASAP7_75t_R U24 ( .A1(n65), .A2(n80), .B(n64), .Y(n6) );
  OR2x2_ASAP7_75t_R U25 ( .A(n89), .B(n85), .Y(n7) );
  OR2x2_ASAP7_75t_R U26 ( .A(n53), .B(n3), .Y(n8) );
  AND2x2_ASAP7_75t_R U27 ( .A(n27), .B(n28), .Y(\SUM\[3\] ) );
  NAND2xp5_ASAP7_75t_R U28 ( .A(n68), .B(n69), .Y(n59) );
  INVx1_ASAP7_75t_R U29 ( .A(n21), .Y(n18) );
  NOR2x1_ASAP7_75t_R U30 ( .A(n45), .B(n1), .Y(n40) );
  INVx1_ASAP7_75t_R U31 ( .A(\A\[15\] ), .Y(n74) );
  INVx1_ASAP7_75t_R U32 ( .A(n28), .Y(n71) );
  OAI21xp5_ASAP7_75t_R U33 ( .A1(n90), .A2(n91), .B(n14), .Y(n68) );
  NAND2xp5_ASAP7_75t_R U34 ( .A(\A\[5\] ), .B(n14), .Y(n94) );
  INVx1_ASAP7_75t_R U35 ( .A(\A\[11\] ), .Y(n87) );
  INVx1_ASAP7_75t_R U36 ( .A(\A\[7\] ), .Y(n53) );
  INVx1_ASAP7_75t_R U37 ( .A(\A\[18\] ), .Y(n52) );
  INVx1_ASAP7_75t_R U38 ( .A(\A\[19\] ), .Y(n49) );
  INVx1_ASAP7_75t_R U39 ( .A(\A\[20\] ), .Y(n48) );
  INVx1_ASAP7_75t_R U40 ( .A(\A\[21\] ), .Y(n45) );
  NAND2xp5_ASAP7_75t_R U41 ( .A(\A\[5\] ), .B(n22), .Y(n21) );
  O2A1O1Ixp33_ASAP7_75t_R U42 ( .A1(n29), .A2(n30), .B(n31), .C(n32), .Y(
        \SUM\[25\] ) );
  XNOR2xp5_ASAP7_75t_R U43 ( .A(n11), .B(n85), .Y(\SUM\[9\] ) );
  XOR2xp5_ASAP7_75t_R U44 ( .A(n84), .B(n5), .Y(\SUM\[8\] ) );
  XNOR2xp5_ASAP7_75t_R U45 ( .A(n12), .B(n13), .Y(\SUM\[7\] ) );
  NAND2xp5_ASAP7_75t_R U46 ( .A(n14), .B(n15), .Y(n13) );
  OAI21xp5_ASAP7_75t_R U47 ( .A1(n16), .A2(n21), .B(n17), .Y(n12) );
  XNOR2xp5_ASAP7_75t_R U48 ( .A(n18), .B(n19), .Y(\SUM\[6\] ) );
  NAND2xp5_ASAP7_75t_R U49 ( .A(n20), .B(n17), .Y(n19) );
  XNOR2xp5_ASAP7_75t_R U50 ( .A(n92), .B(n22), .Y(\SUM\[5\] ) );
  OAI21xp5_ASAP7_75t_R U51 ( .A1(n28), .A2(n23), .B(n24), .Y(n22) );
  INVx1_ASAP7_75t_R U52 ( .A(n25), .Y(n23) );
  XNOR2xp5_ASAP7_75t_R U53 ( .A(n71), .B(n26), .Y(\SUM\[4\] ) );
  NAND2xp5_ASAP7_75t_R U54 ( .A(n24), .B(n25), .Y(n26) );
  INVx1_ASAP7_75t_R U55 ( .A(n34), .Y(n30) );
  XOR2xp5_ASAP7_75t_R U56 ( .A(n35), .B(n36), .Y(\SUM\[24\] ) );
  INVx1_ASAP7_75t_R U57 ( .A(n38), .Y(n33) );
  XNOR2xp5_ASAP7_75t_R U58 ( .A(\B\[24\] ), .B(\A\[24\] ), .Y(n35) );
  XOR2xp5_ASAP7_75t_R U59 ( .A(n39), .B(n29), .Y(\SUM\[23\] ) );
  AO21x1_ASAP7_75t_R U60 ( .A1(n40), .A2(n41), .B(n42), .Y(n37) );
  INVx1_ASAP7_75t_R U61 ( .A(n43), .Y(n42) );
  NAND2xp5_ASAP7_75t_R U62 ( .A(n34), .B(n38), .Y(n39) );
  NAND2xp5_ASAP7_75t_R U63 ( .A(\B\[23\] ), .B(\A\[23\] ), .Y(n38) );
  OR2x2_ASAP7_75t_R U64 ( .A(\A\[23\] ), .B(\B\[23\] ), .Y(n34) );
  XNOR2xp5_ASAP7_75t_R U65 ( .A(n44), .B(n40), .Y(\SUM\[22\] ) );
  NAND2xp5_ASAP7_75t_R U66 ( .A(n41), .B(n43), .Y(n44) );
  NAND2xp5_ASAP7_75t_R U67 ( .A(\B\[22\] ), .B(\A\[22\] ), .Y(n43) );
  NAND2xp5_ASAP7_75t_R U68 ( .A(n46), .B(n47), .Y(n41) );
  INVx1_ASAP7_75t_R U69 ( .A(\A\[22\] ), .Y(n47) );
  INVx1_ASAP7_75t_R U70 ( .A(\B\[22\] ), .Y(n46) );
  XOR2xp5_ASAP7_75t_R U71 ( .A(n45), .B(n1), .Y(\SUM\[21\] ) );
  XOR2xp5_ASAP7_75t_R U72 ( .A(n48), .B(n2), .Y(\SUM\[20\] ) );
  INVx1_ASAP7_75t_R U73 ( .A(n51), .Y(n50) );
  XNOR2xp5_ASAP7_75t_R U74 ( .A(n51), .B(n49), .Y(\SUM\[19\] ) );
  XOR2xp5_ASAP7_75t_R U75 ( .A(n52), .B(n8), .Y(\SUM\[18\] ) );
  XNOR2xp5_ASAP7_75t_R U76 ( .A(n3), .B(\A\[17\] ), .Y(\SUM\[17\] ) );
  XNOR2xp5_ASAP7_75t_R U77 ( .A(n55), .B(n57), .Y(\SUM\[16\] ) );
  INVx1_ASAP7_75t_R U78 ( .A(n56), .Y(n58) );
  NAND2xp5_ASAP7_75t_R U79 ( .A(\B\[16\] ), .B(\A\[24\] ), .Y(n56) );
  NAND3xp33_ASAP7_75t_R U80 ( .A(n62), .B(\A\[13\] ), .C(\A\[15\] ), .Y(n66)
         );
  INVx1_ASAP7_75t_R U81 ( .A(n67), .Y(n65) );
  INVx1_ASAP7_75t_R U82 ( .A(n64), .Y(n72) );
  INVx1_ASAP7_75t_R U83 ( .A(n73), .Y(n70) );
  XOR2xp5_ASAP7_75t_R U84 ( .A(n74), .B(n75), .Y(\SUM\[15\] ) );
  INVx1_ASAP7_75t_R U85 ( .A(n77), .Y(n61) );
  XNOR2xp5_ASAP7_75t_R U86 ( .A(n76), .B(n78), .Y(\SUM\[14\] ) );
  NAND2xp5_ASAP7_75t_R U87 ( .A(n62), .B(n77), .Y(n78) );
  NAND2xp5_ASAP7_75t_R U88 ( .A(\B\[14\] ), .B(\A\[14\] ), .Y(n77) );
  OR2x2_ASAP7_75t_R U89 ( .A(\A\[14\] ), .B(\B\[14\] ), .Y(n62) );
  INVx1_ASAP7_75t_R U90 ( .A(\A\[13\] ), .Y(n79) );
  XOR2xp5_ASAP7_75t_R U91 ( .A(n79), .B(n6), .Y(\SUM\[13\] ) );
  INVx1_ASAP7_75t_R U92 ( .A(n81), .Y(n80) );
  XNOR2xp5_ASAP7_75t_R U93 ( .A(n81), .B(n82), .Y(\SUM\[12\] ) );
  NAND2xp5_ASAP7_75t_R U94 ( .A(n67), .B(n64), .Y(n82) );
  NAND2xp5_ASAP7_75t_R U95 ( .A(\B\[12\] ), .B(\A\[12\] ), .Y(n64) );
  OR2x2_ASAP7_75t_R U96 ( .A(\A\[12\] ), .B(\B\[12\] ), .Y(n67) );
  NAND3xp33_ASAP7_75t_R U97 ( .A(n83), .B(\A\[10\] ), .C(\A\[11\] ), .Y(n63)
         );
  XNOR2xp5_ASAP7_75t_R U98 ( .A(n86), .B(n87), .Y(\SUM\[11\] ) );
  INVx1_ASAP7_75t_R U99 ( .A(\A\[10\] ), .Y(n88) );
  XOR2xp5_ASAP7_75t_R U100 ( .A(n88), .B(n7), .Y(\SUM\[10\] ) );
  INVx1_ASAP7_75t_R U101 ( .A(\A\[9\] ), .Y(n85) );
  INVx1_ASAP7_75t_R U102 ( .A(n11), .Y(n89) );
  INVx1_ASAP7_75t_R U103 ( .A(\A\[8\] ), .Y(n84) );
  NAND2xp5_ASAP7_75t_R U104 ( .A(\B\[4\] ), .B(\A\[4\] ), .Y(n24) );
  INVx1_ASAP7_75t_R U105 ( .A(n20), .Y(n16) );
  INVx1_ASAP7_75t_R U106 ( .A(\A\[5\] ), .Y(n92) );
  NAND2xp5_ASAP7_75t_R U107 ( .A(n15), .B(n17), .Y(n90) );
  NAND2xp5_ASAP7_75t_R U108 ( .A(\B\[6\] ), .B(\A\[6\] ), .Y(n17) );
  NAND2xp5_ASAP7_75t_R U109 ( .A(\B\[7\] ), .B(\A\[7\] ), .Y(n15) );
  OR2x2_ASAP7_75t_R U110 ( .A(n93), .B(n94), .Y(n73) );
  OR2x2_ASAP7_75t_R U111 ( .A(\A\[7\] ), .B(\B\[7\] ), .Y(n14) );
  NAND2xp5_ASAP7_75t_R U112 ( .A(n20), .B(n25), .Y(n93) );
  OR2x2_ASAP7_75t_R U113 ( .A(\A\[4\] ), .B(\B\[4\] ), .Y(n25) );
  OR2x2_ASAP7_75t_R U114 ( .A(\A\[6\] ), .B(\B\[6\] ), .Y(n20) );
  OR2x2_ASAP7_75t_R U115 ( .A(\A\[3\] ), .B(\B\[3\] ), .Y(n27) );
  NAND2xp5_ASAP7_75t_R U116 ( .A(\B\[3\] ), .B(\A\[3\] ), .Y(n28) );
endmodule


module fp32_exp_DW02_mult_14 ( .A({\A\[3\] , \A\[2\] , \A\[1\] , \A\[0\] }), 
    .B({\B\[23\] , \B\[22\] , \B\[21\] , \B\[20\] , \B\[19\] , \B\[18\] , 
        \B\[17\] , \B\[16\] , \B\[15\] , \B\[14\] , \B\[13\] , \B\[12\] , 
        \B\[11\] , \B\[10\] , \B\[9\] , \B\[8\] , \B\[7\] , \B\[6\] , \B\[5\] , 
        \B\[4\] , \B\[3\] , \B\[2\] , \B\[1\] , \B\[0\] }), TC, .PRODUCT({
        \PRODUCT\[27\] , \PRODUCT\[26\] , \PRODUCT\[25\] , \PRODUCT\[24\] , 
        \PRODUCT\[23\] , \PRODUCT\[22\] , \PRODUCT\[21\] , \PRODUCT\[20\] , 
        \PRODUCT\[19\] , \PRODUCT\[18\] , \PRODUCT\[17\] , \PRODUCT\[16\] , 
        \PRODUCT\[15\] , \PRODUCT\[14\] , \PRODUCT\[13\] , \PRODUCT\[12\] , 
        \PRODUCT\[11\] , \PRODUCT\[10\] , \PRODUCT\[9\] , \PRODUCT\[8\] , 
        \PRODUCT\[7\] , \PRODUCT\[6\] , \PRODUCT\[5\] , \PRODUCT\[4\] , 
        \PRODUCT\[3\] , \PRODUCT\[2\] , \PRODUCT\[1\] , \PRODUCT\[0\] }) );
  input \A\[3\] , \A\[2\] , \A\[1\] , \A\[0\] , \B\[23\] , \B\[22\] ,
         \B\[21\] , \B\[20\] , \B\[19\] , \B\[18\] , \B\[17\] , \B\[16\] ,
         \B\[15\] , \B\[14\] , \B\[13\] , \B\[12\] , \B\[11\] , \B\[10\] ,
         \B\[9\] , \B\[8\] , \B\[7\] , \B\[6\] , \B\[5\] , \B\[4\] , \B\[3\] ,
         \B\[2\] , \B\[1\] , \B\[0\] , TC;
  output \PRODUCT\[27\] , \PRODUCT\[26\] , \PRODUCT\[25\] , \PRODUCT\[24\] ,
         \PRODUCT\[23\] , \PRODUCT\[22\] , \PRODUCT\[21\] , \PRODUCT\[20\] ,
         \PRODUCT\[19\] , \PRODUCT\[18\] , \PRODUCT\[17\] , \PRODUCT\[16\] ,
         \PRODUCT\[15\] , \PRODUCT\[14\] , \PRODUCT\[13\] , \PRODUCT\[12\] ,
         \PRODUCT\[11\] , \PRODUCT\[10\] , \PRODUCT\[9\] , \PRODUCT\[8\] ,
         \PRODUCT\[7\] , \PRODUCT\[6\] , \PRODUCT\[5\] , \PRODUCT\[4\] ,
         \PRODUCT\[3\] , \PRODUCT\[2\] , \PRODUCT\[1\] , \PRODUCT\[0\] ;
  wire   net27237, \ab\[3\]\[9\] , \ab\[2\]\[9\] , \ab\[1\]\[9\] ,
         \ab\[0\]\[9\] , n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13,
         n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27,
         n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41,
         n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n55, n56,
         n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70,
         n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84,
         n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98,
         n99, n100, n101, n102, n103, n104, n105, n106;
  assign \ab\[3\]\[9\]  = \A\[3\] ;
  assign \ab\[2\]\[9\]  = \A\[2\] ;
  assign \ab\[1\]\[9\]  = \A\[1\] ;
  assign \ab\[0\]\[9\]  = \A\[0\] ;

  FAx1_ASAP7_75t_R S4_0 ( .A(\ab\[3\]\[9\] ), .B(n62), .CI(n61), .CON(n65), 
        .SN(n66) );
  FAx1_ASAP7_75t_R S4_1 ( .A(\ab\[3\]\[9\] ), .B(n58), .CI(\PRODUCT\[1\] ), 
        .CON(n67), .SN(n68) );
  FAx1_ASAP7_75t_R S4_3 ( .A(\ab\[3\]\[9\] ), .B(n52), .CI(n50), .CON(n69), 
        .SN(n70) );
  FAx1_ASAP7_75t_R S4_4 ( .A(\ab\[3\]\[9\] ), .B(n47), .CI(\ab\[2\]\[9\] ), 
        .CON(n71), .SN(n72) );
  FAx1_ASAP7_75t_R S4_9 ( .A(\ab\[3\]\[9\] ), .B(n44), .CI(n22), .CON(n73), 
        .SN(n74) );
  FAx1_ASAP7_75t_R S4_11 ( .A(\ab\[3\]\[9\] ), .B(n41), .CI(n22), .CON(n75), 
        .SN(n76) );
  FAx1_ASAP7_75t_R S4_13 ( .A(\ab\[3\]\[9\] ), .B(n38), .CI(n22), .CON(n77), 
        .SN(n78) );
  FAx1_ASAP7_75t_R S4_19 ( .A(\ab\[3\]\[9\] ), .B(n33), .CI(n31), .CON(n79), 
        .SN(n80) );
  FAx1_ASAP7_75t_R S4_20 ( .A(\ab\[3\]\[9\] ), .B(n28), .CI(n61), .CON(n81), 
        .SN(n82) );
  FAx1_ASAP7_75t_R S4_21 ( .A(\ab\[3\]\[9\] ), .B(n25), .CI(n22), .CON(n83), 
        .SN(n84) );
  FAx1_ASAP7_75t_R S1_2_0 ( .A(\ab\[2\]\[9\] ), .B(n64), .CI(n22), .CON(n85), 
        .SN(n86) );
  FAx1_ASAP7_75t_R S2_2_3 ( .A(\ab\[2\]\[9\] ), .B(n55), .CI(\PRODUCT\[1\] ), 
        .CON(n89), .SN(n90) );
  FAx1_ASAP7_75t_R S2_2_4 ( .A(\ab\[2\]\[9\] ), .B(n51), .CI(n22), .CON(n91), 
        .SN(n92) );
  FAx1_ASAP7_75t_R S2_2_19 ( .A(\ab\[2\]\[9\] ), .B(n35), .CI(\PRODUCT\[1\] ), 
        .CON(n96), .SN(n97) );
  FAx1_ASAP7_75t_R S2_2_20 ( .A(\ab\[2\]\[9\] ), .B(n32), .CI(n22), .CON(n98), 
        .SN(n99) );
  INVx1_ASAP7_75t_R U2 ( .A(n103), .Y(n51) );
  AND2x2_ASAP7_75t_R U3 ( .A(n59), .B(n57), .Y(n2) );
  XOR2xp5_ASAP7_75t_R U4 ( .A(n53), .B(n56), .Y(n3) );
  XOR2xp5_ASAP7_75t_R U5 ( .A(n61), .B(n42), .Y(n4) );
  AND2x2_ASAP7_75t_R U6 ( .A(n48), .B(n46), .Y(n5) );
  XOR2xp5_ASAP7_75t_R U7 ( .A(n46), .B(n48), .Y(n6) );
  AND2x2_ASAP7_75t_R U8 ( .A(n42), .B(n61), .Y(n7) );
  XOR2xp5_ASAP7_75t_R U9 ( .A(n61), .B(n39), .Y(n8) );
  XOR2xp5_ASAP7_75t_R U10 ( .A(n27), .B(n29), .Y(n9) );
  AND2x2_ASAP7_75t_R U11 ( .A(n29), .B(n27), .Y(n10) );
  AND2x2_ASAP7_75t_R U12 ( .A(n26), .B(n24), .Y(n11) );
  XOR2xp5_ASAP7_75t_R U13 ( .A(\ab\[3\]\[9\] ), .B(n45), .Y(n12) );
  AND2x2_ASAP7_75t_R U14 ( .A(n45), .B(\ab\[3\]\[9\] ), .Y(n13) );
  AND2x2_ASAP7_75t_R U15 ( .A(n56), .B(n53), .Y(n14) );
  AND2x2_ASAP7_75t_R U16 ( .A(n39), .B(n61), .Y(n15) );
  XOR2xp5_ASAP7_75t_R U17 ( .A(\ab\[2\]\[9\] ), .B(n36), .Y(n16) );
  AND2x2_ASAP7_75t_R U18 ( .A(n36), .B(\ab\[2\]\[9\] ), .Y(n17) );
  XOR2xp5_ASAP7_75t_R U19 ( .A(n24), .B(n26), .Y(n18) );
  XOR2xp5_ASAP7_75t_R U20 ( .A(\ab\[2\]\[9\] ), .B(n23), .Y(n19) );
  AND2x2_ASAP7_75t_R U21 ( .A(n23), .B(\ab\[2\]\[9\] ), .Y(n20) );
  XOR2xp5_ASAP7_75t_R U22 ( .A(n57), .B(n59), .Y(n21) );
  BUFx2_ASAP7_75t_R U23 ( .A(\ab\[1\]\[9\] ), .Y(n22) );
  TIELOx1_ASAP7_75t_R U24 ( .L(net27237) );
  NAND2xp5_ASAP7_75t_R U25 ( .A(\ab\[0\]\[9\] ), .B(n22), .Y(n101) );
  NAND2xp5_ASAP7_75t_R U26 ( .A(\ab\[0\]\[9\] ), .B(n22), .Y(n102) );
  NAND2xp5_ASAP7_75t_R U27 ( .A(\ab\[0\]\[9\] ), .B(n22), .Y(n103) );
  XNOR2xp5_ASAP7_75t_R U28 ( .A(n22), .B(\ab\[0\]\[9\] ), .Y(n104) );
  NAND2xp5_ASAP7_75t_R U29 ( .A(\ab\[0\]\[9\] ), .B(n22), .Y(n105) );
  NAND2xp5_ASAP7_75t_R U30 ( .A(\ab\[0\]\[9\] ), .B(n22), .Y(n106) );
  NAND2xp5_ASAP7_75t_R U31 ( .A(\ab\[2\]\[9\] ), .B(\ab\[0\]\[9\] ), .Y(n87)
         );
  XNOR2xp5_ASAP7_75t_R U32 ( .A(\ab\[0\]\[9\] ), .B(\ab\[2\]\[9\] ), .Y(n88)
         );
  NAND2xp5_ASAP7_75t_R U33 ( .A(\ab\[2\]\[9\] ), .B(\ab\[0\]\[9\] ), .Y(n93)
         );
  NAND2xp5_ASAP7_75t_R U34 ( .A(\ab\[2\]\[9\] ), .B(\ab\[0\]\[9\] ), .Y(n94)
         );
  NAND2xp5_ASAP7_75t_R U35 ( .A(\ab\[2\]\[9\] ), .B(\ab\[0\]\[9\] ), .Y(n95)
         );
  NAND2xp5_ASAP7_75t_R U36 ( .A(\ab\[2\]\[9\] ), .B(\ab\[0\]\[9\] ), .Y(n100)
         );
  INVx1_ASAP7_75t_R U37 ( .A(n91), .Y(n47) );
  INVx1_ASAP7_75t_R U38 ( .A(n102), .Y(n55) );
  INVx1_ASAP7_75t_R U39 ( .A(n104), .Y(\PRODUCT\[1\] ) );
  INVx1_ASAP7_75t_R U40 ( .A(n101), .Y(n64) );
  INVx1_ASAP7_75t_R U41 ( .A(n89), .Y(n52) );
  INVx1_ASAP7_75t_R U42 ( .A(n92), .Y(n50) );
  INVx1_ASAP7_75t_R U43 ( .A(n85), .Y(n62) );
  INVx1_ASAP7_75t_R U44 ( .A(n71), .Y(n45) );
  INVx1_ASAP7_75t_R U45 ( .A(n69), .Y(n48) );
  INVx1_ASAP7_75t_R U46 ( .A(n72), .Y(n46) );
  INVx1_ASAP7_75t_R U47 ( .A(n67), .Y(n56) );
  INVx1_ASAP7_75t_R U48 ( .A(n90), .Y(n53) );
  INVx1_ASAP7_75t_R U49 ( .A(n65), .Y(n59) );
  INVx1_ASAP7_75t_R U50 ( .A(n68), .Y(n57) );
  INVx1_ASAP7_75t_R U51 ( .A(n80), .Y(n30) );
  INVx1_ASAP7_75t_R U52 ( .A(n97), .Y(n34) );
  INVx1_ASAP7_75t_R U53 ( .A(n78), .Y(n37) );
  INVx1_ASAP7_75t_R U54 ( .A(n76), .Y(n40) );
  INVx1_ASAP7_75t_R U55 ( .A(n74), .Y(n43) );
  INVx1_ASAP7_75t_R U56 ( .A(n70), .Y(n49) );
  INVx1_ASAP7_75t_R U57 ( .A(n66), .Y(n60) );
  INVx1_ASAP7_75t_R U58 ( .A(n86), .Y(n63) );
  INVx1_ASAP7_75t_R U59 ( .A(n83), .Y(n23) );
  INVx1_ASAP7_75t_R U60 ( .A(n84), .Y(n24) );
  INVx1_ASAP7_75t_R U61 ( .A(n100), .Y(n25) );
  INVx1_ASAP7_75t_R U62 ( .A(n81), .Y(n26) );
  INVx1_ASAP7_75t_R U63 ( .A(n82), .Y(n27) );
  INVx1_ASAP7_75t_R U64 ( .A(n98), .Y(n28) );
  INVx1_ASAP7_75t_R U65 ( .A(n79), .Y(n29) );
  INVx1_ASAP7_75t_R U66 ( .A(n99), .Y(n31) );
  INVx1_ASAP7_75t_R U67 ( .A(n106), .Y(n32) );
  INVx1_ASAP7_75t_R U68 ( .A(n96), .Y(n33) );
  INVx1_ASAP7_75t_R U69 ( .A(n105), .Y(n35) );
  INVx1_ASAP7_75t_R U70 ( .A(n77), .Y(n36) );
  INVx1_ASAP7_75t_R U71 ( .A(n95), .Y(n38) );
  INVx1_ASAP7_75t_R U72 ( .A(n75), .Y(n39) );
  INVx1_ASAP7_75t_R U73 ( .A(n94), .Y(n41) );
  INVx1_ASAP7_75t_R U74 ( .A(n73), .Y(n42) );
  INVx1_ASAP7_75t_R U75 ( .A(n93), .Y(n44) );
  INVx1_ASAP7_75t_R U76 ( .A(n87), .Y(n58) );
  INVx1_ASAP7_75t_R U77 ( .A(n88), .Y(n61) );
  fp32_exp_DW01_add_J8_2 FS_1 ( .A({net27237, \ab\[3\]\[9\] , n19, n18, n9, 
        n30, n34, \PRODUCT\[1\] , \ab\[0\]\[9\] , \ab\[3\]\[9\] , n16, n37, n8, 
        n40, n4, n43, n61, n22, \ab\[0\]\[9\] , n12, n6, n49, n3, n21, n60, 
        n63}), .B({net27237, n20, n11, n10, net27237, net27237, net27237, 
        net27237, net27237, n17, net27237, n15, net27237, n7, net27237, 
        net27237, net27237, net27237, n13, n5, net27237, n14, n2, net27237, 
        net27237, net27237}), .CI(net27237), .SUM({\PRODUCT\[27\] , 
        \PRODUCT\[26\] , \PRODUCT\[25\] , \PRODUCT\[24\] , \PRODUCT\[23\] , 
        \PRODUCT\[22\] , \PRODUCT\[21\] , \PRODUCT\[20\] , \PRODUCT\[19\] , 
        \PRODUCT\[18\] , \PRODUCT\[17\] , \PRODUCT\[16\] , \PRODUCT\[15\] , 
        \PRODUCT\[14\] , \PRODUCT\[13\] , \PRODUCT\[12\] , \PRODUCT\[11\] , 
        \PRODUCT\[10\] , \PRODUCT\[9\] , \PRODUCT\[8\] , \PRODUCT\[7\] , 
        \PRODUCT\[6\] , \PRODUCT\[5\] , \PRODUCT\[4\] , \PRODUCT\[3\] , 
        \PRODUCT\[2\] }) );
endmodule


module fp32_exp_DW01_add_41 ( .A({\A\[25\] , \A\[24\] , \A\[23\] , \A\[22\] , 
        \A\[21\] , \A\[20\] , \A\[19\] , \A\[18\] , \A\[17\] , \A\[16\] , 
        \A\[15\] , \A\[14\] , \A\[13\] , \A\[12\] , \A\[11\] , \A\[10\] , 
        \A\[9\] , \A\[8\] , \A\[7\] , \A\[6\] , \A\[5\] , \A\[4\] , \A\[3\] , 
        \A\[2\] , \A\[1\] , \A\[0\] }), .B({\B\[25\] , \B\[24\] , \B\[23\] , 
        \B\[22\] , \B\[21\] , \B\[20\] , \B\[19\] , \B\[18\] , \B\[17\] , 
        \B\[16\] , \B\[15\] , \B\[14\] , \B\[13\] , \B\[12\] , \B\[11\] , 
        \B\[10\] , \B\[9\] , \B\[8\] , \B\[7\] , \B\[6\] , \B\[5\] , \B\[4\] , 
        \B\[3\] , \B\[2\] , \B\[1\] , \B\[0\] }), CI, .SUM({\SUM\[25\] , 
        \SUM\[24\] , \SUM\[23\] , \SUM\[22\] , \SUM\[21\] , \SUM\[20\] , 
        \SUM\[19\] , \SUM\[18\] , \SUM\[17\] , \SUM\[16\] , \SUM\[15\] , 
        \SUM\[14\] , \SUM\[13\] , \SUM\[12\] , \SUM\[11\] , \SUM\[10\] , 
        \SUM\[9\] , \SUM\[8\] , \SUM\[7\] , \SUM\[6\] , \SUM\[5\] , \SUM\[4\] , 
        \SUM\[3\] , \SUM\[2\] , \SUM\[1\] , \SUM\[0\] }), CO );
  input \A\[25\] , \A\[24\] , \A\[23\] , \A\[22\] , \A\[21\] , \A\[20\] ,
         \A\[19\] , \A\[18\] , \A\[17\] , \A\[16\] , \A\[15\] , \A\[14\] ,
         \A\[13\] , \A\[12\] , \A\[11\] , \A\[10\] , \A\[9\] , \A\[8\] ,
         \A\[7\] , \A\[6\] , \A\[5\] , \A\[4\] , \A\[3\] , \A\[2\] , \A\[1\] ,
         \A\[0\] , \B\[25\] , \B\[24\] , \B\[23\] , \B\[22\] , \B\[21\] ,
         \B\[20\] , \B\[19\] , \B\[18\] , \B\[17\] , \B\[16\] , \B\[15\] ,
         \B\[14\] , \B\[13\] , \B\[12\] , \B\[11\] , \B\[10\] , \B\[9\] ,
         \B\[8\] , \B\[7\] , \B\[6\] , \B\[5\] , \B\[4\] , \B\[3\] , \B\[2\] ,
         \B\[1\] , \B\[0\] , CI;
  output \SUM\[25\] , \SUM\[24\] , \SUM\[23\] , \SUM\[22\] , \SUM\[21\] ,
         \SUM\[20\] , \SUM\[19\] , \SUM\[18\] , \SUM\[17\] , \SUM\[16\] ,
         \SUM\[15\] , \SUM\[14\] , \SUM\[13\] , \SUM\[12\] , \SUM\[11\] ,
         \SUM\[10\] , \SUM\[9\] , \SUM\[8\] , \SUM\[7\] , \SUM\[6\] ,
         \SUM\[5\] , \SUM\[4\] , \SUM\[3\] , \SUM\[2\] , \SUM\[1\] ,
         \SUM\[0\] , CO;
  wire   \A\[2\] , \A\[1\] , \A\[0\] , n1, n2, n3, n4, n5, n6, n7, n8, n11,
         n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25,
         n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39,
         n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53,
         n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67,
         n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81,
         n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94;
  assign \SUM\[2\]  = \A\[2\] ;
  assign \SUM\[1\]  = \A\[1\] ;
  assign \SUM\[0\]  = \A\[0\] ;

  AOI21xp5_ASAP7_75t_R U2 ( .A1(\B\[24\] ), .A2(\A\[24\] ), .B(n33), .Y(n31)
         );
  NOR2xp33_ASAP7_75t_R U3 ( .A(n79), .B(n6), .Y(n76) );
  AOI21xp5_ASAP7_75t_R U4 ( .A1(n59), .A2(n60), .B(n4), .Y(n55) );
  AOI211xp5_ASAP7_75t_R U5 ( .A1(n63), .A2(n64), .B(n65), .C(n66), .Y(n60) );
  NOR2xp33_ASAP7_75t_R U6 ( .A(\A\[24\] ), .B(\B\[16\] ), .Y(n54) );
  AOI21xp5_ASAP7_75t_R U7 ( .A1(n70), .A2(n71), .B(n72), .Y(n69) );
  NOR2xp33_ASAP7_75t_R U8 ( .A(n84), .B(n85), .Y(n83) );
  NOR3xp33_ASAP7_75t_R U9 ( .A(n24), .B(n92), .C(n16), .Y(n91) );
  NOR2xp33_ASAP7_75t_R U10 ( .A(n52), .B(n8), .Y(n51) );
  NOR2xp33_ASAP7_75t_R U11 ( .A(n5), .B(n63), .Y(n81) );
  NOR2xp33_ASAP7_75t_R U12 ( .A(n5), .B(n84), .Y(n11) );
  O2A1O1Ixp33_ASAP7_75t_R U13 ( .A1(n29), .A2(n30), .B(n31), .C(n32), .Y(
        \SUM\[25\] ) );
  NOR2xp33_ASAP7_75t_R U14 ( .A(\B\[24\] ), .B(\A\[24\] ), .Y(n32) );
  AOI21xp5_ASAP7_75t_R U15 ( .A1(n34), .A2(n37), .B(n33), .Y(n36) );
  AOI21xp5_ASAP7_75t_R U16 ( .A1(n76), .A2(n62), .B(n61), .Y(n75) );
  NOR2xp33_ASAP7_75t_R U17 ( .A(n88), .B(n7), .Y(n86) );
  NOR2xp33_ASAP7_75t_R U18 ( .A(n58), .B(n54), .Y(n57) );
  OR2x2_ASAP7_75t_R U19 ( .A(n48), .B(n2), .Y(n1) );
  OR2x2_ASAP7_75t_R U20 ( .A(n49), .B(n50), .Y(n2) );
  OA21x2_ASAP7_75t_R U21 ( .A1(n54), .A2(n55), .B(n56), .Y(n3) );
  AND2x2_ASAP7_75t_R U22 ( .A(n61), .B(\A\[15\] ), .Y(n4) );
  OA21x2_ASAP7_75t_R U23 ( .A1(n28), .A2(n73), .B(n68), .Y(n5) );
  OA21x2_ASAP7_75t_R U24 ( .A1(n65), .A2(n80), .B(n64), .Y(n6) );
  OR2x2_ASAP7_75t_R U25 ( .A(n89), .B(n85), .Y(n7) );
  OR2x2_ASAP7_75t_R U26 ( .A(n53), .B(n3), .Y(n8) );
  AND2x2_ASAP7_75t_R U27 ( .A(n27), .B(n28), .Y(\SUM\[3\] ) );
  NAND2xp5_ASAP7_75t_R U28 ( .A(n68), .B(n69), .Y(n59) );
  INVx1_ASAP7_75t_R U29 ( .A(n21), .Y(n18) );
  NOR2x1_ASAP7_75t_R U30 ( .A(n45), .B(n1), .Y(n40) );
  INVx1_ASAP7_75t_R U31 ( .A(\A\[15\] ), .Y(n74) );
  INVx1_ASAP7_75t_R U32 ( .A(n28), .Y(n71) );
  OAI21xp5_ASAP7_75t_R U33 ( .A1(n90), .A2(n91), .B(n14), .Y(n68) );
  NAND2xp5_ASAP7_75t_R U34 ( .A(\A\[5\] ), .B(n14), .Y(n94) );
  INVx1_ASAP7_75t_R U35 ( .A(\A\[11\] ), .Y(n87) );
  INVx1_ASAP7_75t_R U36 ( .A(\A\[7\] ), .Y(n53) );
  INVx1_ASAP7_75t_R U37 ( .A(\A\[18\] ), .Y(n52) );
  INVx1_ASAP7_75t_R U38 ( .A(\A\[19\] ), .Y(n49) );
  INVx1_ASAP7_75t_R U39 ( .A(\A\[20\] ), .Y(n48) );
  INVx1_ASAP7_75t_R U40 ( .A(\A\[21\] ), .Y(n45) );
  NAND2xp5_ASAP7_75t_R U41 ( .A(\A\[5\] ), .B(n22), .Y(n21) );
  XNOR2xp5_ASAP7_75t_R U42 ( .A(n11), .B(n85), .Y(\SUM\[9\] ) );
  XOR2xp5_ASAP7_75t_R U43 ( .A(n84), .B(n5), .Y(\SUM\[8\] ) );
  XNOR2xp5_ASAP7_75t_R U44 ( .A(n12), .B(n13), .Y(\SUM\[7\] ) );
  NAND2xp5_ASAP7_75t_R U45 ( .A(n14), .B(n15), .Y(n13) );
  OAI21xp5_ASAP7_75t_R U46 ( .A1(n16), .A2(n21), .B(n17), .Y(n12) );
  XNOR2xp5_ASAP7_75t_R U47 ( .A(n18), .B(n19), .Y(\SUM\[6\] ) );
  NAND2xp5_ASAP7_75t_R U48 ( .A(n20), .B(n17), .Y(n19) );
  XNOR2xp5_ASAP7_75t_R U49 ( .A(n92), .B(n22), .Y(\SUM\[5\] ) );
  OAI21xp5_ASAP7_75t_R U50 ( .A1(n28), .A2(n23), .B(n24), .Y(n22) );
  INVx1_ASAP7_75t_R U51 ( .A(n25), .Y(n23) );
  XNOR2xp5_ASAP7_75t_R U52 ( .A(n71), .B(n26), .Y(\SUM\[4\] ) );
  NAND2xp5_ASAP7_75t_R U53 ( .A(n24), .B(n25), .Y(n26) );
  INVx1_ASAP7_75t_R U54 ( .A(n34), .Y(n30) );
  XOR2xp5_ASAP7_75t_R U55 ( .A(n35), .B(n36), .Y(\SUM\[24\] ) );
  INVx1_ASAP7_75t_R U56 ( .A(n38), .Y(n33) );
  XNOR2xp5_ASAP7_75t_R U57 ( .A(\B\[24\] ), .B(\A\[24\] ), .Y(n35) );
  XOR2xp5_ASAP7_75t_R U58 ( .A(n39), .B(n29), .Y(\SUM\[23\] ) );
  INVx1_ASAP7_75t_R U59 ( .A(n37), .Y(n29) );
  AO21x1_ASAP7_75t_R U60 ( .A1(n40), .A2(n41), .B(n42), .Y(n37) );
  INVx1_ASAP7_75t_R U61 ( .A(n43), .Y(n42) );
  NAND2xp5_ASAP7_75t_R U62 ( .A(n34), .B(n38), .Y(n39) );
  NAND2xp5_ASAP7_75t_R U63 ( .A(\B\[23\] ), .B(\A\[23\] ), .Y(n38) );
  OR2x2_ASAP7_75t_R U64 ( .A(\A\[23\] ), .B(\B\[23\] ), .Y(n34) );
  XNOR2xp5_ASAP7_75t_R U65 ( .A(n44), .B(n40), .Y(\SUM\[22\] ) );
  NAND2xp5_ASAP7_75t_R U66 ( .A(n41), .B(n43), .Y(n44) );
  NAND2xp5_ASAP7_75t_R U67 ( .A(\B\[22\] ), .B(\A\[22\] ), .Y(n43) );
  NAND2xp5_ASAP7_75t_R U68 ( .A(n46), .B(n47), .Y(n41) );
  INVx1_ASAP7_75t_R U69 ( .A(\A\[22\] ), .Y(n47) );
  INVx1_ASAP7_75t_R U70 ( .A(\B\[22\] ), .Y(n46) );
  XOR2xp5_ASAP7_75t_R U71 ( .A(n45), .B(n1), .Y(\SUM\[21\] ) );
  XOR2xp5_ASAP7_75t_R U72 ( .A(n48), .B(n2), .Y(\SUM\[20\] ) );
  INVx1_ASAP7_75t_R U73 ( .A(n51), .Y(n50) );
  XNOR2xp5_ASAP7_75t_R U74 ( .A(n51), .B(n49), .Y(\SUM\[19\] ) );
  XOR2xp5_ASAP7_75t_R U75 ( .A(n52), .B(n8), .Y(\SUM\[18\] ) );
  XNOR2xp5_ASAP7_75t_R U76 ( .A(n3), .B(\A\[17\] ), .Y(\SUM\[17\] ) );
  XNOR2xp5_ASAP7_75t_R U77 ( .A(n55), .B(n57), .Y(\SUM\[16\] ) );
  INVx1_ASAP7_75t_R U78 ( .A(n56), .Y(n58) );
  NAND2xp5_ASAP7_75t_R U79 ( .A(\B\[16\] ), .B(\A\[24\] ), .Y(n56) );
  NAND3xp33_ASAP7_75t_R U80 ( .A(n62), .B(\A\[13\] ), .C(\A\[15\] ), .Y(n66)
         );
  INVx1_ASAP7_75t_R U81 ( .A(n67), .Y(n65) );
  INVx1_ASAP7_75t_R U82 ( .A(n64), .Y(n72) );
  INVx1_ASAP7_75t_R U83 ( .A(n73), .Y(n70) );
  XOR2xp5_ASAP7_75t_R U84 ( .A(n74), .B(n75), .Y(\SUM\[15\] ) );
  INVx1_ASAP7_75t_R U85 ( .A(n77), .Y(n61) );
  XNOR2xp5_ASAP7_75t_R U86 ( .A(n76), .B(n78), .Y(\SUM\[14\] ) );
  NAND2xp5_ASAP7_75t_R U87 ( .A(n62), .B(n77), .Y(n78) );
  NAND2xp5_ASAP7_75t_R U88 ( .A(\B\[14\] ), .B(\A\[14\] ), .Y(n77) );
  OR2x2_ASAP7_75t_R U89 ( .A(\A\[14\] ), .B(\B\[14\] ), .Y(n62) );
  INVx1_ASAP7_75t_R U90 ( .A(\A\[13\] ), .Y(n79) );
  XOR2xp5_ASAP7_75t_R U91 ( .A(n79), .B(n6), .Y(\SUM\[13\] ) );
  INVx1_ASAP7_75t_R U92 ( .A(n81), .Y(n80) );
  XNOR2xp5_ASAP7_75t_R U93 ( .A(n81), .B(n82), .Y(\SUM\[12\] ) );
  NAND2xp5_ASAP7_75t_R U94 ( .A(n67), .B(n64), .Y(n82) );
  NAND2xp5_ASAP7_75t_R U95 ( .A(\B\[12\] ), .B(\A\[12\] ), .Y(n64) );
  OR2x2_ASAP7_75t_R U96 ( .A(\A\[12\] ), .B(\B\[12\] ), .Y(n67) );
  NAND3xp33_ASAP7_75t_R U97 ( .A(n83), .B(\A\[10\] ), .C(\A\[11\] ), .Y(n63)
         );
  XNOR2xp5_ASAP7_75t_R U98 ( .A(n86), .B(n87), .Y(\SUM\[11\] ) );
  INVx1_ASAP7_75t_R U99 ( .A(\A\[10\] ), .Y(n88) );
  XOR2xp5_ASAP7_75t_R U100 ( .A(n88), .B(n7), .Y(\SUM\[10\] ) );
  INVx1_ASAP7_75t_R U101 ( .A(\A\[9\] ), .Y(n85) );
  INVx1_ASAP7_75t_R U102 ( .A(n11), .Y(n89) );
  INVx1_ASAP7_75t_R U103 ( .A(\A\[8\] ), .Y(n84) );
  NAND2xp5_ASAP7_75t_R U104 ( .A(\B\[4\] ), .B(\A\[4\] ), .Y(n24) );
  INVx1_ASAP7_75t_R U105 ( .A(n20), .Y(n16) );
  INVx1_ASAP7_75t_R U106 ( .A(\A\[5\] ), .Y(n92) );
  NAND2xp5_ASAP7_75t_R U107 ( .A(n15), .B(n17), .Y(n90) );
  NAND2xp5_ASAP7_75t_R U108 ( .A(\B\[6\] ), .B(\A\[6\] ), .Y(n17) );
  NAND2xp5_ASAP7_75t_R U109 ( .A(\B\[7\] ), .B(\A\[7\] ), .Y(n15) );
  OR2x2_ASAP7_75t_R U110 ( .A(n93), .B(n94), .Y(n73) );
  OR2x2_ASAP7_75t_R U111 ( .A(\A\[7\] ), .B(\B\[7\] ), .Y(n14) );
  NAND2xp5_ASAP7_75t_R U112 ( .A(n20), .B(n25), .Y(n93) );
  OR2x2_ASAP7_75t_R U113 ( .A(\A\[4\] ), .B(\B\[4\] ), .Y(n25) );
  OR2x2_ASAP7_75t_R U114 ( .A(\A\[6\] ), .B(\B\[6\] ), .Y(n20) );
  OR2x2_ASAP7_75t_R U115 ( .A(\A\[3\] ), .B(\B\[3\] ), .Y(n27) );
  NAND2xp5_ASAP7_75t_R U116 ( .A(\B\[3\] ), .B(\A\[3\] ), .Y(n28) );
endmodule


module fp32_exp_DW02_mult_13 ( .A({\A\[3\] , \A\[2\] , \A\[1\] , \A\[0\] }), 
    .B({\B\[23\] , \B\[22\] , \B\[21\] , \B\[20\] , \B\[19\] , \B\[18\] , 
        \B\[17\] , \B\[16\] , \B\[15\] , \B\[14\] , \B\[13\] , \B\[12\] , 
        \B\[11\] , \B\[10\] , \B\[9\] , \B\[8\] , \B\[7\] , \B\[6\] , \B\[5\] , 
        \B\[4\] , \B\[3\] , \B\[2\] , \B\[1\] , \B\[0\] }), TC, .PRODUCT({
        \PRODUCT\[27\] , \PRODUCT\[26\] , \PRODUCT\[25\] , \PRODUCT\[24\] , 
        \PRODUCT\[23\] , \PRODUCT\[22\] , \PRODUCT\[21\] , \PRODUCT\[20\] , 
        \PRODUCT\[19\] , \PRODUCT\[18\] , \PRODUCT\[17\] , \PRODUCT\[16\] , 
        \PRODUCT\[15\] , \PRODUCT\[14\] , \PRODUCT\[13\] , \PRODUCT\[12\] , 
        \PRODUCT\[11\] , \PRODUCT\[10\] , \PRODUCT\[9\] , \PRODUCT\[8\] , 
        \PRODUCT\[7\] , \PRODUCT\[6\] , \PRODUCT\[5\] , \PRODUCT\[4\] , 
        \PRODUCT\[3\] , \PRODUCT\[2\] , \PRODUCT\[1\] , \PRODUCT\[0\] }) );
  input \A\[3\] , \A\[2\] , \A\[1\] , \A\[0\] , \B\[23\] , \B\[22\] ,
         \B\[21\] , \B\[20\] , \B\[19\] , \B\[18\] , \B\[17\] , \B\[16\] ,
         \B\[15\] , \B\[14\] , \B\[13\] , \B\[12\] , \B\[11\] , \B\[10\] ,
         \B\[9\] , \B\[8\] , \B\[7\] , \B\[6\] , \B\[5\] , \B\[4\] , \B\[3\] ,
         \B\[2\] , \B\[1\] , \B\[0\] , TC;
  output \PRODUCT\[27\] , \PRODUCT\[26\] , \PRODUCT\[25\] , \PRODUCT\[24\] ,
         \PRODUCT\[23\] , \PRODUCT\[22\] , \PRODUCT\[21\] , \PRODUCT\[20\] ,
         \PRODUCT\[19\] , \PRODUCT\[18\] , \PRODUCT\[17\] , \PRODUCT\[16\] ,
         \PRODUCT\[15\] , \PRODUCT\[14\] , \PRODUCT\[13\] , \PRODUCT\[12\] ,
         \PRODUCT\[11\] , \PRODUCT\[10\] , \PRODUCT\[9\] , \PRODUCT\[8\] ,
         \PRODUCT\[7\] , \PRODUCT\[6\] , \PRODUCT\[5\] , \PRODUCT\[4\] ,
         \PRODUCT\[3\] , \PRODUCT\[2\] , \PRODUCT\[1\] , \PRODUCT\[0\] ;
  wire   net27229, \ab\[3\]\[9\] , \ab\[2\]\[9\] , \ab\[1\]\[9\] ,
         \ab\[0\]\[9\] , n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13,
         n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27,
         n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41,
         n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n55, n56,
         n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70,
         n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84,
         n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98,
         n99, n100, n101, n102, n103, n104, n105, n106;
  assign \ab\[3\]\[9\]  = \A\[3\] ;
  assign \ab\[2\]\[9\]  = \A\[2\] ;
  assign \ab\[1\]\[9\]  = \A\[1\] ;
  assign \ab\[0\]\[9\]  = \A\[0\] ;

  FAx1_ASAP7_75t_R S4_0 ( .A(\ab\[3\]\[9\] ), .B(n62), .CI(n61), .CON(n65), 
        .SN(n66) );
  FAx1_ASAP7_75t_R S4_1 ( .A(\ab\[3\]\[9\] ), .B(n58), .CI(\PRODUCT\[1\] ), 
        .CON(n67), .SN(n68) );
  FAx1_ASAP7_75t_R S4_3 ( .A(\ab\[3\]\[9\] ), .B(n52), .CI(n50), .CON(n69), 
        .SN(n70) );
  FAx1_ASAP7_75t_R S4_4 ( .A(\ab\[3\]\[9\] ), .B(n47), .CI(\ab\[2\]\[9\] ), 
        .CON(n71), .SN(n72) );
  FAx1_ASAP7_75t_R S4_9 ( .A(\ab\[3\]\[9\] ), .B(n44), .CI(n22), .CON(n73), 
        .SN(n74) );
  FAx1_ASAP7_75t_R S4_11 ( .A(\ab\[3\]\[9\] ), .B(n41), .CI(n22), .CON(n75), 
        .SN(n76) );
  FAx1_ASAP7_75t_R S4_13 ( .A(\ab\[3\]\[9\] ), .B(n38), .CI(n22), .CON(n77), 
        .SN(n78) );
  FAx1_ASAP7_75t_R S4_19 ( .A(\ab\[3\]\[9\] ), .B(n33), .CI(n31), .CON(n79), 
        .SN(n80) );
  FAx1_ASAP7_75t_R S4_20 ( .A(\ab\[3\]\[9\] ), .B(n28), .CI(n61), .CON(n81), 
        .SN(n82) );
  FAx1_ASAP7_75t_R S4_21 ( .A(\ab\[3\]\[9\] ), .B(n25), .CI(n22), .CON(n83), 
        .SN(n84) );
  FAx1_ASAP7_75t_R S1_2_0 ( .A(\ab\[2\]\[9\] ), .B(n64), .CI(n22), .CON(n85), 
        .SN(n86) );
  FAx1_ASAP7_75t_R S2_2_3 ( .A(\ab\[2\]\[9\] ), .B(n55), .CI(\PRODUCT\[1\] ), 
        .CON(n89), .SN(n90) );
  FAx1_ASAP7_75t_R S2_2_4 ( .A(\ab\[2\]\[9\] ), .B(n51), .CI(n22), .CON(n91), 
        .SN(n92) );
  FAx1_ASAP7_75t_R S2_2_19 ( .A(\ab\[2\]\[9\] ), .B(n35), .CI(\PRODUCT\[1\] ), 
        .CON(n96), .SN(n97) );
  FAx1_ASAP7_75t_R S2_2_20 ( .A(\ab\[2\]\[9\] ), .B(n32), .CI(n22), .CON(n98), 
        .SN(n99) );
  AND2x2_ASAP7_75t_R U2 ( .A(n59), .B(n57), .Y(n2) );
  XOR2xp5_ASAP7_75t_R U3 ( .A(n53), .B(n56), .Y(n3) );
  XOR2xp5_ASAP7_75t_R U4 ( .A(n61), .B(n42), .Y(n4) );
  AND2x2_ASAP7_75t_R U5 ( .A(n48), .B(n46), .Y(n5) );
  XOR2xp5_ASAP7_75t_R U6 ( .A(n46), .B(n48), .Y(n6) );
  AND2x2_ASAP7_75t_R U7 ( .A(n42), .B(n61), .Y(n7) );
  XOR2xp5_ASAP7_75t_R U8 ( .A(n61), .B(n39), .Y(n8) );
  XOR2xp5_ASAP7_75t_R U9 ( .A(n27), .B(n29), .Y(n9) );
  AND2x2_ASAP7_75t_R U10 ( .A(n29), .B(n27), .Y(n10) );
  AND2x2_ASAP7_75t_R U11 ( .A(n26), .B(n24), .Y(n11) );
  XOR2xp5_ASAP7_75t_R U12 ( .A(\ab\[3\]\[9\] ), .B(n45), .Y(n12) );
  AND2x2_ASAP7_75t_R U13 ( .A(n45), .B(\ab\[3\]\[9\] ), .Y(n13) );
  AND2x2_ASAP7_75t_R U14 ( .A(n56), .B(n53), .Y(n14) );
  AND2x2_ASAP7_75t_R U15 ( .A(n39), .B(n61), .Y(n15) );
  XOR2xp5_ASAP7_75t_R U16 ( .A(\ab\[2\]\[9\] ), .B(n36), .Y(n16) );
  AND2x2_ASAP7_75t_R U17 ( .A(n36), .B(\ab\[2\]\[9\] ), .Y(n17) );
  XOR2xp5_ASAP7_75t_R U18 ( .A(n24), .B(n26), .Y(n18) );
  XOR2xp5_ASAP7_75t_R U19 ( .A(\ab\[2\]\[9\] ), .B(n23), .Y(n19) );
  AND2x2_ASAP7_75t_R U20 ( .A(n23), .B(\ab\[2\]\[9\] ), .Y(n20) );
  XOR2xp5_ASAP7_75t_R U21 ( .A(n57), .B(n59), .Y(n21) );
  BUFx2_ASAP7_75t_R U22 ( .A(\ab\[1\]\[9\] ), .Y(n22) );
  TIELOx1_ASAP7_75t_R U23 ( .L(net27229) );
  NAND2xp5_ASAP7_75t_R U24 ( .A(\ab\[0\]\[9\] ), .B(n22), .Y(n101) );
  NAND2xp5_ASAP7_75t_R U25 ( .A(\ab\[0\]\[9\] ), .B(n22), .Y(n102) );
  NAND2xp5_ASAP7_75t_R U26 ( .A(\ab\[0\]\[9\] ), .B(n22), .Y(n103) );
  XNOR2xp5_ASAP7_75t_R U27 ( .A(n22), .B(\ab\[0\]\[9\] ), .Y(n104) );
  NAND2xp5_ASAP7_75t_R U28 ( .A(\ab\[0\]\[9\] ), .B(n22), .Y(n105) );
  NAND2xp5_ASAP7_75t_R U29 ( .A(\ab\[0\]\[9\] ), .B(n22), .Y(n106) );
  NAND2xp5_ASAP7_75t_R U30 ( .A(\ab\[2\]\[9\] ), .B(\ab\[0\]\[9\] ), .Y(n87)
         );
  XNOR2xp5_ASAP7_75t_R U31 ( .A(\ab\[0\]\[9\] ), .B(\ab\[2\]\[9\] ), .Y(n88)
         );
  NAND2xp5_ASAP7_75t_R U32 ( .A(\ab\[2\]\[9\] ), .B(\ab\[0\]\[9\] ), .Y(n93)
         );
  NAND2xp5_ASAP7_75t_R U33 ( .A(\ab\[2\]\[9\] ), .B(\ab\[0\]\[9\] ), .Y(n94)
         );
  NAND2xp5_ASAP7_75t_R U34 ( .A(\ab\[2\]\[9\] ), .B(\ab\[0\]\[9\] ), .Y(n95)
         );
  NAND2xp5_ASAP7_75t_R U35 ( .A(\ab\[2\]\[9\] ), .B(\ab\[0\]\[9\] ), .Y(n100)
         );
  INVxp67_ASAP7_75t_R U36 ( .A(n71), .Y(n45) );
  INVx1_ASAP7_75t_R U37 ( .A(n103), .Y(n51) );
  INVx1_ASAP7_75t_R U38 ( .A(n102), .Y(n55) );
  INVx1_ASAP7_75t_R U39 ( .A(n104), .Y(\PRODUCT\[1\] ) );
  INVx1_ASAP7_75t_R U40 ( .A(n101), .Y(n64) );
  INVx1_ASAP7_75t_R U41 ( .A(n91), .Y(n47) );
  INVx1_ASAP7_75t_R U42 ( .A(n89), .Y(n52) );
  INVx1_ASAP7_75t_R U43 ( .A(n92), .Y(n50) );
  INVx1_ASAP7_75t_R U44 ( .A(n85), .Y(n62) );
  INVx1_ASAP7_75t_R U45 ( .A(n69), .Y(n48) );
  INVx1_ASAP7_75t_R U46 ( .A(n72), .Y(n46) );
  INVx1_ASAP7_75t_R U47 ( .A(n67), .Y(n56) );
  INVx1_ASAP7_75t_R U48 ( .A(n90), .Y(n53) );
  INVx1_ASAP7_75t_R U49 ( .A(n65), .Y(n59) );
  INVx1_ASAP7_75t_R U50 ( .A(n68), .Y(n57) );
  INVx1_ASAP7_75t_R U51 ( .A(n80), .Y(n30) );
  INVx1_ASAP7_75t_R U52 ( .A(n97), .Y(n34) );
  INVx1_ASAP7_75t_R U53 ( .A(n78), .Y(n37) );
  INVx1_ASAP7_75t_R U54 ( .A(n76), .Y(n40) );
  INVx1_ASAP7_75t_R U55 ( .A(n74), .Y(n43) );
  INVx1_ASAP7_75t_R U56 ( .A(n70), .Y(n49) );
  INVx1_ASAP7_75t_R U57 ( .A(n66), .Y(n60) );
  INVx1_ASAP7_75t_R U58 ( .A(n86), .Y(n63) );
  INVx1_ASAP7_75t_R U59 ( .A(n83), .Y(n23) );
  INVx1_ASAP7_75t_R U60 ( .A(n84), .Y(n24) );
  INVx1_ASAP7_75t_R U61 ( .A(n100), .Y(n25) );
  INVx1_ASAP7_75t_R U62 ( .A(n81), .Y(n26) );
  INVx1_ASAP7_75t_R U63 ( .A(n82), .Y(n27) );
  INVx1_ASAP7_75t_R U64 ( .A(n98), .Y(n28) );
  INVx1_ASAP7_75t_R U65 ( .A(n79), .Y(n29) );
  INVx1_ASAP7_75t_R U66 ( .A(n99), .Y(n31) );
  INVx1_ASAP7_75t_R U67 ( .A(n106), .Y(n32) );
  INVx1_ASAP7_75t_R U68 ( .A(n96), .Y(n33) );
  INVx1_ASAP7_75t_R U69 ( .A(n105), .Y(n35) );
  INVx1_ASAP7_75t_R U70 ( .A(n77), .Y(n36) );
  INVx1_ASAP7_75t_R U71 ( .A(n95), .Y(n38) );
  INVx1_ASAP7_75t_R U72 ( .A(n75), .Y(n39) );
  INVx1_ASAP7_75t_R U73 ( .A(n94), .Y(n41) );
  INVx1_ASAP7_75t_R U74 ( .A(n73), .Y(n42) );
  INVx1_ASAP7_75t_R U75 ( .A(n93), .Y(n44) );
  INVx1_ASAP7_75t_R U76 ( .A(n87), .Y(n58) );
  INVx1_ASAP7_75t_R U77 ( .A(n88), .Y(n61) );
  fp32_exp_DW01_add_41 FS_1 ( .A({net27229, \ab\[3\]\[9\] , n19, n18, n9, n30, 
        n34, \PRODUCT\[1\] , \ab\[0\]\[9\] , \ab\[3\]\[9\] , n16, n37, n8, n40, 
        n4, n43, n61, n22, \ab\[0\]\[9\] , n12, n6, n49, n3, n21, n60, n63}), 
        .B({net27229, n20, n11, n10, net27229, net27229, net27229, net27229, 
        net27229, n17, net27229, n15, net27229, n7, net27229, net27229, 
        net27229, net27229, n13, n5, net27229, n14, n2, net27229, net27229, 
        net27229}), .CI(net27229), .SUM({\PRODUCT\[27\] , \PRODUCT\[26\] , 
        \PRODUCT\[25\] , \PRODUCT\[24\] , \PRODUCT\[23\] , \PRODUCT\[22\] , 
        \PRODUCT\[21\] , \PRODUCT\[20\] , \PRODUCT\[19\] , \PRODUCT\[18\] , 
        \PRODUCT\[17\] , \PRODUCT\[16\] , \PRODUCT\[15\] , \PRODUCT\[14\] , 
        \PRODUCT\[13\] , \PRODUCT\[12\] , \PRODUCT\[11\] , \PRODUCT\[10\] , 
        \PRODUCT\[9\] , \PRODUCT\[8\] , \PRODUCT\[7\] , \PRODUCT\[6\] , 
        \PRODUCT\[5\] , \PRODUCT\[4\] , \PRODUCT\[3\] , \PRODUCT\[2\] }) );
endmodule


module fp32_exp_DW01_add_J8_3 ( .A({\A\[25\] , \A\[24\] , \A\[23\] , \A\[22\] , 
        \A\[21\] , \A\[20\] , \A\[19\] , \A\[18\] , \A\[17\] , \A\[16\] , 
        \A\[15\] , \A\[14\] , \A\[13\] , \A\[12\] , \A\[11\] , \A\[10\] , 
        \A\[9\] , \A\[8\] , \A\[7\] , \A\[6\] , \A\[5\] , \A\[4\] , \A\[3\] , 
        \A\[2\] , \A\[1\] , \A\[0\] }), .B({\B\[25\] , \B\[24\] , \B\[23\] , 
        \B\[22\] , \B\[21\] , \B\[20\] , \B\[19\] , \B\[18\] , \B\[17\] , 
        \B\[16\] , \B\[15\] , \B\[14\] , \B\[13\] , \B\[12\] , \B\[11\] , 
        \B\[10\] , \B\[9\] , \B\[8\] , \B\[7\] , \B\[6\] , \B\[5\] , \B\[4\] , 
        \B\[3\] , \B\[2\] , \B\[1\] , \B\[0\] }), CI, .SUM({\SUM\[25\] , 
        \SUM\[24\] , \SUM\[23\] , \SUM\[22\] , \SUM\[21\] , \SUM\[20\] , 
        \SUM\[19\] , \SUM\[18\] , \SUM\[17\] , \SUM\[16\] , \SUM\[15\] , 
        \SUM\[14\] , \SUM\[13\] , \SUM\[12\] , \SUM\[11\] , \SUM\[10\] , 
        \SUM\[9\] , \SUM\[8\] , \SUM\[7\] , \SUM\[6\] , \SUM\[5\] , \SUM\[4\] , 
        \SUM\[3\] , \SUM\[2\] , \SUM\[1\] , \SUM\[0\] }), CO );
  input \A\[25\] , \A\[24\] , \A\[23\] , \A\[22\] , \A\[21\] , \A\[20\] ,
         \A\[19\] , \A\[18\] , \A\[17\] , \A\[16\] , \A\[15\] , \A\[14\] ,
         \A\[13\] , \A\[12\] , \A\[11\] , \A\[10\] , \A\[9\] , \A\[8\] ,
         \A\[7\] , \A\[6\] , \A\[5\] , \A\[4\] , \A\[3\] , \A\[2\] , \A\[1\] ,
         \A\[0\] , \B\[25\] , \B\[24\] , \B\[23\] , \B\[22\] , \B\[21\] ,
         \B\[20\] , \B\[19\] , \B\[18\] , \B\[17\] , \B\[16\] , \B\[15\] ,
         \B\[14\] , \B\[13\] , \B\[12\] , \B\[11\] , \B\[10\] , \B\[9\] ,
         \B\[8\] , \B\[7\] , \B\[6\] , \B\[5\] , \B\[4\] , \B\[3\] , \B\[2\] ,
         \B\[1\] , \B\[0\] , CI;
  output \SUM\[25\] , \SUM\[24\] , \SUM\[23\] , \SUM\[22\] , \SUM\[21\] ,
         \SUM\[20\] , \SUM\[19\] , \SUM\[18\] , \SUM\[17\] , \SUM\[16\] ,
         \SUM\[15\] , \SUM\[14\] , \SUM\[13\] , \SUM\[12\] , \SUM\[11\] ,
         \SUM\[10\] , \SUM\[9\] , \SUM\[8\] , \SUM\[7\] , \SUM\[6\] ,
         \SUM\[5\] , \SUM\[4\] , \SUM\[3\] , \SUM\[2\] , \SUM\[1\] ,
         \SUM\[0\] , CO;
  wire   \A\[2\] , \A\[1\] , \A\[0\] , n1, n2, n3, n4, n5, n6, n7, n8, n11,
         n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25,
         n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39,
         n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53,
         n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67,
         n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81,
         n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94;
  assign \SUM\[2\]  = \A\[2\] ;
  assign \SUM\[1\]  = \A\[1\] ;
  assign \SUM\[0\]  = \A\[0\] ;

  AOI21xp5_ASAP7_75t_R U2 ( .A1(\B\[24\] ), .A2(\A\[24\] ), .B(n33), .Y(n31)
         );
  INVxp67_ASAP7_75t_R U3 ( .A(n37), .Y(n29) );
  NOR2xp33_ASAP7_75t_R U4 ( .A(n79), .B(n6), .Y(n76) );
  AOI21xp5_ASAP7_75t_R U5 ( .A1(n59), .A2(n60), .B(n4), .Y(n55) );
  AOI211xp5_ASAP7_75t_R U6 ( .A1(n63), .A2(n64), .B(n65), .C(n66), .Y(n60) );
  NOR2xp33_ASAP7_75t_R U7 ( .A(\A\[24\] ), .B(\B\[16\] ), .Y(n54) );
  AOI21xp5_ASAP7_75t_R U8 ( .A1(n70), .A2(n71), .B(n72), .Y(n69) );
  NOR2xp33_ASAP7_75t_R U9 ( .A(n84), .B(n85), .Y(n83) );
  NOR3xp33_ASAP7_75t_R U10 ( .A(n24), .B(n92), .C(n16), .Y(n91) );
  NOR2xp33_ASAP7_75t_R U11 ( .A(n52), .B(n8), .Y(n51) );
  NOR2xp33_ASAP7_75t_R U12 ( .A(n5), .B(n63), .Y(n81) );
  NOR2xp33_ASAP7_75t_R U13 ( .A(n5), .B(n84), .Y(n11) );
  AOI21xp5_ASAP7_75t_R U14 ( .A1(n34), .A2(n37), .B(n33), .Y(n36) );
  NOR2xp33_ASAP7_75t_R U15 ( .A(\B\[24\] ), .B(\A\[24\] ), .Y(n32) );
  AOI21xp5_ASAP7_75t_R U16 ( .A1(n76), .A2(n62), .B(n61), .Y(n75) );
  NOR2xp33_ASAP7_75t_R U17 ( .A(n88), .B(n7), .Y(n86) );
  NOR2xp33_ASAP7_75t_R U18 ( .A(n58), .B(n54), .Y(n57) );
  OR2x2_ASAP7_75t_R U19 ( .A(n48), .B(n2), .Y(n1) );
  OR2x2_ASAP7_75t_R U20 ( .A(n49), .B(n50), .Y(n2) );
  OA21x2_ASAP7_75t_R U21 ( .A1(n54), .A2(n55), .B(n56), .Y(n3) );
  AND2x2_ASAP7_75t_R U22 ( .A(n61), .B(\A\[15\] ), .Y(n4) );
  OA21x2_ASAP7_75t_R U23 ( .A1(n28), .A2(n73), .B(n68), .Y(n5) );
  OA21x2_ASAP7_75t_R U24 ( .A1(n65), .A2(n80), .B(n64), .Y(n6) );
  OR2x2_ASAP7_75t_R U25 ( .A(n89), .B(n85), .Y(n7) );
  OR2x2_ASAP7_75t_R U26 ( .A(n53), .B(n3), .Y(n8) );
  AND2x2_ASAP7_75t_R U27 ( .A(n27), .B(n28), .Y(\SUM\[3\] ) );
  NAND2xp5_ASAP7_75t_R U28 ( .A(n68), .B(n69), .Y(n59) );
  INVx1_ASAP7_75t_R U29 ( .A(n21), .Y(n18) );
  NOR2x1_ASAP7_75t_R U30 ( .A(n45), .B(n1), .Y(n40) );
  INVx1_ASAP7_75t_R U31 ( .A(\A\[15\] ), .Y(n74) );
  INVx1_ASAP7_75t_R U32 ( .A(n28), .Y(n71) );
  OAI21xp5_ASAP7_75t_R U33 ( .A1(n90), .A2(n91), .B(n14), .Y(n68) );
  NAND2xp5_ASAP7_75t_R U34 ( .A(\A\[5\] ), .B(n14), .Y(n94) );
  INVx1_ASAP7_75t_R U35 ( .A(\A\[11\] ), .Y(n87) );
  INVx1_ASAP7_75t_R U36 ( .A(\A\[7\] ), .Y(n53) );
  INVx1_ASAP7_75t_R U37 ( .A(\A\[18\] ), .Y(n52) );
  INVx1_ASAP7_75t_R U38 ( .A(\A\[19\] ), .Y(n49) );
  INVx1_ASAP7_75t_R U39 ( .A(\A\[20\] ), .Y(n48) );
  INVx1_ASAP7_75t_R U40 ( .A(\A\[21\] ), .Y(n45) );
  NAND2xp5_ASAP7_75t_R U41 ( .A(\A\[5\] ), .B(n22), .Y(n21) );
  O2A1O1Ixp33_ASAP7_75t_R U42 ( .A1(n29), .A2(n30), .B(n31), .C(n32), .Y(
        \SUM\[25\] ) );
  XNOR2xp5_ASAP7_75t_R U43 ( .A(n11), .B(n85), .Y(\SUM\[9\] ) );
  XOR2xp5_ASAP7_75t_R U44 ( .A(n84), .B(n5), .Y(\SUM\[8\] ) );
  XNOR2xp5_ASAP7_75t_R U45 ( .A(n12), .B(n13), .Y(\SUM\[7\] ) );
  NAND2xp5_ASAP7_75t_R U46 ( .A(n14), .B(n15), .Y(n13) );
  OAI21xp5_ASAP7_75t_R U47 ( .A1(n16), .A2(n21), .B(n17), .Y(n12) );
  XNOR2xp5_ASAP7_75t_R U48 ( .A(n18), .B(n19), .Y(\SUM\[6\] ) );
  NAND2xp5_ASAP7_75t_R U49 ( .A(n20), .B(n17), .Y(n19) );
  XNOR2xp5_ASAP7_75t_R U50 ( .A(n92), .B(n22), .Y(\SUM\[5\] ) );
  OAI21xp5_ASAP7_75t_R U51 ( .A1(n28), .A2(n23), .B(n24), .Y(n22) );
  INVx1_ASAP7_75t_R U52 ( .A(n25), .Y(n23) );
  XNOR2xp5_ASAP7_75t_R U53 ( .A(n71), .B(n26), .Y(\SUM\[4\] ) );
  NAND2xp5_ASAP7_75t_R U54 ( .A(n24), .B(n25), .Y(n26) );
  INVx1_ASAP7_75t_R U55 ( .A(n34), .Y(n30) );
  XOR2xp5_ASAP7_75t_R U56 ( .A(n35), .B(n36), .Y(\SUM\[24\] ) );
  INVx1_ASAP7_75t_R U57 ( .A(n38), .Y(n33) );
  XNOR2xp5_ASAP7_75t_R U58 ( .A(\B\[24\] ), .B(\A\[24\] ), .Y(n35) );
  XOR2xp5_ASAP7_75t_R U59 ( .A(n39), .B(n29), .Y(\SUM\[23\] ) );
  AO21x1_ASAP7_75t_R U60 ( .A1(n40), .A2(n41), .B(n42), .Y(n37) );
  INVx1_ASAP7_75t_R U61 ( .A(n43), .Y(n42) );
  NAND2xp5_ASAP7_75t_R U62 ( .A(n34), .B(n38), .Y(n39) );
  NAND2xp5_ASAP7_75t_R U63 ( .A(\B\[23\] ), .B(\A\[23\] ), .Y(n38) );
  OR2x2_ASAP7_75t_R U64 ( .A(\A\[23\] ), .B(\B\[23\] ), .Y(n34) );
  XNOR2xp5_ASAP7_75t_R U65 ( .A(n44), .B(n40), .Y(\SUM\[22\] ) );
  NAND2xp5_ASAP7_75t_R U66 ( .A(n41), .B(n43), .Y(n44) );
  NAND2xp5_ASAP7_75t_R U67 ( .A(\B\[22\] ), .B(\A\[22\] ), .Y(n43) );
  NAND2xp5_ASAP7_75t_R U68 ( .A(n46), .B(n47), .Y(n41) );
  INVx1_ASAP7_75t_R U69 ( .A(\A\[22\] ), .Y(n47) );
  INVx1_ASAP7_75t_R U70 ( .A(\B\[22\] ), .Y(n46) );
  XOR2xp5_ASAP7_75t_R U71 ( .A(n45), .B(n1), .Y(\SUM\[21\] ) );
  XOR2xp5_ASAP7_75t_R U72 ( .A(n48), .B(n2), .Y(\SUM\[20\] ) );
  INVx1_ASAP7_75t_R U73 ( .A(n51), .Y(n50) );
  XNOR2xp5_ASAP7_75t_R U74 ( .A(n51), .B(n49), .Y(\SUM\[19\] ) );
  XOR2xp5_ASAP7_75t_R U75 ( .A(n52), .B(n8), .Y(\SUM\[18\] ) );
  XNOR2xp5_ASAP7_75t_R U76 ( .A(n3), .B(\A\[17\] ), .Y(\SUM\[17\] ) );
  XNOR2xp5_ASAP7_75t_R U77 ( .A(n55), .B(n57), .Y(\SUM\[16\] ) );
  INVx1_ASAP7_75t_R U78 ( .A(n56), .Y(n58) );
  NAND2xp5_ASAP7_75t_R U79 ( .A(\B\[16\] ), .B(\A\[24\] ), .Y(n56) );
  NAND3xp33_ASAP7_75t_R U80 ( .A(n62), .B(\A\[13\] ), .C(\A\[15\] ), .Y(n66)
         );
  INVx1_ASAP7_75t_R U81 ( .A(n67), .Y(n65) );
  INVx1_ASAP7_75t_R U82 ( .A(n64), .Y(n72) );
  INVx1_ASAP7_75t_R U83 ( .A(n73), .Y(n70) );
  XOR2xp5_ASAP7_75t_R U84 ( .A(n74), .B(n75), .Y(\SUM\[15\] ) );
  INVx1_ASAP7_75t_R U85 ( .A(n77), .Y(n61) );
  XNOR2xp5_ASAP7_75t_R U86 ( .A(n76), .B(n78), .Y(\SUM\[14\] ) );
  NAND2xp5_ASAP7_75t_R U87 ( .A(n62), .B(n77), .Y(n78) );
  NAND2xp5_ASAP7_75t_R U88 ( .A(\B\[14\] ), .B(\A\[14\] ), .Y(n77) );
  OR2x2_ASAP7_75t_R U89 ( .A(\A\[14\] ), .B(\B\[14\] ), .Y(n62) );
  INVx1_ASAP7_75t_R U90 ( .A(\A\[13\] ), .Y(n79) );
  XOR2xp5_ASAP7_75t_R U91 ( .A(n79), .B(n6), .Y(\SUM\[13\] ) );
  INVx1_ASAP7_75t_R U92 ( .A(n81), .Y(n80) );
  XNOR2xp5_ASAP7_75t_R U93 ( .A(n81), .B(n82), .Y(\SUM\[12\] ) );
  NAND2xp5_ASAP7_75t_R U94 ( .A(n67), .B(n64), .Y(n82) );
  NAND2xp5_ASAP7_75t_R U95 ( .A(\B\[12\] ), .B(\A\[12\] ), .Y(n64) );
  OR2x2_ASAP7_75t_R U96 ( .A(\A\[12\] ), .B(\B\[12\] ), .Y(n67) );
  NAND3xp33_ASAP7_75t_R U97 ( .A(n83), .B(\A\[10\] ), .C(\A\[11\] ), .Y(n63)
         );
  XNOR2xp5_ASAP7_75t_R U98 ( .A(n86), .B(n87), .Y(\SUM\[11\] ) );
  INVx1_ASAP7_75t_R U99 ( .A(\A\[10\] ), .Y(n88) );
  XOR2xp5_ASAP7_75t_R U100 ( .A(n88), .B(n7), .Y(\SUM\[10\] ) );
  INVx1_ASAP7_75t_R U101 ( .A(\A\[9\] ), .Y(n85) );
  INVx1_ASAP7_75t_R U102 ( .A(n11), .Y(n89) );
  INVx1_ASAP7_75t_R U103 ( .A(\A\[8\] ), .Y(n84) );
  NAND2xp5_ASAP7_75t_R U104 ( .A(\B\[4\] ), .B(\A\[4\] ), .Y(n24) );
  INVx1_ASAP7_75t_R U105 ( .A(n20), .Y(n16) );
  INVx1_ASAP7_75t_R U106 ( .A(\A\[5\] ), .Y(n92) );
  NAND2xp5_ASAP7_75t_R U107 ( .A(n15), .B(n17), .Y(n90) );
  NAND2xp5_ASAP7_75t_R U108 ( .A(\B\[6\] ), .B(\A\[6\] ), .Y(n17) );
  NAND2xp5_ASAP7_75t_R U109 ( .A(\B\[7\] ), .B(\A\[7\] ), .Y(n15) );
  OR2x2_ASAP7_75t_R U110 ( .A(n93), .B(n94), .Y(n73) );
  OR2x2_ASAP7_75t_R U111 ( .A(\A\[7\] ), .B(\B\[7\] ), .Y(n14) );
  NAND2xp5_ASAP7_75t_R U112 ( .A(n20), .B(n25), .Y(n93) );
  OR2x2_ASAP7_75t_R U113 ( .A(\A\[4\] ), .B(\B\[4\] ), .Y(n25) );
  OR2x2_ASAP7_75t_R U114 ( .A(\A\[6\] ), .B(\B\[6\] ), .Y(n20) );
  OR2x2_ASAP7_75t_R U115 ( .A(\A\[3\] ), .B(\B\[3\] ), .Y(n27) );
  NAND2xp5_ASAP7_75t_R U116 ( .A(\B\[3\] ), .B(\A\[3\] ), .Y(n28) );
endmodule


module fp32_exp_DW02_mult_12 ( .A({\A\[3\] , \A\[2\] , \A\[1\] , \A\[0\] }), 
    .B({\B\[23\] , \B\[22\] , \B\[21\] , \B\[20\] , \B\[19\] , \B\[18\] , 
        \B\[17\] , \B\[16\] , \B\[15\] , \B\[14\] , \B\[13\] , \B\[12\] , 
        \B\[11\] , \B\[10\] , \B\[9\] , \B\[8\] , \B\[7\] , \B\[6\] , \B\[5\] , 
        \B\[4\] , \B\[3\] , \B\[2\] , \B\[1\] , \B\[0\] }), TC, .PRODUCT({
        \PRODUCT\[27\] , \PRODUCT\[26\] , \PRODUCT\[25\] , \PRODUCT\[24\] , 
        \PRODUCT\[23\] , \PRODUCT\[22\] , \PRODUCT\[21\] , \PRODUCT\[20\] , 
        \PRODUCT\[19\] , \PRODUCT\[18\] , \PRODUCT\[17\] , \PRODUCT\[16\] , 
        \PRODUCT\[15\] , \PRODUCT\[14\] , \PRODUCT\[13\] , \PRODUCT\[12\] , 
        \PRODUCT\[11\] , \PRODUCT\[10\] , \PRODUCT\[9\] , \PRODUCT\[8\] , 
        \PRODUCT\[7\] , \PRODUCT\[6\] , \PRODUCT\[5\] , \PRODUCT\[4\] , 
        \PRODUCT\[3\] , \PRODUCT\[2\] , \PRODUCT\[1\] , \PRODUCT\[0\] }) );
  input \A\[3\] , \A\[2\] , \A\[1\] , \A\[0\] , \B\[23\] , \B\[22\] ,
         \B\[21\] , \B\[20\] , \B\[19\] , \B\[18\] , \B\[17\] , \B\[16\] ,
         \B\[15\] , \B\[14\] , \B\[13\] , \B\[12\] , \B\[11\] , \B\[10\] ,
         \B\[9\] , \B\[8\] , \B\[7\] , \B\[6\] , \B\[5\] , \B\[4\] , \B\[3\] ,
         \B\[2\] , \B\[1\] , \B\[0\] , TC;
  output \PRODUCT\[27\] , \PRODUCT\[26\] , \PRODUCT\[25\] , \PRODUCT\[24\] ,
         \PRODUCT\[23\] , \PRODUCT\[22\] , \PRODUCT\[21\] , \PRODUCT\[20\] ,
         \PRODUCT\[19\] , \PRODUCT\[18\] , \PRODUCT\[17\] , \PRODUCT\[16\] ,
         \PRODUCT\[15\] , \PRODUCT\[14\] , \PRODUCT\[13\] , \PRODUCT\[12\] ,
         \PRODUCT\[11\] , \PRODUCT\[10\] , \PRODUCT\[9\] , \PRODUCT\[8\] ,
         \PRODUCT\[7\] , \PRODUCT\[6\] , \PRODUCT\[5\] , \PRODUCT\[4\] ,
         \PRODUCT\[3\] , \PRODUCT\[2\] , \PRODUCT\[1\] , \PRODUCT\[0\] ;
  wire   net27221, \ab\[3\]\[9\] , \ab\[2\]\[9\] , \ab\[1\]\[9\] ,
         \ab\[0\]\[9\] , n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13,
         n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27,
         n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41,
         n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n55, n56,
         n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70,
         n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84,
         n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98,
         n99, n100, n101, n102, n103, n104, n105, n106;
  assign \ab\[3\]\[9\]  = \A\[3\] ;
  assign \ab\[2\]\[9\]  = \A\[2\] ;
  assign \ab\[1\]\[9\]  = \A\[1\] ;
  assign \ab\[0\]\[9\]  = \A\[0\] ;

  FAx1_ASAP7_75t_R S4_0 ( .A(\ab\[3\]\[9\] ), .B(n62), .CI(n61), .CON(n65), 
        .SN(n66) );
  FAx1_ASAP7_75t_R S4_1 ( .A(\ab\[3\]\[9\] ), .B(n58), .CI(\PRODUCT\[1\] ), 
        .CON(n67), .SN(n68) );
  FAx1_ASAP7_75t_R S4_3 ( .A(\ab\[3\]\[9\] ), .B(n52), .CI(n50), .CON(n69), 
        .SN(n70) );
  FAx1_ASAP7_75t_R S4_4 ( .A(\ab\[3\]\[9\] ), .B(n47), .CI(\ab\[2\]\[9\] ), 
        .CON(n71), .SN(n72) );
  FAx1_ASAP7_75t_R S4_9 ( .A(\ab\[3\]\[9\] ), .B(n44), .CI(n22), .CON(n73), 
        .SN(n74) );
  FAx1_ASAP7_75t_R S4_11 ( .A(\ab\[3\]\[9\] ), .B(n41), .CI(n22), .CON(n75), 
        .SN(n76) );
  FAx1_ASAP7_75t_R S4_13 ( .A(\ab\[3\]\[9\] ), .B(n38), .CI(n22), .CON(n77), 
        .SN(n78) );
  FAx1_ASAP7_75t_R S4_19 ( .A(\ab\[3\]\[9\] ), .B(n33), .CI(n31), .CON(n79), 
        .SN(n80) );
  FAx1_ASAP7_75t_R S4_20 ( .A(\ab\[3\]\[9\] ), .B(n28), .CI(n61), .CON(n81), 
        .SN(n82) );
  FAx1_ASAP7_75t_R S4_21 ( .A(\ab\[3\]\[9\] ), .B(n25), .CI(n22), .CON(n83), 
        .SN(n84) );
  FAx1_ASAP7_75t_R S1_2_0 ( .A(\ab\[2\]\[9\] ), .B(n64), .CI(n22), .CON(n85), 
        .SN(n86) );
  FAx1_ASAP7_75t_R S2_2_3 ( .A(\ab\[2\]\[9\] ), .B(n55), .CI(\PRODUCT\[1\] ), 
        .CON(n89), .SN(n90) );
  FAx1_ASAP7_75t_R S2_2_4 ( .A(\ab\[2\]\[9\] ), .B(n51), .CI(n22), .CON(n91), 
        .SN(n92) );
  FAx1_ASAP7_75t_R S2_2_19 ( .A(\ab\[2\]\[9\] ), .B(n35), .CI(\PRODUCT\[1\] ), 
        .CON(n96), .SN(n97) );
  FAx1_ASAP7_75t_R S2_2_20 ( .A(\ab\[2\]\[9\] ), .B(n32), .CI(n22), .CON(n98), 
        .SN(n99) );
  INVx1_ASAP7_75t_R U2 ( .A(n103), .Y(n51) );
  AND2x2_ASAP7_75t_R U3 ( .A(n59), .B(n57), .Y(n2) );
  XOR2xp5_ASAP7_75t_R U4 ( .A(n53), .B(n56), .Y(n3) );
  XOR2xp5_ASAP7_75t_R U5 ( .A(n61), .B(n42), .Y(n4) );
  AND2x2_ASAP7_75t_R U6 ( .A(n48), .B(n46), .Y(n5) );
  XOR2xp5_ASAP7_75t_R U7 ( .A(n46), .B(n48), .Y(n6) );
  AND2x2_ASAP7_75t_R U8 ( .A(n42), .B(n61), .Y(n7) );
  XOR2xp5_ASAP7_75t_R U9 ( .A(n61), .B(n39), .Y(n8) );
  XOR2xp5_ASAP7_75t_R U10 ( .A(n27), .B(n29), .Y(n9) );
  AND2x2_ASAP7_75t_R U11 ( .A(n29), .B(n27), .Y(n10) );
  AND2x2_ASAP7_75t_R U12 ( .A(n26), .B(n24), .Y(n11) );
  XOR2xp5_ASAP7_75t_R U13 ( .A(\ab\[3\]\[9\] ), .B(n45), .Y(n12) );
  AND2x2_ASAP7_75t_R U14 ( .A(n45), .B(\ab\[3\]\[9\] ), .Y(n13) );
  AND2x2_ASAP7_75t_R U15 ( .A(n56), .B(n53), .Y(n14) );
  AND2x2_ASAP7_75t_R U16 ( .A(n39), .B(n61), .Y(n15) );
  XOR2xp5_ASAP7_75t_R U17 ( .A(\ab\[2\]\[9\] ), .B(n36), .Y(n16) );
  AND2x2_ASAP7_75t_R U18 ( .A(n36), .B(\ab\[2\]\[9\] ), .Y(n17) );
  XOR2xp5_ASAP7_75t_R U19 ( .A(n24), .B(n26), .Y(n18) );
  XOR2xp5_ASAP7_75t_R U20 ( .A(\ab\[2\]\[9\] ), .B(n23), .Y(n19) );
  AND2x2_ASAP7_75t_R U21 ( .A(n23), .B(\ab\[2\]\[9\] ), .Y(n20) );
  XOR2xp5_ASAP7_75t_R U22 ( .A(n57), .B(n59), .Y(n21) );
  BUFx2_ASAP7_75t_R U23 ( .A(\ab\[1\]\[9\] ), .Y(n22) );
  TIELOx1_ASAP7_75t_R U24 ( .L(net27221) );
  NAND2xp5_ASAP7_75t_R U25 ( .A(\ab\[0\]\[9\] ), .B(n22), .Y(n101) );
  NAND2xp5_ASAP7_75t_R U26 ( .A(\ab\[0\]\[9\] ), .B(n22), .Y(n102) );
  NAND2xp5_ASAP7_75t_R U27 ( .A(\ab\[0\]\[9\] ), .B(n22), .Y(n103) );
  XNOR2xp5_ASAP7_75t_R U28 ( .A(n22), .B(\ab\[0\]\[9\] ), .Y(n104) );
  NAND2xp5_ASAP7_75t_R U29 ( .A(\ab\[0\]\[9\] ), .B(n22), .Y(n105) );
  NAND2xp5_ASAP7_75t_R U30 ( .A(\ab\[0\]\[9\] ), .B(n22), .Y(n106) );
  NAND2xp5_ASAP7_75t_R U31 ( .A(\ab\[2\]\[9\] ), .B(\ab\[0\]\[9\] ), .Y(n87)
         );
  XNOR2xp5_ASAP7_75t_R U32 ( .A(\ab\[0\]\[9\] ), .B(\ab\[2\]\[9\] ), .Y(n88)
         );
  NAND2xp5_ASAP7_75t_R U33 ( .A(\ab\[2\]\[9\] ), .B(\ab\[0\]\[9\] ), .Y(n93)
         );
  NAND2xp5_ASAP7_75t_R U34 ( .A(\ab\[2\]\[9\] ), .B(\ab\[0\]\[9\] ), .Y(n94)
         );
  NAND2xp5_ASAP7_75t_R U35 ( .A(\ab\[2\]\[9\] ), .B(\ab\[0\]\[9\] ), .Y(n95)
         );
  NAND2xp5_ASAP7_75t_R U36 ( .A(\ab\[2\]\[9\] ), .B(\ab\[0\]\[9\] ), .Y(n100)
         );
  INVx1_ASAP7_75t_R U37 ( .A(n91), .Y(n47) );
  INVx1_ASAP7_75t_R U38 ( .A(n102), .Y(n55) );
  INVx1_ASAP7_75t_R U39 ( .A(n104), .Y(\PRODUCT\[1\] ) );
  INVx1_ASAP7_75t_R U40 ( .A(n101), .Y(n64) );
  INVx1_ASAP7_75t_R U41 ( .A(n89), .Y(n52) );
  INVx1_ASAP7_75t_R U42 ( .A(n92), .Y(n50) );
  INVx1_ASAP7_75t_R U43 ( .A(n85), .Y(n62) );
  INVx1_ASAP7_75t_R U44 ( .A(n71), .Y(n45) );
  INVx1_ASAP7_75t_R U45 ( .A(n69), .Y(n48) );
  INVx1_ASAP7_75t_R U46 ( .A(n72), .Y(n46) );
  INVx1_ASAP7_75t_R U47 ( .A(n67), .Y(n56) );
  INVx1_ASAP7_75t_R U48 ( .A(n90), .Y(n53) );
  INVx1_ASAP7_75t_R U49 ( .A(n65), .Y(n59) );
  INVx1_ASAP7_75t_R U50 ( .A(n68), .Y(n57) );
  INVx1_ASAP7_75t_R U51 ( .A(n80), .Y(n30) );
  INVx1_ASAP7_75t_R U52 ( .A(n97), .Y(n34) );
  INVx1_ASAP7_75t_R U53 ( .A(n78), .Y(n37) );
  INVx1_ASAP7_75t_R U54 ( .A(n76), .Y(n40) );
  INVx1_ASAP7_75t_R U55 ( .A(n74), .Y(n43) );
  INVx1_ASAP7_75t_R U56 ( .A(n70), .Y(n49) );
  INVx1_ASAP7_75t_R U57 ( .A(n66), .Y(n60) );
  INVx1_ASAP7_75t_R U58 ( .A(n86), .Y(n63) );
  INVx1_ASAP7_75t_R U59 ( .A(n83), .Y(n23) );
  INVx1_ASAP7_75t_R U60 ( .A(n84), .Y(n24) );
  INVx1_ASAP7_75t_R U61 ( .A(n100), .Y(n25) );
  INVx1_ASAP7_75t_R U62 ( .A(n81), .Y(n26) );
  INVx1_ASAP7_75t_R U63 ( .A(n82), .Y(n27) );
  INVx1_ASAP7_75t_R U64 ( .A(n98), .Y(n28) );
  INVx1_ASAP7_75t_R U65 ( .A(n79), .Y(n29) );
  INVx1_ASAP7_75t_R U66 ( .A(n99), .Y(n31) );
  INVx1_ASAP7_75t_R U67 ( .A(n106), .Y(n32) );
  INVx1_ASAP7_75t_R U68 ( .A(n96), .Y(n33) );
  INVx1_ASAP7_75t_R U69 ( .A(n105), .Y(n35) );
  INVx1_ASAP7_75t_R U70 ( .A(n77), .Y(n36) );
  INVx1_ASAP7_75t_R U71 ( .A(n95), .Y(n38) );
  INVx1_ASAP7_75t_R U72 ( .A(n75), .Y(n39) );
  INVx1_ASAP7_75t_R U73 ( .A(n94), .Y(n41) );
  INVx1_ASAP7_75t_R U74 ( .A(n73), .Y(n42) );
  INVx1_ASAP7_75t_R U75 ( .A(n93), .Y(n44) );
  INVx1_ASAP7_75t_R U76 ( .A(n87), .Y(n58) );
  INVx1_ASAP7_75t_R U77 ( .A(n88), .Y(n61) );
  fp32_exp_DW01_add_J8_3 FS_1 ( .A({net27221, \ab\[3\]\[9\] , n19, n18, n9, 
        n30, n34, \PRODUCT\[1\] , \ab\[0\]\[9\] , \ab\[3\]\[9\] , n16, n37, n8, 
        n40, n4, n43, n61, n22, \ab\[0\]\[9\] , n12, n6, n49, n3, n21, n60, 
        n63}), .B({net27221, n20, n11, n10, net27221, net27221, net27221, 
        net27221, net27221, n17, net27221, n15, net27221, n7, net27221, 
        net27221, net27221, net27221, n13, n5, net27221, n14, n2, net27221, 
        net27221, net27221}), .CI(net27221), .SUM({\PRODUCT\[27\] , 
        \PRODUCT\[26\] , \PRODUCT\[25\] , \PRODUCT\[24\] , \PRODUCT\[23\] , 
        \PRODUCT\[22\] , \PRODUCT\[21\] , \PRODUCT\[20\] , \PRODUCT\[19\] , 
        \PRODUCT\[18\] , \PRODUCT\[17\] , \PRODUCT\[16\] , \PRODUCT\[15\] , 
        \PRODUCT\[14\] , \PRODUCT\[13\] , \PRODUCT\[12\] , \PRODUCT\[11\] , 
        \PRODUCT\[10\] , \PRODUCT\[9\] , \PRODUCT\[8\] , \PRODUCT\[7\] , 
        \PRODUCT\[6\] , \PRODUCT\[5\] , \PRODUCT\[4\] , \PRODUCT\[3\] , 
        \PRODUCT\[2\] }) );
endmodule


module fp32_exp_DW01_add_42 ( .A({\A\[25\] , \A\[24\] , \A\[23\] , \A\[22\] , 
        \A\[21\] , \A\[20\] , \A\[19\] , \A\[18\] , \A\[17\] , \A\[16\] , 
        \A\[15\] , \A\[14\] , \A\[13\] , \A\[12\] , \A\[11\] , \A\[10\] , 
        \A\[9\] , \A\[8\] , \A\[7\] , \A\[6\] , \A\[5\] , \A\[4\] , \A\[3\] , 
        \A\[2\] , \A\[1\] , \A\[0\] }), .B({\B\[25\] , \B\[24\] , \B\[23\] , 
        \B\[22\] , \B\[21\] , \B\[20\] , \B\[19\] , \B\[18\] , \B\[17\] , 
        \B\[16\] , \B\[15\] , \B\[14\] , \B\[13\] , \B\[12\] , \B\[11\] , 
        \B\[10\] , \B\[9\] , \B\[8\] , \B\[7\] , \B\[6\] , \B\[5\] , \B\[4\] , 
        \B\[3\] , \B\[2\] , \B\[1\] , \B\[0\] }), CI, .SUM({\SUM\[25\] , 
        \SUM\[24\] , \SUM\[23\] , \SUM\[22\] , \SUM\[21\] , \SUM\[20\] , 
        \SUM\[19\] , \SUM\[18\] , \SUM\[17\] , \SUM\[16\] , \SUM\[15\] , 
        \SUM\[14\] , \SUM\[13\] , \SUM\[12\] , \SUM\[11\] , \SUM\[10\] , 
        \SUM\[9\] , \SUM\[8\] , \SUM\[7\] , \SUM\[6\] , \SUM\[5\] , \SUM\[4\] , 
        \SUM\[3\] , \SUM\[2\] , \SUM\[1\] , \SUM\[0\] }), CO );
  input \A\[25\] , \A\[24\] , \A\[23\] , \A\[22\] , \A\[21\] , \A\[20\] ,
         \A\[19\] , \A\[18\] , \A\[17\] , \A\[16\] , \A\[15\] , \A\[14\] ,
         \A\[13\] , \A\[12\] , \A\[11\] , \A\[10\] , \A\[9\] , \A\[8\] ,
         \A\[7\] , \A\[6\] , \A\[5\] , \A\[4\] , \A\[3\] , \A\[2\] , \A\[1\] ,
         \A\[0\] , \B\[25\] , \B\[24\] , \B\[23\] , \B\[22\] , \B\[21\] ,
         \B\[20\] , \B\[19\] , \B\[18\] , \B\[17\] , \B\[16\] , \B\[15\] ,
         \B\[14\] , \B\[13\] , \B\[12\] , \B\[11\] , \B\[10\] , \B\[9\] ,
         \B\[8\] , \B\[7\] , \B\[6\] , \B\[5\] , \B\[4\] , \B\[3\] , \B\[2\] ,
         \B\[1\] , \B\[0\] , CI;
  output \SUM\[25\] , \SUM\[24\] , \SUM\[23\] , \SUM\[22\] , \SUM\[21\] ,
         \SUM\[20\] , \SUM\[19\] , \SUM\[18\] , \SUM\[17\] , \SUM\[16\] ,
         \SUM\[15\] , \SUM\[14\] , \SUM\[13\] , \SUM\[12\] , \SUM\[11\] ,
         \SUM\[10\] , \SUM\[9\] , \SUM\[8\] , \SUM\[7\] , \SUM\[6\] ,
         \SUM\[5\] , \SUM\[4\] , \SUM\[3\] , \SUM\[2\] , \SUM\[1\] ,
         \SUM\[0\] , CO;
  wire   \A\[2\] , \A\[1\] , \A\[0\] , n1, n2, n3, n4, n5, n6, n7, n8, n11,
         n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25,
         n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39,
         n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53,
         n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67,
         n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81,
         n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94;
  assign \SUM\[2\]  = \A\[2\] ;
  assign \SUM\[1\]  = \A\[1\] ;
  assign \SUM\[0\]  = \A\[0\] ;

  AOI21xp5_ASAP7_75t_R U2 ( .A1(\B\[24\] ), .A2(\A\[24\] ), .B(n33), .Y(n31)
         );
  NOR2xp33_ASAP7_75t_R U3 ( .A(n79), .B(n6), .Y(n76) );
  AOI21xp5_ASAP7_75t_R U4 ( .A1(n59), .A2(n60), .B(n4), .Y(n55) );
  AOI211xp5_ASAP7_75t_R U5 ( .A1(n63), .A2(n64), .B(n65), .C(n66), .Y(n60) );
  NOR2xp33_ASAP7_75t_R U6 ( .A(\A\[24\] ), .B(\B\[16\] ), .Y(n54) );
  AOI21xp5_ASAP7_75t_R U7 ( .A1(n70), .A2(n71), .B(n72), .Y(n69) );
  NOR2xp33_ASAP7_75t_R U8 ( .A(n84), .B(n85), .Y(n83) );
  NOR3xp33_ASAP7_75t_R U9 ( .A(n24), .B(n92), .C(n16), .Y(n91) );
  NOR2xp33_ASAP7_75t_R U10 ( .A(n52), .B(n8), .Y(n51) );
  NOR2xp33_ASAP7_75t_R U11 ( .A(n5), .B(n63), .Y(n81) );
  NOR2xp33_ASAP7_75t_R U12 ( .A(n5), .B(n84), .Y(n11) );
  O2A1O1Ixp33_ASAP7_75t_R U13 ( .A1(n29), .A2(n30), .B(n31), .C(n32), .Y(
        \SUM\[25\] ) );
  NOR2xp33_ASAP7_75t_R U14 ( .A(\B\[24\] ), .B(\A\[24\] ), .Y(n32) );
  AOI21xp5_ASAP7_75t_R U15 ( .A1(n34), .A2(n37), .B(n33), .Y(n36) );
  AOI21xp5_ASAP7_75t_R U16 ( .A1(n76), .A2(n62), .B(n61), .Y(n75) );
  NOR2xp33_ASAP7_75t_R U17 ( .A(n88), .B(n7), .Y(n86) );
  NOR2xp33_ASAP7_75t_R U18 ( .A(n58), .B(n54), .Y(n57) );
  OR2x2_ASAP7_75t_R U19 ( .A(n48), .B(n2), .Y(n1) );
  OR2x2_ASAP7_75t_R U20 ( .A(n49), .B(n50), .Y(n2) );
  OA21x2_ASAP7_75t_R U21 ( .A1(n54), .A2(n55), .B(n56), .Y(n3) );
  AND2x2_ASAP7_75t_R U22 ( .A(n61), .B(\A\[15\] ), .Y(n4) );
  OA21x2_ASAP7_75t_R U23 ( .A1(n28), .A2(n73), .B(n68), .Y(n5) );
  OA21x2_ASAP7_75t_R U24 ( .A1(n65), .A2(n80), .B(n64), .Y(n6) );
  OR2x2_ASAP7_75t_R U25 ( .A(n89), .B(n85), .Y(n7) );
  OR2x2_ASAP7_75t_R U26 ( .A(n53), .B(n3), .Y(n8) );
  AND2x2_ASAP7_75t_R U27 ( .A(n27), .B(n28), .Y(\SUM\[3\] ) );
  NAND2xp5_ASAP7_75t_R U28 ( .A(n68), .B(n69), .Y(n59) );
  INVx1_ASAP7_75t_R U29 ( .A(n21), .Y(n18) );
  NOR2x1_ASAP7_75t_R U30 ( .A(n45), .B(n1), .Y(n40) );
  INVx1_ASAP7_75t_R U31 ( .A(\A\[15\] ), .Y(n74) );
  INVx1_ASAP7_75t_R U32 ( .A(n28), .Y(n71) );
  OAI21xp5_ASAP7_75t_R U33 ( .A1(n90), .A2(n91), .B(n14), .Y(n68) );
  NAND2xp5_ASAP7_75t_R U34 ( .A(\A\[5\] ), .B(n14), .Y(n94) );
  INVx1_ASAP7_75t_R U35 ( .A(\A\[11\] ), .Y(n87) );
  INVx1_ASAP7_75t_R U36 ( .A(\A\[7\] ), .Y(n53) );
  INVx1_ASAP7_75t_R U37 ( .A(\A\[18\] ), .Y(n52) );
  INVx1_ASAP7_75t_R U38 ( .A(\A\[19\] ), .Y(n49) );
  INVx1_ASAP7_75t_R U39 ( .A(\A\[20\] ), .Y(n48) );
  INVx1_ASAP7_75t_R U40 ( .A(\A\[21\] ), .Y(n45) );
  NAND2xp5_ASAP7_75t_R U41 ( .A(\A\[5\] ), .B(n22), .Y(n21) );
  XNOR2xp5_ASAP7_75t_R U42 ( .A(n11), .B(n85), .Y(\SUM\[9\] ) );
  XOR2xp5_ASAP7_75t_R U43 ( .A(n84), .B(n5), .Y(\SUM\[8\] ) );
  XNOR2xp5_ASAP7_75t_R U44 ( .A(n12), .B(n13), .Y(\SUM\[7\] ) );
  NAND2xp5_ASAP7_75t_R U45 ( .A(n14), .B(n15), .Y(n13) );
  OAI21xp5_ASAP7_75t_R U46 ( .A1(n16), .A2(n21), .B(n17), .Y(n12) );
  XNOR2xp5_ASAP7_75t_R U47 ( .A(n18), .B(n19), .Y(\SUM\[6\] ) );
  NAND2xp5_ASAP7_75t_R U48 ( .A(n20), .B(n17), .Y(n19) );
  XNOR2xp5_ASAP7_75t_R U49 ( .A(n92), .B(n22), .Y(\SUM\[5\] ) );
  OAI21xp5_ASAP7_75t_R U50 ( .A1(n28), .A2(n23), .B(n24), .Y(n22) );
  INVx1_ASAP7_75t_R U51 ( .A(n25), .Y(n23) );
  XNOR2xp5_ASAP7_75t_R U52 ( .A(n71), .B(n26), .Y(\SUM\[4\] ) );
  NAND2xp5_ASAP7_75t_R U53 ( .A(n24), .B(n25), .Y(n26) );
  INVx1_ASAP7_75t_R U54 ( .A(n34), .Y(n30) );
  XOR2xp5_ASAP7_75t_R U55 ( .A(n35), .B(n36), .Y(\SUM\[24\] ) );
  INVx1_ASAP7_75t_R U56 ( .A(n38), .Y(n33) );
  XNOR2xp5_ASAP7_75t_R U57 ( .A(\B\[24\] ), .B(\A\[24\] ), .Y(n35) );
  XOR2xp5_ASAP7_75t_R U58 ( .A(n39), .B(n29), .Y(\SUM\[23\] ) );
  INVx1_ASAP7_75t_R U59 ( .A(n37), .Y(n29) );
  AO21x1_ASAP7_75t_R U60 ( .A1(n40), .A2(n41), .B(n42), .Y(n37) );
  INVx1_ASAP7_75t_R U61 ( .A(n43), .Y(n42) );
  NAND2xp5_ASAP7_75t_R U62 ( .A(n34), .B(n38), .Y(n39) );
  NAND2xp5_ASAP7_75t_R U63 ( .A(\B\[23\] ), .B(\A\[23\] ), .Y(n38) );
  OR2x2_ASAP7_75t_R U64 ( .A(\A\[23\] ), .B(\B\[23\] ), .Y(n34) );
  XNOR2xp5_ASAP7_75t_R U65 ( .A(n44), .B(n40), .Y(\SUM\[22\] ) );
  NAND2xp5_ASAP7_75t_R U66 ( .A(n41), .B(n43), .Y(n44) );
  NAND2xp5_ASAP7_75t_R U67 ( .A(\B\[22\] ), .B(\A\[22\] ), .Y(n43) );
  NAND2xp5_ASAP7_75t_R U68 ( .A(n46), .B(n47), .Y(n41) );
  INVx1_ASAP7_75t_R U69 ( .A(\A\[22\] ), .Y(n47) );
  INVx1_ASAP7_75t_R U70 ( .A(\B\[22\] ), .Y(n46) );
  XOR2xp5_ASAP7_75t_R U71 ( .A(n45), .B(n1), .Y(\SUM\[21\] ) );
  XOR2xp5_ASAP7_75t_R U72 ( .A(n48), .B(n2), .Y(\SUM\[20\] ) );
  INVx1_ASAP7_75t_R U73 ( .A(n51), .Y(n50) );
  XNOR2xp5_ASAP7_75t_R U74 ( .A(n51), .B(n49), .Y(\SUM\[19\] ) );
  XOR2xp5_ASAP7_75t_R U75 ( .A(n52), .B(n8), .Y(\SUM\[18\] ) );
  XNOR2xp5_ASAP7_75t_R U76 ( .A(n3), .B(\A\[17\] ), .Y(\SUM\[17\] ) );
  XNOR2xp5_ASAP7_75t_R U77 ( .A(n55), .B(n57), .Y(\SUM\[16\] ) );
  INVx1_ASAP7_75t_R U78 ( .A(n56), .Y(n58) );
  NAND2xp5_ASAP7_75t_R U79 ( .A(\B\[16\] ), .B(\A\[24\] ), .Y(n56) );
  NAND3xp33_ASAP7_75t_R U80 ( .A(n62), .B(\A\[13\] ), .C(\A\[15\] ), .Y(n66)
         );
  INVx1_ASAP7_75t_R U81 ( .A(n67), .Y(n65) );
  INVx1_ASAP7_75t_R U82 ( .A(n64), .Y(n72) );
  INVx1_ASAP7_75t_R U83 ( .A(n73), .Y(n70) );
  XOR2xp5_ASAP7_75t_R U84 ( .A(n74), .B(n75), .Y(\SUM\[15\] ) );
  INVx1_ASAP7_75t_R U85 ( .A(n77), .Y(n61) );
  XNOR2xp5_ASAP7_75t_R U86 ( .A(n76), .B(n78), .Y(\SUM\[14\] ) );
  NAND2xp5_ASAP7_75t_R U87 ( .A(n62), .B(n77), .Y(n78) );
  NAND2xp5_ASAP7_75t_R U88 ( .A(\B\[14\] ), .B(\A\[14\] ), .Y(n77) );
  OR2x2_ASAP7_75t_R U89 ( .A(\A\[14\] ), .B(\B\[14\] ), .Y(n62) );
  INVx1_ASAP7_75t_R U90 ( .A(\A\[13\] ), .Y(n79) );
  XOR2xp5_ASAP7_75t_R U91 ( .A(n79), .B(n6), .Y(\SUM\[13\] ) );
  INVx1_ASAP7_75t_R U92 ( .A(n81), .Y(n80) );
  XNOR2xp5_ASAP7_75t_R U93 ( .A(n81), .B(n82), .Y(\SUM\[12\] ) );
  NAND2xp5_ASAP7_75t_R U94 ( .A(n67), .B(n64), .Y(n82) );
  NAND2xp5_ASAP7_75t_R U95 ( .A(\B\[12\] ), .B(\A\[12\] ), .Y(n64) );
  OR2x2_ASAP7_75t_R U96 ( .A(\A\[12\] ), .B(\B\[12\] ), .Y(n67) );
  NAND3xp33_ASAP7_75t_R U97 ( .A(n83), .B(\A\[10\] ), .C(\A\[11\] ), .Y(n63)
         );
  XNOR2xp5_ASAP7_75t_R U98 ( .A(n86), .B(n87), .Y(\SUM\[11\] ) );
  INVx1_ASAP7_75t_R U99 ( .A(\A\[10\] ), .Y(n88) );
  XOR2xp5_ASAP7_75t_R U100 ( .A(n88), .B(n7), .Y(\SUM\[10\] ) );
  INVx1_ASAP7_75t_R U101 ( .A(\A\[9\] ), .Y(n85) );
  INVx1_ASAP7_75t_R U102 ( .A(n11), .Y(n89) );
  INVx1_ASAP7_75t_R U103 ( .A(\A\[8\] ), .Y(n84) );
  NAND2xp5_ASAP7_75t_R U104 ( .A(\B\[4\] ), .B(\A\[4\] ), .Y(n24) );
  INVx1_ASAP7_75t_R U105 ( .A(n20), .Y(n16) );
  INVx1_ASAP7_75t_R U106 ( .A(\A\[5\] ), .Y(n92) );
  NAND2xp5_ASAP7_75t_R U107 ( .A(n15), .B(n17), .Y(n90) );
  NAND2xp5_ASAP7_75t_R U108 ( .A(\B\[6\] ), .B(\A\[6\] ), .Y(n17) );
  NAND2xp5_ASAP7_75t_R U109 ( .A(\B\[7\] ), .B(\A\[7\] ), .Y(n15) );
  OR2x2_ASAP7_75t_R U110 ( .A(n93), .B(n94), .Y(n73) );
  OR2x2_ASAP7_75t_R U111 ( .A(\A\[7\] ), .B(\B\[7\] ), .Y(n14) );
  NAND2xp5_ASAP7_75t_R U112 ( .A(n20), .B(n25), .Y(n93) );
  OR2x2_ASAP7_75t_R U113 ( .A(\A\[4\] ), .B(\B\[4\] ), .Y(n25) );
  OR2x2_ASAP7_75t_R U114 ( .A(\A\[6\] ), .B(\B\[6\] ), .Y(n20) );
  OR2x2_ASAP7_75t_R U115 ( .A(\A\[3\] ), .B(\B\[3\] ), .Y(n27) );
  NAND2xp5_ASAP7_75t_R U116 ( .A(\B\[3\] ), .B(\A\[3\] ), .Y(n28) );
endmodule


module fp32_exp_DW02_mult_11 ( .A({\A\[3\] , \A\[2\] , \A\[1\] , \A\[0\] }), 
    .B({\B\[23\] , \B\[22\] , \B\[21\] , \B\[20\] , \B\[19\] , \B\[18\] , 
        \B\[17\] , \B\[16\] , \B\[15\] , \B\[14\] , \B\[13\] , \B\[12\] , 
        \B\[11\] , \B\[10\] , \B\[9\] , \B\[8\] , \B\[7\] , \B\[6\] , \B\[5\] , 
        \B\[4\] , \B\[3\] , \B\[2\] , \B\[1\] , \B\[0\] }), TC, .PRODUCT({
        \PRODUCT\[27\] , \PRODUCT\[26\] , \PRODUCT\[25\] , \PRODUCT\[24\] , 
        \PRODUCT\[23\] , \PRODUCT\[22\] , \PRODUCT\[21\] , \PRODUCT\[20\] , 
        \PRODUCT\[19\] , \PRODUCT\[18\] , \PRODUCT\[17\] , \PRODUCT\[16\] , 
        \PRODUCT\[15\] , \PRODUCT\[14\] , \PRODUCT\[13\] , \PRODUCT\[12\] , 
        \PRODUCT\[11\] , \PRODUCT\[10\] , \PRODUCT\[9\] , \PRODUCT\[8\] , 
        \PRODUCT\[7\] , \PRODUCT\[6\] , \PRODUCT\[5\] , \PRODUCT\[4\] , 
        \PRODUCT\[3\] , \PRODUCT\[2\] , \PRODUCT\[1\] , \PRODUCT\[0\] }) );
  input \A\[3\] , \A\[2\] , \A\[1\] , \A\[0\] , \B\[23\] , \B\[22\] ,
         \B\[21\] , \B\[20\] , \B\[19\] , \B\[18\] , \B\[17\] , \B\[16\] ,
         \B\[15\] , \B\[14\] , \B\[13\] , \B\[12\] , \B\[11\] , \B\[10\] ,
         \B\[9\] , \B\[8\] , \B\[7\] , \B\[6\] , \B\[5\] , \B\[4\] , \B\[3\] ,
         \B\[2\] , \B\[1\] , \B\[0\] , TC;
  output \PRODUCT\[27\] , \PRODUCT\[26\] , \PRODUCT\[25\] , \PRODUCT\[24\] ,
         \PRODUCT\[23\] , \PRODUCT\[22\] , \PRODUCT\[21\] , \PRODUCT\[20\] ,
         \PRODUCT\[19\] , \PRODUCT\[18\] , \PRODUCT\[17\] , \PRODUCT\[16\] ,
         \PRODUCT\[15\] , \PRODUCT\[14\] , \PRODUCT\[13\] , \PRODUCT\[12\] ,
         \PRODUCT\[11\] , \PRODUCT\[10\] , \PRODUCT\[9\] , \PRODUCT\[8\] ,
         \PRODUCT\[7\] , \PRODUCT\[6\] , \PRODUCT\[5\] , \PRODUCT\[4\] ,
         \PRODUCT\[3\] , \PRODUCT\[2\] , \PRODUCT\[1\] , \PRODUCT\[0\] ;
  wire   net27213, \ab\[3\]\[9\] , \ab\[2\]\[9\] , \ab\[1\]\[9\] ,
         \ab\[0\]\[9\] , n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13,
         n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27,
         n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41,
         n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n55, n56,
         n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70,
         n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84,
         n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98,
         n99, n100, n101, n102, n103, n104, n105, n106;
  assign \ab\[3\]\[9\]  = \A\[3\] ;
  assign \ab\[2\]\[9\]  = \A\[2\] ;
  assign \ab\[1\]\[9\]  = \A\[1\] ;
  assign \ab\[0\]\[9\]  = \A\[0\] ;

  FAx1_ASAP7_75t_R S4_0 ( .A(\ab\[3\]\[9\] ), .B(n62), .CI(n61), .CON(n65), 
        .SN(n66) );
  FAx1_ASAP7_75t_R S4_1 ( .A(\ab\[3\]\[9\] ), .B(n58), .CI(\PRODUCT\[1\] ), 
        .CON(n67), .SN(n68) );
  FAx1_ASAP7_75t_R S4_3 ( .A(\ab\[3\]\[9\] ), .B(n52), .CI(n50), .CON(n69), 
        .SN(n70) );
  FAx1_ASAP7_75t_R S4_4 ( .A(\ab\[3\]\[9\] ), .B(n47), .CI(\ab\[2\]\[9\] ), 
        .CON(n71), .SN(n72) );
  FAx1_ASAP7_75t_R S4_9 ( .A(\ab\[3\]\[9\] ), .B(n44), .CI(n22), .CON(n73), 
        .SN(n74) );
  FAx1_ASAP7_75t_R S4_11 ( .A(\ab\[3\]\[9\] ), .B(n41), .CI(n22), .CON(n75), 
        .SN(n76) );
  FAx1_ASAP7_75t_R S4_13 ( .A(\ab\[3\]\[9\] ), .B(n38), .CI(n22), .CON(n77), 
        .SN(n78) );
  FAx1_ASAP7_75t_R S4_19 ( .A(\ab\[3\]\[9\] ), .B(n33), .CI(n31), .CON(n79), 
        .SN(n80) );
  FAx1_ASAP7_75t_R S4_20 ( .A(\ab\[3\]\[9\] ), .B(n28), .CI(n61), .CON(n81), 
        .SN(n82) );
  FAx1_ASAP7_75t_R S4_21 ( .A(\ab\[3\]\[9\] ), .B(n25), .CI(n22), .CON(n83), 
        .SN(n84) );
  FAx1_ASAP7_75t_R S1_2_0 ( .A(\ab\[2\]\[9\] ), .B(n64), .CI(n22), .CON(n85), 
        .SN(n86) );
  FAx1_ASAP7_75t_R S2_2_3 ( .A(\ab\[2\]\[9\] ), .B(n55), .CI(\PRODUCT\[1\] ), 
        .CON(n89), .SN(n90) );
  FAx1_ASAP7_75t_R S2_2_4 ( .A(\ab\[2\]\[9\] ), .B(n51), .CI(n22), .CON(n91), 
        .SN(n92) );
  FAx1_ASAP7_75t_R S2_2_19 ( .A(\ab\[2\]\[9\] ), .B(n35), .CI(\PRODUCT\[1\] ), 
        .CON(n96), .SN(n97) );
  FAx1_ASAP7_75t_R S2_2_20 ( .A(\ab\[2\]\[9\] ), .B(n32), .CI(n22), .CON(n98), 
        .SN(n99) );
  AND2x2_ASAP7_75t_R U2 ( .A(n59), .B(n57), .Y(n2) );
  XOR2xp5_ASAP7_75t_R U3 ( .A(n53), .B(n56), .Y(n3) );
  XOR2xp5_ASAP7_75t_R U4 ( .A(n61), .B(n42), .Y(n4) );
  AND2x2_ASAP7_75t_R U5 ( .A(n48), .B(n46), .Y(n5) );
  XOR2xp5_ASAP7_75t_R U6 ( .A(n46), .B(n48), .Y(n6) );
  AND2x2_ASAP7_75t_R U7 ( .A(n42), .B(n61), .Y(n7) );
  XOR2xp5_ASAP7_75t_R U8 ( .A(n61), .B(n39), .Y(n8) );
  XOR2xp5_ASAP7_75t_R U9 ( .A(n27), .B(n29), .Y(n9) );
  AND2x2_ASAP7_75t_R U10 ( .A(n29), .B(n27), .Y(n10) );
  AND2x2_ASAP7_75t_R U11 ( .A(n26), .B(n24), .Y(n11) );
  XOR2xp5_ASAP7_75t_R U12 ( .A(\ab\[3\]\[9\] ), .B(n45), .Y(n12) );
  AND2x2_ASAP7_75t_R U13 ( .A(n45), .B(\ab\[3\]\[9\] ), .Y(n13) );
  AND2x2_ASAP7_75t_R U14 ( .A(n56), .B(n53), .Y(n14) );
  AND2x2_ASAP7_75t_R U15 ( .A(n39), .B(n61), .Y(n15) );
  XOR2xp5_ASAP7_75t_R U16 ( .A(\ab\[2\]\[9\] ), .B(n36), .Y(n16) );
  AND2x2_ASAP7_75t_R U17 ( .A(n36), .B(\ab\[2\]\[9\] ), .Y(n17) );
  XOR2xp5_ASAP7_75t_R U18 ( .A(n24), .B(n26), .Y(n18) );
  XOR2xp5_ASAP7_75t_R U19 ( .A(\ab\[2\]\[9\] ), .B(n23), .Y(n19) );
  AND2x2_ASAP7_75t_R U20 ( .A(n23), .B(\ab\[2\]\[9\] ), .Y(n20) );
  XOR2xp5_ASAP7_75t_R U21 ( .A(n57), .B(n59), .Y(n21) );
  BUFx2_ASAP7_75t_R U22 ( .A(\ab\[1\]\[9\] ), .Y(n22) );
  TIELOx1_ASAP7_75t_R U23 ( .L(net27213) );
  NAND2xp5_ASAP7_75t_R U24 ( .A(\ab\[0\]\[9\] ), .B(n22), .Y(n101) );
  NAND2xp5_ASAP7_75t_R U25 ( .A(\ab\[0\]\[9\] ), .B(n22), .Y(n102) );
  NAND2xp5_ASAP7_75t_R U26 ( .A(\ab\[0\]\[9\] ), .B(n22), .Y(n103) );
  XNOR2xp5_ASAP7_75t_R U27 ( .A(n22), .B(\ab\[0\]\[9\] ), .Y(n104) );
  NAND2xp5_ASAP7_75t_R U28 ( .A(\ab\[0\]\[9\] ), .B(n22), .Y(n105) );
  NAND2xp5_ASAP7_75t_R U29 ( .A(\ab\[0\]\[9\] ), .B(n22), .Y(n106) );
  NAND2xp5_ASAP7_75t_R U30 ( .A(\ab\[2\]\[9\] ), .B(\ab\[0\]\[9\] ), .Y(n87)
         );
  XNOR2xp5_ASAP7_75t_R U31 ( .A(\ab\[0\]\[9\] ), .B(\ab\[2\]\[9\] ), .Y(n88)
         );
  NAND2xp5_ASAP7_75t_R U32 ( .A(\ab\[2\]\[9\] ), .B(\ab\[0\]\[9\] ), .Y(n93)
         );
  NAND2xp5_ASAP7_75t_R U33 ( .A(\ab\[2\]\[9\] ), .B(\ab\[0\]\[9\] ), .Y(n94)
         );
  NAND2xp5_ASAP7_75t_R U34 ( .A(\ab\[2\]\[9\] ), .B(\ab\[0\]\[9\] ), .Y(n95)
         );
  NAND2xp5_ASAP7_75t_R U35 ( .A(\ab\[2\]\[9\] ), .B(\ab\[0\]\[9\] ), .Y(n100)
         );
  INVxp67_ASAP7_75t_R U36 ( .A(n71), .Y(n45) );
  INVx1_ASAP7_75t_R U37 ( .A(n103), .Y(n51) );
  INVx1_ASAP7_75t_R U38 ( .A(n102), .Y(n55) );
  INVx1_ASAP7_75t_R U39 ( .A(n104), .Y(\PRODUCT\[1\] ) );
  INVx1_ASAP7_75t_R U40 ( .A(n101), .Y(n64) );
  INVx1_ASAP7_75t_R U41 ( .A(n91), .Y(n47) );
  INVx1_ASAP7_75t_R U42 ( .A(n89), .Y(n52) );
  INVx1_ASAP7_75t_R U43 ( .A(n92), .Y(n50) );
  INVx1_ASAP7_75t_R U44 ( .A(n85), .Y(n62) );
  INVx1_ASAP7_75t_R U45 ( .A(n69), .Y(n48) );
  INVx1_ASAP7_75t_R U46 ( .A(n72), .Y(n46) );
  INVx1_ASAP7_75t_R U47 ( .A(n67), .Y(n56) );
  INVx1_ASAP7_75t_R U48 ( .A(n90), .Y(n53) );
  INVx1_ASAP7_75t_R U49 ( .A(n65), .Y(n59) );
  INVx1_ASAP7_75t_R U50 ( .A(n68), .Y(n57) );
  INVx1_ASAP7_75t_R U51 ( .A(n80), .Y(n30) );
  INVx1_ASAP7_75t_R U52 ( .A(n97), .Y(n34) );
  INVx1_ASAP7_75t_R U53 ( .A(n78), .Y(n37) );
  INVx1_ASAP7_75t_R U54 ( .A(n76), .Y(n40) );
  INVx1_ASAP7_75t_R U55 ( .A(n74), .Y(n43) );
  INVx1_ASAP7_75t_R U56 ( .A(n70), .Y(n49) );
  INVx1_ASAP7_75t_R U57 ( .A(n66), .Y(n60) );
  INVx1_ASAP7_75t_R U58 ( .A(n86), .Y(n63) );
  INVx1_ASAP7_75t_R U59 ( .A(n83), .Y(n23) );
  INVx1_ASAP7_75t_R U60 ( .A(n84), .Y(n24) );
  INVx1_ASAP7_75t_R U61 ( .A(n100), .Y(n25) );
  INVx1_ASAP7_75t_R U62 ( .A(n81), .Y(n26) );
  INVx1_ASAP7_75t_R U63 ( .A(n82), .Y(n27) );
  INVx1_ASAP7_75t_R U64 ( .A(n98), .Y(n28) );
  INVx1_ASAP7_75t_R U65 ( .A(n79), .Y(n29) );
  INVx1_ASAP7_75t_R U66 ( .A(n99), .Y(n31) );
  INVx1_ASAP7_75t_R U67 ( .A(n106), .Y(n32) );
  INVx1_ASAP7_75t_R U68 ( .A(n96), .Y(n33) );
  INVx1_ASAP7_75t_R U69 ( .A(n105), .Y(n35) );
  INVx1_ASAP7_75t_R U70 ( .A(n77), .Y(n36) );
  INVx1_ASAP7_75t_R U71 ( .A(n95), .Y(n38) );
  INVx1_ASAP7_75t_R U72 ( .A(n75), .Y(n39) );
  INVx1_ASAP7_75t_R U73 ( .A(n94), .Y(n41) );
  INVx1_ASAP7_75t_R U74 ( .A(n73), .Y(n42) );
  INVx1_ASAP7_75t_R U75 ( .A(n93), .Y(n44) );
  INVx1_ASAP7_75t_R U76 ( .A(n87), .Y(n58) );
  INVx1_ASAP7_75t_R U77 ( .A(n88), .Y(n61) );
  fp32_exp_DW01_add_42 FS_1 ( .A({net27213, \ab\[3\]\[9\] , n19, n18, n9, n30, 
        n34, \PRODUCT\[1\] , \ab\[0\]\[9\] , \ab\[3\]\[9\] , n16, n37, n8, n40, 
        n4, n43, n61, n22, \ab\[0\]\[9\] , n12, n6, n49, n3, n21, n60, n63}), 
        .B({net27213, n20, n11, n10, net27213, net27213, net27213, net27213, 
        net27213, n17, net27213, n15, net27213, n7, net27213, net27213, 
        net27213, net27213, n13, n5, net27213, n14, n2, net27213, net27213, 
        net27213}), .CI(net27213), .SUM({\PRODUCT\[27\] , \PRODUCT\[26\] , 
        \PRODUCT\[25\] , \PRODUCT\[24\] , \PRODUCT\[23\] , \PRODUCT\[22\] , 
        \PRODUCT\[21\] , \PRODUCT\[20\] , \PRODUCT\[19\] , \PRODUCT\[18\] , 
        \PRODUCT\[17\] , \PRODUCT\[16\] , \PRODUCT\[15\] , \PRODUCT\[14\] , 
        \PRODUCT\[13\] , \PRODUCT\[12\] , \PRODUCT\[11\] , \PRODUCT\[10\] , 
        \PRODUCT\[9\] , \PRODUCT\[8\] , \PRODUCT\[7\] , \PRODUCT\[6\] , 
        \PRODUCT\[5\] , \PRODUCT\[4\] , \PRODUCT\[3\] , \PRODUCT\[2\] }) );
endmodule


module fp32_exp_DW01_add_J8_4 ( .A({\A\[25\] , \A\[24\] , \A\[23\] , \A\[22\] , 
        \A\[21\] , \A\[20\] , \A\[19\] , \A\[18\] , \A\[17\] , \A\[16\] , 
        \A\[15\] , \A\[14\] , \A\[13\] , \A\[12\] , \A\[11\] , \A\[10\] , 
        \A\[9\] , \A\[8\] , \A\[7\] , \A\[6\] , \A\[5\] , \A\[4\] , \A\[3\] , 
        \A\[2\] , \A\[1\] , \A\[0\] }), .B({\B\[25\] , \B\[24\] , \B\[23\] , 
        \B\[22\] , \B\[21\] , \B\[20\] , \B\[19\] , \B\[18\] , \B\[17\] , 
        \B\[16\] , \B\[15\] , \B\[14\] , \B\[13\] , \B\[12\] , \B\[11\] , 
        \B\[10\] , \B\[9\] , \B\[8\] , \B\[7\] , \B\[6\] , \B\[5\] , \B\[4\] , 
        \B\[3\] , \B\[2\] , \B\[1\] , \B\[0\] }), CI, .SUM({\SUM\[25\] , 
        \SUM\[24\] , \SUM\[23\] , \SUM\[22\] , \SUM\[21\] , \SUM\[20\] , 
        \SUM\[19\] , \SUM\[18\] , \SUM\[17\] , \SUM\[16\] , \SUM\[15\] , 
        \SUM\[14\] , \SUM\[13\] , \SUM\[12\] , \SUM\[11\] , \SUM\[10\] , 
        \SUM\[9\] , \SUM\[8\] , \SUM\[7\] , \SUM\[6\] , \SUM\[5\] , \SUM\[4\] , 
        \SUM\[3\] , \SUM\[2\] , \SUM\[1\] , \SUM\[0\] }), CO );
  input \A\[25\] , \A\[24\] , \A\[23\] , \A\[22\] , \A\[21\] , \A\[20\] ,
         \A\[19\] , \A\[18\] , \A\[17\] , \A\[16\] , \A\[15\] , \A\[14\] ,
         \A\[13\] , \A\[12\] , \A\[11\] , \A\[10\] , \A\[9\] , \A\[8\] ,
         \A\[7\] , \A\[6\] , \A\[5\] , \A\[4\] , \A\[3\] , \A\[2\] , \A\[1\] ,
         \A\[0\] , \B\[25\] , \B\[24\] , \B\[23\] , \B\[22\] , \B\[21\] ,
         \B\[20\] , \B\[19\] , \B\[18\] , \B\[17\] , \B\[16\] , \B\[15\] ,
         \B\[14\] , \B\[13\] , \B\[12\] , \B\[11\] , \B\[10\] , \B\[9\] ,
         \B\[8\] , \B\[7\] , \B\[6\] , \B\[5\] , \B\[4\] , \B\[3\] , \B\[2\] ,
         \B\[1\] , \B\[0\] , CI;
  output \SUM\[25\] , \SUM\[24\] , \SUM\[23\] , \SUM\[22\] , \SUM\[21\] ,
         \SUM\[20\] , \SUM\[19\] , \SUM\[18\] , \SUM\[17\] , \SUM\[16\] ,
         \SUM\[15\] , \SUM\[14\] , \SUM\[13\] , \SUM\[12\] , \SUM\[11\] ,
         \SUM\[10\] , \SUM\[9\] , \SUM\[8\] , \SUM\[7\] , \SUM\[6\] ,
         \SUM\[5\] , \SUM\[4\] , \SUM\[3\] , \SUM\[2\] , \SUM\[1\] ,
         \SUM\[0\] , CO;
  wire   \A\[2\] , \A\[1\] , \A\[0\] , n1, n2, n3, n4, n5, n6, n7, n8, n11,
         n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25,
         n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39,
         n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53,
         n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67,
         n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81,
         n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94;
  assign \SUM\[2\]  = \A\[2\] ;
  assign \SUM\[1\]  = \A\[1\] ;
  assign \SUM\[0\]  = \A\[0\] ;

  AOI21xp5_ASAP7_75t_R U2 ( .A1(\B\[24\] ), .A2(\A\[24\] ), .B(n33), .Y(n31)
         );
  INVxp67_ASAP7_75t_R U3 ( .A(n37), .Y(n29) );
  NOR2xp33_ASAP7_75t_R U4 ( .A(n79), .B(n6), .Y(n76) );
  AOI21xp5_ASAP7_75t_R U5 ( .A1(n59), .A2(n60), .B(n4), .Y(n55) );
  AOI211xp5_ASAP7_75t_R U6 ( .A1(n63), .A2(n64), .B(n65), .C(n66), .Y(n60) );
  NOR2xp33_ASAP7_75t_R U7 ( .A(\A\[24\] ), .B(\B\[16\] ), .Y(n54) );
  AOI21xp5_ASAP7_75t_R U8 ( .A1(n70), .A2(n71), .B(n72), .Y(n69) );
  NOR2xp33_ASAP7_75t_R U9 ( .A(n84), .B(n85), .Y(n83) );
  NOR3xp33_ASAP7_75t_R U10 ( .A(n24), .B(n92), .C(n16), .Y(n91) );
  NOR2xp33_ASAP7_75t_R U11 ( .A(n52), .B(n8), .Y(n51) );
  NOR2xp33_ASAP7_75t_R U12 ( .A(n5), .B(n63), .Y(n81) );
  NOR2xp33_ASAP7_75t_R U13 ( .A(n5), .B(n84), .Y(n11) );
  AOI21xp5_ASAP7_75t_R U14 ( .A1(n34), .A2(n37), .B(n33), .Y(n36) );
  NOR2xp33_ASAP7_75t_R U15 ( .A(\B\[24\] ), .B(\A\[24\] ), .Y(n32) );
  AOI21xp5_ASAP7_75t_R U16 ( .A1(n76), .A2(n62), .B(n61), .Y(n75) );
  NOR2xp33_ASAP7_75t_R U17 ( .A(n88), .B(n7), .Y(n86) );
  NOR2xp33_ASAP7_75t_R U18 ( .A(n58), .B(n54), .Y(n57) );
  OR2x2_ASAP7_75t_R U19 ( .A(n48), .B(n2), .Y(n1) );
  OR2x2_ASAP7_75t_R U20 ( .A(n49), .B(n50), .Y(n2) );
  OA21x2_ASAP7_75t_R U21 ( .A1(n54), .A2(n55), .B(n56), .Y(n3) );
  AND2x2_ASAP7_75t_R U22 ( .A(n61), .B(\A\[15\] ), .Y(n4) );
  OA21x2_ASAP7_75t_R U23 ( .A1(n28), .A2(n73), .B(n68), .Y(n5) );
  OA21x2_ASAP7_75t_R U24 ( .A1(n65), .A2(n80), .B(n64), .Y(n6) );
  OR2x2_ASAP7_75t_R U25 ( .A(n89), .B(n85), .Y(n7) );
  OR2x2_ASAP7_75t_R U26 ( .A(n53), .B(n3), .Y(n8) );
  AND2x2_ASAP7_75t_R U27 ( .A(n27), .B(n28), .Y(\SUM\[3\] ) );
  NAND2xp5_ASAP7_75t_R U28 ( .A(n68), .B(n69), .Y(n59) );
  INVx1_ASAP7_75t_R U29 ( .A(n21), .Y(n18) );
  NOR2x1_ASAP7_75t_R U30 ( .A(n45), .B(n1), .Y(n40) );
  INVx1_ASAP7_75t_R U31 ( .A(\A\[15\] ), .Y(n74) );
  INVx1_ASAP7_75t_R U32 ( .A(n28), .Y(n71) );
  OAI21xp5_ASAP7_75t_R U33 ( .A1(n90), .A2(n91), .B(n14), .Y(n68) );
  NAND2xp5_ASAP7_75t_R U34 ( .A(\A\[5\] ), .B(n14), .Y(n94) );
  INVx1_ASAP7_75t_R U35 ( .A(\A\[11\] ), .Y(n87) );
  INVx1_ASAP7_75t_R U36 ( .A(\A\[7\] ), .Y(n53) );
  INVx1_ASAP7_75t_R U37 ( .A(\A\[18\] ), .Y(n52) );
  INVx1_ASAP7_75t_R U38 ( .A(\A\[19\] ), .Y(n49) );
  INVx1_ASAP7_75t_R U39 ( .A(\A\[20\] ), .Y(n48) );
  INVx1_ASAP7_75t_R U40 ( .A(\A\[21\] ), .Y(n45) );
  NAND2xp5_ASAP7_75t_R U41 ( .A(\A\[5\] ), .B(n22), .Y(n21) );
  O2A1O1Ixp33_ASAP7_75t_R U42 ( .A1(n29), .A2(n30), .B(n31), .C(n32), .Y(
        \SUM\[25\] ) );
  XNOR2xp5_ASAP7_75t_R U43 ( .A(n11), .B(n85), .Y(\SUM\[9\] ) );
  XOR2xp5_ASAP7_75t_R U44 ( .A(n84), .B(n5), .Y(\SUM\[8\] ) );
  XNOR2xp5_ASAP7_75t_R U45 ( .A(n12), .B(n13), .Y(\SUM\[7\] ) );
  NAND2xp5_ASAP7_75t_R U46 ( .A(n14), .B(n15), .Y(n13) );
  OAI21xp5_ASAP7_75t_R U47 ( .A1(n16), .A2(n21), .B(n17), .Y(n12) );
  XNOR2xp5_ASAP7_75t_R U48 ( .A(n18), .B(n19), .Y(\SUM\[6\] ) );
  NAND2xp5_ASAP7_75t_R U49 ( .A(n20), .B(n17), .Y(n19) );
  XNOR2xp5_ASAP7_75t_R U50 ( .A(n92), .B(n22), .Y(\SUM\[5\] ) );
  OAI21xp5_ASAP7_75t_R U51 ( .A1(n28), .A2(n23), .B(n24), .Y(n22) );
  INVx1_ASAP7_75t_R U52 ( .A(n25), .Y(n23) );
  XNOR2xp5_ASAP7_75t_R U53 ( .A(n71), .B(n26), .Y(\SUM\[4\] ) );
  NAND2xp5_ASAP7_75t_R U54 ( .A(n24), .B(n25), .Y(n26) );
  INVx1_ASAP7_75t_R U55 ( .A(n34), .Y(n30) );
  XOR2xp5_ASAP7_75t_R U56 ( .A(n35), .B(n36), .Y(\SUM\[24\] ) );
  INVx1_ASAP7_75t_R U57 ( .A(n38), .Y(n33) );
  XNOR2xp5_ASAP7_75t_R U58 ( .A(\B\[24\] ), .B(\A\[24\] ), .Y(n35) );
  XOR2xp5_ASAP7_75t_R U59 ( .A(n39), .B(n29), .Y(\SUM\[23\] ) );
  AO21x1_ASAP7_75t_R U60 ( .A1(n40), .A2(n41), .B(n42), .Y(n37) );
  INVx1_ASAP7_75t_R U61 ( .A(n43), .Y(n42) );
  NAND2xp5_ASAP7_75t_R U62 ( .A(n34), .B(n38), .Y(n39) );
  NAND2xp5_ASAP7_75t_R U63 ( .A(\B\[23\] ), .B(\A\[23\] ), .Y(n38) );
  OR2x2_ASAP7_75t_R U64 ( .A(\A\[23\] ), .B(\B\[23\] ), .Y(n34) );
  XNOR2xp5_ASAP7_75t_R U65 ( .A(n44), .B(n40), .Y(\SUM\[22\] ) );
  NAND2xp5_ASAP7_75t_R U66 ( .A(n41), .B(n43), .Y(n44) );
  NAND2xp5_ASAP7_75t_R U67 ( .A(\B\[22\] ), .B(\A\[22\] ), .Y(n43) );
  NAND2xp5_ASAP7_75t_R U68 ( .A(n46), .B(n47), .Y(n41) );
  INVx1_ASAP7_75t_R U69 ( .A(\A\[22\] ), .Y(n47) );
  INVx1_ASAP7_75t_R U70 ( .A(\B\[22\] ), .Y(n46) );
  XOR2xp5_ASAP7_75t_R U71 ( .A(n45), .B(n1), .Y(\SUM\[21\] ) );
  XOR2xp5_ASAP7_75t_R U72 ( .A(n48), .B(n2), .Y(\SUM\[20\] ) );
  INVx1_ASAP7_75t_R U73 ( .A(n51), .Y(n50) );
  XNOR2xp5_ASAP7_75t_R U74 ( .A(n51), .B(n49), .Y(\SUM\[19\] ) );
  XOR2xp5_ASAP7_75t_R U75 ( .A(n52), .B(n8), .Y(\SUM\[18\] ) );
  XNOR2xp5_ASAP7_75t_R U76 ( .A(n3), .B(\A\[17\] ), .Y(\SUM\[17\] ) );
  XNOR2xp5_ASAP7_75t_R U77 ( .A(n55), .B(n57), .Y(\SUM\[16\] ) );
  INVx1_ASAP7_75t_R U78 ( .A(n56), .Y(n58) );
  NAND2xp5_ASAP7_75t_R U79 ( .A(\B\[16\] ), .B(\A\[24\] ), .Y(n56) );
  NAND3xp33_ASAP7_75t_R U80 ( .A(n62), .B(\A\[13\] ), .C(\A\[15\] ), .Y(n66)
         );
  INVx1_ASAP7_75t_R U81 ( .A(n67), .Y(n65) );
  INVx1_ASAP7_75t_R U82 ( .A(n64), .Y(n72) );
  INVx1_ASAP7_75t_R U83 ( .A(n73), .Y(n70) );
  XOR2xp5_ASAP7_75t_R U84 ( .A(n74), .B(n75), .Y(\SUM\[15\] ) );
  INVx1_ASAP7_75t_R U85 ( .A(n77), .Y(n61) );
  XNOR2xp5_ASAP7_75t_R U86 ( .A(n76), .B(n78), .Y(\SUM\[14\] ) );
  NAND2xp5_ASAP7_75t_R U87 ( .A(n62), .B(n77), .Y(n78) );
  NAND2xp5_ASAP7_75t_R U88 ( .A(\B\[14\] ), .B(\A\[14\] ), .Y(n77) );
  OR2x2_ASAP7_75t_R U89 ( .A(\A\[14\] ), .B(\B\[14\] ), .Y(n62) );
  INVx1_ASAP7_75t_R U90 ( .A(\A\[13\] ), .Y(n79) );
  XOR2xp5_ASAP7_75t_R U91 ( .A(n79), .B(n6), .Y(\SUM\[13\] ) );
  INVx1_ASAP7_75t_R U92 ( .A(n81), .Y(n80) );
  XNOR2xp5_ASAP7_75t_R U93 ( .A(n81), .B(n82), .Y(\SUM\[12\] ) );
  NAND2xp5_ASAP7_75t_R U94 ( .A(n67), .B(n64), .Y(n82) );
  NAND2xp5_ASAP7_75t_R U95 ( .A(\B\[12\] ), .B(\A\[12\] ), .Y(n64) );
  OR2x2_ASAP7_75t_R U96 ( .A(\A\[12\] ), .B(\B\[12\] ), .Y(n67) );
  NAND3xp33_ASAP7_75t_R U97 ( .A(n83), .B(\A\[10\] ), .C(\A\[11\] ), .Y(n63)
         );
  XNOR2xp5_ASAP7_75t_R U98 ( .A(n86), .B(n87), .Y(\SUM\[11\] ) );
  INVx1_ASAP7_75t_R U99 ( .A(\A\[10\] ), .Y(n88) );
  XOR2xp5_ASAP7_75t_R U100 ( .A(n88), .B(n7), .Y(\SUM\[10\] ) );
  INVx1_ASAP7_75t_R U101 ( .A(\A\[9\] ), .Y(n85) );
  INVx1_ASAP7_75t_R U102 ( .A(n11), .Y(n89) );
  INVx1_ASAP7_75t_R U103 ( .A(\A\[8\] ), .Y(n84) );
  NAND2xp5_ASAP7_75t_R U104 ( .A(\B\[4\] ), .B(\A\[4\] ), .Y(n24) );
  INVx1_ASAP7_75t_R U105 ( .A(n20), .Y(n16) );
  INVx1_ASAP7_75t_R U106 ( .A(\A\[5\] ), .Y(n92) );
  NAND2xp5_ASAP7_75t_R U107 ( .A(n15), .B(n17), .Y(n90) );
  NAND2xp5_ASAP7_75t_R U108 ( .A(\B\[6\] ), .B(\A\[6\] ), .Y(n17) );
  NAND2xp5_ASAP7_75t_R U109 ( .A(\B\[7\] ), .B(\A\[7\] ), .Y(n15) );
  OR2x2_ASAP7_75t_R U110 ( .A(n93), .B(n94), .Y(n73) );
  OR2x2_ASAP7_75t_R U111 ( .A(\A\[7\] ), .B(\B\[7\] ), .Y(n14) );
  NAND2xp5_ASAP7_75t_R U112 ( .A(n20), .B(n25), .Y(n93) );
  OR2x2_ASAP7_75t_R U113 ( .A(\A\[4\] ), .B(\B\[4\] ), .Y(n25) );
  OR2x2_ASAP7_75t_R U114 ( .A(\A\[6\] ), .B(\B\[6\] ), .Y(n20) );
  OR2x2_ASAP7_75t_R U115 ( .A(\A\[3\] ), .B(\B\[3\] ), .Y(n27) );
  NAND2xp5_ASAP7_75t_R U116 ( .A(\B\[3\] ), .B(\A\[3\] ), .Y(n28) );
endmodule


module fp32_exp_DW02_mult_10 ( .A({\A\[3\] , \A\[2\] , \A\[1\] , \A\[0\] }), 
    .B({\B\[23\] , \B\[22\] , \B\[21\] , \B\[20\] , \B\[19\] , \B\[18\] , 
        \B\[17\] , \B\[16\] , \B\[15\] , \B\[14\] , \B\[13\] , \B\[12\] , 
        \B\[11\] , \B\[10\] , \B\[9\] , \B\[8\] , \B\[7\] , \B\[6\] , \B\[5\] , 
        \B\[4\] , \B\[3\] , \B\[2\] , \B\[1\] , \B\[0\] }), TC, .PRODUCT({
        \PRODUCT\[27\] , \PRODUCT\[26\] , \PRODUCT\[25\] , \PRODUCT\[24\] , 
        \PRODUCT\[23\] , \PRODUCT\[22\] , \PRODUCT\[21\] , \PRODUCT\[20\] , 
        \PRODUCT\[19\] , \PRODUCT\[18\] , \PRODUCT\[17\] , \PRODUCT\[16\] , 
        \PRODUCT\[15\] , \PRODUCT\[14\] , \PRODUCT\[13\] , \PRODUCT\[12\] , 
        \PRODUCT\[11\] , \PRODUCT\[10\] , \PRODUCT\[9\] , \PRODUCT\[8\] , 
        \PRODUCT\[7\] , \PRODUCT\[6\] , \PRODUCT\[5\] , \PRODUCT\[4\] , 
        \PRODUCT\[3\] , \PRODUCT\[2\] , \PRODUCT\[1\] , \PRODUCT\[0\] }) );
  input \A\[3\] , \A\[2\] , \A\[1\] , \A\[0\] , \B\[23\] , \B\[22\] ,
         \B\[21\] , \B\[20\] , \B\[19\] , \B\[18\] , \B\[17\] , \B\[16\] ,
         \B\[15\] , \B\[14\] , \B\[13\] , \B\[12\] , \B\[11\] , \B\[10\] ,
         \B\[9\] , \B\[8\] , \B\[7\] , \B\[6\] , \B\[5\] , \B\[4\] , \B\[3\] ,
         \B\[2\] , \B\[1\] , \B\[0\] , TC;
  output \PRODUCT\[27\] , \PRODUCT\[26\] , \PRODUCT\[25\] , \PRODUCT\[24\] ,
         \PRODUCT\[23\] , \PRODUCT\[22\] , \PRODUCT\[21\] , \PRODUCT\[20\] ,
         \PRODUCT\[19\] , \PRODUCT\[18\] , \PRODUCT\[17\] , \PRODUCT\[16\] ,
         \PRODUCT\[15\] , \PRODUCT\[14\] , \PRODUCT\[13\] , \PRODUCT\[12\] ,
         \PRODUCT\[11\] , \PRODUCT\[10\] , \PRODUCT\[9\] , \PRODUCT\[8\] ,
         \PRODUCT\[7\] , \PRODUCT\[6\] , \PRODUCT\[5\] , \PRODUCT\[4\] ,
         \PRODUCT\[3\] , \PRODUCT\[2\] , \PRODUCT\[1\] , \PRODUCT\[0\] ;
  wire   net27205, \ab\[3\]\[9\] , \ab\[2\]\[9\] , \ab\[1\]\[9\] ,
         \ab\[0\]\[9\] , n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13,
         n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27,
         n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41,
         n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n55, n56,
         n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70,
         n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84,
         n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98,
         n99, n100, n101, n102, n103, n104, n105, n106;
  assign \ab\[3\]\[9\]  = \A\[3\] ;
  assign \ab\[2\]\[9\]  = \A\[2\] ;
  assign \ab\[1\]\[9\]  = \A\[1\] ;
  assign \ab\[0\]\[9\]  = \A\[0\] ;

  FAx1_ASAP7_75t_R S4_0 ( .A(\ab\[3\]\[9\] ), .B(n62), .CI(n61), .CON(n65), 
        .SN(n66) );
  FAx1_ASAP7_75t_R S4_1 ( .A(\ab\[3\]\[9\] ), .B(n58), .CI(\PRODUCT\[1\] ), 
        .CON(n67), .SN(n68) );
  FAx1_ASAP7_75t_R S4_3 ( .A(\ab\[3\]\[9\] ), .B(n52), .CI(n50), .CON(n69), 
        .SN(n70) );
  FAx1_ASAP7_75t_R S4_4 ( .A(\ab\[3\]\[9\] ), .B(n47), .CI(\ab\[2\]\[9\] ), 
        .CON(n71), .SN(n72) );
  FAx1_ASAP7_75t_R S4_9 ( .A(\ab\[3\]\[9\] ), .B(n44), .CI(n22), .CON(n73), 
        .SN(n74) );
  FAx1_ASAP7_75t_R S4_11 ( .A(\ab\[3\]\[9\] ), .B(n41), .CI(n22), .CON(n75), 
        .SN(n76) );
  FAx1_ASAP7_75t_R S4_13 ( .A(\ab\[3\]\[9\] ), .B(n38), .CI(n22), .CON(n77), 
        .SN(n78) );
  FAx1_ASAP7_75t_R S4_19 ( .A(\ab\[3\]\[9\] ), .B(n33), .CI(n31), .CON(n79), 
        .SN(n80) );
  FAx1_ASAP7_75t_R S4_20 ( .A(\ab\[3\]\[9\] ), .B(n28), .CI(n61), .CON(n81), 
        .SN(n82) );
  FAx1_ASAP7_75t_R S4_21 ( .A(\ab\[3\]\[9\] ), .B(n25), .CI(n22), .CON(n83), 
        .SN(n84) );
  FAx1_ASAP7_75t_R S1_2_0 ( .A(\ab\[2\]\[9\] ), .B(n64), .CI(n22), .CON(n85), 
        .SN(n86) );
  FAx1_ASAP7_75t_R S2_2_3 ( .A(\ab\[2\]\[9\] ), .B(n55), .CI(\PRODUCT\[1\] ), 
        .CON(n89), .SN(n90) );
  FAx1_ASAP7_75t_R S2_2_4 ( .A(\ab\[2\]\[9\] ), .B(n51), .CI(n22), .CON(n91), 
        .SN(n92) );
  FAx1_ASAP7_75t_R S2_2_19 ( .A(\ab\[2\]\[9\] ), .B(n35), .CI(\PRODUCT\[1\] ), 
        .CON(n96), .SN(n97) );
  FAx1_ASAP7_75t_R S2_2_20 ( .A(\ab\[2\]\[9\] ), .B(n32), .CI(n22), .CON(n98), 
        .SN(n99) );
  INVx1_ASAP7_75t_R U2 ( .A(n103), .Y(n51) );
  AND2x2_ASAP7_75t_R U3 ( .A(n59), .B(n57), .Y(n2) );
  XOR2xp5_ASAP7_75t_R U4 ( .A(n53), .B(n56), .Y(n3) );
  XOR2xp5_ASAP7_75t_R U5 ( .A(n61), .B(n42), .Y(n4) );
  AND2x2_ASAP7_75t_R U6 ( .A(n48), .B(n46), .Y(n5) );
  XOR2xp5_ASAP7_75t_R U7 ( .A(n46), .B(n48), .Y(n6) );
  AND2x2_ASAP7_75t_R U8 ( .A(n42), .B(n61), .Y(n7) );
  XOR2xp5_ASAP7_75t_R U9 ( .A(n61), .B(n39), .Y(n8) );
  XOR2xp5_ASAP7_75t_R U10 ( .A(n27), .B(n29), .Y(n9) );
  AND2x2_ASAP7_75t_R U11 ( .A(n29), .B(n27), .Y(n10) );
  AND2x2_ASAP7_75t_R U12 ( .A(n26), .B(n24), .Y(n11) );
  XOR2xp5_ASAP7_75t_R U13 ( .A(\ab\[3\]\[9\] ), .B(n45), .Y(n12) );
  AND2x2_ASAP7_75t_R U14 ( .A(n45), .B(\ab\[3\]\[9\] ), .Y(n13) );
  AND2x2_ASAP7_75t_R U15 ( .A(n56), .B(n53), .Y(n14) );
  AND2x2_ASAP7_75t_R U16 ( .A(n39), .B(n61), .Y(n15) );
  XOR2xp5_ASAP7_75t_R U17 ( .A(\ab\[2\]\[9\] ), .B(n36), .Y(n16) );
  AND2x2_ASAP7_75t_R U18 ( .A(n36), .B(\ab\[2\]\[9\] ), .Y(n17) );
  XOR2xp5_ASAP7_75t_R U19 ( .A(n24), .B(n26), .Y(n18) );
  XOR2xp5_ASAP7_75t_R U20 ( .A(\ab\[2\]\[9\] ), .B(n23), .Y(n19) );
  AND2x2_ASAP7_75t_R U21 ( .A(n23), .B(\ab\[2\]\[9\] ), .Y(n20) );
  XOR2xp5_ASAP7_75t_R U22 ( .A(n57), .B(n59), .Y(n21) );
  BUFx2_ASAP7_75t_R U23 ( .A(\ab\[1\]\[9\] ), .Y(n22) );
  TIELOx1_ASAP7_75t_R U24 ( .L(net27205) );
  NAND2xp5_ASAP7_75t_R U25 ( .A(\ab\[0\]\[9\] ), .B(n22), .Y(n101) );
  NAND2xp5_ASAP7_75t_R U26 ( .A(\ab\[0\]\[9\] ), .B(n22), .Y(n102) );
  NAND2xp5_ASAP7_75t_R U27 ( .A(\ab\[0\]\[9\] ), .B(n22), .Y(n103) );
  XNOR2xp5_ASAP7_75t_R U28 ( .A(n22), .B(\ab\[0\]\[9\] ), .Y(n104) );
  NAND2xp5_ASAP7_75t_R U29 ( .A(\ab\[0\]\[9\] ), .B(n22), .Y(n105) );
  NAND2xp5_ASAP7_75t_R U30 ( .A(\ab\[0\]\[9\] ), .B(n22), .Y(n106) );
  NAND2xp5_ASAP7_75t_R U31 ( .A(\ab\[2\]\[9\] ), .B(\ab\[0\]\[9\] ), .Y(n87)
         );
  XNOR2xp5_ASAP7_75t_R U32 ( .A(\ab\[0\]\[9\] ), .B(\ab\[2\]\[9\] ), .Y(n88)
         );
  NAND2xp5_ASAP7_75t_R U33 ( .A(\ab\[2\]\[9\] ), .B(\ab\[0\]\[9\] ), .Y(n93)
         );
  NAND2xp5_ASAP7_75t_R U34 ( .A(\ab\[2\]\[9\] ), .B(\ab\[0\]\[9\] ), .Y(n94)
         );
  NAND2xp5_ASAP7_75t_R U35 ( .A(\ab\[2\]\[9\] ), .B(\ab\[0\]\[9\] ), .Y(n95)
         );
  NAND2xp5_ASAP7_75t_R U36 ( .A(\ab\[2\]\[9\] ), .B(\ab\[0\]\[9\] ), .Y(n100)
         );
  INVx1_ASAP7_75t_R U37 ( .A(n91), .Y(n47) );
  INVx1_ASAP7_75t_R U38 ( .A(n102), .Y(n55) );
  INVx1_ASAP7_75t_R U39 ( .A(n104), .Y(\PRODUCT\[1\] ) );
  INVx1_ASAP7_75t_R U40 ( .A(n101), .Y(n64) );
  INVx1_ASAP7_75t_R U41 ( .A(n89), .Y(n52) );
  INVx1_ASAP7_75t_R U42 ( .A(n92), .Y(n50) );
  INVx1_ASAP7_75t_R U43 ( .A(n85), .Y(n62) );
  INVx1_ASAP7_75t_R U44 ( .A(n71), .Y(n45) );
  INVx1_ASAP7_75t_R U45 ( .A(n69), .Y(n48) );
  INVx1_ASAP7_75t_R U46 ( .A(n72), .Y(n46) );
  INVx1_ASAP7_75t_R U47 ( .A(n67), .Y(n56) );
  INVx1_ASAP7_75t_R U48 ( .A(n90), .Y(n53) );
  INVx1_ASAP7_75t_R U49 ( .A(n65), .Y(n59) );
  INVx1_ASAP7_75t_R U50 ( .A(n68), .Y(n57) );
  INVx1_ASAP7_75t_R U51 ( .A(n80), .Y(n30) );
  INVx1_ASAP7_75t_R U52 ( .A(n97), .Y(n34) );
  INVx1_ASAP7_75t_R U53 ( .A(n78), .Y(n37) );
  INVx1_ASAP7_75t_R U54 ( .A(n76), .Y(n40) );
  INVx1_ASAP7_75t_R U55 ( .A(n74), .Y(n43) );
  INVx1_ASAP7_75t_R U56 ( .A(n70), .Y(n49) );
  INVx1_ASAP7_75t_R U57 ( .A(n66), .Y(n60) );
  INVx1_ASAP7_75t_R U58 ( .A(n86), .Y(n63) );
  INVx1_ASAP7_75t_R U59 ( .A(n83), .Y(n23) );
  INVx1_ASAP7_75t_R U60 ( .A(n84), .Y(n24) );
  INVx1_ASAP7_75t_R U61 ( .A(n100), .Y(n25) );
  INVx1_ASAP7_75t_R U62 ( .A(n81), .Y(n26) );
  INVx1_ASAP7_75t_R U63 ( .A(n82), .Y(n27) );
  INVx1_ASAP7_75t_R U64 ( .A(n98), .Y(n28) );
  INVx1_ASAP7_75t_R U65 ( .A(n79), .Y(n29) );
  INVx1_ASAP7_75t_R U66 ( .A(n99), .Y(n31) );
  INVx1_ASAP7_75t_R U67 ( .A(n106), .Y(n32) );
  INVx1_ASAP7_75t_R U68 ( .A(n96), .Y(n33) );
  INVx1_ASAP7_75t_R U69 ( .A(n105), .Y(n35) );
  INVx1_ASAP7_75t_R U70 ( .A(n77), .Y(n36) );
  INVx1_ASAP7_75t_R U71 ( .A(n95), .Y(n38) );
  INVx1_ASAP7_75t_R U72 ( .A(n75), .Y(n39) );
  INVx1_ASAP7_75t_R U73 ( .A(n94), .Y(n41) );
  INVx1_ASAP7_75t_R U74 ( .A(n73), .Y(n42) );
  INVx1_ASAP7_75t_R U75 ( .A(n93), .Y(n44) );
  INVx1_ASAP7_75t_R U76 ( .A(n87), .Y(n58) );
  INVx1_ASAP7_75t_R U77 ( .A(n88), .Y(n61) );
  fp32_exp_DW01_add_J8_4 FS_1 ( .A({net27205, \ab\[3\]\[9\] , n19, n18, n9, 
        n30, n34, \PRODUCT\[1\] , \ab\[0\]\[9\] , \ab\[3\]\[9\] , n16, n37, n8, 
        n40, n4, n43, n61, n22, \ab\[0\]\[9\] , n12, n6, n49, n3, n21, n60, 
        n63}), .B({net27205, n20, n11, n10, net27205, net27205, net27205, 
        net27205, net27205, n17, net27205, n15, net27205, n7, net27205, 
        net27205, net27205, net27205, n13, n5, net27205, n14, n2, net27205, 
        net27205, net27205}), .CI(net27205), .SUM({\PRODUCT\[27\] , 
        \PRODUCT\[26\] , \PRODUCT\[25\] , \PRODUCT\[24\] , \PRODUCT\[23\] , 
        \PRODUCT\[22\] , \PRODUCT\[21\] , \PRODUCT\[20\] , \PRODUCT\[19\] , 
        \PRODUCT\[18\] , \PRODUCT\[17\] , \PRODUCT\[16\] , \PRODUCT\[15\] , 
        \PRODUCT\[14\] , \PRODUCT\[13\] , \PRODUCT\[12\] , \PRODUCT\[11\] , 
        \PRODUCT\[10\] , \PRODUCT\[9\] , \PRODUCT\[8\] , \PRODUCT\[7\] , 
        \PRODUCT\[6\] , \PRODUCT\[5\] , \PRODUCT\[4\] , \PRODUCT\[3\] , 
        \PRODUCT\[2\] }) );
endmodule


module fp32_exp_DW01_add_43 ( .A({\A\[25\] , \A\[24\] , \A\[23\] , \A\[22\] , 
        \A\[21\] , \A\[20\] , \A\[19\] , \A\[18\] , \A\[17\] , \A\[16\] , 
        \A\[15\] , \A\[14\] , \A\[13\] , \A\[12\] , \A\[11\] , \A\[10\] , 
        \A\[9\] , \A\[8\] , \A\[7\] , \A\[6\] , \A\[5\] , \A\[4\] , \A\[3\] , 
        \A\[2\] , \A\[1\] , \A\[0\] }), .B({\B\[25\] , \B\[24\] , \B\[23\] , 
        \B\[22\] , \B\[21\] , \B\[20\] , \B\[19\] , \B\[18\] , \B\[17\] , 
        \B\[16\] , \B\[15\] , \B\[14\] , \B\[13\] , \B\[12\] , \B\[11\] , 
        \B\[10\] , \B\[9\] , \B\[8\] , \B\[7\] , \B\[6\] , \B\[5\] , \B\[4\] , 
        \B\[3\] , \B\[2\] , \B\[1\] , \B\[0\] }), CI, .SUM({\SUM\[25\] , 
        \SUM\[24\] , \SUM\[23\] , \SUM\[22\] , \SUM\[21\] , \SUM\[20\] , 
        \SUM\[19\] , \SUM\[18\] , \SUM\[17\] , \SUM\[16\] , \SUM\[15\] , 
        \SUM\[14\] , \SUM\[13\] , \SUM\[12\] , \SUM\[11\] , \SUM\[10\] , 
        \SUM\[9\] , \SUM\[8\] , \SUM\[7\] , \SUM\[6\] , \SUM\[5\] , \SUM\[4\] , 
        \SUM\[3\] , \SUM\[2\] , \SUM\[1\] , \SUM\[0\] }), CO );
  input \A\[25\] , \A\[24\] , \A\[23\] , \A\[22\] , \A\[21\] , \A\[20\] ,
         \A\[19\] , \A\[18\] , \A\[17\] , \A\[16\] , \A\[15\] , \A\[14\] ,
         \A\[13\] , \A\[12\] , \A\[11\] , \A\[10\] , \A\[9\] , \A\[8\] ,
         \A\[7\] , \A\[6\] , \A\[5\] , \A\[4\] , \A\[3\] , \A\[2\] , \A\[1\] ,
         \A\[0\] , \B\[25\] , \B\[24\] , \B\[23\] , \B\[22\] , \B\[21\] ,
         \B\[20\] , \B\[19\] , \B\[18\] , \B\[17\] , \B\[16\] , \B\[15\] ,
         \B\[14\] , \B\[13\] , \B\[12\] , \B\[11\] , \B\[10\] , \B\[9\] ,
         \B\[8\] , \B\[7\] , \B\[6\] , \B\[5\] , \B\[4\] , \B\[3\] , \B\[2\] ,
         \B\[1\] , \B\[0\] , CI;
  output \SUM\[25\] , \SUM\[24\] , \SUM\[23\] , \SUM\[22\] , \SUM\[21\] ,
         \SUM\[20\] , \SUM\[19\] , \SUM\[18\] , \SUM\[17\] , \SUM\[16\] ,
         \SUM\[15\] , \SUM\[14\] , \SUM\[13\] , \SUM\[12\] , \SUM\[11\] ,
         \SUM\[10\] , \SUM\[9\] , \SUM\[8\] , \SUM\[7\] , \SUM\[6\] ,
         \SUM\[5\] , \SUM\[4\] , \SUM\[3\] , \SUM\[2\] , \SUM\[1\] ,
         \SUM\[0\] , CO;
  wire   \A\[2\] , \A\[1\] , \A\[0\] , n1, n2, n3, n4, n5, n6, n7, n8, n11,
         n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25,
         n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39,
         n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53,
         n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67,
         n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81,
         n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94;
  assign \SUM\[2\]  = \A\[2\] ;
  assign \SUM\[1\]  = \A\[1\] ;
  assign \SUM\[0\]  = \A\[0\] ;

  AOI21xp5_ASAP7_75t_R U2 ( .A1(\B\[24\] ), .A2(\A\[24\] ), .B(n33), .Y(n31)
         );
  NOR2xp33_ASAP7_75t_R U3 ( .A(n79), .B(n6), .Y(n76) );
  AOI21xp5_ASAP7_75t_R U4 ( .A1(n59), .A2(n60), .B(n4), .Y(n55) );
  AOI211xp5_ASAP7_75t_R U5 ( .A1(n63), .A2(n64), .B(n65), .C(n66), .Y(n60) );
  NOR2xp33_ASAP7_75t_R U6 ( .A(\A\[24\] ), .B(\B\[16\] ), .Y(n54) );
  AOI21xp5_ASAP7_75t_R U7 ( .A1(n70), .A2(n71), .B(n72), .Y(n69) );
  NOR2xp33_ASAP7_75t_R U8 ( .A(n84), .B(n85), .Y(n83) );
  NOR3xp33_ASAP7_75t_R U9 ( .A(n24), .B(n92), .C(n16), .Y(n91) );
  NOR2xp33_ASAP7_75t_R U10 ( .A(n52), .B(n8), .Y(n51) );
  NOR2xp33_ASAP7_75t_R U11 ( .A(n5), .B(n63), .Y(n81) );
  NOR2xp33_ASAP7_75t_R U12 ( .A(n5), .B(n84), .Y(n11) );
  O2A1O1Ixp33_ASAP7_75t_R U13 ( .A1(n29), .A2(n30), .B(n31), .C(n32), .Y(
        \SUM\[25\] ) );
  NOR2xp33_ASAP7_75t_R U14 ( .A(\B\[24\] ), .B(\A\[24\] ), .Y(n32) );
  AOI21xp5_ASAP7_75t_R U15 ( .A1(n34), .A2(n37), .B(n33), .Y(n36) );
  AOI21xp5_ASAP7_75t_R U16 ( .A1(n76), .A2(n62), .B(n61), .Y(n75) );
  NOR2xp33_ASAP7_75t_R U17 ( .A(n88), .B(n7), .Y(n86) );
  NOR2xp33_ASAP7_75t_R U18 ( .A(n58), .B(n54), .Y(n57) );
  OR2x2_ASAP7_75t_R U19 ( .A(n48), .B(n2), .Y(n1) );
  OR2x2_ASAP7_75t_R U20 ( .A(n49), .B(n50), .Y(n2) );
  OA21x2_ASAP7_75t_R U21 ( .A1(n54), .A2(n55), .B(n56), .Y(n3) );
  AND2x2_ASAP7_75t_R U22 ( .A(n61), .B(\A\[15\] ), .Y(n4) );
  OA21x2_ASAP7_75t_R U23 ( .A1(n28), .A2(n73), .B(n68), .Y(n5) );
  OA21x2_ASAP7_75t_R U24 ( .A1(n65), .A2(n80), .B(n64), .Y(n6) );
  OR2x2_ASAP7_75t_R U25 ( .A(n89), .B(n85), .Y(n7) );
  OR2x2_ASAP7_75t_R U26 ( .A(n53), .B(n3), .Y(n8) );
  AND2x2_ASAP7_75t_R U27 ( .A(n27), .B(n28), .Y(\SUM\[3\] ) );
  NAND2xp5_ASAP7_75t_R U28 ( .A(n68), .B(n69), .Y(n59) );
  INVx1_ASAP7_75t_R U29 ( .A(n21), .Y(n18) );
  NOR2x1_ASAP7_75t_R U30 ( .A(n45), .B(n1), .Y(n40) );
  INVx1_ASAP7_75t_R U31 ( .A(\A\[15\] ), .Y(n74) );
  INVx1_ASAP7_75t_R U32 ( .A(n28), .Y(n71) );
  OAI21xp5_ASAP7_75t_R U33 ( .A1(n90), .A2(n91), .B(n14), .Y(n68) );
  NAND2xp5_ASAP7_75t_R U34 ( .A(\A\[5\] ), .B(n14), .Y(n94) );
  INVx1_ASAP7_75t_R U35 ( .A(\A\[11\] ), .Y(n87) );
  INVx1_ASAP7_75t_R U36 ( .A(\A\[7\] ), .Y(n53) );
  INVx1_ASAP7_75t_R U37 ( .A(\A\[18\] ), .Y(n52) );
  INVx1_ASAP7_75t_R U38 ( .A(\A\[19\] ), .Y(n49) );
  INVx1_ASAP7_75t_R U39 ( .A(\A\[20\] ), .Y(n48) );
  INVx1_ASAP7_75t_R U40 ( .A(\A\[21\] ), .Y(n45) );
  NAND2xp5_ASAP7_75t_R U41 ( .A(\A\[5\] ), .B(n22), .Y(n21) );
  XNOR2xp5_ASAP7_75t_R U42 ( .A(n11), .B(n85), .Y(\SUM\[9\] ) );
  XOR2xp5_ASAP7_75t_R U43 ( .A(n84), .B(n5), .Y(\SUM\[8\] ) );
  XNOR2xp5_ASAP7_75t_R U44 ( .A(n12), .B(n13), .Y(\SUM\[7\] ) );
  NAND2xp5_ASAP7_75t_R U45 ( .A(n14), .B(n15), .Y(n13) );
  OAI21xp5_ASAP7_75t_R U46 ( .A1(n16), .A2(n21), .B(n17), .Y(n12) );
  XNOR2xp5_ASAP7_75t_R U47 ( .A(n18), .B(n19), .Y(\SUM\[6\] ) );
  NAND2xp5_ASAP7_75t_R U48 ( .A(n20), .B(n17), .Y(n19) );
  XNOR2xp5_ASAP7_75t_R U49 ( .A(n92), .B(n22), .Y(\SUM\[5\] ) );
  OAI21xp5_ASAP7_75t_R U50 ( .A1(n28), .A2(n23), .B(n24), .Y(n22) );
  INVx1_ASAP7_75t_R U51 ( .A(n25), .Y(n23) );
  XNOR2xp5_ASAP7_75t_R U52 ( .A(n71), .B(n26), .Y(\SUM\[4\] ) );
  NAND2xp5_ASAP7_75t_R U53 ( .A(n24), .B(n25), .Y(n26) );
  INVx1_ASAP7_75t_R U54 ( .A(n34), .Y(n30) );
  XOR2xp5_ASAP7_75t_R U55 ( .A(n35), .B(n36), .Y(\SUM\[24\] ) );
  INVx1_ASAP7_75t_R U56 ( .A(n38), .Y(n33) );
  XNOR2xp5_ASAP7_75t_R U57 ( .A(\B\[24\] ), .B(\A\[24\] ), .Y(n35) );
  XOR2xp5_ASAP7_75t_R U58 ( .A(n39), .B(n29), .Y(\SUM\[23\] ) );
  INVx1_ASAP7_75t_R U59 ( .A(n37), .Y(n29) );
  AO21x1_ASAP7_75t_R U60 ( .A1(n40), .A2(n41), .B(n42), .Y(n37) );
  INVx1_ASAP7_75t_R U61 ( .A(n43), .Y(n42) );
  NAND2xp5_ASAP7_75t_R U62 ( .A(n34), .B(n38), .Y(n39) );
  NAND2xp5_ASAP7_75t_R U63 ( .A(\B\[23\] ), .B(\A\[23\] ), .Y(n38) );
  OR2x2_ASAP7_75t_R U64 ( .A(\A\[23\] ), .B(\B\[23\] ), .Y(n34) );
  XNOR2xp5_ASAP7_75t_R U65 ( .A(n44), .B(n40), .Y(\SUM\[22\] ) );
  NAND2xp5_ASAP7_75t_R U66 ( .A(n41), .B(n43), .Y(n44) );
  NAND2xp5_ASAP7_75t_R U67 ( .A(\B\[22\] ), .B(\A\[22\] ), .Y(n43) );
  NAND2xp5_ASAP7_75t_R U68 ( .A(n46), .B(n47), .Y(n41) );
  INVx1_ASAP7_75t_R U69 ( .A(\A\[22\] ), .Y(n47) );
  INVx1_ASAP7_75t_R U70 ( .A(\B\[22\] ), .Y(n46) );
  XOR2xp5_ASAP7_75t_R U71 ( .A(n45), .B(n1), .Y(\SUM\[21\] ) );
  XOR2xp5_ASAP7_75t_R U72 ( .A(n48), .B(n2), .Y(\SUM\[20\] ) );
  INVx1_ASAP7_75t_R U73 ( .A(n51), .Y(n50) );
  XNOR2xp5_ASAP7_75t_R U74 ( .A(n51), .B(n49), .Y(\SUM\[19\] ) );
  XOR2xp5_ASAP7_75t_R U75 ( .A(n52), .B(n8), .Y(\SUM\[18\] ) );
  XNOR2xp5_ASAP7_75t_R U76 ( .A(n3), .B(\A\[17\] ), .Y(\SUM\[17\] ) );
  XNOR2xp5_ASAP7_75t_R U77 ( .A(n55), .B(n57), .Y(\SUM\[16\] ) );
  INVx1_ASAP7_75t_R U78 ( .A(n56), .Y(n58) );
  NAND2xp5_ASAP7_75t_R U79 ( .A(\B\[16\] ), .B(\A\[24\] ), .Y(n56) );
  NAND3xp33_ASAP7_75t_R U80 ( .A(n62), .B(\A\[13\] ), .C(\A\[15\] ), .Y(n66)
         );
  INVx1_ASAP7_75t_R U81 ( .A(n67), .Y(n65) );
  INVx1_ASAP7_75t_R U82 ( .A(n64), .Y(n72) );
  INVx1_ASAP7_75t_R U83 ( .A(n73), .Y(n70) );
  XOR2xp5_ASAP7_75t_R U84 ( .A(n74), .B(n75), .Y(\SUM\[15\] ) );
  INVx1_ASAP7_75t_R U85 ( .A(n77), .Y(n61) );
  XNOR2xp5_ASAP7_75t_R U86 ( .A(n76), .B(n78), .Y(\SUM\[14\] ) );
  NAND2xp5_ASAP7_75t_R U87 ( .A(n62), .B(n77), .Y(n78) );
  NAND2xp5_ASAP7_75t_R U88 ( .A(\B\[14\] ), .B(\A\[14\] ), .Y(n77) );
  OR2x2_ASAP7_75t_R U89 ( .A(\A\[14\] ), .B(\B\[14\] ), .Y(n62) );
  INVx1_ASAP7_75t_R U90 ( .A(\A\[13\] ), .Y(n79) );
  XOR2xp5_ASAP7_75t_R U91 ( .A(n79), .B(n6), .Y(\SUM\[13\] ) );
  INVx1_ASAP7_75t_R U92 ( .A(n81), .Y(n80) );
  XNOR2xp5_ASAP7_75t_R U93 ( .A(n81), .B(n82), .Y(\SUM\[12\] ) );
  NAND2xp5_ASAP7_75t_R U94 ( .A(n67), .B(n64), .Y(n82) );
  NAND2xp5_ASAP7_75t_R U95 ( .A(\B\[12\] ), .B(\A\[12\] ), .Y(n64) );
  OR2x2_ASAP7_75t_R U96 ( .A(\A\[12\] ), .B(\B\[12\] ), .Y(n67) );
  NAND3xp33_ASAP7_75t_R U97 ( .A(n83), .B(\A\[10\] ), .C(\A\[11\] ), .Y(n63)
         );
  XNOR2xp5_ASAP7_75t_R U98 ( .A(n86), .B(n87), .Y(\SUM\[11\] ) );
  INVx1_ASAP7_75t_R U99 ( .A(\A\[10\] ), .Y(n88) );
  XOR2xp5_ASAP7_75t_R U100 ( .A(n88), .B(n7), .Y(\SUM\[10\] ) );
  INVx1_ASAP7_75t_R U101 ( .A(\A\[9\] ), .Y(n85) );
  INVx1_ASAP7_75t_R U102 ( .A(n11), .Y(n89) );
  INVx1_ASAP7_75t_R U103 ( .A(\A\[8\] ), .Y(n84) );
  NAND2xp5_ASAP7_75t_R U104 ( .A(\B\[4\] ), .B(\A\[4\] ), .Y(n24) );
  INVx1_ASAP7_75t_R U105 ( .A(n20), .Y(n16) );
  INVx1_ASAP7_75t_R U106 ( .A(\A\[5\] ), .Y(n92) );
  NAND2xp5_ASAP7_75t_R U107 ( .A(n15), .B(n17), .Y(n90) );
  NAND2xp5_ASAP7_75t_R U108 ( .A(\B\[6\] ), .B(\A\[6\] ), .Y(n17) );
  NAND2xp5_ASAP7_75t_R U109 ( .A(\B\[7\] ), .B(\A\[7\] ), .Y(n15) );
  OR2x2_ASAP7_75t_R U110 ( .A(n93), .B(n94), .Y(n73) );
  OR2x2_ASAP7_75t_R U111 ( .A(\A\[7\] ), .B(\B\[7\] ), .Y(n14) );
  NAND2xp5_ASAP7_75t_R U112 ( .A(n20), .B(n25), .Y(n93) );
  OR2x2_ASAP7_75t_R U113 ( .A(\A\[4\] ), .B(\B\[4\] ), .Y(n25) );
  OR2x2_ASAP7_75t_R U114 ( .A(\A\[6\] ), .B(\B\[6\] ), .Y(n20) );
  OR2x2_ASAP7_75t_R U115 ( .A(\A\[3\] ), .B(\B\[3\] ), .Y(n27) );
  NAND2xp5_ASAP7_75t_R U116 ( .A(\B\[3\] ), .B(\A\[3\] ), .Y(n28) );
endmodule


module fp32_exp_DW02_mult_9 ( .A({\A\[3\] , \A\[2\] , \A\[1\] , \A\[0\] }), 
    .B({\B\[23\] , \B\[22\] , \B\[21\] , \B\[20\] , \B\[19\] , \B\[18\] , 
        \B\[17\] , \B\[16\] , \B\[15\] , \B\[14\] , \B\[13\] , \B\[12\] , 
        \B\[11\] , \B\[10\] , \B\[9\] , \B\[8\] , \B\[7\] , \B\[6\] , \B\[5\] , 
        \B\[4\] , \B\[3\] , \B\[2\] , \B\[1\] , \B\[0\] }), TC, .PRODUCT({
        \PRODUCT\[27\] , \PRODUCT\[26\] , \PRODUCT\[25\] , \PRODUCT\[24\] , 
        \PRODUCT\[23\] , \PRODUCT\[22\] , \PRODUCT\[21\] , \PRODUCT\[20\] , 
        \PRODUCT\[19\] , \PRODUCT\[18\] , \PRODUCT\[17\] , \PRODUCT\[16\] , 
        \PRODUCT\[15\] , \PRODUCT\[14\] , \PRODUCT\[13\] , \PRODUCT\[12\] , 
        \PRODUCT\[11\] , \PRODUCT\[10\] , \PRODUCT\[9\] , \PRODUCT\[8\] , 
        \PRODUCT\[7\] , \PRODUCT\[6\] , \PRODUCT\[5\] , \PRODUCT\[4\] , 
        \PRODUCT\[3\] , \PRODUCT\[2\] , \PRODUCT\[1\] , \PRODUCT\[0\] }) );
  input \A\[3\] , \A\[2\] , \A\[1\] , \A\[0\] , \B\[23\] , \B\[22\] ,
         \B\[21\] , \B\[20\] , \B\[19\] , \B\[18\] , \B\[17\] , \B\[16\] ,
         \B\[15\] , \B\[14\] , \B\[13\] , \B\[12\] , \B\[11\] , \B\[10\] ,
         \B\[9\] , \B\[8\] , \B\[7\] , \B\[6\] , \B\[5\] , \B\[4\] , \B\[3\] ,
         \B\[2\] , \B\[1\] , \B\[0\] , TC;
  output \PRODUCT\[27\] , \PRODUCT\[26\] , \PRODUCT\[25\] , \PRODUCT\[24\] ,
         \PRODUCT\[23\] , \PRODUCT\[22\] , \PRODUCT\[21\] , \PRODUCT\[20\] ,
         \PRODUCT\[19\] , \PRODUCT\[18\] , \PRODUCT\[17\] , \PRODUCT\[16\] ,
         \PRODUCT\[15\] , \PRODUCT\[14\] , \PRODUCT\[13\] , \PRODUCT\[12\] ,
         \PRODUCT\[11\] , \PRODUCT\[10\] , \PRODUCT\[9\] , \PRODUCT\[8\] ,
         \PRODUCT\[7\] , \PRODUCT\[6\] , \PRODUCT\[5\] , \PRODUCT\[4\] ,
         \PRODUCT\[3\] , \PRODUCT\[2\] , \PRODUCT\[1\] , \PRODUCT\[0\] ;
  wire   net27197, \ab\[3\]\[9\] , \ab\[2\]\[9\] , \ab\[1\]\[9\] ,
         \ab\[0\]\[9\] , n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13,
         n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27,
         n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41,
         n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n55, n56,
         n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70,
         n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84,
         n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98,
         n99, n100, n101, n102, n103, n104, n105, n106;
  assign \ab\[3\]\[9\]  = \A\[3\] ;
  assign \ab\[2\]\[9\]  = \A\[2\] ;
  assign \ab\[1\]\[9\]  = \A\[1\] ;
  assign \ab\[0\]\[9\]  = \A\[0\] ;

  FAx1_ASAP7_75t_R S4_0 ( .A(\ab\[3\]\[9\] ), .B(n62), .CI(n61), .CON(n65), 
        .SN(n66) );
  FAx1_ASAP7_75t_R S4_1 ( .A(\ab\[3\]\[9\] ), .B(n58), .CI(\PRODUCT\[1\] ), 
        .CON(n67), .SN(n68) );
  FAx1_ASAP7_75t_R S4_3 ( .A(\ab\[3\]\[9\] ), .B(n52), .CI(n50), .CON(n69), 
        .SN(n70) );
  FAx1_ASAP7_75t_R S4_4 ( .A(\ab\[3\]\[9\] ), .B(n47), .CI(\ab\[2\]\[9\] ), 
        .CON(n71), .SN(n72) );
  FAx1_ASAP7_75t_R S4_9 ( .A(\ab\[3\]\[9\] ), .B(n44), .CI(n22), .CON(n73), 
        .SN(n74) );
  FAx1_ASAP7_75t_R S4_11 ( .A(\ab\[3\]\[9\] ), .B(n41), .CI(n22), .CON(n75), 
        .SN(n76) );
  FAx1_ASAP7_75t_R S4_13 ( .A(\ab\[3\]\[9\] ), .B(n38), .CI(n22), .CON(n77), 
        .SN(n78) );
  FAx1_ASAP7_75t_R S4_19 ( .A(\ab\[3\]\[9\] ), .B(n33), .CI(n31), .CON(n79), 
        .SN(n80) );
  FAx1_ASAP7_75t_R S4_20 ( .A(\ab\[3\]\[9\] ), .B(n28), .CI(n61), .CON(n81), 
        .SN(n82) );
  FAx1_ASAP7_75t_R S4_21 ( .A(\ab\[3\]\[9\] ), .B(n25), .CI(n22), .CON(n83), 
        .SN(n84) );
  FAx1_ASAP7_75t_R S1_2_0 ( .A(\ab\[2\]\[9\] ), .B(n64), .CI(n22), .CON(n85), 
        .SN(n86) );
  FAx1_ASAP7_75t_R S2_2_3 ( .A(\ab\[2\]\[9\] ), .B(n55), .CI(\PRODUCT\[1\] ), 
        .CON(n89), .SN(n90) );
  FAx1_ASAP7_75t_R S2_2_4 ( .A(\ab\[2\]\[9\] ), .B(n51), .CI(n22), .CON(n91), 
        .SN(n92) );
  FAx1_ASAP7_75t_R S2_2_19 ( .A(\ab\[2\]\[9\] ), .B(n35), .CI(\PRODUCT\[1\] ), 
        .CON(n96), .SN(n97) );
  FAx1_ASAP7_75t_R S2_2_20 ( .A(\ab\[2\]\[9\] ), .B(n32), .CI(n22), .CON(n98), 
        .SN(n99) );
  AND2x2_ASAP7_75t_R U2 ( .A(n59), .B(n57), .Y(n2) );
  XOR2xp5_ASAP7_75t_R U3 ( .A(n53), .B(n56), .Y(n3) );
  XOR2xp5_ASAP7_75t_R U4 ( .A(n61), .B(n42), .Y(n4) );
  AND2x2_ASAP7_75t_R U5 ( .A(n48), .B(n46), .Y(n5) );
  XOR2xp5_ASAP7_75t_R U6 ( .A(n46), .B(n48), .Y(n6) );
  AND2x2_ASAP7_75t_R U7 ( .A(n42), .B(n61), .Y(n7) );
  XOR2xp5_ASAP7_75t_R U8 ( .A(n61), .B(n39), .Y(n8) );
  XOR2xp5_ASAP7_75t_R U9 ( .A(n27), .B(n29), .Y(n9) );
  AND2x2_ASAP7_75t_R U10 ( .A(n29), .B(n27), .Y(n10) );
  AND2x2_ASAP7_75t_R U11 ( .A(n26), .B(n24), .Y(n11) );
  XOR2xp5_ASAP7_75t_R U12 ( .A(\ab\[3\]\[9\] ), .B(n45), .Y(n12) );
  AND2x2_ASAP7_75t_R U13 ( .A(n45), .B(\ab\[3\]\[9\] ), .Y(n13) );
  AND2x2_ASAP7_75t_R U14 ( .A(n56), .B(n53), .Y(n14) );
  AND2x2_ASAP7_75t_R U15 ( .A(n39), .B(n61), .Y(n15) );
  XOR2xp5_ASAP7_75t_R U16 ( .A(\ab\[2\]\[9\] ), .B(n36), .Y(n16) );
  AND2x2_ASAP7_75t_R U17 ( .A(n36), .B(\ab\[2\]\[9\] ), .Y(n17) );
  XOR2xp5_ASAP7_75t_R U18 ( .A(n24), .B(n26), .Y(n18) );
  XOR2xp5_ASAP7_75t_R U19 ( .A(\ab\[2\]\[9\] ), .B(n23), .Y(n19) );
  AND2x2_ASAP7_75t_R U20 ( .A(n23), .B(\ab\[2\]\[9\] ), .Y(n20) );
  XOR2xp5_ASAP7_75t_R U21 ( .A(n57), .B(n59), .Y(n21) );
  BUFx2_ASAP7_75t_R U22 ( .A(\ab\[1\]\[9\] ), .Y(n22) );
  TIELOx1_ASAP7_75t_R U23 ( .L(net27197) );
  NAND2xp5_ASAP7_75t_R U24 ( .A(\ab\[0\]\[9\] ), .B(n22), .Y(n101) );
  NAND2xp5_ASAP7_75t_R U25 ( .A(\ab\[0\]\[9\] ), .B(n22), .Y(n102) );
  NAND2xp5_ASAP7_75t_R U26 ( .A(\ab\[0\]\[9\] ), .B(n22), .Y(n103) );
  XNOR2xp5_ASAP7_75t_R U27 ( .A(n22), .B(\ab\[0\]\[9\] ), .Y(n104) );
  NAND2xp5_ASAP7_75t_R U28 ( .A(\ab\[0\]\[9\] ), .B(n22), .Y(n105) );
  NAND2xp5_ASAP7_75t_R U29 ( .A(\ab\[0\]\[9\] ), .B(n22), .Y(n106) );
  NAND2xp5_ASAP7_75t_R U30 ( .A(\ab\[2\]\[9\] ), .B(\ab\[0\]\[9\] ), .Y(n87)
         );
  XNOR2xp5_ASAP7_75t_R U31 ( .A(\ab\[0\]\[9\] ), .B(\ab\[2\]\[9\] ), .Y(n88)
         );
  NAND2xp5_ASAP7_75t_R U32 ( .A(\ab\[2\]\[9\] ), .B(\ab\[0\]\[9\] ), .Y(n93)
         );
  NAND2xp5_ASAP7_75t_R U33 ( .A(\ab\[2\]\[9\] ), .B(\ab\[0\]\[9\] ), .Y(n94)
         );
  NAND2xp5_ASAP7_75t_R U34 ( .A(\ab\[2\]\[9\] ), .B(\ab\[0\]\[9\] ), .Y(n95)
         );
  NAND2xp5_ASAP7_75t_R U35 ( .A(\ab\[2\]\[9\] ), .B(\ab\[0\]\[9\] ), .Y(n100)
         );
  INVxp67_ASAP7_75t_R U36 ( .A(n71), .Y(n45) );
  INVx1_ASAP7_75t_R U37 ( .A(n103), .Y(n51) );
  INVx1_ASAP7_75t_R U38 ( .A(n102), .Y(n55) );
  INVx1_ASAP7_75t_R U39 ( .A(n104), .Y(\PRODUCT\[1\] ) );
  INVx1_ASAP7_75t_R U40 ( .A(n101), .Y(n64) );
  INVx1_ASAP7_75t_R U41 ( .A(n91), .Y(n47) );
  INVx1_ASAP7_75t_R U42 ( .A(n89), .Y(n52) );
  INVx1_ASAP7_75t_R U43 ( .A(n92), .Y(n50) );
  INVx1_ASAP7_75t_R U44 ( .A(n85), .Y(n62) );
  INVx1_ASAP7_75t_R U45 ( .A(n69), .Y(n48) );
  INVx1_ASAP7_75t_R U46 ( .A(n72), .Y(n46) );
  INVx1_ASAP7_75t_R U47 ( .A(n67), .Y(n56) );
  INVx1_ASAP7_75t_R U48 ( .A(n90), .Y(n53) );
  INVx1_ASAP7_75t_R U49 ( .A(n65), .Y(n59) );
  INVx1_ASAP7_75t_R U50 ( .A(n68), .Y(n57) );
  INVx1_ASAP7_75t_R U51 ( .A(n80), .Y(n30) );
  INVx1_ASAP7_75t_R U52 ( .A(n97), .Y(n34) );
  INVx1_ASAP7_75t_R U53 ( .A(n78), .Y(n37) );
  INVx1_ASAP7_75t_R U54 ( .A(n76), .Y(n40) );
  INVx1_ASAP7_75t_R U55 ( .A(n74), .Y(n43) );
  INVx1_ASAP7_75t_R U56 ( .A(n70), .Y(n49) );
  INVx1_ASAP7_75t_R U57 ( .A(n66), .Y(n60) );
  INVx1_ASAP7_75t_R U58 ( .A(n86), .Y(n63) );
  INVx1_ASAP7_75t_R U59 ( .A(n83), .Y(n23) );
  INVx1_ASAP7_75t_R U60 ( .A(n84), .Y(n24) );
  INVx1_ASAP7_75t_R U61 ( .A(n100), .Y(n25) );
  INVx1_ASAP7_75t_R U62 ( .A(n81), .Y(n26) );
  INVx1_ASAP7_75t_R U63 ( .A(n82), .Y(n27) );
  INVx1_ASAP7_75t_R U64 ( .A(n98), .Y(n28) );
  INVx1_ASAP7_75t_R U65 ( .A(n79), .Y(n29) );
  INVx1_ASAP7_75t_R U66 ( .A(n99), .Y(n31) );
  INVx1_ASAP7_75t_R U67 ( .A(n106), .Y(n32) );
  INVx1_ASAP7_75t_R U68 ( .A(n96), .Y(n33) );
  INVx1_ASAP7_75t_R U69 ( .A(n105), .Y(n35) );
  INVx1_ASAP7_75t_R U70 ( .A(n77), .Y(n36) );
  INVx1_ASAP7_75t_R U71 ( .A(n95), .Y(n38) );
  INVx1_ASAP7_75t_R U72 ( .A(n75), .Y(n39) );
  INVx1_ASAP7_75t_R U73 ( .A(n94), .Y(n41) );
  INVx1_ASAP7_75t_R U74 ( .A(n73), .Y(n42) );
  INVx1_ASAP7_75t_R U75 ( .A(n93), .Y(n44) );
  INVx1_ASAP7_75t_R U76 ( .A(n87), .Y(n58) );
  INVx1_ASAP7_75t_R U77 ( .A(n88), .Y(n61) );
  fp32_exp_DW01_add_43 FS_1 ( .A({net27197, \ab\[3\]\[9\] , n19, n18, n9, n30, 
        n34, \PRODUCT\[1\] , \ab\[0\]\[9\] , \ab\[3\]\[9\] , n16, n37, n8, n40, 
        n4, n43, n61, n22, \ab\[0\]\[9\] , n12, n6, n49, n3, n21, n60, n63}), 
        .B({net27197, n20, n11, n10, net27197, net27197, net27197, net27197, 
        net27197, n17, net27197, n15, net27197, n7, net27197, net27197, 
        net27197, net27197, n13, n5, net27197, n14, n2, net27197, net27197, 
        net27197}), .CI(net27197), .SUM({\PRODUCT\[27\] , \PRODUCT\[26\] , 
        \PRODUCT\[25\] , \PRODUCT\[24\] , \PRODUCT\[23\] , \PRODUCT\[22\] , 
        \PRODUCT\[21\] , \PRODUCT\[20\] , \PRODUCT\[19\] , \PRODUCT\[18\] , 
        \PRODUCT\[17\] , \PRODUCT\[16\] , \PRODUCT\[15\] , \PRODUCT\[14\] , 
        \PRODUCT\[13\] , \PRODUCT\[12\] , \PRODUCT\[11\] , \PRODUCT\[10\] , 
        \PRODUCT\[9\] , \PRODUCT\[8\] , \PRODUCT\[7\] , \PRODUCT\[6\] , 
        \PRODUCT\[5\] , \PRODUCT\[4\] , \PRODUCT\[3\] , \PRODUCT\[2\] }) );
endmodule


module fp32_exp_DW01_add_J8_5 ( .A({\A\[25\] , \A\[24\] , \A\[23\] , \A\[22\] , 
        \A\[21\] , \A\[20\] , \A\[19\] , \A\[18\] , \A\[17\] , \A\[16\] , 
        \A\[15\] , \A\[14\] , \A\[13\] , \A\[12\] , \A\[11\] , \A\[10\] , 
        \A\[9\] , \A\[8\] , \A\[7\] , \A\[6\] , \A\[5\] , \A\[4\] , \A\[3\] , 
        \A\[2\] , \A\[1\] , \A\[0\] }), .B({\B\[25\] , \B\[24\] , \B\[23\] , 
        \B\[22\] , \B\[21\] , \B\[20\] , \B\[19\] , \B\[18\] , \B\[17\] , 
        \B\[16\] , \B\[15\] , \B\[14\] , \B\[13\] , \B\[12\] , \B\[11\] , 
        \B\[10\] , \B\[9\] , \B\[8\] , \B\[7\] , \B\[6\] , \B\[5\] , \B\[4\] , 
        \B\[3\] , \B\[2\] , \B\[1\] , \B\[0\] }), CI, .SUM({\SUM\[25\] , 
        \SUM\[24\] , \SUM\[23\] , \SUM\[22\] , \SUM\[21\] , \SUM\[20\] , 
        \SUM\[19\] , \SUM\[18\] , \SUM\[17\] , \SUM\[16\] , \SUM\[15\] , 
        \SUM\[14\] , \SUM\[13\] , \SUM\[12\] , \SUM\[11\] , \SUM\[10\] , 
        \SUM\[9\] , \SUM\[8\] , \SUM\[7\] , \SUM\[6\] , \SUM\[5\] , \SUM\[4\] , 
        \SUM\[3\] , \SUM\[2\] , \SUM\[1\] , \SUM\[0\] }), CO );
  input \A\[25\] , \A\[24\] , \A\[23\] , \A\[22\] , \A\[21\] , \A\[20\] ,
         \A\[19\] , \A\[18\] , \A\[17\] , \A\[16\] , \A\[15\] , \A\[14\] ,
         \A\[13\] , \A\[12\] , \A\[11\] , \A\[10\] , \A\[9\] , \A\[8\] ,
         \A\[7\] , \A\[6\] , \A\[5\] , \A\[4\] , \A\[3\] , \A\[2\] , \A\[1\] ,
         \A\[0\] , \B\[25\] , \B\[24\] , \B\[23\] , \B\[22\] , \B\[21\] ,
         \B\[20\] , \B\[19\] , \B\[18\] , \B\[17\] , \B\[16\] , \B\[15\] ,
         \B\[14\] , \B\[13\] , \B\[12\] , \B\[11\] , \B\[10\] , \B\[9\] ,
         \B\[8\] , \B\[7\] , \B\[6\] , \B\[5\] , \B\[4\] , \B\[3\] , \B\[2\] ,
         \B\[1\] , \B\[0\] , CI;
  output \SUM\[25\] , \SUM\[24\] , \SUM\[23\] , \SUM\[22\] , \SUM\[21\] ,
         \SUM\[20\] , \SUM\[19\] , \SUM\[18\] , \SUM\[17\] , \SUM\[16\] ,
         \SUM\[15\] , \SUM\[14\] , \SUM\[13\] , \SUM\[12\] , \SUM\[11\] ,
         \SUM\[10\] , \SUM\[9\] , \SUM\[8\] , \SUM\[7\] , \SUM\[6\] ,
         \SUM\[5\] , \SUM\[4\] , \SUM\[3\] , \SUM\[2\] , \SUM\[1\] ,
         \SUM\[0\] , CO;
  wire   \A\[2\] , \A\[1\] , \A\[0\] , n1, n2, n3, n4, n5, n6, n7, n8, n11,
         n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25,
         n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39,
         n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53,
         n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68,
         n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82,
         n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93;
  assign \SUM\[2\]  = \A\[2\] ;
  assign \SUM\[1\]  = \A\[1\] ;
  assign \SUM\[0\]  = \A\[0\] ;

  INVx1_ASAP7_75t_R U2 ( .A(\A\[7\] ), .Y(n13) );
  INVx1_ASAP7_75t_R U3 ( .A(n15), .Y(n87) );
  INVx1_ASAP7_75t_R U5 ( .A(n52), .Y(n55) );
  INVx1_ASAP7_75t_R U6 ( .A(\B\[24\] ), .Y(n33) );
  INVx1_ASAP7_75t_R U7 ( .A(\B\[24\] ), .Y(n30) );
  INVx1_ASAP7_75t_R U8 ( .A(\B\[16\] ), .Y(n52) );
  INVx1_ASAP7_75t_R U9 ( .A(n31), .Y(n29) );
  INVxp67_ASAP7_75t_R U10 ( .A(n35), .Y(n27) );
  NOR2xp33_ASAP7_75t_R U11 ( .A(n76), .B(n6), .Y(n73) );
  AOI21xp5_ASAP7_75t_R U12 ( .A1(n56), .A2(n57), .B(n4), .Y(n53) );
  AOI211xp5_ASAP7_75t_R U13 ( .A1(n60), .A2(n61), .B(n62), .C(n63), .Y(n57) );
  AOI21xp5_ASAP7_75t_R U14 ( .A1(n67), .A2(n68), .B(n69), .Y(n66) );
  NOR2xp33_ASAP7_75t_R U15 ( .A(n81), .B(n82), .Y(n80) );
  NOR3xp33_ASAP7_75t_R U16 ( .A(n22), .B(n89), .C(n14), .Y(n88) );
  NOR2xp33_ASAP7_75t_R U17 ( .A(n50), .B(n8), .Y(n49) );
  NOR2xp33_ASAP7_75t_R U18 ( .A(n5), .B(n60), .Y(n78) );
  NOR2xp33_ASAP7_75t_R U19 ( .A(n5), .B(n81), .Y(n11) );
  AOI21xp5_ASAP7_75t_R U20 ( .A1(n32), .A2(n35), .B(n31), .Y(n34) );
  AOI21xp5_ASAP7_75t_R U21 ( .A1(n73), .A2(n59), .B(n58), .Y(n72) );
  NOR2xp33_ASAP7_75t_R U22 ( .A(n85), .B(n7), .Y(n83) );
  OR2x2_ASAP7_75t_R U23 ( .A(n46), .B(n2), .Y(n1) );
  OR2x2_ASAP7_75t_R U24 ( .A(n47), .B(n48), .Y(n2) );
  AND2x2_ASAP7_75t_R U25 ( .A(n58), .B(\A\[15\] ), .Y(n4) );
  OA21x2_ASAP7_75t_R U26 ( .A1(n26), .A2(n70), .B(n65), .Y(n5) );
  OA21x2_ASAP7_75t_R U27 ( .A1(n62), .A2(n77), .B(n61), .Y(n6) );
  OR2x2_ASAP7_75t_R U28 ( .A(n86), .B(n82), .Y(n7) );
  OR2x2_ASAP7_75t_R U29 ( .A(n51), .B(n3), .Y(n8) );
  AND2x2_ASAP7_75t_R U30 ( .A(n25), .B(n26), .Y(\SUM\[3\] ) );
  NAND2xp5_ASAP7_75t_R U32 ( .A(n65), .B(n66), .Y(n56) );
  INVx1_ASAP7_75t_R U33 ( .A(n19), .Y(n16) );
  NOR2x1_ASAP7_75t_R U34 ( .A(n43), .B(n1), .Y(n38) );
  INVx1_ASAP7_75t_R U35 ( .A(\A\[15\] ), .Y(n71) );
  INVx1_ASAP7_75t_R U36 ( .A(n26), .Y(n68) );
  OAI21xp5_ASAP7_75t_R U37 ( .A1(n87), .A2(n88), .B(\A\[7\] ), .Y(n65) );
  NAND2xp5_ASAP7_75t_R U38 ( .A(\A\[5\] ), .B(\A\[7\] ), .Y(n91) );
  INVx1_ASAP7_75t_R U39 ( .A(\A\[11\] ), .Y(n84) );
  INVx1_ASAP7_75t_R U40 ( .A(\A\[7\] ), .Y(n51) );
  INVx1_ASAP7_75t_R U41 ( .A(\A\[18\] ), .Y(n50) );
  INVx1_ASAP7_75t_R U42 ( .A(\A\[19\] ), .Y(n47) );
  INVx1_ASAP7_75t_R U43 ( .A(\A\[20\] ), .Y(n46) );
  INVx1_ASAP7_75t_R U44 ( .A(\A\[21\] ), .Y(n43) );
  NAND2xp5_ASAP7_75t_R U45 ( .A(\A\[5\] ), .B(n20), .Y(n19) );
  O2A1O1Ixp33_ASAP7_75t_R U46 ( .A1(n27), .A2(n28), .B(n29), .C(n30), .Y(
        \SUM\[25\] ) );
  XNOR2xp5_ASAP7_75t_R U47 ( .A(n11), .B(n82), .Y(\SUM\[9\] ) );
  XOR2xp5_ASAP7_75t_R U48 ( .A(n81), .B(n5), .Y(\SUM\[8\] ) );
  XNOR2xp5_ASAP7_75t_R U49 ( .A(n12), .B(n13), .Y(\SUM\[7\] ) );
  OAI21xp5_ASAP7_75t_R U50 ( .A1(n14), .A2(n19), .B(n15), .Y(n12) );
  XNOR2xp5_ASAP7_75t_R U51 ( .A(n16), .B(n17), .Y(\SUM\[6\] ) );
  NAND2xp5_ASAP7_75t_R U52 ( .A(n18), .B(n15), .Y(n17) );
  XNOR2xp5_ASAP7_75t_R U53 ( .A(n89), .B(n20), .Y(\SUM\[5\] ) );
  OAI21xp5_ASAP7_75t_R U54 ( .A1(n26), .A2(n21), .B(n22), .Y(n20) );
  INVx1_ASAP7_75t_R U55 ( .A(n23), .Y(n21) );
  XNOR2xp5_ASAP7_75t_R U56 ( .A(n68), .B(n24), .Y(\SUM\[4\] ) );
  NAND2xp5_ASAP7_75t_R U57 ( .A(n22), .B(n23), .Y(n24) );
  INVx1_ASAP7_75t_R U58 ( .A(n32), .Y(n28) );
  XOR2xp5_ASAP7_75t_R U59 ( .A(n33), .B(n34), .Y(\SUM\[24\] ) );
  INVx1_ASAP7_75t_R U60 ( .A(n36), .Y(n31) );
  XOR2xp5_ASAP7_75t_R U61 ( .A(n37), .B(n27), .Y(\SUM\[23\] ) );
  AO21x1_ASAP7_75t_R U62 ( .A1(n38), .A2(n39), .B(n40), .Y(n35) );
  INVx1_ASAP7_75t_R U63 ( .A(n41), .Y(n40) );
  NAND2xp5_ASAP7_75t_R U64 ( .A(n32), .B(n36), .Y(n37) );
  NAND2xp5_ASAP7_75t_R U65 ( .A(\B\[23\] ), .B(\A\[23\] ), .Y(n36) );
  OR2x2_ASAP7_75t_R U66 ( .A(\A\[23\] ), .B(\B\[23\] ), .Y(n32) );
  XNOR2xp5_ASAP7_75t_R U67 ( .A(n42), .B(n38), .Y(\SUM\[22\] ) );
  NAND2xp5_ASAP7_75t_R U68 ( .A(n39), .B(n41), .Y(n42) );
  NAND2xp5_ASAP7_75t_R U69 ( .A(\B\[22\] ), .B(\A\[22\] ), .Y(n41) );
  NAND2xp5_ASAP7_75t_R U70 ( .A(n44), .B(n45), .Y(n39) );
  INVx1_ASAP7_75t_R U71 ( .A(\A\[22\] ), .Y(n45) );
  INVx1_ASAP7_75t_R U72 ( .A(\B\[22\] ), .Y(n44) );
  XOR2xp5_ASAP7_75t_R U73 ( .A(n43), .B(n1), .Y(\SUM\[21\] ) );
  XOR2xp5_ASAP7_75t_R U74 ( .A(n46), .B(n2), .Y(\SUM\[20\] ) );
  INVx1_ASAP7_75t_R U75 ( .A(n49), .Y(n48) );
  XNOR2xp5_ASAP7_75t_R U76 ( .A(n49), .B(n47), .Y(\SUM\[19\] ) );
  XOR2xp5_ASAP7_75t_R U77 ( .A(n50), .B(n8), .Y(\SUM\[18\] ) );
  XNOR2xp5_ASAP7_75t_R U78 ( .A(n3), .B(\A\[17\] ), .Y(\SUM\[17\] ) );
  XNOR2xp5_ASAP7_75t_R U79 ( .A(n53), .B(n55), .Y(\SUM\[16\] ) );
  NAND3xp33_ASAP7_75t_R U80 ( .A(n59), .B(\A\[13\] ), .C(\A\[15\] ), .Y(n63)
         );
  INVx1_ASAP7_75t_R U81 ( .A(n64), .Y(n62) );
  INVx1_ASAP7_75t_R U82 ( .A(n61), .Y(n69) );
  INVx1_ASAP7_75t_R U83 ( .A(n70), .Y(n67) );
  XOR2xp5_ASAP7_75t_R U84 ( .A(n71), .B(n72), .Y(\SUM\[15\] ) );
  INVx1_ASAP7_75t_R U85 ( .A(n74), .Y(n58) );
  XNOR2xp5_ASAP7_75t_R U86 ( .A(n73), .B(n75), .Y(\SUM\[14\] ) );
  NAND2xp5_ASAP7_75t_R U87 ( .A(n59), .B(n74), .Y(n75) );
  NAND2xp5_ASAP7_75t_R U88 ( .A(\B\[14\] ), .B(\A\[14\] ), .Y(n74) );
  OR2x2_ASAP7_75t_R U89 ( .A(\A\[14\] ), .B(\B\[14\] ), .Y(n59) );
  INVx1_ASAP7_75t_R U90 ( .A(\A\[13\] ), .Y(n76) );
  XOR2xp5_ASAP7_75t_R U91 ( .A(n76), .B(n6), .Y(\SUM\[13\] ) );
  INVx1_ASAP7_75t_R U92 ( .A(n78), .Y(n77) );
  XNOR2xp5_ASAP7_75t_R U93 ( .A(n78), .B(n79), .Y(\SUM\[12\] ) );
  NAND2xp5_ASAP7_75t_R U94 ( .A(n64), .B(n61), .Y(n79) );
  NAND2xp5_ASAP7_75t_R U95 ( .A(\B\[12\] ), .B(\A\[12\] ), .Y(n61) );
  OR2x2_ASAP7_75t_R U96 ( .A(\A\[12\] ), .B(\B\[12\] ), .Y(n64) );
  NAND3xp33_ASAP7_75t_R U97 ( .A(n80), .B(\A\[10\] ), .C(\A\[11\] ), .Y(n60)
         );
  XNOR2xp5_ASAP7_75t_R U98 ( .A(n83), .B(n84), .Y(\SUM\[11\] ) );
  INVx1_ASAP7_75t_R U99 ( .A(\A\[10\] ), .Y(n85) );
  XOR2xp5_ASAP7_75t_R U100 ( .A(n85), .B(n7), .Y(\SUM\[10\] ) );
  INVx1_ASAP7_75t_R U101 ( .A(\A\[9\] ), .Y(n82) );
  INVx1_ASAP7_75t_R U102 ( .A(n11), .Y(n86) );
  INVx1_ASAP7_75t_R U103 ( .A(\A\[8\] ), .Y(n81) );
  NAND2xp5_ASAP7_75t_R U104 ( .A(\B\[4\] ), .B(\A\[4\] ), .Y(n22) );
  INVx1_ASAP7_75t_R U105 ( .A(n18), .Y(n14) );
  INVx1_ASAP7_75t_R U106 ( .A(\A\[5\] ), .Y(n89) );
  NAND2xp5_ASAP7_75t_R U107 ( .A(\B\[6\] ), .B(\A\[6\] ), .Y(n15) );
  OR2x2_ASAP7_75t_R U108 ( .A(n90), .B(n91), .Y(n70) );
  NAND2xp5_ASAP7_75t_R U109 ( .A(n18), .B(n23), .Y(n90) );
  OR2x2_ASAP7_75t_R U110 ( .A(\A\[4\] ), .B(\B\[4\] ), .Y(n23) );
  OR2x2_ASAP7_75t_R U111 ( .A(\A\[6\] ), .B(\B\[6\] ), .Y(n18) );
  OR2x2_ASAP7_75t_R U112 ( .A(\A\[3\] ), .B(\B\[3\] ), .Y(n25) );
  NAND2xp5_ASAP7_75t_R U113 ( .A(\B\[3\] ), .B(\A\[3\] ), .Y(n26) );
  NAND2xp5_ASAP7_75t_R U4 ( .A(n92), .B(n93), .Y(n3) );
  INVx1_ASAP7_75t_R U31 ( .A(n52), .Y(n92) );
  INVx1_ASAP7_75t_R U114 ( .A(n53), .Y(n93) );
endmodule


module fp32_exp_DW02_mult_8 ( .A({\A\[3\] , \A\[2\] , \A\[1\] , \A\[0\] }), 
    .B({\B\[23\] , \B\[22\] , \B\[21\] , \B\[20\] , \B\[19\] , \B\[18\] , 
        \B\[17\] , \B\[16\] , \B\[15\] , \B\[14\] , \B\[13\] , \B\[12\] , 
        \B\[11\] , \B\[10\] , \B\[9\] , \B\[8\] , \B\[7\] , \B\[6\] , \B\[5\] , 
        \B\[4\] , \B\[3\] , \B\[2\] , \B\[1\] , \B\[0\] }), TC, .PRODUCT({
        \PRODUCT\[27\] , \PRODUCT\[26\] , \PRODUCT\[25\] , \PRODUCT\[24\] , 
        \PRODUCT\[23\] , \PRODUCT\[22\] , \PRODUCT\[21\] , \PRODUCT\[20\] , 
        \PRODUCT\[19\] , \PRODUCT\[18\] , \PRODUCT\[17\] , \PRODUCT\[16\] , 
        \PRODUCT\[15\] , \PRODUCT\[14\] , \PRODUCT\[13\] , \PRODUCT\[12\] , 
        \PRODUCT\[11\] , \PRODUCT\[10\] , \PRODUCT\[9\] , \PRODUCT\[8\] , 
        \PRODUCT\[7\] , \PRODUCT\[6\] , \PRODUCT\[5\] , \PRODUCT\[4\] , 
        \PRODUCT\[3\] , \PRODUCT\[2\] , \PRODUCT\[1\] , \PRODUCT\[0\] }) );
  input \A\[3\] , \A\[2\] , \A\[1\] , \A\[0\] , \B\[23\] , \B\[22\] ,
         \B\[21\] , \B\[20\] , \B\[19\] , \B\[18\] , \B\[17\] , \B\[16\] ,
         \B\[15\] , \B\[14\] , \B\[13\] , \B\[12\] , \B\[11\] , \B\[10\] ,
         \B\[9\] , \B\[8\] , \B\[7\] , \B\[6\] , \B\[5\] , \B\[4\] , \B\[3\] ,
         \B\[2\] , \B\[1\] , \B\[0\] , TC;
  output \PRODUCT\[27\] , \PRODUCT\[26\] , \PRODUCT\[25\] , \PRODUCT\[24\] ,
         \PRODUCT\[23\] , \PRODUCT\[22\] , \PRODUCT\[21\] , \PRODUCT\[20\] ,
         \PRODUCT\[19\] , \PRODUCT\[18\] , \PRODUCT\[17\] , \PRODUCT\[16\] ,
         \PRODUCT\[15\] , \PRODUCT\[14\] , \PRODUCT\[13\] , \PRODUCT\[12\] ,
         \PRODUCT\[11\] , \PRODUCT\[10\] , \PRODUCT\[9\] , \PRODUCT\[8\] ,
         \PRODUCT\[7\] , \PRODUCT\[6\] , \PRODUCT\[5\] , \PRODUCT\[4\] ,
         \PRODUCT\[3\] , \PRODUCT\[2\] , \PRODUCT\[1\] , \PRODUCT\[0\] ;
  wire   net46656, \ab\[2\]\[9\] , \ab\[1\]\[9\] , \ab\[0\]\[9\] , n2, n3, n4,
         n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19,
         n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33,
         n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47,
         n48, n49, n50, n51, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62,
         n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76,
         n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90,
         n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103,
         n104;
  assign \ab\[2\]\[9\]  = \A\[2\] ;
  assign \ab\[1\]\[9\]  = \A\[1\] ;
  assign \ab\[0\]\[9\]  = \A\[0\] ;

  FAx1_ASAP7_75t_R S1_2_0 ( .A(\ab\[2\]\[9\] ), .B(n62), .CI(n21), .CON(n83), 
        .SN(n84) );
  FAx1_ASAP7_75t_R S2_2_3 ( .A(\ab\[2\]\[9\] ), .B(n53), .CI(\PRODUCT\[1\] ), 
        .CON(n87), .SN(n88) );
  FAx1_ASAP7_75t_R S2_2_4 ( .A(\ab\[2\]\[9\] ), .B(n49), .CI(n21), .CON(n89), 
        .SN(n90) );
  FAx1_ASAP7_75t_R S2_2_19 ( .A(\ab\[2\]\[9\] ), .B(n34), .CI(\PRODUCT\[1\] ), 
        .CON(n94), .SN(n95) );
  FAx1_ASAP7_75t_R S2_2_20 ( .A(\ab\[2\]\[9\] ), .B(n31), .CI(n21), .CON(n96), 
        .SN(n97) );
  NAND2xp5_ASAP7_75t_R U2 ( .A(n43), .B(n21), .Y(n71) );
  XNOR2xp5_ASAP7_75t_R U3 ( .A(n21), .B(n43), .Y(n72) );
  NAND2xp5_ASAP7_75t_R U4 ( .A(n45), .B(\ab\[2\]\[9\] ), .Y(n69) );
  XNOR2xp5_ASAP7_75t_R U5 ( .A(\ab\[2\]\[9\] ), .B(n45), .Y(n70) );
  NAND2xp5_ASAP7_75t_R U6 ( .A(n27), .B(n59), .Y(n79) );
  XNOR2xp5_ASAP7_75t_R U7 ( .A(n59), .B(n27), .Y(n80) );
  NAND2xp5_ASAP7_75t_R U8 ( .A(n32), .B(n30), .Y(n77) );
  XNOR2xp5_ASAP7_75t_R U9 ( .A(n30), .B(n32), .Y(n78) );
  NAND2xp5_ASAP7_75t_R U10 ( .A(n37), .B(n21), .Y(n75) );
  XNOR2xp5_ASAP7_75t_R U11 ( .A(n21), .B(n37), .Y(n76) );
  NAND2xp5_ASAP7_75t_R U12 ( .A(n60), .B(n59), .Y(n63) );
  XNOR2xp5_ASAP7_75t_R U13 ( .A(n59), .B(n60), .Y(n64) );
  NAND2xp5_ASAP7_75t_R U14 ( .A(n40), .B(n21), .Y(n73) );
  XNOR2xp5_ASAP7_75t_R U15 ( .A(n21), .B(n40), .Y(n74) );
  NAND2xp5_ASAP7_75t_R U16 ( .A(n56), .B(\PRODUCT\[1\] ), .Y(n65) );
  XNOR2xp5_ASAP7_75t_R U17 ( .A(\PRODUCT\[1\] ), .B(n56), .Y(n66) );
  NAND2xp5_ASAP7_75t_R U18 ( .A(n24), .B(n21), .Y(n81) );
  XNOR2xp5_ASAP7_75t_R U19 ( .A(n21), .B(n24), .Y(n82) );
  NAND2xp5_ASAP7_75t_R U20 ( .A(n50), .B(n48), .Y(n67) );
  XNOR2xp5_ASAP7_75t_R U21 ( .A(n48), .B(n50), .Y(n68) );
  INVx1_ASAP7_75t_R U22 ( .A(n101), .Y(n49) );
  AND2x2_ASAP7_75t_R U23 ( .A(n57), .B(n55), .Y(n2) );
  XOR2xp5_ASAP7_75t_R U24 ( .A(n51), .B(n54), .Y(n3) );
  XOR2xp5_ASAP7_75t_R U25 ( .A(n59), .B(n41), .Y(n4) );
  AND2x2_ASAP7_75t_R U26 ( .A(n46), .B(n44), .Y(n5) );
  XOR2xp5_ASAP7_75t_R U27 ( .A(n44), .B(n46), .Y(n6) );
  AND2x2_ASAP7_75t_R U28 ( .A(n41), .B(n59), .Y(n7) );
  XOR2xp5_ASAP7_75t_R U29 ( .A(n59), .B(n38), .Y(n8) );
  XOR2xp5_ASAP7_75t_R U30 ( .A(n26), .B(n28), .Y(n9) );
  AND2x2_ASAP7_75t_R U31 ( .A(n28), .B(n26), .Y(n10) );
  AND2x2_ASAP7_75t_R U32 ( .A(n25), .B(n23), .Y(n11) );
  AND2x2_ASAP7_75t_R U33 ( .A(n54), .B(n51), .Y(n13) );
  AND2x2_ASAP7_75t_R U34 ( .A(n38), .B(n59), .Y(n14) );
  XOR2xp5_ASAP7_75t_R U35 ( .A(\ab\[2\]\[9\] ), .B(n35), .Y(n15) );
  AND2x2_ASAP7_75t_R U36 ( .A(n35), .B(\ab\[2\]\[9\] ), .Y(n16) );
  XOR2xp5_ASAP7_75t_R U37 ( .A(n23), .B(n25), .Y(n17) );
  XOR2xp5_ASAP7_75t_R U38 ( .A(\ab\[2\]\[9\] ), .B(n22), .Y(n18) );
  XOR2xp5_ASAP7_75t_R U39 ( .A(n55), .B(n57), .Y(n19) );
  AND2x2_ASAP7_75t_R U40 ( .A(n22), .B(\ab\[2\]\[9\] ), .Y(n20) );
  BUFx2_ASAP7_75t_R U41 ( .A(\ab\[1\]\[9\] ), .Y(n21) );
  TIELOx1_ASAP7_75t_R U42 ( .L(net46656) );
  NAND2xp5_ASAP7_75t_R U43 ( .A(\ab\[0\]\[9\] ), .B(n21), .Y(n99) );
  NAND2xp5_ASAP7_75t_R U44 ( .A(\ab\[0\]\[9\] ), .B(n21), .Y(n100) );
  NAND2xp5_ASAP7_75t_R U45 ( .A(\ab\[0\]\[9\] ), .B(n21), .Y(n101) );
  XNOR2xp5_ASAP7_75t_R U46 ( .A(n21), .B(\ab\[0\]\[9\] ), .Y(n102) );
  NAND2xp5_ASAP7_75t_R U47 ( .A(\ab\[0\]\[9\] ), .B(n21), .Y(n103) );
  NAND2xp5_ASAP7_75t_R U48 ( .A(\ab\[0\]\[9\] ), .B(n21), .Y(n104) );
  NAND2xp5_ASAP7_75t_R U49 ( .A(\ab\[2\]\[9\] ), .B(\ab\[0\]\[9\] ), .Y(n85)
         );
  XNOR2xp5_ASAP7_75t_R U50 ( .A(\ab\[0\]\[9\] ), .B(\ab\[2\]\[9\] ), .Y(n86)
         );
  NAND2xp5_ASAP7_75t_R U51 ( .A(\ab\[2\]\[9\] ), .B(\ab\[0\]\[9\] ), .Y(n91)
         );
  NAND2xp5_ASAP7_75t_R U52 ( .A(\ab\[2\]\[9\] ), .B(\ab\[0\]\[9\] ), .Y(n92)
         );
  NAND2xp5_ASAP7_75t_R U53 ( .A(\ab\[2\]\[9\] ), .B(\ab\[0\]\[9\] ), .Y(n93)
         );
  NAND2xp5_ASAP7_75t_R U54 ( .A(\ab\[2\]\[9\] ), .B(\ab\[0\]\[9\] ), .Y(n98)
         );
  INVx1_ASAP7_75t_R U55 ( .A(n89), .Y(n45) );
  INVx1_ASAP7_75t_R U56 ( .A(n100), .Y(n53) );
  INVx1_ASAP7_75t_R U57 ( .A(n102), .Y(\PRODUCT\[1\] ) );
  INVx1_ASAP7_75t_R U58 ( .A(n99), .Y(n62) );
  INVx1_ASAP7_75t_R U59 ( .A(n87), .Y(n50) );
  INVx1_ASAP7_75t_R U60 ( .A(n90), .Y(n48) );
  INVx1_ASAP7_75t_R U61 ( .A(n83), .Y(n60) );
  INVx1_ASAP7_75t_R U62 ( .A(n69), .Y(n12) );
  INVx1_ASAP7_75t_R U63 ( .A(n67), .Y(n46) );
  INVx1_ASAP7_75t_R U64 ( .A(n70), .Y(n44) );
  INVx1_ASAP7_75t_R U65 ( .A(n65), .Y(n54) );
  INVx1_ASAP7_75t_R U66 ( .A(n88), .Y(n51) );
  INVx1_ASAP7_75t_R U67 ( .A(n63), .Y(n57) );
  INVx1_ASAP7_75t_R U68 ( .A(n66), .Y(n55) );
  INVx1_ASAP7_75t_R U69 ( .A(n78), .Y(n29) );
  INVx1_ASAP7_75t_R U70 ( .A(n95), .Y(n33) );
  INVx1_ASAP7_75t_R U71 ( .A(n76), .Y(n36) );
  INVx1_ASAP7_75t_R U72 ( .A(n74), .Y(n39) );
  INVx1_ASAP7_75t_R U73 ( .A(n72), .Y(n42) );
  INVx1_ASAP7_75t_R U74 ( .A(n68), .Y(n47) );
  INVx1_ASAP7_75t_R U75 ( .A(n64), .Y(n58) );
  INVx1_ASAP7_75t_R U76 ( .A(n84), .Y(n61) );
  INVx1_ASAP7_75t_R U77 ( .A(n81), .Y(n22) );
  INVx1_ASAP7_75t_R U78 ( .A(n82), .Y(n23) );
  INVx1_ASAP7_75t_R U79 ( .A(n98), .Y(n24) );
  INVx1_ASAP7_75t_R U80 ( .A(n79), .Y(n25) );
  INVx1_ASAP7_75t_R U81 ( .A(n80), .Y(n26) );
  INVx1_ASAP7_75t_R U82 ( .A(n96), .Y(n27) );
  INVx1_ASAP7_75t_R U83 ( .A(n77), .Y(n28) );
  INVx1_ASAP7_75t_R U84 ( .A(n97), .Y(n30) );
  INVx1_ASAP7_75t_R U85 ( .A(n104), .Y(n31) );
  INVx1_ASAP7_75t_R U86 ( .A(n94), .Y(n32) );
  INVx1_ASAP7_75t_R U87 ( .A(n103), .Y(n34) );
  INVx1_ASAP7_75t_R U88 ( .A(n75), .Y(n35) );
  INVx1_ASAP7_75t_R U89 ( .A(n93), .Y(n37) );
  INVx1_ASAP7_75t_R U90 ( .A(n73), .Y(n38) );
  INVx1_ASAP7_75t_R U91 ( .A(n92), .Y(n40) );
  INVx1_ASAP7_75t_R U92 ( .A(n71), .Y(n41) );
  INVx1_ASAP7_75t_R U93 ( .A(n91), .Y(n43) );
  INVx1_ASAP7_75t_R U94 ( .A(n85), .Y(n56) );
  INVx1_ASAP7_75t_R U95 ( .A(n86), .Y(n59) );
  fp32_exp_DW01_add_J8_5 FS_1 ( .A({net46656, net46656, n18, n17, n9, n29, n33, 
        \PRODUCT\[1\] , \ab\[0\]\[9\] , net46656, n15, n36, n8, n39, n4, n42, 
        n59, n21, \ab\[0\]\[9\] , n12, n6, n47, n3, n19, n58, n61}), .B({
        net46656, n20, n11, n10, net46656, net46656, net46656, net46656, 
        net46656, n16, net46656, n14, net46656, n7, net46656, net46656, 
        net46656, net46656, net46656, n5, net46656, n13, n2, net46656, 
        net46656, net46656}), .CI(net46656), .SUM({\PRODUCT\[27\] , 
        \PRODUCT\[26\] , \PRODUCT\[25\] , \PRODUCT\[24\] , \PRODUCT\[23\] , 
        \PRODUCT\[22\] , \PRODUCT\[21\] , \PRODUCT\[20\] , \PRODUCT\[19\] , 
        \PRODUCT\[18\] , \PRODUCT\[17\] , \PRODUCT\[16\] , \PRODUCT\[15\] , 
        \PRODUCT\[14\] , \PRODUCT\[13\] , \PRODUCT\[12\] , \PRODUCT\[11\] , 
        \PRODUCT\[10\] , \PRODUCT\[9\] , \PRODUCT\[8\] , \PRODUCT\[7\] , 
        \PRODUCT\[6\] , \PRODUCT\[5\] , \PRODUCT\[4\] , \PRODUCT\[3\] , 
        \PRODUCT\[2\] }) );
endmodule


module fp32_exp_DW01_add_32 ( .A({\A\[39\] , \A\[38\] , \A\[37\] , \A\[36\] , 
        \A\[35\] , \A\[34\] , \A\[33\] , \A\[32\] , \A\[31\] , \A\[30\] , 
        \A\[29\] , \A\[28\] , \A\[27\] , \A\[26\] , \A\[25\] , \A\[24\] , 
        \A\[23\] , \A\[22\] , \A\[21\] , \A\[20\] , \A\[19\] , \A\[18\] , 
        \A\[17\] , \A\[16\] , \A\[15\] , \A\[14\] , \A\[13\] , \A\[12\] , 
        \A\[11\] , \A\[10\] , \A\[9\] , \A\[8\] , \A\[7\] , \A\[6\] , \A\[5\] , 
        \A\[4\] , \A\[3\] , \A\[2\] , \A\[1\] , \A\[0\] }), .B({\B\[39\] , 
        \B\[38\] , \B\[37\] , \B\[36\] , \B\[35\] , \B\[34\] , \B\[33\] , 
        \B\[32\] , \B\[31\] , \B\[30\] , \B\[29\] , \B\[28\] , \B\[27\] , 
        \B\[26\] , \B\[25\] , \B\[24\] , \B\[23\] , \B\[22\] , \B\[21\] , 
        \B\[20\] , \B\[19\] , \B\[18\] , \B\[17\] , \B\[16\] , \B\[15\] , 
        \B\[14\] , \B\[13\] , \B\[12\] , \B\[11\] , \B\[10\] , \B\[9\] , 
        \B\[8\] , \B\[7\] , \B\[6\] , \B\[5\] , \B\[4\] , \B\[3\] , \B\[2\] , 
        \B\[1\] , \B\[0\] }), CI, .SUM({\SUM\[39\] , \SUM\[38\] , \SUM\[37\] , 
        \SUM\[36\] , \SUM\[35\] , \SUM\[34\] , \SUM\[33\] , \SUM\[32\] , 
        \SUM\[31\] , \SUM\[30\] , \SUM\[29\] , \SUM\[28\] , \SUM\[27\] , 
        \SUM\[26\] , \SUM\[25\] , \SUM\[24\] , \SUM\[23\] , \SUM\[22\] , 
        \SUM\[21\] , \SUM\[20\] , \SUM\[19\] , \SUM\[18\] , \SUM\[17\] , 
        \SUM\[16\] , \SUM\[15\] , \SUM\[14\] , \SUM\[13\] , \SUM\[12\] , 
        \SUM\[11\] , \SUM\[10\] , \SUM\[9\] , \SUM\[8\] , \SUM\[7\] , 
        \SUM\[6\] , \SUM\[5\] , \SUM\[4\] , \SUM\[3\] , \SUM\[2\] , \SUM\[1\] , 
        \SUM\[0\] }), CO );
  input \A\[39\] , \A\[38\] , \A\[37\] , \A\[36\] , \A\[35\] , \A\[34\] ,
         \A\[33\] , \A\[32\] , \A\[31\] , \A\[30\] , \A\[29\] , \A\[28\] ,
         \A\[27\] , \A\[26\] , \A\[25\] , \A\[24\] , \A\[23\] , \A\[22\] ,
         \A\[21\] , \A\[20\] , \A\[19\] , \A\[18\] , \A\[17\] , \A\[16\] ,
         \A\[15\] , \A\[14\] , \A\[13\] , \A\[12\] , \A\[11\] , \A\[10\] ,
         \A\[9\] , \A\[8\] , \A\[7\] , \A\[6\] , \A\[5\] , \A\[4\] , \A\[3\] ,
         \A\[2\] , \A\[1\] , \A\[0\] , \B\[39\] , \B\[38\] , \B\[37\] ,
         \B\[36\] , \B\[35\] , \B\[34\] , \B\[33\] , \B\[32\] , \B\[31\] ,
         \B\[30\] , \B\[29\] , \B\[28\] , \B\[27\] , \B\[26\] , \B\[25\] ,
         \B\[24\] , \B\[23\] , \B\[22\] , \B\[21\] , \B\[20\] , \B\[19\] ,
         \B\[18\] , \B\[17\] , \B\[16\] , \B\[15\] , \B\[14\] , \B\[13\] ,
         \B\[12\] , \B\[11\] , \B\[10\] , \B\[9\] , \B\[8\] , \B\[7\] ,
         \B\[6\] , \B\[5\] , \B\[4\] , \B\[3\] , \B\[2\] , \B\[1\] , \B\[0\] ,
         CI;
  output \SUM\[39\] , \SUM\[38\] , \SUM\[37\] , \SUM\[36\] , \SUM\[35\] ,
         \SUM\[34\] , \SUM\[33\] , \SUM\[32\] , \SUM\[31\] , \SUM\[30\] ,
         \SUM\[29\] , \SUM\[28\] , \SUM\[27\] , \SUM\[26\] , \SUM\[25\] ,
         \SUM\[24\] , \SUM\[23\] , \SUM\[22\] , \SUM\[21\] , \SUM\[20\] ,
         \SUM\[19\] , \SUM\[18\] , \SUM\[17\] , \SUM\[16\] , \SUM\[15\] ,
         \SUM\[14\] , \SUM\[13\] , \SUM\[12\] , \SUM\[11\] , \SUM\[10\] ,
         \SUM\[9\] , \SUM\[8\] , \SUM\[7\] , \SUM\[6\] , \SUM\[5\] ,
         \SUM\[4\] , \SUM\[3\] , \SUM\[2\] , \SUM\[1\] , \SUM\[0\] , CO;
  wire   n1, n2, n3, n4, n5, n6, n9, n10, n11, n12, n13, n14, n15, n17, n18,
         n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46,
         n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60,
         n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74,
         n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88,
         n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101,
         n102, n103, n104, n105, n106, n107, n108, n109, n110, n111, n112,
         n113, n114, n115, n116, n117, n118, n119, n120, n121, n122, n123,
         n124, n125, n126, n127, n128, n129, n130, n131, n132, n133, n134,
         n135, n136, n137, n138, n139, n140, n141, n142, n143, n144, n145,
         n146, n147, n148, n149, n150, n151, n152, n153, n154, n155, n156,
         n157, n158, n159, n160, n161, n162, n163, n164, n165, n166, n167,
         n168, n169, n170, n171, n172, n173, n174, n175, n176;

  AOI21xp5_ASAP7_75t_R U2 ( .A1(n54), .A2(n55), .B(n56), .Y(n52) );
  O2A1O1Ixp33_ASAP7_75t_R U3 ( .A1(n80), .A2(n81), .B(n82), .C(n83), .Y(n76)
         );
  NAND4xp25_ASAP7_75t_R U4 ( .A(n78), .B(n85), .C(n84), .D(n86), .Y(n53) );
  NAND4xp25_ASAP7_75t_R U5 ( .A(n119), .B(n120), .C(n121), .D(n122), .Y(n58)
         );
  NOR2xp33_ASAP7_75t_R U6 ( .A(n3), .B(n123), .Y(n121) );
  O2A1O1Ixp33_ASAP7_75t_R U7 ( .A1(n45), .A2(n46), .B(n47), .C(n48), .Y(n41)
         );
  AOI21xp5_ASAP7_75t_R U8 ( .A1(n49), .A2(n50), .B(n51), .Y(n46) );
  NOR2xp33_ASAP7_75t_R U9 ( .A(n57), .B(n53), .Y(n49) );
  O2A1O1Ixp33_ASAP7_75t_R U10 ( .A1(n103), .A2(n104), .B(n105), .C(n106), .Y(
        n99) );
  NAND4xp25_ASAP7_75t_R U11 ( .A(n101), .B(n107), .C(n108), .D(n109), .Y(n57)
         );
  O2A1O1Ixp33_ASAP7_75t_R U12 ( .A1(n123), .A2(n128), .B(n129), .C(n3), .Y(
        n126) );
  NOR2xp33_ASAP7_75t_R U13 ( .A(n17), .B(n26), .Y(n25) );
  NOR2xp33_ASAP7_75t_R U14 ( .A(n29), .B(n1), .Y(n27) );
  NOR2xp33_ASAP7_75t_R U15 ( .A(n33), .B(n34), .Y(n32) );
  AOI21xp5_ASAP7_75t_R U16 ( .A1(n144), .A2(n145), .B(n146), .Y(n143) );
  NOR2xp33_ASAP7_75t_R U17 ( .A(n5), .B(n172), .Y(n166) );
  NOR2xp33_ASAP7_75t_R U18 ( .A(n127), .B(n3), .Y(n133) );
  AOI21xp5_ASAP7_75t_R U19 ( .A1(n156), .A2(n149), .B(n144), .Y(n155) );
  NOR2xp33_ASAP7_75t_R U20 ( .A(n168), .B(n5), .Y(n176) );
  OR2x2_ASAP7_75t_R U21 ( .A(n30), .B(n31), .Y(n1) );
  AND2x2_ASAP7_75t_R U22 ( .A(\A\[37\] ), .B(n25), .Y(n2) );
  NOR2xp33_ASAP7_75t_R U23 ( .A(\A\[18\] ), .B(\B\[18\] ), .Y(n3) );
  OA21x2_ASAP7_75t_R U24 ( .A1(n22), .A2(n172), .B(n21), .Y(n4) );
  NOR2xp33_ASAP7_75t_R U25 ( .A(\A\[10\] ), .B(\B\[10\] ), .Y(n5) );
  AND2x2_ASAP7_75t_R U26 ( .A(\A\[38\] ), .B(n2), .Y(n6) );
  XOR2xp5_ASAP7_75t_R U27 ( .A(\A\[38\] ), .B(n2), .Y(\SUM\[38\] ) );
  XOR2xp5_ASAP7_75t_R U28 ( .A(\A\[37\] ), .B(n25), .Y(\SUM\[37\] ) );
  AND2x2_ASAP7_75t_R U29 ( .A(n151), .B(n152), .Y(n9) );
  AND2x2_ASAP7_75t_R U30 ( .A(n74), .B(n75), .Y(n10) );
  AND2x2_ASAP7_75t_R U31 ( .A(n118), .B(n58), .Y(n11) );
  OA21x2_ASAP7_75t_R U32 ( .A1(n45), .A2(n69), .B(n47), .Y(n12) );
  AOI21xp5_ASAP7_75t_R U33 ( .A1(n90), .A2(n84), .B(n91), .Y(n13) );
  OA21x2_ASAP7_75t_R U34 ( .A1(n103), .A2(n113), .B(n105), .Y(n14) );
  OA21x2_ASAP7_75t_R U35 ( .A1(n123), .A2(n134), .B(n129), .Y(n15) );
  AND2x2_ASAP7_75t_R U36 ( .A(n22), .B(n23), .Y(\SUM\[8\] ) );
  INVx1_ASAP7_75t_R U37 ( .A(n22), .Y(n18) );
  NAND2xp5_ASAP7_75t_R U38 ( .A(n27), .B(\A\[35\] ), .Y(n17) );
  INVx1_ASAP7_75t_R U39 ( .A(\A\[32\] ), .Y(n33) );
  INVx1_ASAP7_75t_R U40 ( .A(\A\[33\] ), .Y(n30) );
  INVx1_ASAP7_75t_R U41 ( .A(\A\[34\] ), .Y(n29) );
  INVx1_ASAP7_75t_R U42 ( .A(\A\[35\] ), .Y(n28) );
  XNOR2xp5_ASAP7_75t_R U43 ( .A(\A\[36\] ), .B(n17), .Y(\SUM\[36\] ) );
  INVx1_ASAP7_75t_R U44 ( .A(\A\[36\] ), .Y(n26) );
  INVx1_ASAP7_75t_R U45 ( .A(\A\[39\] ), .Y(n24) );
  XNOR2xp5_ASAP7_75t_R U46 ( .A(n18), .B(n19), .Y(\SUM\[9\] ) );
  NAND2xp5_ASAP7_75t_R U47 ( .A(n20), .B(n21), .Y(n19) );
  XNOR2xp5_ASAP7_75t_R U48 ( .A(n24), .B(n6), .Y(\SUM\[39\] ) );
  XNOR2xp5_ASAP7_75t_R U49 ( .A(n27), .B(n28), .Y(\SUM\[35\] ) );
  XOR2xp5_ASAP7_75t_R U50 ( .A(n29), .B(n1), .Y(\SUM\[34\] ) );
  INVx1_ASAP7_75t_R U51 ( .A(n32), .Y(n31) );
  XNOR2xp5_ASAP7_75t_R U52 ( .A(n32), .B(n30), .Y(\SUM\[33\] ) );
  XNOR2xp5_ASAP7_75t_R U53 ( .A(n34), .B(\A\[32\] ), .Y(\SUM\[32\] ) );
  INVx1_ASAP7_75t_R U54 ( .A(n35), .Y(n34) );
  A2O1A1Ixp33_ASAP7_75t_R U55 ( .A1(n36), .A2(n37), .B(n38), .C(n39), .Y(n35)
         );
  INVx1_ASAP7_75t_R U56 ( .A(n40), .Y(n38) );
  OAI21xp5_ASAP7_75t_R U57 ( .A1(n41), .A2(n42), .B(n43), .Y(n37) );
  INVx1_ASAP7_75t_R U58 ( .A(n44), .Y(n42) );
  OAI21xp5_ASAP7_75t_R U59 ( .A1(n52), .A2(n53), .B(n10), .Y(n51) );
  INVx1_ASAP7_75t_R U60 ( .A(n57), .Y(n54) );
  INVx1_ASAP7_75t_R U61 ( .A(n58), .Y(n50) );
  XNOR2xp5_ASAP7_75t_R U62 ( .A(n59), .B(n60), .Y(\SUM\[31\] ) );
  NAND2xp5_ASAP7_75t_R U63 ( .A(n40), .B(n39), .Y(n60) );
  NAND2xp5_ASAP7_75t_R U64 ( .A(\B\[31\] ), .B(\A\[31\] ), .Y(n39) );
  NAND2xp5_ASAP7_75t_R U65 ( .A(n61), .B(n62), .Y(n40) );
  INVx1_ASAP7_75t_R U66 ( .A(\A\[31\] ), .Y(n62) );
  INVx1_ASAP7_75t_R U67 ( .A(\B\[31\] ), .Y(n61) );
  OAI21xp5_ASAP7_75t_R U68 ( .A1(n63), .A2(n64), .B(n36), .Y(n59) );
  INVx1_ASAP7_75t_R U69 ( .A(n65), .Y(n64) );
  INVx1_ASAP7_75t_R U70 ( .A(n43), .Y(n63) );
  XNOR2xp5_ASAP7_75t_R U71 ( .A(n65), .B(n66), .Y(\SUM\[30\] ) );
  NAND2xp5_ASAP7_75t_R U72 ( .A(n43), .B(n36), .Y(n66) );
  NAND2xp5_ASAP7_75t_R U73 ( .A(\B\[30\] ), .B(\A\[30\] ), .Y(n36) );
  OR2x2_ASAP7_75t_R U74 ( .A(\A\[30\] ), .B(\B\[30\] ), .Y(n43) );
  OAI21xp5_ASAP7_75t_R U75 ( .A1(n48), .A2(n12), .B(n44), .Y(n65) );
  INVx1_ASAP7_75t_R U76 ( .A(n67), .Y(n48) );
  XOR2xp5_ASAP7_75t_R U77 ( .A(n68), .B(n12), .Y(\SUM\[29\] ) );
  INVx1_ASAP7_75t_R U78 ( .A(n70), .Y(n69) );
  INVx1_ASAP7_75t_R U79 ( .A(n71), .Y(n45) );
  NAND2xp5_ASAP7_75t_R U80 ( .A(n67), .B(n44), .Y(n68) );
  NAND2xp5_ASAP7_75t_R U81 ( .A(\B\[29\] ), .B(\A\[29\] ), .Y(n44) );
  OR2x2_ASAP7_75t_R U82 ( .A(\A\[29\] ), .B(\B\[29\] ), .Y(n67) );
  XNOR2xp5_ASAP7_75t_R U83 ( .A(n70), .B(n72), .Y(\SUM\[28\] ) );
  NAND2xp5_ASAP7_75t_R U84 ( .A(n71), .B(n47), .Y(n72) );
  NAND2xp5_ASAP7_75t_R U85 ( .A(\B\[28\] ), .B(\A\[28\] ), .Y(n47) );
  OR2x2_ASAP7_75t_R U86 ( .A(\A\[28\] ), .B(\B\[28\] ), .Y(n71) );
  OAI21xp5_ASAP7_75t_R U87 ( .A1(n73), .A2(n53), .B(n10), .Y(n70) );
  OAI21xp5_ASAP7_75t_R U88 ( .A1(n76), .A2(n77), .B(n78), .Y(n75) );
  INVx1_ASAP7_75t_R U89 ( .A(n79), .Y(n77) );
  INVx1_ASAP7_75t_R U90 ( .A(n84), .Y(n80) );
  XNOR2xp5_ASAP7_75t_R U91 ( .A(n87), .B(n88), .Y(\SUM\[27\] ) );
  NAND2xp5_ASAP7_75t_R U92 ( .A(n78), .B(n74), .Y(n88) );
  NAND2xp5_ASAP7_75t_R U93 ( .A(\B\[27\] ), .B(\A\[27\] ), .Y(n74) );
  OR2x2_ASAP7_75t_R U94 ( .A(\A\[27\] ), .B(\B\[27\] ), .Y(n78) );
  OAI21xp5_ASAP7_75t_R U95 ( .A1(n83), .A2(n13), .B(n79), .Y(n87) );
  INVx1_ASAP7_75t_R U96 ( .A(n85), .Y(n83) );
  XOR2xp5_ASAP7_75t_R U97 ( .A(n89), .B(n13), .Y(\SUM\[26\] ) );
  INVx1_ASAP7_75t_R U98 ( .A(n82), .Y(n91) );
  NAND2xp5_ASAP7_75t_R U99 ( .A(n85), .B(n79), .Y(n89) );
  NAND2xp5_ASAP7_75t_R U100 ( .A(\B\[26\] ), .B(\A\[26\] ), .Y(n79) );
  OR2x2_ASAP7_75t_R U101 ( .A(\A\[26\] ), .B(\B\[26\] ), .Y(n85) );
  XNOR2xp5_ASAP7_75t_R U102 ( .A(n90), .B(n92), .Y(\SUM\[25\] ) );
  NAND2xp5_ASAP7_75t_R U103 ( .A(n84), .B(n82), .Y(n92) );
  NAND2xp5_ASAP7_75t_R U104 ( .A(\B\[25\] ), .B(\A\[25\] ), .Y(n82) );
  OR2x2_ASAP7_75t_R U105 ( .A(\A\[25\] ), .B(\B\[25\] ), .Y(n84) );
  OAI21xp5_ASAP7_75t_R U106 ( .A1(n93), .A2(n73), .B(n81), .Y(n90) );
  INVx1_ASAP7_75t_R U107 ( .A(n94), .Y(n73) );
  INVx1_ASAP7_75t_R U108 ( .A(n86), .Y(n93) );
  XNOR2xp5_ASAP7_75t_R U109 ( .A(n94), .B(n95), .Y(\SUM\[24\] ) );
  NAND2xp5_ASAP7_75t_R U110 ( .A(n81), .B(n86), .Y(n95) );
  OR2x2_ASAP7_75t_R U111 ( .A(\A\[24\] ), .B(\B\[24\] ), .Y(n86) );
  NAND2xp5_ASAP7_75t_R U112 ( .A(\B\[24\] ), .B(\A\[24\] ), .Y(n81) );
  OAI21xp5_ASAP7_75t_R U113 ( .A1(n11), .A2(n57), .B(n96), .Y(n94) );
  INVx1_ASAP7_75t_R U114 ( .A(n56), .Y(n96) );
  NAND2xp5_ASAP7_75t_R U115 ( .A(n97), .B(n98), .Y(n56) );
  OAI21xp5_ASAP7_75t_R U116 ( .A1(n99), .A2(n100), .B(n101), .Y(n98) );
  INVx1_ASAP7_75t_R U117 ( .A(n102), .Y(n100) );
  XNOR2xp5_ASAP7_75t_R U118 ( .A(n110), .B(n111), .Y(\SUM\[23\] ) );
  NAND2xp5_ASAP7_75t_R U119 ( .A(n101), .B(n97), .Y(n111) );
  NAND2xp5_ASAP7_75t_R U120 ( .A(\B\[23\] ), .B(\A\[23\] ), .Y(n97) );
  OR2x2_ASAP7_75t_R U121 ( .A(\A\[23\] ), .B(\B\[23\] ), .Y(n101) );
  OAI21xp5_ASAP7_75t_R U122 ( .A1(n106), .A2(n14), .B(n102), .Y(n110) );
  INVx1_ASAP7_75t_R U123 ( .A(n107), .Y(n106) );
  XOR2xp5_ASAP7_75t_R U124 ( .A(n112), .B(n14), .Y(\SUM\[22\] ) );
  INVx1_ASAP7_75t_R U125 ( .A(n114), .Y(n113) );
  INVx1_ASAP7_75t_R U126 ( .A(n108), .Y(n103) );
  NAND2xp5_ASAP7_75t_R U127 ( .A(n107), .B(n102), .Y(n112) );
  NAND2xp5_ASAP7_75t_R U128 ( .A(\B\[22\] ), .B(\A\[22\] ), .Y(n102) );
  OR2x2_ASAP7_75t_R U129 ( .A(\A\[22\] ), .B(\B\[22\] ), .Y(n107) );
  XNOR2xp5_ASAP7_75t_R U130 ( .A(n114), .B(n115), .Y(\SUM\[21\] ) );
  NAND2xp5_ASAP7_75t_R U131 ( .A(n108), .B(n105), .Y(n115) );
  NAND2xp5_ASAP7_75t_R U132 ( .A(\B\[21\] ), .B(\A\[21\] ), .Y(n105) );
  OR2x2_ASAP7_75t_R U133 ( .A(\A\[21\] ), .B(\B\[21\] ), .Y(n108) );
  OAI21xp5_ASAP7_75t_R U134 ( .A1(n116), .A2(n11), .B(n104), .Y(n114) );
  INVx1_ASAP7_75t_R U135 ( .A(n109), .Y(n116) );
  XOR2xp5_ASAP7_75t_R U136 ( .A(n117), .B(n11), .Y(\SUM\[20\] ) );
  INVx1_ASAP7_75t_R U137 ( .A(n55), .Y(n118) );
  NAND2xp5_ASAP7_75t_R U138 ( .A(n124), .B(n125), .Y(n55) );
  OAI21xp5_ASAP7_75t_R U139 ( .A1(n126), .A2(n127), .B(n119), .Y(n125) );
  NAND2xp5_ASAP7_75t_R U140 ( .A(n109), .B(n104), .Y(n117) );
  NAND2xp5_ASAP7_75t_R U141 ( .A(\B\[20\] ), .B(\A\[20\] ), .Y(n104) );
  OR2x2_ASAP7_75t_R U142 ( .A(\A\[20\] ), .B(\B\[20\] ), .Y(n109) );
  XNOR2xp5_ASAP7_75t_R U143 ( .A(n130), .B(n131), .Y(\SUM\[19\] ) );
  NAND2xp5_ASAP7_75t_R U144 ( .A(n119), .B(n124), .Y(n131) );
  NAND2xp5_ASAP7_75t_R U145 ( .A(\B\[19\] ), .B(\A\[19\] ), .Y(n124) );
  OR2x2_ASAP7_75t_R U146 ( .A(\A\[19\] ), .B(\B\[19\] ), .Y(n119) );
  OAI21xp5_ASAP7_75t_R U147 ( .A1(n3), .A2(n15), .B(n132), .Y(n130) );
  XNOR2xp5_ASAP7_75t_R U148 ( .A(n15), .B(n133), .Y(\SUM\[18\] ) );
  INVx1_ASAP7_75t_R U149 ( .A(n132), .Y(n127) );
  NAND2xp5_ASAP7_75t_R U150 ( .A(\B\[18\] ), .B(\A\[18\] ), .Y(n132) );
  INVx1_ASAP7_75t_R U151 ( .A(n135), .Y(n134) );
  INVx1_ASAP7_75t_R U152 ( .A(n136), .Y(n123) );
  XNOR2xp5_ASAP7_75t_R U153 ( .A(n137), .B(n135), .Y(\SUM\[17\] ) );
  OAI21xp5_ASAP7_75t_R U154 ( .A1(n138), .A2(n139), .B(n128), .Y(n135) );
  INVx1_ASAP7_75t_R U155 ( .A(n122), .Y(n139) );
  INVx1_ASAP7_75t_R U156 ( .A(n120), .Y(n138) );
  NAND2xp5_ASAP7_75t_R U157 ( .A(n129), .B(n136), .Y(n137) );
  OR2x2_ASAP7_75t_R U158 ( .A(\A\[17\] ), .B(\B\[17\] ), .Y(n136) );
  NAND2xp5_ASAP7_75t_R U159 ( .A(\B\[17\] ), .B(\A\[17\] ), .Y(n129) );
  XNOR2xp5_ASAP7_75t_R U160 ( .A(n122), .B(n140), .Y(\SUM\[16\] ) );
  NAND2xp5_ASAP7_75t_R U161 ( .A(n128), .B(n120), .Y(n140) );
  OR2x2_ASAP7_75t_R U162 ( .A(\A\[16\] ), .B(\B\[16\] ), .Y(n120) );
  NAND2xp5_ASAP7_75t_R U163 ( .A(\B\[16\] ), .B(\A\[16\] ), .Y(n128) );
  A2O1A1Ixp33_ASAP7_75t_R U164 ( .A1(n141), .A2(n9), .B(n142), .C(n143), .Y(
        n122) );
  INVx1_ASAP7_75t_R U165 ( .A(n147), .Y(n146) );
  NAND3xp33_ASAP7_75t_R U166 ( .A(n145), .B(n148), .C(n149), .Y(n142) );
  NAND2xp5_ASAP7_75t_R U167 ( .A(n153), .B(n150), .Y(n141) );
  XOR2xp5_ASAP7_75t_R U168 ( .A(n154), .B(n155), .Y(\SUM\[15\] ) );
  INVx1_ASAP7_75t_R U169 ( .A(n157), .Y(n144) );
  NAND2xp5_ASAP7_75t_R U170 ( .A(n145), .B(n147), .Y(n154) );
  NAND2xp5_ASAP7_75t_R U171 ( .A(\B\[15\] ), .B(\A\[15\] ), .Y(n147) );
  OR2x2_ASAP7_75t_R U172 ( .A(\A\[15\] ), .B(\B\[15\] ), .Y(n145) );
  XNOR2xp5_ASAP7_75t_R U173 ( .A(n158), .B(n156), .Y(\SUM\[14\] ) );
  OAI21xp5_ASAP7_75t_R U174 ( .A1(n159), .A2(n160), .B(n151), .Y(n156) );
  INVx1_ASAP7_75t_R U175 ( .A(n161), .Y(n160) );
  INVx1_ASAP7_75t_R U176 ( .A(n148), .Y(n159) );
  NAND2xp5_ASAP7_75t_R U177 ( .A(n149), .B(n157), .Y(n158) );
  NAND2xp5_ASAP7_75t_R U178 ( .A(\B\[14\] ), .B(\A\[14\] ), .Y(n157) );
  OR2x2_ASAP7_75t_R U179 ( .A(\A\[14\] ), .B(\B\[14\] ), .Y(n149) );
  XNOR2xp5_ASAP7_75t_R U180 ( .A(n161), .B(n162), .Y(\SUM\[13\] ) );
  NAND2xp5_ASAP7_75t_R U181 ( .A(n148), .B(n151), .Y(n162) );
  NAND2xp5_ASAP7_75t_R U182 ( .A(\B\[13\] ), .B(\A\[13\] ), .Y(n151) );
  OR2x2_ASAP7_75t_R U183 ( .A(\A\[13\] ), .B(\B\[13\] ), .Y(n148) );
  OAI21xp5_ASAP7_75t_R U184 ( .A1(n163), .A2(n165), .B(n152), .Y(n161) );
  INVx1_ASAP7_75t_R U185 ( .A(n150), .Y(n163) );
  XOR2xp5_ASAP7_75t_R U186 ( .A(n164), .B(n165), .Y(\SUM\[12\] ) );
  INVx1_ASAP7_75t_R U187 ( .A(n165), .Y(n153) );
  A2O1A1O1Ixp25_ASAP7_75t_R U188 ( .A1(n166), .A2(n167), .B(n168), .C(n169), 
        .D(n170), .Y(n165) );
  INVx1_ASAP7_75t_R U189 ( .A(n171), .Y(n170) );
  NAND2xp5_ASAP7_75t_R U190 ( .A(n22), .B(n21), .Y(n167) );
  NAND2xp5_ASAP7_75t_R U191 ( .A(n150), .B(n152), .Y(n164) );
  NAND2xp5_ASAP7_75t_R U192 ( .A(\B\[12\] ), .B(\A\[12\] ), .Y(n152) );
  OR2x2_ASAP7_75t_R U193 ( .A(\A\[12\] ), .B(\B\[12\] ), .Y(n150) );
  XNOR2xp5_ASAP7_75t_R U194 ( .A(n173), .B(n174), .Y(\SUM\[11\] ) );
  NAND2xp5_ASAP7_75t_R U195 ( .A(n169), .B(n171), .Y(n174) );
  NAND2xp5_ASAP7_75t_R U196 ( .A(\B\[11\] ), .B(\A\[11\] ), .Y(n171) );
  OR2x2_ASAP7_75t_R U197 ( .A(\A\[11\] ), .B(\B\[11\] ), .Y(n169) );
  OAI21xp5_ASAP7_75t_R U198 ( .A1(n5), .A2(n4), .B(n175), .Y(n173) );
  XNOR2xp5_ASAP7_75t_R U199 ( .A(n4), .B(n176), .Y(\SUM\[10\] ) );
  INVx1_ASAP7_75t_R U200 ( .A(n175), .Y(n168) );
  NAND2xp5_ASAP7_75t_R U201 ( .A(\B\[10\] ), .B(\A\[10\] ), .Y(n175) );
  NAND2xp5_ASAP7_75t_R U202 ( .A(\B\[9\] ), .B(\A\[9\] ), .Y(n21) );
  INVx1_ASAP7_75t_R U203 ( .A(n20), .Y(n172) );
  OR2x2_ASAP7_75t_R U204 ( .A(\A\[9\] ), .B(\B\[9\] ), .Y(n20) );
  NAND2xp5_ASAP7_75t_R U205 ( .A(\B\[8\] ), .B(\A\[8\] ), .Y(n22) );
  OR2x2_ASAP7_75t_R U206 ( .A(\A\[8\] ), .B(\B\[8\] ), .Y(n23) );
endmodule


module fp32_exp_DW01_add_J3_1 ( .A({\A\[39\] , \A\[38\] , \A\[37\] , \A\[36\] , 
        \A\[35\] , \A\[34\] , \A\[33\] , \A\[32\] , \A\[31\] , \A\[30\] , 
        \A\[29\] , \A\[28\] , \A\[27\] , \A\[26\] , \A\[25\] , \A\[24\] , 
        \A\[23\] , \A\[22\] , \A\[21\] , \A\[20\] , \A\[19\] , \A\[18\] , 
        \A\[17\] , \A\[16\] , \A\[15\] , \A\[14\] , \A\[13\] , \A\[12\] , 
        \A\[11\] , \A\[10\] , \A\[9\] , \A\[8\] , \A\[7\] , \A\[6\] , \A\[5\] , 
        \A\[4\] , \A\[3\] , \A\[2\] , \A\[1\] , \A\[0\] }), .B({\B\[39\] , 
        \B\[38\] , \B\[37\] , \B\[36\] , \B\[35\] , \B\[34\] , \B\[33\] , 
        \B\[32\] , \B\[31\] , \B\[30\] , \B\[29\] , \B\[28\] , \B\[27\] , 
        \B\[26\] , \B\[25\] , \B\[24\] , \B\[23\] , \B\[22\] , \B\[21\] , 
        \B\[20\] , \B\[19\] , \B\[18\] , \B\[17\] , \B\[16\] , \B\[15\] , 
        \B\[14\] , \B\[13\] , \B\[12\] , \B\[11\] , \B\[10\] , \B\[9\] , 
        \B\[8\] , \B\[7\] , \B\[6\] , \B\[5\] , \B\[4\] , \B\[3\] , \B\[2\] , 
        \B\[1\] , \B\[0\] }), CI, .SUM({\SUM\[39\] , \SUM\[38\] , \SUM\[37\] , 
        \SUM\[36\] , \SUM\[35\] , \SUM\[34\] , \SUM\[33\] , \SUM\[32\] , 
        \SUM\[31\] , \SUM\[30\] , \SUM\[29\] , \SUM\[28\] , \SUM\[27\] , 
        \SUM\[26\] , \SUM\[25\] , \SUM\[24\] , \SUM\[23\] , \SUM\[22\] , 
        \SUM\[21\] , \SUM\[20\] , \SUM\[19\] , \SUM\[18\] , \SUM\[17\] , 
        \SUM\[16\] , \SUM\[15\] , \SUM\[14\] , \SUM\[13\] , \SUM\[12\] , 
        \SUM\[11\] , \SUM\[10\] , \SUM\[9\] , \SUM\[8\] , \SUM\[7\] , 
        \SUM\[6\] , \SUM\[5\] , \SUM\[4\] , \SUM\[3\] , \SUM\[2\] , \SUM\[1\] , 
        \SUM\[0\] }), CO );
  input \A\[39\] , \A\[38\] , \A\[37\] , \A\[36\] , \A\[35\] , \A\[34\] ,
         \A\[33\] , \A\[32\] , \A\[31\] , \A\[30\] , \A\[29\] , \A\[28\] ,
         \A\[27\] , \A\[26\] , \A\[25\] , \A\[24\] , \A\[23\] , \A\[22\] ,
         \A\[21\] , \A\[20\] , \A\[19\] , \A\[18\] , \A\[17\] , \A\[16\] ,
         \A\[15\] , \A\[14\] , \A\[13\] , \A\[12\] , \A\[11\] , \A\[10\] ,
         \A\[9\] , \A\[8\] , \A\[7\] , \A\[6\] , \A\[5\] , \A\[4\] , \A\[3\] ,
         \A\[2\] , \A\[1\] , \A\[0\] , \B\[39\] , \B\[38\] , \B\[37\] ,
         \B\[36\] , \B\[35\] , \B\[34\] , \B\[33\] , \B\[32\] , \B\[31\] ,
         \B\[30\] , \B\[29\] , \B\[28\] , \B\[27\] , \B\[26\] , \B\[25\] ,
         \B\[24\] , \B\[23\] , \B\[22\] , \B\[21\] , \B\[20\] , \B\[19\] ,
         \B\[18\] , \B\[17\] , \B\[16\] , \B\[15\] , \B\[14\] , \B\[13\] ,
         \B\[12\] , \B\[11\] , \B\[10\] , \B\[9\] , \B\[8\] , \B\[7\] ,
         \B\[6\] , \B\[5\] , \B\[4\] , \B\[3\] , \B\[2\] , \B\[1\] , \B\[0\] ,
         CI;
  output \SUM\[39\] , \SUM\[38\] , \SUM\[37\] , \SUM\[36\] , \SUM\[35\] ,
         \SUM\[34\] , \SUM\[33\] , \SUM\[32\] , \SUM\[31\] , \SUM\[30\] ,
         \SUM\[29\] , \SUM\[28\] , \SUM\[27\] , \SUM\[26\] , \SUM\[25\] ,
         \SUM\[24\] , \SUM\[23\] , \SUM\[22\] , \SUM\[21\] , \SUM\[20\] ,
         \SUM\[19\] , \SUM\[18\] , \SUM\[17\] , \SUM\[16\] , \SUM\[15\] ,
         \SUM\[14\] , \SUM\[13\] , \SUM\[12\] , \SUM\[11\] , \SUM\[10\] ,
         \SUM\[9\] , \SUM\[8\] , \SUM\[7\] , \SUM\[6\] , \SUM\[5\] ,
         \SUM\[4\] , \SUM\[3\] , \SUM\[2\] , \SUM\[1\] , \SUM\[0\] , CO;
  wire   n1, n2, n3, n4, n5, n6, n9, n10, n11, n12, n13, n14, n15, n17, n18,
         n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46,
         n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60,
         n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74,
         n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88,
         n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101,
         n102, n103, n104, n105, n106, n107, n108, n109, n110, n111, n112,
         n113, n114, n115, n116, n117, n118, n119, n120, n121, n122, n123,
         n124, n125, n126, n127, n128, n129, n130, n131, n132, n133, n134,
         n135, n136, n137, n138, n139, n140, n141, n142, n143, n144, n145,
         n146, n147, n148, n149, n150, n151, n152, n153, n154, n155, n156,
         n157, n158, n159, n160, n161, n162, n163, n164, n165, n166, n167,
         n168, n169, n170, n171, n172, n173, n174, n175, n176;

  AOI21xp5_ASAP7_75t_R U2 ( .A1(n54), .A2(n55), .B(n56), .Y(n52) );
  O2A1O1Ixp33_ASAP7_75t_R U3 ( .A1(n80), .A2(n81), .B(n82), .C(n83), .Y(n76)
         );
  NAND4xp25_ASAP7_75t_R U4 ( .A(n78), .B(n85), .C(n84), .D(n86), .Y(n53) );
  NAND4xp25_ASAP7_75t_R U5 ( .A(n119), .B(n120), .C(n121), .D(n122), .Y(n58)
         );
  NOR2xp33_ASAP7_75t_R U6 ( .A(n3), .B(n123), .Y(n121) );
  O2A1O1Ixp33_ASAP7_75t_R U7 ( .A1(n45), .A2(n46), .B(n47), .C(n48), .Y(n41)
         );
  AOI21xp5_ASAP7_75t_R U8 ( .A1(n49), .A2(n50), .B(n51), .Y(n46) );
  NOR2xp33_ASAP7_75t_R U9 ( .A(n57), .B(n53), .Y(n49) );
  O2A1O1Ixp33_ASAP7_75t_R U10 ( .A1(n103), .A2(n104), .B(n105), .C(n106), .Y(
        n99) );
  NAND4xp25_ASAP7_75t_R U11 ( .A(n101), .B(n107), .C(n108), .D(n109), .Y(n57)
         );
  O2A1O1Ixp33_ASAP7_75t_R U12 ( .A1(n123), .A2(n128), .B(n129), .C(n3), .Y(
        n126) );
  NOR2xp33_ASAP7_75t_R U13 ( .A(n17), .B(n26), .Y(n25) );
  NOR2xp33_ASAP7_75t_R U14 ( .A(n29), .B(n1), .Y(n27) );
  NOR2xp33_ASAP7_75t_R U15 ( .A(n33), .B(n34), .Y(n32) );
  AOI21xp5_ASAP7_75t_R U16 ( .A1(n144), .A2(n145), .B(n146), .Y(n143) );
  NOR2xp33_ASAP7_75t_R U17 ( .A(n5), .B(n172), .Y(n166) );
  NOR2xp33_ASAP7_75t_R U18 ( .A(n127), .B(n3), .Y(n133) );
  AOI21xp5_ASAP7_75t_R U19 ( .A1(n156), .A2(n149), .B(n144), .Y(n155) );
  NOR2xp33_ASAP7_75t_R U20 ( .A(n168), .B(n5), .Y(n176) );
  OR2x2_ASAP7_75t_R U21 ( .A(n30), .B(n31), .Y(n1) );
  AND2x2_ASAP7_75t_R U22 ( .A(\A\[37\] ), .B(n25), .Y(n2) );
  NOR2xp33_ASAP7_75t_R U23 ( .A(\A\[18\] ), .B(\B\[18\] ), .Y(n3) );
  OA21x2_ASAP7_75t_R U24 ( .A1(n22), .A2(n172), .B(n21), .Y(n4) );
  NOR2xp33_ASAP7_75t_R U25 ( .A(\A\[10\] ), .B(\B\[10\] ), .Y(n5) );
  AND2x2_ASAP7_75t_R U26 ( .A(\A\[38\] ), .B(n2), .Y(n6) );
  XOR2xp5_ASAP7_75t_R U27 ( .A(\A\[38\] ), .B(n2), .Y(\SUM\[38\] ) );
  XOR2xp5_ASAP7_75t_R U28 ( .A(\A\[37\] ), .B(n25), .Y(\SUM\[37\] ) );
  AND2x2_ASAP7_75t_R U29 ( .A(n151), .B(n152), .Y(n9) );
  AND2x2_ASAP7_75t_R U30 ( .A(n74), .B(n75), .Y(n10) );
  AND2x2_ASAP7_75t_R U31 ( .A(n118), .B(n58), .Y(n11) );
  OA21x2_ASAP7_75t_R U32 ( .A1(n45), .A2(n69), .B(n47), .Y(n12) );
  AOI21xp5_ASAP7_75t_R U33 ( .A1(n90), .A2(n84), .B(n91), .Y(n13) );
  OA21x2_ASAP7_75t_R U34 ( .A1(n103), .A2(n113), .B(n105), .Y(n14) );
  OA21x2_ASAP7_75t_R U35 ( .A1(n123), .A2(n134), .B(n129), .Y(n15) );
  AND2x2_ASAP7_75t_R U36 ( .A(n22), .B(n23), .Y(\SUM\[8\] ) );
  INVx1_ASAP7_75t_R U37 ( .A(n22), .Y(n18) );
  NAND2xp5_ASAP7_75t_R U38 ( .A(n27), .B(\A\[35\] ), .Y(n17) );
  INVx1_ASAP7_75t_R U39 ( .A(\A\[32\] ), .Y(n33) );
  INVx1_ASAP7_75t_R U40 ( .A(\A\[33\] ), .Y(n30) );
  INVx1_ASAP7_75t_R U41 ( .A(\A\[34\] ), .Y(n29) );
  INVx1_ASAP7_75t_R U42 ( .A(\A\[35\] ), .Y(n28) );
  XNOR2xp5_ASAP7_75t_R U43 ( .A(\A\[36\] ), .B(n17), .Y(\SUM\[36\] ) );
  INVx1_ASAP7_75t_R U44 ( .A(\A\[36\] ), .Y(n26) );
  INVx1_ASAP7_75t_R U45 ( .A(\A\[39\] ), .Y(n24) );
  XNOR2xp5_ASAP7_75t_R U46 ( .A(n18), .B(n19), .Y(\SUM\[9\] ) );
  NAND2xp5_ASAP7_75t_R U47 ( .A(n20), .B(n21), .Y(n19) );
  XNOR2xp5_ASAP7_75t_R U48 ( .A(n24), .B(n6), .Y(\SUM\[39\] ) );
  XNOR2xp5_ASAP7_75t_R U49 ( .A(n27), .B(n28), .Y(\SUM\[35\] ) );
  XOR2xp5_ASAP7_75t_R U50 ( .A(n29), .B(n1), .Y(\SUM\[34\] ) );
  INVx1_ASAP7_75t_R U51 ( .A(n32), .Y(n31) );
  XNOR2xp5_ASAP7_75t_R U52 ( .A(n32), .B(n30), .Y(\SUM\[33\] ) );
  XNOR2xp5_ASAP7_75t_R U53 ( .A(n34), .B(\A\[32\] ), .Y(\SUM\[32\] ) );
  INVx1_ASAP7_75t_R U54 ( .A(n35), .Y(n34) );
  A2O1A1Ixp33_ASAP7_75t_R U55 ( .A1(n36), .A2(n37), .B(n38), .C(n39), .Y(n35)
         );
  INVx1_ASAP7_75t_R U56 ( .A(n40), .Y(n38) );
  OAI21xp5_ASAP7_75t_R U57 ( .A1(n41), .A2(n42), .B(n43), .Y(n37) );
  INVx1_ASAP7_75t_R U58 ( .A(n44), .Y(n42) );
  OAI21xp5_ASAP7_75t_R U59 ( .A1(n52), .A2(n53), .B(n10), .Y(n51) );
  INVx1_ASAP7_75t_R U60 ( .A(n57), .Y(n54) );
  INVx1_ASAP7_75t_R U61 ( .A(n58), .Y(n50) );
  XNOR2xp5_ASAP7_75t_R U62 ( .A(n59), .B(n60), .Y(\SUM\[31\] ) );
  NAND2xp5_ASAP7_75t_R U63 ( .A(n40), .B(n39), .Y(n60) );
  NAND2xp5_ASAP7_75t_R U64 ( .A(\B\[31\] ), .B(\A\[31\] ), .Y(n39) );
  NAND2xp5_ASAP7_75t_R U65 ( .A(n61), .B(n62), .Y(n40) );
  INVx1_ASAP7_75t_R U66 ( .A(\A\[31\] ), .Y(n62) );
  INVx1_ASAP7_75t_R U67 ( .A(\B\[31\] ), .Y(n61) );
  OAI21xp5_ASAP7_75t_R U68 ( .A1(n63), .A2(n64), .B(n36), .Y(n59) );
  INVx1_ASAP7_75t_R U69 ( .A(n65), .Y(n64) );
  INVx1_ASAP7_75t_R U70 ( .A(n43), .Y(n63) );
  XNOR2xp5_ASAP7_75t_R U71 ( .A(n65), .B(n66), .Y(\SUM\[30\] ) );
  NAND2xp5_ASAP7_75t_R U72 ( .A(n43), .B(n36), .Y(n66) );
  NAND2xp5_ASAP7_75t_R U73 ( .A(\B\[30\] ), .B(\A\[30\] ), .Y(n36) );
  OR2x2_ASAP7_75t_R U74 ( .A(\A\[30\] ), .B(\B\[30\] ), .Y(n43) );
  OAI21xp5_ASAP7_75t_R U75 ( .A1(n48), .A2(n12), .B(n44), .Y(n65) );
  INVx1_ASAP7_75t_R U76 ( .A(n67), .Y(n48) );
  XOR2xp5_ASAP7_75t_R U77 ( .A(n68), .B(n12), .Y(\SUM\[29\] ) );
  INVx1_ASAP7_75t_R U78 ( .A(n70), .Y(n69) );
  INVx1_ASAP7_75t_R U79 ( .A(n71), .Y(n45) );
  NAND2xp5_ASAP7_75t_R U80 ( .A(n67), .B(n44), .Y(n68) );
  NAND2xp5_ASAP7_75t_R U81 ( .A(\B\[29\] ), .B(\A\[29\] ), .Y(n44) );
  OR2x2_ASAP7_75t_R U82 ( .A(\A\[29\] ), .B(\B\[29\] ), .Y(n67) );
  XNOR2xp5_ASAP7_75t_R U83 ( .A(n70), .B(n72), .Y(\SUM\[28\] ) );
  NAND2xp5_ASAP7_75t_R U84 ( .A(n71), .B(n47), .Y(n72) );
  NAND2xp5_ASAP7_75t_R U85 ( .A(\B\[28\] ), .B(\A\[28\] ), .Y(n47) );
  OR2x2_ASAP7_75t_R U86 ( .A(\A\[28\] ), .B(\B\[28\] ), .Y(n71) );
  OAI21xp5_ASAP7_75t_R U87 ( .A1(n73), .A2(n53), .B(n10), .Y(n70) );
  OAI21xp5_ASAP7_75t_R U88 ( .A1(n76), .A2(n77), .B(n78), .Y(n75) );
  INVx1_ASAP7_75t_R U89 ( .A(n79), .Y(n77) );
  INVx1_ASAP7_75t_R U90 ( .A(n84), .Y(n80) );
  XNOR2xp5_ASAP7_75t_R U91 ( .A(n87), .B(n88), .Y(\SUM\[27\] ) );
  NAND2xp5_ASAP7_75t_R U92 ( .A(n78), .B(n74), .Y(n88) );
  NAND2xp5_ASAP7_75t_R U93 ( .A(\B\[27\] ), .B(\A\[27\] ), .Y(n74) );
  OR2x2_ASAP7_75t_R U94 ( .A(\A\[27\] ), .B(\B\[27\] ), .Y(n78) );
  OAI21xp5_ASAP7_75t_R U95 ( .A1(n83), .A2(n13), .B(n79), .Y(n87) );
  INVx1_ASAP7_75t_R U96 ( .A(n85), .Y(n83) );
  XOR2xp5_ASAP7_75t_R U97 ( .A(n89), .B(n13), .Y(\SUM\[26\] ) );
  INVx1_ASAP7_75t_R U98 ( .A(n82), .Y(n91) );
  NAND2xp5_ASAP7_75t_R U99 ( .A(n85), .B(n79), .Y(n89) );
  NAND2xp5_ASAP7_75t_R U100 ( .A(\B\[26\] ), .B(\A\[26\] ), .Y(n79) );
  OR2x2_ASAP7_75t_R U101 ( .A(\A\[26\] ), .B(\B\[26\] ), .Y(n85) );
  XNOR2xp5_ASAP7_75t_R U102 ( .A(n90), .B(n92), .Y(\SUM\[25\] ) );
  NAND2xp5_ASAP7_75t_R U103 ( .A(n84), .B(n82), .Y(n92) );
  NAND2xp5_ASAP7_75t_R U104 ( .A(\B\[25\] ), .B(\A\[25\] ), .Y(n82) );
  OR2x2_ASAP7_75t_R U105 ( .A(\A\[25\] ), .B(\B\[25\] ), .Y(n84) );
  OAI21xp5_ASAP7_75t_R U106 ( .A1(n93), .A2(n73), .B(n81), .Y(n90) );
  INVx1_ASAP7_75t_R U107 ( .A(n94), .Y(n73) );
  INVx1_ASAP7_75t_R U108 ( .A(n86), .Y(n93) );
  XNOR2xp5_ASAP7_75t_R U109 ( .A(n94), .B(n95), .Y(\SUM\[24\] ) );
  NAND2xp5_ASAP7_75t_R U110 ( .A(n81), .B(n86), .Y(n95) );
  OR2x2_ASAP7_75t_R U111 ( .A(\A\[24\] ), .B(\B\[24\] ), .Y(n86) );
  NAND2xp5_ASAP7_75t_R U112 ( .A(\B\[24\] ), .B(\A\[24\] ), .Y(n81) );
  OAI21xp5_ASAP7_75t_R U113 ( .A1(n11), .A2(n57), .B(n96), .Y(n94) );
  INVx1_ASAP7_75t_R U114 ( .A(n56), .Y(n96) );
  NAND2xp5_ASAP7_75t_R U115 ( .A(n97), .B(n98), .Y(n56) );
  OAI21xp5_ASAP7_75t_R U116 ( .A1(n99), .A2(n100), .B(n101), .Y(n98) );
  INVx1_ASAP7_75t_R U117 ( .A(n102), .Y(n100) );
  XNOR2xp5_ASAP7_75t_R U118 ( .A(n110), .B(n111), .Y(\SUM\[23\] ) );
  NAND2xp5_ASAP7_75t_R U119 ( .A(n101), .B(n97), .Y(n111) );
  NAND2xp5_ASAP7_75t_R U120 ( .A(\B\[23\] ), .B(\A\[23\] ), .Y(n97) );
  OR2x2_ASAP7_75t_R U121 ( .A(\A\[23\] ), .B(\B\[23\] ), .Y(n101) );
  OAI21xp5_ASAP7_75t_R U122 ( .A1(n106), .A2(n14), .B(n102), .Y(n110) );
  INVx1_ASAP7_75t_R U123 ( .A(n107), .Y(n106) );
  XOR2xp5_ASAP7_75t_R U124 ( .A(n112), .B(n14), .Y(\SUM\[22\] ) );
  INVx1_ASAP7_75t_R U125 ( .A(n114), .Y(n113) );
  INVx1_ASAP7_75t_R U126 ( .A(n108), .Y(n103) );
  NAND2xp5_ASAP7_75t_R U127 ( .A(n107), .B(n102), .Y(n112) );
  NAND2xp5_ASAP7_75t_R U128 ( .A(\B\[22\] ), .B(\A\[22\] ), .Y(n102) );
  OR2x2_ASAP7_75t_R U129 ( .A(\A\[22\] ), .B(\B\[22\] ), .Y(n107) );
  XNOR2xp5_ASAP7_75t_R U130 ( .A(n114), .B(n115), .Y(\SUM\[21\] ) );
  NAND2xp5_ASAP7_75t_R U131 ( .A(n108), .B(n105), .Y(n115) );
  NAND2xp5_ASAP7_75t_R U132 ( .A(\B\[21\] ), .B(\A\[21\] ), .Y(n105) );
  OR2x2_ASAP7_75t_R U133 ( .A(\A\[21\] ), .B(\B\[21\] ), .Y(n108) );
  OAI21xp5_ASAP7_75t_R U134 ( .A1(n116), .A2(n11), .B(n104), .Y(n114) );
  INVx1_ASAP7_75t_R U135 ( .A(n109), .Y(n116) );
  XOR2xp5_ASAP7_75t_R U136 ( .A(n117), .B(n11), .Y(\SUM\[20\] ) );
  INVx1_ASAP7_75t_R U137 ( .A(n55), .Y(n118) );
  NAND2xp5_ASAP7_75t_R U138 ( .A(n124), .B(n125), .Y(n55) );
  OAI21xp5_ASAP7_75t_R U139 ( .A1(n126), .A2(n127), .B(n119), .Y(n125) );
  NAND2xp5_ASAP7_75t_R U140 ( .A(n109), .B(n104), .Y(n117) );
  NAND2xp5_ASAP7_75t_R U141 ( .A(\B\[20\] ), .B(\A\[20\] ), .Y(n104) );
  OR2x2_ASAP7_75t_R U142 ( .A(\A\[20\] ), .B(\B\[20\] ), .Y(n109) );
  XNOR2xp5_ASAP7_75t_R U143 ( .A(n130), .B(n131), .Y(\SUM\[19\] ) );
  NAND2xp5_ASAP7_75t_R U144 ( .A(n119), .B(n124), .Y(n131) );
  NAND2xp5_ASAP7_75t_R U145 ( .A(\B\[19\] ), .B(\A\[19\] ), .Y(n124) );
  OR2x2_ASAP7_75t_R U146 ( .A(\A\[19\] ), .B(\B\[19\] ), .Y(n119) );
  OAI21xp5_ASAP7_75t_R U147 ( .A1(n3), .A2(n15), .B(n132), .Y(n130) );
  XNOR2xp5_ASAP7_75t_R U148 ( .A(n15), .B(n133), .Y(\SUM\[18\] ) );
  INVx1_ASAP7_75t_R U149 ( .A(n132), .Y(n127) );
  NAND2xp5_ASAP7_75t_R U150 ( .A(\B\[18\] ), .B(\A\[18\] ), .Y(n132) );
  INVx1_ASAP7_75t_R U151 ( .A(n135), .Y(n134) );
  INVx1_ASAP7_75t_R U152 ( .A(n136), .Y(n123) );
  XNOR2xp5_ASAP7_75t_R U153 ( .A(n137), .B(n135), .Y(\SUM\[17\] ) );
  OAI21xp5_ASAP7_75t_R U154 ( .A1(n138), .A2(n139), .B(n128), .Y(n135) );
  INVx1_ASAP7_75t_R U155 ( .A(n122), .Y(n139) );
  INVx1_ASAP7_75t_R U156 ( .A(n120), .Y(n138) );
  NAND2xp5_ASAP7_75t_R U157 ( .A(n129), .B(n136), .Y(n137) );
  OR2x2_ASAP7_75t_R U158 ( .A(\A\[17\] ), .B(\B\[17\] ), .Y(n136) );
  NAND2xp5_ASAP7_75t_R U159 ( .A(\B\[17\] ), .B(\A\[17\] ), .Y(n129) );
  XNOR2xp5_ASAP7_75t_R U160 ( .A(n122), .B(n140), .Y(\SUM\[16\] ) );
  NAND2xp5_ASAP7_75t_R U161 ( .A(n128), .B(n120), .Y(n140) );
  OR2x2_ASAP7_75t_R U162 ( .A(\A\[16\] ), .B(\B\[16\] ), .Y(n120) );
  NAND2xp5_ASAP7_75t_R U163 ( .A(\B\[16\] ), .B(\A\[16\] ), .Y(n128) );
  A2O1A1Ixp33_ASAP7_75t_R U164 ( .A1(n141), .A2(n9), .B(n142), .C(n143), .Y(
        n122) );
  INVx1_ASAP7_75t_R U165 ( .A(n147), .Y(n146) );
  NAND3xp33_ASAP7_75t_R U166 ( .A(n145), .B(n148), .C(n149), .Y(n142) );
  NAND2xp5_ASAP7_75t_R U167 ( .A(n153), .B(n150), .Y(n141) );
  XOR2xp5_ASAP7_75t_R U168 ( .A(n154), .B(n155), .Y(\SUM\[15\] ) );
  INVx1_ASAP7_75t_R U169 ( .A(n157), .Y(n144) );
  NAND2xp5_ASAP7_75t_R U170 ( .A(n145), .B(n147), .Y(n154) );
  NAND2xp5_ASAP7_75t_R U171 ( .A(\B\[15\] ), .B(\A\[15\] ), .Y(n147) );
  OR2x2_ASAP7_75t_R U172 ( .A(\A\[15\] ), .B(\B\[15\] ), .Y(n145) );
  XNOR2xp5_ASAP7_75t_R U173 ( .A(n158), .B(n156), .Y(\SUM\[14\] ) );
  OAI21xp5_ASAP7_75t_R U174 ( .A1(n159), .A2(n160), .B(n151), .Y(n156) );
  INVx1_ASAP7_75t_R U175 ( .A(n161), .Y(n160) );
  INVx1_ASAP7_75t_R U176 ( .A(n148), .Y(n159) );
  NAND2xp5_ASAP7_75t_R U177 ( .A(n149), .B(n157), .Y(n158) );
  NAND2xp5_ASAP7_75t_R U178 ( .A(\B\[14\] ), .B(\A\[14\] ), .Y(n157) );
  OR2x2_ASAP7_75t_R U179 ( .A(\A\[14\] ), .B(\B\[14\] ), .Y(n149) );
  XNOR2xp5_ASAP7_75t_R U180 ( .A(n161), .B(n162), .Y(\SUM\[13\] ) );
  NAND2xp5_ASAP7_75t_R U181 ( .A(n148), .B(n151), .Y(n162) );
  NAND2xp5_ASAP7_75t_R U182 ( .A(\B\[13\] ), .B(\A\[13\] ), .Y(n151) );
  OR2x2_ASAP7_75t_R U183 ( .A(\A\[13\] ), .B(\B\[13\] ), .Y(n148) );
  OAI21xp5_ASAP7_75t_R U184 ( .A1(n163), .A2(n165), .B(n152), .Y(n161) );
  INVx1_ASAP7_75t_R U185 ( .A(n150), .Y(n163) );
  XOR2xp5_ASAP7_75t_R U186 ( .A(n164), .B(n165), .Y(\SUM\[12\] ) );
  INVx1_ASAP7_75t_R U187 ( .A(n165), .Y(n153) );
  A2O1A1O1Ixp25_ASAP7_75t_R U188 ( .A1(n166), .A2(n167), .B(n168), .C(n169), 
        .D(n170), .Y(n165) );
  INVx1_ASAP7_75t_R U189 ( .A(n171), .Y(n170) );
  NAND2xp5_ASAP7_75t_R U190 ( .A(n22), .B(n21), .Y(n167) );
  NAND2xp5_ASAP7_75t_R U191 ( .A(n150), .B(n152), .Y(n164) );
  NAND2xp5_ASAP7_75t_R U192 ( .A(\B\[12\] ), .B(\A\[12\] ), .Y(n152) );
  OR2x2_ASAP7_75t_R U193 ( .A(\A\[12\] ), .B(\B\[12\] ), .Y(n150) );
  XNOR2xp5_ASAP7_75t_R U194 ( .A(n173), .B(n174), .Y(\SUM\[11\] ) );
  NAND2xp5_ASAP7_75t_R U195 ( .A(n169), .B(n171), .Y(n174) );
  NAND2xp5_ASAP7_75t_R U196 ( .A(\B\[11\] ), .B(\A\[11\] ), .Y(n171) );
  OR2x2_ASAP7_75t_R U197 ( .A(\A\[11\] ), .B(\B\[11\] ), .Y(n169) );
  OAI21xp5_ASAP7_75t_R U198 ( .A1(n5), .A2(n4), .B(n175), .Y(n173) );
  XNOR2xp5_ASAP7_75t_R U199 ( .A(n4), .B(n176), .Y(\SUM\[10\] ) );
  INVx1_ASAP7_75t_R U200 ( .A(n175), .Y(n168) );
  NAND2xp5_ASAP7_75t_R U201 ( .A(\B\[10\] ), .B(\A\[10\] ), .Y(n175) );
  NAND2xp5_ASAP7_75t_R U202 ( .A(\B\[9\] ), .B(\A\[9\] ), .Y(n21) );
  INVx1_ASAP7_75t_R U203 ( .A(n20), .Y(n172) );
  OR2x2_ASAP7_75t_R U204 ( .A(\A\[9\] ), .B(\B\[9\] ), .Y(n20) );
  NAND2xp5_ASAP7_75t_R U205 ( .A(\B\[8\] ), .B(\A\[8\] ), .Y(n22) );
  OR2x2_ASAP7_75t_R U206 ( .A(\A\[8\] ), .B(\B\[8\] ), .Y(n23) );
endmodule


module fp32_exp_DW01_sub_6 ( .A({\A\[22\] , \A\[21\] , \A\[20\] , \A\[19\] , 
        \A\[18\] , \A\[17\] , \A\[16\] , \A\[15\] , \A\[14\] , \A\[13\] , 
        \A\[12\] , \A\[11\] , \A\[10\] , \A\[9\] , \A\[8\] , \A\[7\] , 
        \A\[6\] , \A\[5\] , \A\[4\] , \A\[3\] , \A\[2\] , \A\[1\] , \A\[0\] }), 
    .B({\B\[22\] , \B\[21\] , \B\[20\] , \B\[19\] , \B\[18\] , \B\[17\] , 
        \B\[16\] , \B\[15\] , \B\[14\] , \B\[13\] , \B\[12\] , \B\[11\] , 
        \B\[10\] , \B\[9\] , \B\[8\] , \B\[7\] , \B\[6\] , \B\[5\] , \B\[4\] , 
        \B\[3\] , \B\[2\] , \B\[1\] , \B\[0\] }), CI, .DIFF({\DIFF\[22\] , 
        \DIFF\[21\] , \DIFF\[20\] , \DIFF\[19\] , \DIFF\[18\] , \DIFF\[17\] , 
        \DIFF\[16\] , \DIFF\[15\] , \DIFF\[14\] , \DIFF\[13\] , \DIFF\[12\] , 
        \DIFF\[11\] , \DIFF\[10\] , \DIFF\[9\] , \DIFF\[8\] , \DIFF\[7\] , 
        \DIFF\[6\] , \DIFF\[5\] , \DIFF\[4\] , \DIFF\[3\] , \DIFF\[2\] , 
        \DIFF\[1\] , \DIFF\[0\] }), CO );
  input \A\[22\] , \A\[21\] , \A\[20\] , \A\[19\] , \A\[18\] , \A\[17\] ,
         \A\[16\] , \A\[15\] , \A\[14\] , \A\[13\] , \A\[12\] , \A\[11\] ,
         \A\[10\] , \A\[9\] , \A\[8\] , \A\[7\] , \A\[6\] , \A\[5\] , \A\[4\] ,
         \A\[3\] , \A\[2\] , \A\[1\] , \A\[0\] , \B\[22\] , \B\[21\] ,
         \B\[20\] , \B\[19\] , \B\[18\] , \B\[17\] , \B\[16\] , \B\[15\] ,
         \B\[14\] , \B\[13\] , \B\[12\] , \B\[11\] , \B\[10\] , \B\[9\] ,
         \B\[8\] , \B\[7\] , \B\[6\] , \B\[5\] , \B\[4\] , \B\[3\] , \B\[2\] ,
         \B\[1\] , \B\[0\] , CI;
  output \DIFF\[22\] , \DIFF\[21\] , \DIFF\[20\] , \DIFF\[19\] , \DIFF\[18\] ,
         \DIFF\[17\] , \DIFF\[16\] , \DIFF\[15\] , \DIFF\[14\] , \DIFF\[13\] ,
         \DIFF\[12\] , \DIFF\[11\] , \DIFF\[10\] , \DIFF\[9\] , \DIFF\[8\] ,
         \DIFF\[7\] , \DIFF\[6\] , \DIFF\[5\] , \DIFF\[4\] , \DIFF\[3\] ,
         \DIFF\[2\] , \DIFF\[1\] , \DIFF\[0\] , CO;
  wire   \B\[0\] , n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14,
         n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28,
         n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42,
         n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56;
  assign \DIFF\[0\]  = \B\[0\] ;

  NAND4xp25_ASAP7_75t_R U3 ( .A(n48), .B(n49), .C(n6), .D(n8), .Y(n35) );
  NOR2xp33_ASAP7_75t_R U4 ( .A(\B\[1\] ), .B(\B\[0\] ), .Y(n55) );
  NOR2xp33_ASAP7_75t_R U5 ( .A(n26), .B(\B\[20\] ), .Y(n25) );
  INVx1_ASAP7_75t_R U6 ( .A(n27), .Y(n26) );
  NOR2xp33_ASAP7_75t_R U7 ( .A(\B\[1\] ), .B(\B\[0\] ), .Y(n21) );
  NOR2xp33_ASAP7_75t_R U8 ( .A(n41), .B(\B\[4\] ), .Y(n14) );
  NOR2xp33_ASAP7_75t_R U9 ( .A(n53), .B(\B\[9\] ), .Y(n52) );
  NOR2xp33_ASAP7_75t_R U10 ( .A(\B\[12\] ), .B(n46), .Y(n45) );
  NAND4xp25_ASAP7_75t_R U11 ( .A(n36), .B(n37), .C(n38), .D(n39), .Y(n34) );
  NAND4xp25_ASAP7_75t_R U12 ( .A(n12), .B(n11), .C(n15), .D(n16), .Y(n40) );
  NOR2xp33_ASAP7_75t_R U13 ( .A(\B\[19\] ), .B(n28), .Y(n27) );
  NOR2xp33_ASAP7_75t_R U14 ( .A(\B\[5\] ), .B(n13), .Y(n10) );
  NOR2xp33_ASAP7_75t_R U15 ( .A(n4), .B(\B\[8\] ), .Y(n5) );
  NOR2xp33_ASAP7_75t_R U16 ( .A(n4), .B(n35), .Y(n47) );
  NOR2xp33_ASAP7_75t_R U17 ( .A(\B\[16\] ), .B(n32), .Y(n30) );
  NOR2xp33_ASAP7_75t_R U18 ( .A(\B\[18\] ), .B(n3), .Y(n29) );
  NOR2xp33_ASAP7_75t_R U19 ( .A(\B\[13\] ), .B(n44), .Y(n43) );
  NOR2xp33_ASAP7_75t_R U20 ( .A(\B\[2\] ), .B(n20), .Y(n18) );
  NOR2xp33_ASAP7_75t_R U21 ( .A(\B\[10\] ), .B(n51), .Y(n50) );
  NOR3xp33_ASAP7_75t_R U22 ( .A(n2), .B(n34), .C(n35), .Y(n33) );
  AND2x2_ASAP7_75t_R U23 ( .A(n24), .B(n25), .Y(n1) );
  OR2x2_ASAP7_75t_R U24 ( .A(n40), .B(n41), .Y(n2) );
  INVx1_ASAP7_75t_R U25 ( .A(n41), .Y(n17) );
  INVx1_ASAP7_75t_R U26 ( .A(\B\[17\] ), .Y(n31) );
  INVx1_ASAP7_75t_R U27 ( .A(\B\[15\] ), .Y(n38) );
  INVx1_ASAP7_75t_R U28 ( .A(\B\[14\] ), .Y(n39) );
  INVx1_ASAP7_75t_R U29 ( .A(\B\[13\] ), .Y(n37) );
  INVx1_ASAP7_75t_R U30 ( .A(\B\[12\] ), .Y(n36) );
  INVx1_ASAP7_75t_R U31 ( .A(\B\[11\] ), .Y(n48) );
  INVx1_ASAP7_75t_R U32 ( .A(\B\[9\] ), .Y(n6) );
  INVx1_ASAP7_75t_R U33 ( .A(\B\[8\] ), .Y(n8) );
  INVx1_ASAP7_75t_R U34 ( .A(\B\[3\] ), .Y(n19) );
  INVx1_ASAP7_75t_R U35 ( .A(\B\[2\] ), .Y(n22) );
  INVx1_ASAP7_75t_R U36 ( .A(\B\[4\] ), .Y(n16) );
  INVx1_ASAP7_75t_R U37 ( .A(\B\[5\] ), .Y(n15) );
  INVx1_ASAP7_75t_R U38 ( .A(\B\[6\] ), .Y(n11) );
  INVx1_ASAP7_75t_R U39 ( .A(\B\[7\] ), .Y(n12) );
  INVx1_ASAP7_75t_R U40 ( .A(\B\[10\] ), .Y(n49) );
  INVx1_ASAP7_75t_R U41 ( .A(\B\[0\] ), .Y(n56) );
  NAND3xp33_ASAP7_75t_R U42 ( .A(n22), .B(n19), .C(n55), .Y(n41) );
  NAND2xp5_ASAP7_75t_R U43 ( .A(n30), .B(n31), .Y(n3) );
  NAND2xp5_ASAP7_75t_R U44 ( .A(n54), .B(n17), .Y(n4) );
  INVx1_ASAP7_75t_R U45 ( .A(n4), .Y(n7) );
  NAND2xp5_ASAP7_75t_R U46 ( .A(n10), .B(n11), .Y(n9) );
  INVx1_ASAP7_75t_R U47 ( .A(n33), .Y(n32) );
  NAND2xp5_ASAP7_75t_R U48 ( .A(n43), .B(n39), .Y(n42) );
  XNOR2xp5_ASAP7_75t_R U49 ( .A(\B\[20\] ), .B(n27), .Y(\DIFF\[20\] ) );
  XNOR2xp5_ASAP7_75t_R U50 ( .A(\B\[21\] ), .B(n25), .Y(\DIFF\[21\] ) );
  INVx1_ASAP7_75t_R U51 ( .A(\B\[22\] ), .Y(n23) );
  XNOR2xp5_ASAP7_75t_R U52 ( .A(\B\[9\] ), .B(n5), .Y(\DIFF\[9\] ) );
  XNOR2xp5_ASAP7_75t_R U53 ( .A(n7), .B(\B\[8\] ), .Y(\DIFF\[8\] ) );
  XOR2xp5_ASAP7_75t_R U54 ( .A(\B\[7\] ), .B(n9), .Y(\DIFF\[7\] ) );
  XNOR2xp5_ASAP7_75t_R U55 ( .A(\B\[6\] ), .B(n10), .Y(\DIFF\[6\] ) );
  INVx1_ASAP7_75t_R U56 ( .A(n14), .Y(n13) );
  XNOR2xp5_ASAP7_75t_R U57 ( .A(\B\[5\] ), .B(n14), .Y(\DIFF\[5\] ) );
  XNOR2xp5_ASAP7_75t_R U58 ( .A(\B\[4\] ), .B(n17), .Y(\DIFF\[4\] ) );
  XNOR2xp5_ASAP7_75t_R U59 ( .A(n18), .B(\B\[3\] ), .Y(\DIFF\[3\] ) );
  INVx1_ASAP7_75t_R U60 ( .A(n21), .Y(n20) );
  XNOR2xp5_ASAP7_75t_R U61 ( .A(n21), .B(\B\[2\] ), .Y(\DIFF\[2\] ) );
  XOR2xp5_ASAP7_75t_R U62 ( .A(n1), .B(n23), .Y(\DIFF\[22\] ) );
  INVx1_ASAP7_75t_R U63 ( .A(\B\[21\] ), .Y(n24) );
  INVx1_ASAP7_75t_R U64 ( .A(n29), .Y(n28) );
  XNOR2xp5_ASAP7_75t_R U65 ( .A(\B\[1\] ), .B(n56), .Y(\DIFF\[1\] ) );
  XNOR2xp5_ASAP7_75t_R U66 ( .A(n29), .B(\B\[19\] ), .Y(\DIFF\[19\] ) );
  XOR2xp5_ASAP7_75t_R U67 ( .A(\B\[18\] ), .B(n3), .Y(\DIFF\[18\] ) );
  XNOR2xp5_ASAP7_75t_R U68 ( .A(n30), .B(\B\[17\] ), .Y(\DIFF\[17\] ) );
  XNOR2xp5_ASAP7_75t_R U69 ( .A(n33), .B(\B\[16\] ), .Y(\DIFF\[16\] ) );
  XOR2xp5_ASAP7_75t_R U70 ( .A(\B\[15\] ), .B(n42), .Y(\DIFF\[15\] ) );
  XNOR2xp5_ASAP7_75t_R U71 ( .A(\B\[14\] ), .B(n43), .Y(\DIFF\[14\] ) );
  INVx1_ASAP7_75t_R U72 ( .A(n45), .Y(n44) );
  XNOR2xp5_ASAP7_75t_R U73 ( .A(\B\[13\] ), .B(n45), .Y(\DIFF\[13\] ) );
  INVx1_ASAP7_75t_R U74 ( .A(n47), .Y(n46) );
  XNOR2xp5_ASAP7_75t_R U75 ( .A(\B\[12\] ), .B(n47), .Y(\DIFF\[12\] ) );
  XNOR2xp5_ASAP7_75t_R U76 ( .A(n50), .B(\B\[11\] ), .Y(\DIFF\[11\] ) );
  INVx1_ASAP7_75t_R U77 ( .A(n52), .Y(n51) );
  XNOR2xp5_ASAP7_75t_R U78 ( .A(\B\[10\] ), .B(n52), .Y(\DIFF\[10\] ) );
  INVx1_ASAP7_75t_R U79 ( .A(n5), .Y(n53) );
  INVx1_ASAP7_75t_R U80 ( .A(n40), .Y(n54) );
endmodule


module fp32_exp_DW01_sub_7 ( .A({\A\[23\] , \A\[22\] , \A\[21\] , \A\[20\] , 
        \A\[19\] , \A\[18\] , \A\[17\] , \A\[16\] , \A\[15\] , \A\[14\] , 
        \A\[13\] , \A\[12\] , \A\[11\] , \A\[10\] , \A\[9\] , \A\[8\] , 
        \A\[7\] , \A\[6\] , \A\[5\] , \A\[4\] , \A\[3\] , \A\[2\] , \A\[1\] , 
        \A\[0\] }), .B({\B\[23\] , \B\[22\] , \B\[21\] , \B\[20\] , \B\[19\] , 
        \B\[18\] , \B\[17\] , \B\[16\] , \B\[15\] , \B\[14\] , \B\[13\] , 
        \B\[12\] , \B\[11\] , \B\[10\] , \B\[9\] , \B\[8\] , \B\[7\] , 
        \B\[6\] , \B\[5\] , \B\[4\] , \B\[3\] , \B\[2\] , \B\[1\] , \B\[0\] }), 
        CI, .DIFF({\DIFF\[23\] , \DIFF\[22\] , \DIFF\[21\] , \DIFF\[20\] , 
        \DIFF\[19\] , \DIFF\[18\] , \DIFF\[17\] , \DIFF\[16\] , \DIFF\[15\] , 
        \DIFF\[14\] , \DIFF\[13\] , \DIFF\[12\] , \DIFF\[11\] , \DIFF\[10\] , 
        \DIFF\[9\] , \DIFF\[8\] , \DIFF\[7\] , \DIFF\[6\] , \DIFF\[5\] , 
        \DIFF\[4\] , \DIFF\[3\] , \DIFF\[2\] , \DIFF\[1\] , \DIFF\[0\] }), CO
 );
  input \A\[23\] , \A\[22\] , \A\[21\] , \A\[20\] , \A\[19\] , \A\[18\] ,
         \A\[17\] , \A\[16\] , \A\[15\] , \A\[14\] , \A\[13\] , \A\[12\] ,
         \A\[11\] , \A\[10\] , \A\[9\] , \A\[8\] , \A\[7\] , \A\[6\] ,
         \A\[5\] , \A\[4\] , \A\[3\] , \A\[2\] , \A\[1\] , \A\[0\] , \B\[23\] ,
         \B\[22\] , \B\[21\] , \B\[20\] , \B\[19\] , \B\[18\] , \B\[17\] ,
         \B\[16\] , \B\[15\] , \B\[14\] , \B\[13\] , \B\[12\] , \B\[11\] ,
         \B\[10\] , \B\[9\] , \B\[8\] , \B\[7\] , \B\[6\] , \B\[5\] , \B\[4\] ,
         \B\[3\] , \B\[2\] , \B\[1\] , \B\[0\] , CI;
  output \DIFF\[23\] , \DIFF\[22\] , \DIFF\[21\] , \DIFF\[20\] , \DIFF\[19\] ,
         \DIFF\[18\] , \DIFF\[17\] , \DIFF\[16\] , \DIFF\[15\] , \DIFF\[14\] ,
         \DIFF\[13\] , \DIFF\[12\] , \DIFF\[11\] , \DIFF\[10\] , \DIFF\[9\] ,
         \DIFF\[8\] , \DIFF\[7\] , \DIFF\[6\] , \DIFF\[5\] , \DIFF\[4\] ,
         \DIFF\[3\] , \DIFF\[2\] , \DIFF\[1\] , \DIFF\[0\] , CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72,
         n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86,
         n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100,
         n101, n102, n103, n104, n105, n106, n107, n108, n109, n110, n111,
         n112, n113, n114, n115, n116, n117, n118, n119, n120, n121, n122,
         n123, n124, n125, n126, n127, n128, n129, n130, n131, n132, n133,
         n134, n135, n136, n137, n138, n139, n140, n141, n142, n143, n144,
         n145, n146, n147, n148, n149, n150, n151, n152, n153, n154, n155,
         n156, n157, n158, n159, n160, n161, n162, n163, n164, n165, n166,
         n167, n168, n169, n170, n171, n172, n173, n174, n175, n176, n177,
         n178, n179, n180, n181, n182, n183;

  O2A1O1Ixp33_ASAP7_75t_R U3 ( .A1(n112), .A2(n109), .B(n113), .C(n110), .Y(
        n105) );
  OAI31xp33_ASAP7_75t_R U4 ( .A1(n108), .A2(n109), .A3(n110), .B(n111), .Y(
        n106) );
  NAND4xp25_ASAP7_75t_R U5 ( .A(n18), .B(n24), .C(n30), .D(n35), .Y(n109) );
  NOR2xp33_ASAP7_75t_R U6 ( .A(n46), .B(n1), .Y(n170) );
  NAND4xp25_ASAP7_75t_R U7 ( .A(n138), .B(n140), .C(n11), .D(n142), .Y(n110)
         );
  NOR2xp33_ASAP7_75t_R U8 ( .A(\A\[20\] ), .B(n60), .Y(n58) );
  O2A1O1Ixp33_ASAP7_75t_R U9 ( .A1(n94), .A2(n95), .B(n96), .C(n97), .Y(n87)
         );
  AOI21xp5_ASAP7_75t_R U10 ( .A1(n49), .A2(n50), .B(n51), .Y(n48) );
  NOR2xp33_ASAP7_75t_R U11 ( .A(\B\[22\] ), .B(n52), .Y(n51) );
  AOI21xp5_ASAP7_75t_R U12 ( .A1(n116), .A2(n104), .B(n95), .Y(n115) );
  NOR2xp33_ASAP7_75t_R U13 ( .A(n14), .B(n15), .Y(n13) );
  NOR2xp33_ASAP7_75t_R U14 ( .A(n29), .B(n26), .Y(n28) );
  NOR2xp33_ASAP7_75t_R U15 ( .A(n34), .B(n31), .Y(n33) );
  NOR2xp33_ASAP7_75t_R U16 ( .A(n68), .B(n46), .Y(n67) );
  AND2x2_ASAP7_75t_R U17 ( .A(\B\[0\] ), .B(n182), .Y(n1) );
  AOI21xp5_ASAP7_75t_R U18 ( .A1(n77), .A2(n78), .B(n79), .Y(n2) );
  AND2x2_ASAP7_75t_R U19 ( .A(n112), .B(n108), .Y(n3) );
  OA21x2_ASAP7_75t_R U20 ( .A1(n3), .A2(n109), .B(n113), .Y(n4) );
  OA21x2_ASAP7_75t_R U21 ( .A1(n125), .A2(n126), .B(n99), .Y(n5) );
  OA21x2_ASAP7_75t_R U22 ( .A1(n3), .A2(n31), .B(n32), .Y(n6) );
  AND2x2_ASAP7_75t_R U23 ( .A(n1), .B(n69), .Y(n7) );
  OR2x2_ASAP7_75t_R U24 ( .A(n177), .B(n1), .Y(\DIFF\[0\] ) );
  XNOR2xp5_ASAP7_75t_R U25 ( .A(n9), .B(n10), .Y(\DIFF\[9\] ) );
  NAND2xp5_ASAP7_75t_R U26 ( .A(n11), .B(n12), .Y(n10) );
  XNOR2xp5_ASAP7_75t_R U27 ( .A(n4), .B(n13), .Y(\DIFF\[8\] ) );
  XNOR2xp5_ASAP7_75t_R U28 ( .A(n16), .B(n17), .Y(\DIFF\[7\] ) );
  NAND2xp5_ASAP7_75t_R U29 ( .A(n18), .B(n19), .Y(n17) );
  OAI21xp5_ASAP7_75t_R U30 ( .A1(n20), .A2(n21), .B(n22), .Y(n16) );
  INVx1_ASAP7_75t_R U31 ( .A(n23), .Y(n21) );
  INVx1_ASAP7_75t_R U32 ( .A(n24), .Y(n20) );
  XNOR2xp5_ASAP7_75t_R U33 ( .A(n23), .B(n25), .Y(\DIFF\[6\] ) );
  NAND2xp5_ASAP7_75t_R U34 ( .A(n24), .B(n22), .Y(n25) );
  OAI21xp5_ASAP7_75t_R U35 ( .A1(n26), .A2(n6), .B(n27), .Y(n23) );
  XNOR2xp5_ASAP7_75t_R U36 ( .A(n6), .B(n28), .Y(\DIFF\[5\] ) );
  INVx1_ASAP7_75t_R U37 ( .A(n30), .Y(n26) );
  XNOR2xp5_ASAP7_75t_R U38 ( .A(n3), .B(n33), .Y(\DIFF\[4\] ) );
  INVx1_ASAP7_75t_R U39 ( .A(n35), .Y(n31) );
  XNOR2xp5_ASAP7_75t_R U40 ( .A(n36), .B(n37), .Y(\DIFF\[3\] ) );
  NAND2xp5_ASAP7_75t_R U41 ( .A(n38), .B(n39), .Y(n37) );
  OAI21xp5_ASAP7_75t_R U42 ( .A1(n40), .A2(n41), .B(n42), .Y(n36) );
  INVx1_ASAP7_75t_R U43 ( .A(n43), .Y(n41) );
  INVx1_ASAP7_75t_R U44 ( .A(n44), .Y(n40) );
  XNOR2xp5_ASAP7_75t_R U45 ( .A(n43), .B(n45), .Y(\DIFF\[2\] ) );
  NAND2xp5_ASAP7_75t_R U46 ( .A(n42), .B(n44), .Y(n45) );
  OAI21xp5_ASAP7_75t_R U47 ( .A1(n46), .A2(n7), .B(n47), .Y(n43) );
  XOR2xp5_ASAP7_75t_R U48 ( .A(n48), .B(\A\[23\] ), .Y(\DIFF\[23\] ) );
  NAND2xp5_ASAP7_75t_R U49 ( .A(\B\[22\] ), .B(n52), .Y(n49) );
  INVx1_ASAP7_75t_R U50 ( .A(\A\[22\] ), .Y(n52) );
  FAx1_ASAP7_75t_R U51 ( .A(\B\[22\] ), .B(\A\[22\] ), .CI(n50), .SN(
        \DIFF\[22\] ) );
  NAND2xp5_ASAP7_75t_R U52 ( .A(n53), .B(n54), .Y(n50) );
  OAI21xp5_ASAP7_75t_R U53 ( .A1(\A\[21\] ), .A2(n55), .B(n56), .Y(n54) );
  NAND2xp5_ASAP7_75t_R U54 ( .A(\A\[21\] ), .B(n55), .Y(n53) );
  INVx1_ASAP7_75t_R U55 ( .A(\B\[21\] ), .Y(n55) );
  FAx1_ASAP7_75t_R U56 ( .A(\B\[21\] ), .B(\A\[21\] ), .CI(n56), .SN(
        \DIFF\[21\] ) );
  OAI21xp5_ASAP7_75t_R U57 ( .A1(n57), .A2(n58), .B(n59), .Y(n56) );
  NAND2xp5_ASAP7_75t_R U58 ( .A(\A\[20\] ), .B(n60), .Y(n59) );
  INVx1_ASAP7_75t_R U59 ( .A(\B\[20\] ), .Y(n60) );
  INVx1_ASAP7_75t_R U60 ( .A(n61), .Y(n57) );
  FAx1_ASAP7_75t_R U61 ( .A(\B\[20\] ), .B(\A\[20\] ), .CI(n61), .SN(
        \DIFF\[20\] ) );
  OAI21xp5_ASAP7_75t_R U62 ( .A1(n62), .A2(n63), .B(n64), .Y(n61) );
  INVx1_ASAP7_75t_R U63 ( .A(n65), .Y(n63) );
  INVx1_ASAP7_75t_R U64 ( .A(n66), .Y(n62) );
  XNOR2xp5_ASAP7_75t_R U65 ( .A(n7), .B(n67), .Y(\DIFF\[1\] ) );
  XNOR2xp5_ASAP7_75t_R U66 ( .A(n65), .B(n70), .Y(\DIFF\[19\] ) );
  NAND2xp5_ASAP7_75t_R U67 ( .A(n64), .B(n66), .Y(n70) );
  NAND2xp5_ASAP7_75t_R U68 ( .A(\B\[19\] ), .B(n71), .Y(n66) );
  INVx1_ASAP7_75t_R U69 ( .A(\A\[19\] ), .Y(n71) );
  NAND2xp5_ASAP7_75t_R U70 ( .A(\A\[19\] ), .B(n72), .Y(n64) );
  INVx1_ASAP7_75t_R U71 ( .A(\B\[19\] ), .Y(n72) );
  OAI21xp5_ASAP7_75t_R U72 ( .A1(n73), .A2(n2), .B(n74), .Y(n65) );
  INVx1_ASAP7_75t_R U73 ( .A(n75), .Y(n73) );
  XOR2xp5_ASAP7_75t_R U74 ( .A(n76), .B(n2), .Y(\DIFF\[18\] ) );
  INVx1_ASAP7_75t_R U75 ( .A(n80), .Y(n79) );
  NAND2xp5_ASAP7_75t_R U76 ( .A(n75), .B(n74), .Y(n76) );
  NAND2xp5_ASAP7_75t_R U77 ( .A(\A\[18\] ), .B(n81), .Y(n74) );
  INVx1_ASAP7_75t_R U78 ( .A(\B\[18\] ), .Y(n81) );
  NAND2xp5_ASAP7_75t_R U79 ( .A(\B\[18\] ), .B(n82), .Y(n75) );
  INVx1_ASAP7_75t_R U80 ( .A(\A\[18\] ), .Y(n82) );
  XNOR2xp5_ASAP7_75t_R U81 ( .A(n77), .B(n83), .Y(\DIFF\[17\] ) );
  NAND2xp5_ASAP7_75t_R U82 ( .A(n78), .B(n80), .Y(n83) );
  NAND2xp5_ASAP7_75t_R U83 ( .A(\A\[17\] ), .B(n84), .Y(n80) );
  INVx1_ASAP7_75t_R U84 ( .A(\B\[17\] ), .Y(n84) );
  NAND2xp5_ASAP7_75t_R U85 ( .A(\B\[17\] ), .B(n85), .Y(n78) );
  INVx1_ASAP7_75t_R U86 ( .A(\A\[17\] ), .Y(n85) );
  OAI21xp5_ASAP7_75t_R U87 ( .A1(n86), .A2(n87), .B(n88), .Y(n77) );
  INVx1_ASAP7_75t_R U88 ( .A(n89), .Y(n86) );
  XNOR2xp5_ASAP7_75t_R U89 ( .A(n90), .B(n91), .Y(\DIFF\[16\] ) );
  NAND2xp5_ASAP7_75t_R U90 ( .A(n88), .B(n89), .Y(n91) );
  NAND2xp5_ASAP7_75t_R U91 ( .A(\B\[16\] ), .B(n92), .Y(n89) );
  INVx1_ASAP7_75t_R U92 ( .A(\A\[16\] ), .Y(n92) );
  NAND2xp5_ASAP7_75t_R U93 ( .A(\A\[16\] ), .B(n93), .Y(n88) );
  INVx1_ASAP7_75t_R U94 ( .A(\B\[16\] ), .Y(n93) );
  INVx1_ASAP7_75t_R U95 ( .A(n87), .Y(n90) );
  INVx1_ASAP7_75t_R U96 ( .A(n98), .Y(n97) );
  A2O1A1O1Ixp25_ASAP7_75t_R U97 ( .A1(n99), .A2(n100), .B(n101), .C(n102), .D(
        n103), .Y(n94) );
  INVx1_ASAP7_75t_R U98 ( .A(n104), .Y(n103) );
  OAI21xp5_ASAP7_75t_R U99 ( .A1(n105), .A2(n106), .B(n107), .Y(n100) );
  XOR2xp5_ASAP7_75t_R U100 ( .A(n114), .B(n115), .Y(\DIFF\[15\] ) );
  INVx1_ASAP7_75t_R U101 ( .A(n117), .Y(n95) );
  NAND2xp5_ASAP7_75t_R U102 ( .A(n96), .B(n98), .Y(n114) );
  NAND2xp5_ASAP7_75t_R U103 ( .A(\A\[15\] ), .B(n118), .Y(n98) );
  INVx1_ASAP7_75t_R U104 ( .A(\B\[15\] ), .Y(n118) );
  NAND2xp5_ASAP7_75t_R U105 ( .A(\B\[15\] ), .B(n119), .Y(n96) );
  INVx1_ASAP7_75t_R U106 ( .A(\A\[15\] ), .Y(n119) );
  XNOR2xp5_ASAP7_75t_R U107 ( .A(n116), .B(n120), .Y(\DIFF\[14\] ) );
  NAND2xp5_ASAP7_75t_R U108 ( .A(n104), .B(n117), .Y(n120) );
  NAND2xp5_ASAP7_75t_R U109 ( .A(\A\[14\] ), .B(n121), .Y(n117) );
  INVx1_ASAP7_75t_R U110 ( .A(\B\[14\] ), .Y(n121) );
  NAND2xp5_ASAP7_75t_R U111 ( .A(\B\[14\] ), .B(n122), .Y(n104) );
  INVx1_ASAP7_75t_R U112 ( .A(\A\[14\] ), .Y(n122) );
  OAI21xp5_ASAP7_75t_R U113 ( .A1(n101), .A2(n5), .B(n102), .Y(n116) );
  INVx1_ASAP7_75t_R U114 ( .A(n123), .Y(n101) );
  XOR2xp5_ASAP7_75t_R U115 ( .A(n124), .B(n5), .Y(\DIFF\[13\] ) );
  INVx1_ASAP7_75t_R U116 ( .A(n127), .Y(n126) );
  INVx1_ASAP7_75t_R U117 ( .A(n107), .Y(n125) );
  NAND2xp5_ASAP7_75t_R U118 ( .A(n123), .B(n102), .Y(n124) );
  NAND2xp5_ASAP7_75t_R U119 ( .A(\A\[13\] ), .B(n128), .Y(n102) );
  INVx1_ASAP7_75t_R U120 ( .A(\B\[13\] ), .Y(n128) );
  NAND2xp5_ASAP7_75t_R U121 ( .A(\B\[13\] ), .B(n129), .Y(n123) );
  INVx1_ASAP7_75t_R U122 ( .A(\A\[13\] ), .Y(n129) );
  XNOR2xp5_ASAP7_75t_R U123 ( .A(n127), .B(n130), .Y(\DIFF\[12\] ) );
  NAND2xp5_ASAP7_75t_R U124 ( .A(n107), .B(n99), .Y(n130) );
  NAND2xp5_ASAP7_75t_R U125 ( .A(\A\[12\] ), .B(n131), .Y(n99) );
  INVx1_ASAP7_75t_R U126 ( .A(\B\[12\] ), .Y(n131) );
  NAND2xp5_ASAP7_75t_R U127 ( .A(\B\[12\] ), .B(n132), .Y(n107) );
  INVx1_ASAP7_75t_R U128 ( .A(\A\[12\] ), .Y(n132) );
  OAI21xp5_ASAP7_75t_R U129 ( .A1(n4), .A2(n110), .B(n111), .Y(n127) );
  INVx1_ASAP7_75t_R U130 ( .A(n133), .Y(n111) );
  A2O1A1Ixp33_ASAP7_75t_R U131 ( .A1(n134), .A2(n135), .B(n136), .C(n137), .Y(
        n133) );
  INVx1_ASAP7_75t_R U132 ( .A(n138), .Y(n136) );
  A2O1A1Ixp33_ASAP7_75t_R U133 ( .A1(n14), .A2(n11), .B(n139), .C(n140), .Y(
        n135) );
  INVx1_ASAP7_75t_R U134 ( .A(n12), .Y(n139) );
  INVx1_ASAP7_75t_R U135 ( .A(n141), .Y(n14) );
  XNOR2xp5_ASAP7_75t_R U136 ( .A(n143), .B(n144), .Y(\DIFF\[11\] ) );
  NAND2xp5_ASAP7_75t_R U137 ( .A(n138), .B(n137), .Y(n144) );
  NAND2xp5_ASAP7_75t_R U138 ( .A(\A\[11\] ), .B(n145), .Y(n137) );
  INVx1_ASAP7_75t_R U139 ( .A(\B\[11\] ), .Y(n145) );
  NAND2xp5_ASAP7_75t_R U140 ( .A(\B\[11\] ), .B(n146), .Y(n138) );
  INVx1_ASAP7_75t_R U141 ( .A(\A\[11\] ), .Y(n146) );
  OAI21xp5_ASAP7_75t_R U142 ( .A1(n147), .A2(n148), .B(n134), .Y(n143) );
  INVx1_ASAP7_75t_R U143 ( .A(n149), .Y(n148) );
  INVx1_ASAP7_75t_R U144 ( .A(n140), .Y(n147) );
  XNOR2xp5_ASAP7_75t_R U145 ( .A(n149), .B(n150), .Y(\DIFF\[10\] ) );
  NAND2xp5_ASAP7_75t_R U146 ( .A(n134), .B(n140), .Y(n150) );
  NAND2xp5_ASAP7_75t_R U147 ( .A(\B\[10\] ), .B(n151), .Y(n140) );
  INVx1_ASAP7_75t_R U148 ( .A(\A\[10\] ), .Y(n151) );
  NAND2xp5_ASAP7_75t_R U149 ( .A(\A\[10\] ), .B(n152), .Y(n134) );
  INVx1_ASAP7_75t_R U150 ( .A(\B\[10\] ), .Y(n152) );
  OAI21xp5_ASAP7_75t_R U151 ( .A1(n153), .A2(n154), .B(n12), .Y(n149) );
  NAND2xp5_ASAP7_75t_R U152 ( .A(\A\[9\] ), .B(n155), .Y(n12) );
  INVx1_ASAP7_75t_R U153 ( .A(\B\[9\] ), .Y(n155) );
  INVx1_ASAP7_75t_R U154 ( .A(n11), .Y(n154) );
  NAND2xp5_ASAP7_75t_R U155 ( .A(\B\[9\] ), .B(n156), .Y(n11) );
  INVx1_ASAP7_75t_R U156 ( .A(\A\[9\] ), .Y(n156) );
  INVx1_ASAP7_75t_R U157 ( .A(n9), .Y(n153) );
  OAI21xp5_ASAP7_75t_R U158 ( .A1(n4), .A2(n15), .B(n141), .Y(n9) );
  NAND2xp5_ASAP7_75t_R U159 ( .A(\A\[8\] ), .B(n157), .Y(n141) );
  INVx1_ASAP7_75t_R U160 ( .A(\B\[8\] ), .Y(n157) );
  INVx1_ASAP7_75t_R U161 ( .A(n142), .Y(n15) );
  NAND2xp5_ASAP7_75t_R U162 ( .A(\B\[8\] ), .B(n158), .Y(n142) );
  INVx1_ASAP7_75t_R U163 ( .A(\A\[8\] ), .Y(n158) );
  INVx1_ASAP7_75t_R U164 ( .A(n159), .Y(n113) );
  A2O1A1Ixp33_ASAP7_75t_R U165 ( .A1(n22), .A2(n160), .B(n161), .C(n19), .Y(
        n159) );
  NAND2xp5_ASAP7_75t_R U166 ( .A(\A\[7\] ), .B(n162), .Y(n19) );
  INVx1_ASAP7_75t_R U167 ( .A(\B\[7\] ), .Y(n162) );
  INVx1_ASAP7_75t_R U168 ( .A(n18), .Y(n161) );
  A2O1A1Ixp33_ASAP7_75t_R U169 ( .A1(n34), .A2(n30), .B(n29), .C(n24), .Y(n160) );
  INVx1_ASAP7_75t_R U170 ( .A(n27), .Y(n29) );
  NAND2xp5_ASAP7_75t_R U171 ( .A(\A\[5\] ), .B(n163), .Y(n27) );
  INVx1_ASAP7_75t_R U172 ( .A(\B\[5\] ), .Y(n163) );
  INVx1_ASAP7_75t_R U173 ( .A(n32), .Y(n34) );
  NAND2xp5_ASAP7_75t_R U174 ( .A(\A\[4\] ), .B(n164), .Y(n32) );
  INVx1_ASAP7_75t_R U175 ( .A(\B\[4\] ), .Y(n164) );
  NAND2xp5_ASAP7_75t_R U176 ( .A(\A\[6\] ), .B(n165), .Y(n22) );
  INVx1_ASAP7_75t_R U177 ( .A(\B\[6\] ), .Y(n165) );
  NAND2xp5_ASAP7_75t_R U178 ( .A(\B\[4\] ), .B(n166), .Y(n35) );
  INVx1_ASAP7_75t_R U179 ( .A(\A\[4\] ), .Y(n166) );
  NAND2xp5_ASAP7_75t_R U180 ( .A(\B\[5\] ), .B(n167), .Y(n30) );
  INVx1_ASAP7_75t_R U181 ( .A(\A\[5\] ), .Y(n167) );
  NAND2xp5_ASAP7_75t_R U182 ( .A(\B\[6\] ), .B(n168), .Y(n24) );
  INVx1_ASAP7_75t_R U183 ( .A(\A\[6\] ), .Y(n168) );
  NAND2xp5_ASAP7_75t_R U184 ( .A(\B\[7\] ), .B(n169), .Y(n18) );
  INVx1_ASAP7_75t_R U185 ( .A(\A\[7\] ), .Y(n169) );
  NAND3xp33_ASAP7_75t_R U186 ( .A(n38), .B(n44), .C(n170), .Y(n108) );
  INVx1_ASAP7_75t_R U187 ( .A(n171), .Y(n46) );
  INVx1_ASAP7_75t_R U188 ( .A(n173), .Y(n112) );
  A2O1A1Ixp33_ASAP7_75t_R U189 ( .A1(n42), .A2(n174), .B(n172), .C(n39), .Y(
        n173) );
  NAND2xp5_ASAP7_75t_R U190 ( .A(\A\[3\] ), .B(n175), .Y(n39) );
  INVx1_ASAP7_75t_R U191 ( .A(\B\[3\] ), .Y(n175) );
  INVx1_ASAP7_75t_R U192 ( .A(n38), .Y(n172) );
  NAND2xp5_ASAP7_75t_R U193 ( .A(\B\[3\] ), .B(n176), .Y(n38) );
  INVx1_ASAP7_75t_R U194 ( .A(\A\[3\] ), .Y(n176) );
  A2O1A1Ixp33_ASAP7_75t_R U195 ( .A1(n177), .A2(n171), .B(n68), .C(n44), .Y(
        n174) );
  NAND2xp5_ASAP7_75t_R U196 ( .A(\B\[2\] ), .B(n178), .Y(n44) );
  INVx1_ASAP7_75t_R U197 ( .A(\A\[2\] ), .Y(n178) );
  INVx1_ASAP7_75t_R U198 ( .A(n47), .Y(n68) );
  NAND2xp5_ASAP7_75t_R U199 ( .A(\A\[1\] ), .B(n179), .Y(n47) );
  INVx1_ASAP7_75t_R U200 ( .A(\B\[1\] ), .Y(n179) );
  NAND2xp5_ASAP7_75t_R U201 ( .A(\B\[1\] ), .B(n180), .Y(n171) );
  INVx1_ASAP7_75t_R U202 ( .A(\A\[1\] ), .Y(n180) );
  NAND2xp5_ASAP7_75t_R U203 ( .A(\A\[2\] ), .B(n181), .Y(n42) );
  INVx1_ASAP7_75t_R U204 ( .A(\B\[2\] ), .Y(n181) );
  INVx1_ASAP7_75t_R U205 ( .A(\A\[0\] ), .Y(n182) );
  INVx1_ASAP7_75t_R U206 ( .A(n69), .Y(n177) );
  NAND2xp5_ASAP7_75t_R U207 ( .A(\A\[0\] ), .B(n183), .Y(n69) );
  INVx1_ASAP7_75t_R U208 ( .A(\B\[0\] ), .Y(n183) );
endmodule


module fp32_exp_DW01_add_35 ( .A({\A\[32\] , \A\[31\] , \A\[30\] , \A\[29\] , 
        \A\[28\] , \A\[27\] , \A\[26\] , \A\[25\] , \A\[24\] , \A\[23\] , 
        \A\[22\] , \A\[21\] , \A\[20\] , \A\[19\] , \A\[18\] , \A\[17\] , 
        \A\[16\] , \A\[15\] , \A\[14\] , \A\[13\] , \A\[12\] , \A\[11\] , 
        \A\[10\] , \A\[9\] , \A\[8\] , \A\[7\] , \A\[6\] , \A\[5\] , \A\[4\] , 
        \A\[3\] , \A\[2\] , \A\[1\] , \A\[0\] }), .B({\B\[32\] , \B\[31\] , 
        \B\[30\] , \B\[29\] , \B\[28\] , \B\[27\] , \B\[26\] , \B\[25\] , 
        \B\[24\] , \B\[23\] , \B\[22\] , \B\[21\] , \B\[20\] , \B\[19\] , 
        \B\[18\] , \B\[17\] , \B\[16\] , \B\[15\] , \B\[14\] , \B\[13\] , 
        \B\[12\] , \B\[11\] , \B\[10\] , \B\[9\] , \B\[8\] , \B\[7\] , 
        \B\[6\] , \B\[5\] , \B\[4\] , \B\[3\] , \B\[2\] , \B\[1\] , \B\[0\] }), 
        CI, .SUM({\SUM\[32\] , \SUM\[31\] , \SUM\[30\] , \SUM\[29\] , 
        \SUM\[28\] , \SUM\[27\] , \SUM\[26\] , \SUM\[25\] , \SUM\[24\] , 
        \SUM\[23\] , \SUM\[22\] , \SUM\[21\] , \SUM\[20\] , \SUM\[19\] , 
        \SUM\[18\] , \SUM\[17\] , \SUM\[16\] , \SUM\[15\] , \SUM\[14\] , 
        \SUM\[13\] , \SUM\[12\] , \SUM\[11\] , \SUM\[10\] , \SUM\[9\] , 
        \SUM\[8\] , \SUM\[7\] , \SUM\[6\] , \SUM\[5\] , \SUM\[4\] , \SUM\[3\] , 
        \SUM\[2\] , \SUM\[1\] , \SUM\[0\] }), CO );
  input \A\[32\] , \A\[31\] , \A\[30\] , \A\[29\] , \A\[28\] , \A\[27\] ,
         \A\[26\] , \A\[25\] , \A\[24\] , \A\[23\] , \A\[22\] , \A\[21\] ,
         \A\[20\] , \A\[19\] , \A\[18\] , \A\[17\] , \A\[16\] , \A\[15\] ,
         \A\[14\] , \A\[13\] , \A\[12\] , \A\[11\] , \A\[10\] , \A\[9\] ,
         \A\[8\] , \A\[7\] , \A\[6\] , \A\[5\] , \A\[4\] , \A\[3\] , \A\[2\] ,
         \A\[1\] , \A\[0\] , \B\[32\] , \B\[31\] , \B\[30\] , \B\[29\] ,
         \B\[28\] , \B\[27\] , \B\[26\] , \B\[25\] , \B\[24\] , \B\[23\] ,
         \B\[22\] , \B\[21\] , \B\[20\] , \B\[19\] , \B\[18\] , \B\[17\] ,
         \B\[16\] , \B\[15\] , \B\[14\] , \B\[13\] , \B\[12\] , \B\[11\] ,
         \B\[10\] , \B\[9\] , \B\[8\] , \B\[7\] , \B\[6\] , \B\[5\] , \B\[4\] ,
         \B\[3\] , \B\[2\] , \B\[1\] , \B\[0\] , CI;
  output \SUM\[32\] , \SUM\[31\] , \SUM\[30\] , \SUM\[29\] , \SUM\[28\] ,
         \SUM\[27\] , \SUM\[26\] , \SUM\[25\] , \SUM\[24\] , \SUM\[23\] ,
         \SUM\[22\] , \SUM\[21\] , \SUM\[20\] , \SUM\[19\] , \SUM\[18\] ,
         \SUM\[17\] , \SUM\[16\] , \SUM\[15\] , \SUM\[14\] , \SUM\[13\] ,
         \SUM\[12\] , \SUM\[11\] , \SUM\[10\] , \SUM\[9\] , \SUM\[8\] ,
         \SUM\[7\] , \SUM\[6\] , \SUM\[5\] , \SUM\[4\] , \SUM\[3\] ,
         \SUM\[2\] , \SUM\[1\] , \SUM\[0\] , CO;
  wire   n1, n2, n3, n4, n5, n6, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72,
         n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86,
         n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98;

  NOR2xp33_ASAP7_75t_R U2 ( .A(n15), .B(n3), .Y(n28) );
  NAND4xp25_ASAP7_75t_R U3 ( .A(\A\[27\] ), .B(\A\[26\] ), .C(\A\[25\] ), .D(
        \A\[24\] ), .Y(n20) );
  NOR2xp33_ASAP7_75t_R U4 ( .A(n21), .B(n20), .Y(n22) );
  NOR3xp33_ASAP7_75t_R U5 ( .A(n42), .B(n40), .C(n41), .Y(n39) );
  NAND4xp25_ASAP7_75t_R U6 ( .A(\A\[23\] ), .B(\A\[22\] ), .C(\A\[21\] ), .D(
        n43), .Y(n21) );
  NAND4xp25_ASAP7_75t_R U7 ( .A(n50), .B(n51), .C(n52), .D(n53), .Y(n24) );
  NOR2xp33_ASAP7_75t_R U8 ( .A(n54), .B(n55), .Y(n52) );
  O2A1O1Ixp33_ASAP7_75t_R U9 ( .A1(n55), .A2(n61), .B(n62), .C(n54), .Y(n58)
         );
  NOR2xp33_ASAP7_75t_R U10 ( .A(n36), .B(n30), .Y(n34) );
  NOR2xp33_ASAP7_75t_R U11 ( .A(n26), .B(n27), .Y(n25) );
  NOR2xp33_ASAP7_75t_R U12 ( .A(n33), .B(n8), .Y(n31) );
  NOR2xp33_ASAP7_75t_R U13 ( .A(n10), .B(n11), .Y(n9) );
  OR2x2_ASAP7_75t_R U14 ( .A(n30), .B(n20), .Y(n1) );
  AND2x2_ASAP7_75t_R U15 ( .A(n49), .B(n24), .Y(n2) );
  OR2x2_ASAP7_75t_R U16 ( .A(n29), .B(n1), .Y(n3) );
  AND2x2_ASAP7_75t_R U17 ( .A(n46), .B(\A\[21\] ), .Y(n4) );
  AOI21xp5_ASAP7_75t_R U18 ( .A1(n86), .A2(n87), .B(n88), .Y(n5) );
  OA21x2_ASAP7_75t_R U19 ( .A1(n55), .A2(n67), .B(n62), .Y(n6) );
  AND2x2_ASAP7_75t_R U20 ( .A(n95), .B(n96), .Y(\SUM\[12\] ) );
  OAI33xp33_ASAP7_75t_R U21 ( .A1(n15), .A2(n13), .A3(n29), .B1(n15), .B2(n14), 
        .B3(n29), .Y(n12) );
  INVx1_ASAP7_75t_R U22 ( .A(\A\[25\] ), .Y(n35) );
  INVx1_ASAP7_75t_R U23 ( .A(n38), .Y(n18) );
  INVx1_ASAP7_75t_R U24 ( .A(\A\[23\] ), .Y(n44) );
  INVx1_ASAP7_75t_R U25 ( .A(n95), .Y(n86) );
  NAND2xp5_ASAP7_75t_R U26 ( .A(n12), .B(\A\[30\] ), .Y(n10) );
  OAI221xp5_ASAP7_75t_R U27 ( .A1(n17), .A2(n18), .B1(n16), .B2(n18), .C(n19), 
        .Y(n14) );
  NAND2xp5_ASAP7_75t_R U28 ( .A(n34), .B(\A\[25\] ), .Y(n8) );
  NAND2xp5_ASAP7_75t_R U29 ( .A(n39), .B(\A\[23\] ), .Y(n38) );
  NAND2xp5_ASAP7_75t_R U30 ( .A(n4), .B(\A\[22\] ), .Y(n45) );
  INVx1_ASAP7_75t_R U31 ( .A(\A\[27\] ), .Y(n32) );
  INVx1_ASAP7_75t_R U32 ( .A(\A\[31\] ), .Y(n11) );
  XOR2xp5_ASAP7_75t_R U33 ( .A(n9), .B(\A\[32\] ), .Y(\SUM\[32\] ) );
  INVx1_ASAP7_75t_R U34 ( .A(n20), .Y(n19) );
  INVx1_ASAP7_75t_R U35 ( .A(n21), .Y(n16) );
  NAND2xp5_ASAP7_75t_R U36 ( .A(n22), .B(n23), .Y(n13) );
  INVx1_ASAP7_75t_R U37 ( .A(n24), .Y(n23) );
  XNOR2xp5_ASAP7_75t_R U38 ( .A(n25), .B(n11), .Y(\SUM\[31\] ) );
  INVx1_ASAP7_75t_R U39 ( .A(n28), .Y(n27) );
  INVx1_ASAP7_75t_R U40 ( .A(\A\[30\] ), .Y(n26) );
  XNOR2xp5_ASAP7_75t_R U41 ( .A(n28), .B(n26), .Y(\SUM\[30\] ) );
  INVx1_ASAP7_75t_R U42 ( .A(\A\[29\] ), .Y(n15) );
  XOR2xp5_ASAP7_75t_R U43 ( .A(n15), .B(n3), .Y(\SUM\[29\] ) );
  INVx1_ASAP7_75t_R U44 ( .A(\A\[28\] ), .Y(n29) );
  XOR2xp5_ASAP7_75t_R U45 ( .A(n29), .B(n1), .Y(\SUM\[28\] ) );
  XNOR2xp5_ASAP7_75t_R U46 ( .A(n31), .B(n32), .Y(\SUM\[27\] ) );
  INVx1_ASAP7_75t_R U47 ( .A(\A\[26\] ), .Y(n33) );
  XOR2xp5_ASAP7_75t_R U48 ( .A(n33), .B(n8), .Y(\SUM\[26\] ) );
  XNOR2xp5_ASAP7_75t_R U49 ( .A(n34), .B(n35), .Y(\SUM\[25\] ) );
  INVx1_ASAP7_75t_R U50 ( .A(n37), .Y(n30) );
  INVx1_ASAP7_75t_R U51 ( .A(\A\[24\] ), .Y(n36) );
  XNOR2xp5_ASAP7_75t_R U52 ( .A(n37), .B(n36), .Y(\SUM\[24\] ) );
  OAI21xp5_ASAP7_75t_R U53 ( .A1(n2), .A2(n21), .B(n38), .Y(n37) );
  INVx1_ASAP7_75t_R U54 ( .A(\A\[22\] ), .Y(n42) );
  INVx1_ASAP7_75t_R U55 ( .A(\A\[21\] ), .Y(n40) );
  XOR2xp5_ASAP7_75t_R U56 ( .A(n44), .B(n45), .Y(\SUM\[23\] ) );
  XNOR2xp5_ASAP7_75t_R U57 ( .A(n42), .B(n4), .Y(\SUM\[22\] ) );
  XNOR2xp5_ASAP7_75t_R U58 ( .A(n46), .B(n40), .Y(\SUM\[21\] ) );
  OAI21xp5_ASAP7_75t_R U59 ( .A1(n47), .A2(n2), .B(n41), .Y(n46) );
  INVx1_ASAP7_75t_R U60 ( .A(n43), .Y(n47) );
  XOR2xp5_ASAP7_75t_R U61 ( .A(n48), .B(n2), .Y(\SUM\[20\] ) );
  INVx1_ASAP7_75t_R U62 ( .A(n17), .Y(n49) );
  NAND2xp5_ASAP7_75t_R U63 ( .A(n56), .B(n57), .Y(n17) );
  OAI21xp5_ASAP7_75t_R U64 ( .A1(n58), .A2(n59), .B(n50), .Y(n57) );
  INVx1_ASAP7_75t_R U65 ( .A(n60), .Y(n59) );
  NAND2xp5_ASAP7_75t_R U66 ( .A(n43), .B(n41), .Y(n48) );
  NAND2xp5_ASAP7_75t_R U67 ( .A(\B\[20\] ), .B(\A\[20\] ), .Y(n41) );
  OR2x2_ASAP7_75t_R U68 ( .A(\A\[20\] ), .B(\B\[20\] ), .Y(n43) );
  XNOR2xp5_ASAP7_75t_R U69 ( .A(n63), .B(n64), .Y(\SUM\[19\] ) );
  NAND2xp5_ASAP7_75t_R U70 ( .A(n50), .B(n56), .Y(n64) );
  NAND2xp5_ASAP7_75t_R U71 ( .A(\B\[19\] ), .B(\A\[19\] ), .Y(n56) );
  OR2x2_ASAP7_75t_R U72 ( .A(\A\[19\] ), .B(\B\[19\] ), .Y(n50) );
  OAI21xp5_ASAP7_75t_R U73 ( .A1(n54), .A2(n6), .B(n60), .Y(n63) );
  INVx1_ASAP7_75t_R U74 ( .A(n65), .Y(n54) );
  XOR2xp5_ASAP7_75t_R U75 ( .A(n66), .B(n6), .Y(\SUM\[18\] ) );
  INVx1_ASAP7_75t_R U76 ( .A(n68), .Y(n67) );
  INVx1_ASAP7_75t_R U77 ( .A(n69), .Y(n55) );
  NAND2xp5_ASAP7_75t_R U78 ( .A(n65), .B(n60), .Y(n66) );
  NAND2xp5_ASAP7_75t_R U79 ( .A(\B\[18\] ), .B(\A\[18\] ), .Y(n60) );
  OR2x2_ASAP7_75t_R U80 ( .A(\A\[18\] ), .B(\B\[18\] ), .Y(n65) );
  XNOR2xp5_ASAP7_75t_R U81 ( .A(n68), .B(n70), .Y(\SUM\[17\] ) );
  NAND2xp5_ASAP7_75t_R U82 ( .A(n69), .B(n62), .Y(n70) );
  NAND2xp5_ASAP7_75t_R U83 ( .A(\B\[17\] ), .B(\A\[17\] ), .Y(n62) );
  OR2x2_ASAP7_75t_R U84 ( .A(\A\[17\] ), .B(\B\[17\] ), .Y(n69) );
  OAI21xp5_ASAP7_75t_R U85 ( .A1(n71), .A2(n72), .B(n61), .Y(n68) );
  INVx1_ASAP7_75t_R U86 ( .A(n51), .Y(n71) );
  XOR2xp5_ASAP7_75t_R U87 ( .A(n73), .B(n72), .Y(\SUM\[16\] ) );
  INVx1_ASAP7_75t_R U88 ( .A(n53), .Y(n72) );
  OAI21xp5_ASAP7_75t_R U89 ( .A1(n74), .A2(n75), .B(n76), .Y(n53) );
  INVx1_ASAP7_75t_R U90 ( .A(n77), .Y(n75) );
  INVx1_ASAP7_75t_R U91 ( .A(n78), .Y(n74) );
  NAND2xp5_ASAP7_75t_R U92 ( .A(n51), .B(n61), .Y(n73) );
  NAND2xp5_ASAP7_75t_R U93 ( .A(\B\[16\] ), .B(\A\[16\] ), .Y(n61) );
  OR2x2_ASAP7_75t_R U94 ( .A(\A\[16\] ), .B(\B\[16\] ), .Y(n51) );
  XNOR2xp5_ASAP7_75t_R U95 ( .A(n77), .B(n79), .Y(\SUM\[15\] ) );
  NAND2xp5_ASAP7_75t_R U96 ( .A(n76), .B(n78), .Y(n79) );
  NAND2xp5_ASAP7_75t_R U97 ( .A(n80), .B(n81), .Y(n78) );
  INVx1_ASAP7_75t_R U98 ( .A(\A\[15\] ), .Y(n81) );
  INVx1_ASAP7_75t_R U99 ( .A(\B\[15\] ), .Y(n80) );
  NAND2xp5_ASAP7_75t_R U100 ( .A(\B\[15\] ), .B(\A\[15\] ), .Y(n76) );
  OAI21xp5_ASAP7_75t_R U101 ( .A1(n82), .A2(n5), .B(n83), .Y(n77) );
  INVx1_ASAP7_75t_R U102 ( .A(n84), .Y(n82) );
  XOR2xp5_ASAP7_75t_R U103 ( .A(n85), .B(n5), .Y(\SUM\[14\] ) );
  INVx1_ASAP7_75t_R U104 ( .A(n89), .Y(n88) );
  NAND2xp5_ASAP7_75t_R U105 ( .A(n84), .B(n83), .Y(n85) );
  NAND2xp5_ASAP7_75t_R U106 ( .A(\B\[14\] ), .B(\A\[14\] ), .Y(n83) );
  NAND2xp5_ASAP7_75t_R U107 ( .A(n90), .B(n91), .Y(n84) );
  INVx1_ASAP7_75t_R U108 ( .A(\A\[14\] ), .Y(n91) );
  INVx1_ASAP7_75t_R U109 ( .A(\B\[14\] ), .Y(n90) );
  XNOR2xp5_ASAP7_75t_R U110 ( .A(n86), .B(n92), .Y(\SUM\[13\] ) );
  NAND2xp5_ASAP7_75t_R U111 ( .A(n87), .B(n89), .Y(n92) );
  NAND2xp5_ASAP7_75t_R U112 ( .A(\B\[13\] ), .B(\A\[13\] ), .Y(n89) );
  NAND2xp5_ASAP7_75t_R U113 ( .A(n93), .B(n94), .Y(n87) );
  INVx1_ASAP7_75t_R U114 ( .A(\A\[13\] ), .Y(n94) );
  INVx1_ASAP7_75t_R U115 ( .A(\B\[13\] ), .Y(n93) );
  NAND2xp5_ASAP7_75t_R U116 ( .A(n97), .B(n98), .Y(n96) );
  INVx1_ASAP7_75t_R U117 ( .A(\A\[12\] ), .Y(n98) );
  INVx1_ASAP7_75t_R U118 ( .A(\B\[12\] ), .Y(n97) );
  NAND2xp5_ASAP7_75t_R U119 ( .A(\B\[12\] ), .B(\A\[12\] ), .Y(n95) );
endmodule


module fp32_exp_DW01_add_36 ( .A({\A\[23\] , \A\[22\] , \A\[21\] , \A\[20\] , 
        \A\[19\] , \A\[18\] , \A\[17\] , \A\[16\] , \A\[15\] , \A\[14\] , 
        \A\[13\] , \A\[12\] , \A\[11\] , \A\[10\] , \A\[9\] , \A\[8\] , 
        \A\[7\] , \A\[6\] , \A\[5\] , \A\[4\] , \A\[3\] , \A\[2\] , \A\[1\] , 
        \A\[0\] }), .B({\B\[23\] , \B\[22\] , \B\[21\] , \B\[20\] , \B\[19\] , 
        \B\[18\] , \B\[17\] , \B\[16\] , \B\[15\] , \B\[14\] , \B\[13\] , 
        \B\[12\] , \B\[11\] , \B\[10\] , \B\[9\] , \B\[8\] , \B\[7\] , 
        \B\[6\] , \B\[5\] , \B\[4\] , \B\[3\] , \B\[2\] , \B\[1\] , \B\[0\] }), 
        CI, .SUM({\SUM\[23\] , \SUM\[22\] , \SUM\[21\] , \SUM\[20\] , 
        \SUM\[19\] , \SUM\[18\] , \SUM\[17\] , \SUM\[16\] , \SUM\[15\] , 
        \SUM\[14\] , \SUM\[13\] , \SUM\[12\] , \SUM\[11\] , \SUM\[10\] , 
        \SUM\[9\] , \SUM\[8\] , \SUM\[7\] , \SUM\[6\] , \SUM\[5\] , \SUM\[4\] , 
        \SUM\[3\] , \SUM\[2\] , \SUM\[1\] , \SUM\[0\] }), CO );
  input \A\[23\] , \A\[22\] , \A\[21\] , \A\[20\] , \A\[19\] , \A\[18\] ,
         \A\[17\] , \A\[16\] , \A\[15\] , \A\[14\] , \A\[13\] , \A\[12\] ,
         \A\[11\] , \A\[10\] , \A\[9\] , \A\[8\] , \A\[7\] , \A\[6\] ,
         \A\[5\] , \A\[4\] , \A\[3\] , \A\[2\] , \A\[1\] , \A\[0\] , \B\[23\] ,
         \B\[22\] , \B\[21\] , \B\[20\] , \B\[19\] , \B\[18\] , \B\[17\] ,
         \B\[16\] , \B\[15\] , \B\[14\] , \B\[13\] , \B\[12\] , \B\[11\] ,
         \B\[10\] , \B\[9\] , \B\[8\] , \B\[7\] , \B\[6\] , \B\[5\] , \B\[4\] ,
         \B\[3\] , \B\[2\] , \B\[1\] , \B\[0\] , CI;
  output \SUM\[23\] , \SUM\[22\] , \SUM\[21\] , \SUM\[20\] , \SUM\[19\] ,
         \SUM\[18\] , \SUM\[17\] , \SUM\[16\] , \SUM\[15\] , \SUM\[14\] ,
         \SUM\[13\] , \SUM\[12\] , \SUM\[11\] , \SUM\[10\] , \SUM\[9\] ,
         \SUM\[8\] , \SUM\[7\] , \SUM\[6\] , \SUM\[5\] , \SUM\[4\] ,
         \SUM\[3\] , \SUM\[2\] , \SUM\[1\] , \SUM\[0\] , CO;
  wire   n2, n3, n4, n5, n6, n7, n8, n9, n10, n12, n13, n14, n15, n16, n17,
         n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31,
         n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45,
         n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59,
         n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73,
         n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87,
         n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100,
         n101, n102, n103, n104, n105, n106, n107, n108, n109, n110, n111,
         n112, n113, n114, n115, n116, n117, n118, n119, n120, n121, n122,
         n123, n124, n125, n126, n127, n128, n129, n130, n131, n132, n133,
         n134, n135, n136, n137, n138, n139, n140, n141, n142, n143, n144,
         n145, n146, n147, n148, n149, n150, n151, n152, n153, n154, n155;

  NOR2xp33_ASAP7_75t_R U2 ( .A(\A\[20\] ), .B(\B\[20\] ), .Y(n57) );
  NAND4xp25_ASAP7_75t_R U3 ( .A(n119), .B(n141), .C(n14), .D(n142), .Y(n94) );
  O2A1O1Ixp33_ASAP7_75t_R U4 ( .A1(n149), .A2(n23), .B(n24), .C(n150), .Y(n99)
         );
  O2A1O1Ixp33_ASAP7_75t_R U5 ( .A1(n28), .A2(n35), .B(n30), .C(n151), .Y(n149)
         );
  NAND4xp25_ASAP7_75t_R U6 ( .A(n24), .B(n22), .C(n33), .D(n36), .Y(n98) );
  O2A1O1Ixp33_ASAP7_75t_R U7 ( .A1(n46), .A2(n67), .B(n47), .C(n43), .Y(n153)
         );
  AOI21xp5_ASAP7_75t_R U8 ( .A1(n17), .A2(n14), .B(n137), .Y(n133) );
  NOR2xp33_ASAP7_75t_R U9 ( .A(n135), .B(n136), .Y(n134) );
  NOR2xp33_ASAP7_75t_R U10 ( .A(n105), .B(n93), .Y(n106) );
  NOR2xp33_ASAP7_75t_R U11 ( .A(n93), .B(n94), .Y(n92) );
  AOI31xp33_ASAP7_75t_R U12 ( .A1(n109), .A2(n110), .A3(n111), .B(n112), .Y(
        n100) );
  NOR2xp33_ASAP7_75t_R U13 ( .A(n104), .B(n113), .Y(n112) );
  NOR3xp33_ASAP7_75t_R U14 ( .A(n105), .B(n103), .C(n118), .Y(n110) );
  NOR2xp33_ASAP7_75t_R U15 ( .A(n93), .B(n114), .Y(n111) );
  NOR2xp33_ASAP7_75t_R U16 ( .A(\A\[22\] ), .B(\B\[22\] ), .Y(n52) );
  AOI21xp5_ASAP7_75t_R U17 ( .A1(n21), .A2(n22), .B(n23), .Y(n20) );
  NOR2xp33_ASAP7_75t_R U18 ( .A(n17), .B(n18), .Y(n16) );
  NOR2xp33_ASAP7_75t_R U19 ( .A(n136), .B(n140), .Y(n146) );
  AOI21xp5_ASAP7_75t_R U20 ( .A1(n122), .A2(n91), .B(n123), .Y(n121) );
  AOI21xp5_ASAP7_75t_R U21 ( .A1(n61), .A2(n81), .B(n84), .Y(n83) );
  AOI21xp5_ASAP7_75t_R U22 ( .A1(n9), .A2(n61), .B(n73), .Y(n76) );
  AOI21xp5_ASAP7_75t_R U23 ( .A1(n3), .A2(n61), .B(n62), .Y(n69) );
  XOR2xp5_ASAP7_75t_R U24 ( .A(n54), .B(n55), .Y(\SUM\[21\] ) );
  XOR2xp5_ASAP7_75t_R U25 ( .A(n50), .B(\B\[23\] ), .Y(\SUM\[23\] ) );
  AND2x2_ASAP7_75t_R U26 ( .A(\B\[21\] ), .B(\A\[21\] ), .Y(n2) );
  AND2x2_ASAP7_75t_R U27 ( .A(n9), .B(n74), .Y(n3) );
  OA21x2_ASAP7_75t_R U28 ( .A1(n97), .A2(n98), .B(n99), .Y(n4) );
  OA21x2_ASAP7_75t_R U29 ( .A1(n46), .A2(n67), .B(n47), .Y(n5) );
  AO21x1_ASAP7_75t_R U30 ( .A1(n62), .A2(n60), .B(n63), .Y(n6) );
  OR2x2_ASAP7_75t_R U31 ( .A(\A\[21\] ), .B(\B\[21\] ), .Y(n7) );
  OR3x1_ASAP7_75t_R U32 ( .A(n102), .B(n103), .C(n104), .Y(n8) );
  O2A1O1Ixp33_ASAP7_75t_R U33 ( .A1(n153), .A2(n154), .B(n41), .C(n155), .Y(
        n97) );
  AND2x2_ASAP7_75t_R U34 ( .A(n81), .B(n80), .Y(n9) );
  OA21x2_ASAP7_75t_R U35 ( .A1(n147), .A2(n148), .B(n15), .Y(n10) );
  AND2x2_ASAP7_75t_R U36 ( .A(n67), .B(n152), .Y(\SUM\[0\] ) );
  INVx1_ASAP7_75t_R U37 ( .A(n97), .Y(n37) );
  INVx1_ASAP7_75t_R U38 ( .A(n67), .Y(n48) );
  OAI21x1_ASAP7_75t_R U39 ( .A1(n56), .A2(n57), .B(n58), .Y(n54) );
  XNOR2xp5_ASAP7_75t_R U40 ( .A(n12), .B(n13), .Y(\SUM\[9\] ) );
  NAND2xp5_ASAP7_75t_R U41 ( .A(n14), .B(n15), .Y(n13) );
  XNOR2xp5_ASAP7_75t_R U42 ( .A(n4), .B(n16), .Y(\SUM\[8\] ) );
  XOR2xp5_ASAP7_75t_R U43 ( .A(n19), .B(n20), .Y(\SUM\[7\] ) );
  NAND2xp5_ASAP7_75t_R U44 ( .A(n24), .B(n25), .Y(n19) );
  XNOR2xp5_ASAP7_75t_R U45 ( .A(n21), .B(n26), .Y(\SUM\[6\] ) );
  NAND2xp5_ASAP7_75t_R U46 ( .A(n22), .B(n27), .Y(n26) );
  OAI21xp5_ASAP7_75t_R U47 ( .A1(n28), .A2(n29), .B(n30), .Y(n21) );
  INVx1_ASAP7_75t_R U48 ( .A(n31), .Y(n29) );
  XNOR2xp5_ASAP7_75t_R U49 ( .A(n31), .B(n32), .Y(\SUM\[5\] ) );
  NAND2xp5_ASAP7_75t_R U50 ( .A(n30), .B(n33), .Y(n32) );
  OAI21xp5_ASAP7_75t_R U51 ( .A1(n97), .A2(n34), .B(n35), .Y(n31) );
  INVx1_ASAP7_75t_R U52 ( .A(n36), .Y(n34) );
  XNOR2xp5_ASAP7_75t_R U53 ( .A(n37), .B(n38), .Y(\SUM\[4\] ) );
  NAND2xp5_ASAP7_75t_R U54 ( .A(n35), .B(n36), .Y(n38) );
  XNOR2xp5_ASAP7_75t_R U55 ( .A(n39), .B(n40), .Y(\SUM\[3\] ) );
  NAND2xp5_ASAP7_75t_R U56 ( .A(n41), .B(n42), .Y(n40) );
  OAI21xp5_ASAP7_75t_R U57 ( .A1(n43), .A2(n5), .B(n44), .Y(n39) );
  XOR2xp5_ASAP7_75t_R U58 ( .A(n45), .B(n5), .Y(\SUM\[2\] ) );
  NAND2xp5_ASAP7_75t_R U59 ( .A(n49), .B(n44), .Y(n45) );
  OAI21xp5_ASAP7_75t_R U60 ( .A1(n51), .A2(n52), .B(n53), .Y(n50) );
  NAND2xp5_ASAP7_75t_R U61 ( .A(\B\[22\] ), .B(\A\[22\] ), .Y(n53) );
  FAx1_ASAP7_75t_R U62 ( .A(\B\[22\] ), .B(\A\[22\] ), .CI(n51), .SN(
        \SUM\[22\] ) );
  AOI21x1_ASAP7_75t_R U63 ( .A1(n54), .A2(n7), .B(n2), .Y(n51) );
  XOR2xp5_ASAP7_75t_R U64 ( .A(\B\[21\] ), .B(\A\[21\] ), .Y(n55) );
  NAND2xp5_ASAP7_75t_R U65 ( .A(\B\[20\] ), .B(\A\[20\] ), .Y(n58) );
  XNOR2xp5_ASAP7_75t_R U66 ( .A(n56), .B(n59), .Y(\SUM\[20\] ) );
  XOR2xp5_ASAP7_75t_R U67 ( .A(\B\[20\] ), .B(\A\[20\] ), .Y(n59) );
  AOI31xp67_ASAP7_75t_R U68 ( .A1(n3), .A2(n60), .A3(n61), .B(n6), .Y(n56) );
  INVx1_ASAP7_75t_R U69 ( .A(n64), .Y(n63) );
  XNOR2xp5_ASAP7_75t_R U70 ( .A(n48), .B(n65), .Y(\SUM\[1\] ) );
  NAND2xp5_ASAP7_75t_R U71 ( .A(n66), .B(n47), .Y(n65) );
  XOR2xp5_ASAP7_75t_R U72 ( .A(n68), .B(n69), .Y(\SUM\[19\] ) );
  OAI21xp5_ASAP7_75t_R U73 ( .A1(n70), .A2(n71), .B(n72), .Y(n62) );
  INVx1_ASAP7_75t_R U74 ( .A(n73), .Y(n71) );
  INVx1_ASAP7_75t_R U75 ( .A(n74), .Y(n70) );
  NAND2xp5_ASAP7_75t_R U76 ( .A(n60), .B(n64), .Y(n68) );
  NAND2xp5_ASAP7_75t_R U77 ( .A(\B\[19\] ), .B(\A\[19\] ), .Y(n64) );
  OR2x2_ASAP7_75t_R U78 ( .A(\A\[19\] ), .B(\B\[19\] ), .Y(n60) );
  XOR2xp5_ASAP7_75t_R U79 ( .A(n75), .B(n76), .Y(\SUM\[18\] ) );
  OAI21xp5_ASAP7_75t_R U80 ( .A1(n77), .A2(n78), .B(n79), .Y(n73) );
  INVx1_ASAP7_75t_R U81 ( .A(n80), .Y(n77) );
  NAND2xp5_ASAP7_75t_R U82 ( .A(n72), .B(n74), .Y(n75) );
  OR2x2_ASAP7_75t_R U83 ( .A(\A\[18\] ), .B(\B\[18\] ), .Y(n74) );
  NAND2xp5_ASAP7_75t_R U84 ( .A(\B\[18\] ), .B(\A\[18\] ), .Y(n72) );
  XOR2xp5_ASAP7_75t_R U85 ( .A(n82), .B(n83), .Y(\SUM\[17\] ) );
  INVx1_ASAP7_75t_R U86 ( .A(n78), .Y(n84) );
  NAND2xp5_ASAP7_75t_R U87 ( .A(n79), .B(n80), .Y(n82) );
  OR2x2_ASAP7_75t_R U88 ( .A(\A\[17\] ), .B(\B\[17\] ), .Y(n80) );
  NAND2xp5_ASAP7_75t_R U89 ( .A(\B\[17\] ), .B(\A\[17\] ), .Y(n79) );
  XNOR2xp5_ASAP7_75t_R U90 ( .A(n85), .B(n61), .Y(\SUM\[16\] ) );
  OR2x2_ASAP7_75t_R U91 ( .A(n86), .B(n87), .Y(n61) );
  OAI21xp5_ASAP7_75t_R U92 ( .A1(n88), .A2(n89), .B(n90), .Y(n87) );
  NAND2xp5_ASAP7_75t_R U93 ( .A(n91), .B(n92), .Y(n89) );
  NAND2xp5_ASAP7_75t_R U94 ( .A(n95), .B(n96), .Y(n88) );
  OAI21xp5_ASAP7_75t_R U95 ( .A1(n97), .A2(n98), .B(n99), .Y(n95) );
  NAND3xp33_ASAP7_75t_R U96 ( .A(n100), .B(n101), .C(n8), .Y(n86) );
  NAND3xp33_ASAP7_75t_R U97 ( .A(n106), .B(n107), .C(n91), .Y(n101) );
  INVx1_ASAP7_75t_R U98 ( .A(n108), .Y(n107) );
  INVx1_ASAP7_75t_R U99 ( .A(n115), .Y(n114) );
  OR2x2_ASAP7_75t_R U100 ( .A(n104), .B(n116), .Y(n93) );
  INVx1_ASAP7_75t_R U101 ( .A(n117), .Y(n104) );
  INVx1_ASAP7_75t_R U102 ( .A(n119), .Y(n118) );
  INVx1_ASAP7_75t_R U103 ( .A(n91), .Y(n103) );
  NAND2xp5_ASAP7_75t_R U104 ( .A(n81), .B(n78), .Y(n85) );
  NAND2xp5_ASAP7_75t_R U105 ( .A(\B\[16\] ), .B(\A\[16\] ), .Y(n78) );
  OR2x2_ASAP7_75t_R U106 ( .A(\A\[16\] ), .B(\B\[16\] ), .Y(n81) );
  XOR2xp5_ASAP7_75t_R U107 ( .A(n120), .B(n121), .Y(\SUM\[15\] ) );
  INVx1_ASAP7_75t_R U108 ( .A(n113), .Y(n123) );
  NAND2xp5_ASAP7_75t_R U109 ( .A(n117), .B(n90), .Y(n120) );
  NAND2xp5_ASAP7_75t_R U110 ( .A(\B\[15\] ), .B(\A\[15\] ), .Y(n90) );
  OR2x2_ASAP7_75t_R U111 ( .A(\A\[15\] ), .B(\B\[15\] ), .Y(n117) );
  XNOR2xp5_ASAP7_75t_R U112 ( .A(n122), .B(n124), .Y(\SUM\[14\] ) );
  NAND2xp5_ASAP7_75t_R U113 ( .A(n91), .B(n113), .Y(n124) );
  NAND2xp5_ASAP7_75t_R U114 ( .A(\B\[14\] ), .B(\A\[14\] ), .Y(n113) );
  OR2x2_ASAP7_75t_R U115 ( .A(\A\[14\] ), .B(\B\[14\] ), .Y(n91) );
  OAI21xp5_ASAP7_75t_R U116 ( .A1(n105), .A2(n125), .B(n102), .Y(n122) );
  INVx1_ASAP7_75t_R U117 ( .A(n126), .Y(n125) );
  INVx1_ASAP7_75t_R U118 ( .A(n96), .Y(n105) );
  XNOR2xp5_ASAP7_75t_R U119 ( .A(n126), .B(n127), .Y(\SUM\[13\] ) );
  NAND2xp5_ASAP7_75t_R U120 ( .A(n102), .B(n96), .Y(n127) );
  OR2x2_ASAP7_75t_R U121 ( .A(\A\[13\] ), .B(\B\[13\] ), .Y(n96) );
  NAND2xp5_ASAP7_75t_R U122 ( .A(\B\[13\] ), .B(\A\[13\] ), .Y(n102) );
  OAI21xp5_ASAP7_75t_R U123 ( .A1(n116), .A2(n128), .B(n108), .Y(n126) );
  INVx1_ASAP7_75t_R U124 ( .A(n129), .Y(n128) );
  INVx1_ASAP7_75t_R U125 ( .A(n130), .Y(n116) );
  XNOR2xp5_ASAP7_75t_R U126 ( .A(n129), .B(n131), .Y(\SUM\[12\] ) );
  NAND2xp5_ASAP7_75t_R U127 ( .A(n130), .B(n108), .Y(n131) );
  NAND2xp5_ASAP7_75t_R U128 ( .A(\B\[12\] ), .B(\A\[12\] ), .Y(n108) );
  OR2x2_ASAP7_75t_R U129 ( .A(\A\[12\] ), .B(\B\[12\] ), .Y(n130) );
  OAI21xp5_ASAP7_75t_R U130 ( .A1(n4), .A2(n94), .B(n132), .Y(n129) );
  NAND3xp33_ASAP7_75t_R U131 ( .A(n115), .B(n119), .C(n109), .Y(n132) );
  NAND2xp5_ASAP7_75t_R U132 ( .A(n133), .B(n134), .Y(n109) );
  INVx1_ASAP7_75t_R U133 ( .A(n15), .Y(n135) );
  INVx1_ASAP7_75t_R U134 ( .A(n138), .Y(n137) );
  INVx1_ASAP7_75t_R U135 ( .A(n139), .Y(n17) );
  NAND2xp5_ASAP7_75t_R U136 ( .A(n140), .B(n138), .Y(n115) );
  XNOR2xp5_ASAP7_75t_R U137 ( .A(n143), .B(n144), .Y(\SUM\[11\] ) );
  NAND2xp5_ASAP7_75t_R U138 ( .A(n119), .B(n138), .Y(n144) );
  NAND2xp5_ASAP7_75t_R U139 ( .A(\B\[11\] ), .B(\A\[11\] ), .Y(n138) );
  OR2x2_ASAP7_75t_R U140 ( .A(\A\[11\] ), .B(\B\[11\] ), .Y(n119) );
  OAI21xp5_ASAP7_75t_R U141 ( .A1(n140), .A2(n10), .B(n145), .Y(n143) );
  XNOR2xp5_ASAP7_75t_R U142 ( .A(n10), .B(n146), .Y(\SUM\[10\] ) );
  INVx1_ASAP7_75t_R U143 ( .A(n141), .Y(n140) );
  OR2x2_ASAP7_75t_R U144 ( .A(\A\[10\] ), .B(\B\[10\] ), .Y(n141) );
  INVx1_ASAP7_75t_R U145 ( .A(n145), .Y(n136) );
  NAND2xp5_ASAP7_75t_R U146 ( .A(\B\[10\] ), .B(\A\[10\] ), .Y(n145) );
  NAND2xp5_ASAP7_75t_R U147 ( .A(\B\[9\] ), .B(\A\[9\] ), .Y(n15) );
  INVx1_ASAP7_75t_R U148 ( .A(n14), .Y(n148) );
  OR2x2_ASAP7_75t_R U149 ( .A(\A\[9\] ), .B(\B\[9\] ), .Y(n14) );
  INVx1_ASAP7_75t_R U150 ( .A(n12), .Y(n147) );
  OAI21xp5_ASAP7_75t_R U151 ( .A1(n4), .A2(n18), .B(n139), .Y(n12) );
  NAND2xp5_ASAP7_75t_R U152 ( .A(\B\[8\] ), .B(\A\[8\] ), .Y(n139) );
  INVx1_ASAP7_75t_R U153 ( .A(n142), .Y(n18) );
  OR2x2_ASAP7_75t_R U154 ( .A(\A\[8\] ), .B(\B\[8\] ), .Y(n142) );
  INVx1_ASAP7_75t_R U155 ( .A(n25), .Y(n150) );
  NAND2xp5_ASAP7_75t_R U156 ( .A(\B\[7\] ), .B(\A\[7\] ), .Y(n25) );
  INVx1_ASAP7_75t_R U157 ( .A(n27), .Y(n23) );
  NAND2xp5_ASAP7_75t_R U158 ( .A(\B\[6\] ), .B(\A\[6\] ), .Y(n27) );
  INVx1_ASAP7_75t_R U159 ( .A(n22), .Y(n151) );
  NAND2xp5_ASAP7_75t_R U160 ( .A(\B\[5\] ), .B(\A\[5\] ), .Y(n30) );
  NAND2xp5_ASAP7_75t_R U161 ( .A(\B\[4\] ), .B(\A\[4\] ), .Y(n35) );
  INVx1_ASAP7_75t_R U162 ( .A(n33), .Y(n28) );
  OR2x2_ASAP7_75t_R U163 ( .A(\A\[4\] ), .B(\B\[4\] ), .Y(n36) );
  OR2x2_ASAP7_75t_R U164 ( .A(\A\[5\] ), .B(\B\[5\] ), .Y(n33) );
  OR2x2_ASAP7_75t_R U165 ( .A(\A\[6\] ), .B(\B\[6\] ), .Y(n22) );
  OR2x2_ASAP7_75t_R U166 ( .A(\A\[7\] ), .B(\B\[7\] ), .Y(n24) );
  INVx1_ASAP7_75t_R U167 ( .A(n42), .Y(n155) );
  NAND2xp5_ASAP7_75t_R U168 ( .A(\B\[3\] ), .B(\A\[3\] ), .Y(n42) );
  OR2x2_ASAP7_75t_R U169 ( .A(\A\[3\] ), .B(\B\[3\] ), .Y(n41) );
  INVx1_ASAP7_75t_R U170 ( .A(n44), .Y(n154) );
  NAND2xp5_ASAP7_75t_R U171 ( .A(\B\[2\] ), .B(\A\[2\] ), .Y(n44) );
  INVx1_ASAP7_75t_R U172 ( .A(n49), .Y(n43) );
  OR2x2_ASAP7_75t_R U173 ( .A(\A\[2\] ), .B(\B\[2\] ), .Y(n49) );
  NAND2xp5_ASAP7_75t_R U174 ( .A(\B\[1\] ), .B(\A\[1\] ), .Y(n47) );
  INVx1_ASAP7_75t_R U175 ( .A(n66), .Y(n46) );
  OR2x2_ASAP7_75t_R U176 ( .A(\A\[1\] ), .B(\B\[1\] ), .Y(n66) );
  OR2x2_ASAP7_75t_R U177 ( .A(\A\[0\] ), .B(\B\[0\] ), .Y(n152) );
  NAND2xp5_ASAP7_75t_R U178 ( .A(\B\[0\] ), .B(\A\[0\] ), .Y(n67) );
endmodule


module fp32_exp_DW01_add_J6_0 ( .A({\A\[55\] , \A\[54\] , \A\[53\] , \A\[52\] , 
        \A\[51\] , \A\[50\] , \A\[49\] , \A\[48\] , \A\[47\] , \A\[46\] , 
        \A\[45\] , \A\[44\] , \A\[43\] , \A\[42\] , \A\[41\] , \A\[40\] , 
        \A\[39\] , \A\[38\] , \A\[37\] , \A\[36\] , \A\[35\] , \A\[34\] , 
        \A\[33\] , \A\[32\] , \A\[31\] , \A\[30\] , \A\[29\] , \A\[28\] , 
        \A\[27\] , \A\[26\] , \A\[25\] , \A\[24\] , \A\[23\] , \A\[22\] , 
        \A\[21\] , \A\[20\] , \A\[19\] , \A\[18\] , \A\[17\] , \A\[16\] , 
        \A\[15\] , \A\[14\] , \A\[13\] , \A\[12\] , \A\[11\] , \A\[10\] , 
        \A\[9\] , \A\[8\] , \A\[7\] , \A\[6\] , \A\[5\] , \A\[4\] , \A\[3\] , 
        \A\[2\] , \A\[1\] , \A\[0\] }), .B({\B\[55\] , \B\[54\] , \B\[53\] , 
        \B\[52\] , \B\[51\] , \B\[50\] , \B\[49\] , \B\[48\] , \B\[47\] , 
        \B\[46\] , \B\[45\] , \B\[44\] , \B\[43\] , \B\[42\] , \B\[41\] , 
        \B\[40\] , \B\[39\] , \B\[38\] , \B\[37\] , \B\[36\] , \B\[35\] , 
        \B\[34\] , \B\[33\] , \B\[32\] , \B\[31\] , \B\[30\] , \B\[29\] , 
        \B\[28\] , \B\[27\] , \B\[26\] , \B\[25\] , \B\[24\] , \B\[23\] , 
        \B\[22\] , \B\[21\] , \B\[20\] , \B\[19\] , \B\[18\] , \B\[17\] , 
        \B\[16\] , \B\[15\] , \B\[14\] , \B\[13\] , \B\[12\] , \B\[11\] , 
        \B\[10\] , \B\[9\] , \B\[8\] , \B\[7\] , \B\[6\] , \B\[5\] , \B\[4\] , 
        \B\[3\] , \B\[2\] , \B\[1\] , \B\[0\] }), CI, .SUM({\SUM\[55\] , 
        \SUM\[54\] , \SUM\[53\] , \SUM\[52\] , \SUM\[51\] , \SUM\[50\] , 
        \SUM\[49\] , \SUM\[48\] , \SUM\[47\] , \SUM\[46\] , \SUM\[45\] , 
        \SUM\[44\] , \SUM\[43\] , \SUM\[42\] , \SUM\[41\] , \SUM\[40\] , 
        \SUM\[39\] , \SUM\[38\] , \SUM\[37\] , \SUM\[36\] , \SUM\[35\] , 
        \SUM\[34\] , \SUM\[33\] , \SUM\[32\] , \SUM\[31\] , \SUM\[30\] , 
        \SUM\[29\] , \SUM\[28\] , \SUM\[27\] , \SUM\[26\] , \SUM\[25\] , 
        \SUM\[24\] , \SUM\[23\] , \SUM\[22\] , \SUM\[21\] , \SUM\[20\] , 
        \SUM\[19\] , \SUM\[18\] , \SUM\[17\] , \SUM\[16\] , \SUM\[15\] , 
        \SUM\[14\] , \SUM\[13\] , \SUM\[12\] , \SUM\[11\] , \SUM\[10\] , 
        \SUM\[9\] , \SUM\[8\] , \SUM\[7\] , \SUM\[6\] , \SUM\[5\] , \SUM\[4\] , 
        \SUM\[3\] , \SUM\[2\] , \SUM\[1\] , \SUM\[0\] }), CO );
  input \A\[55\] , \A\[54\] , \A\[53\] , \A\[52\] , \A\[51\] , \A\[50\] ,
         \A\[49\] , \A\[48\] , \A\[47\] , \A\[46\] , \A\[45\] , \A\[44\] ,
         \A\[43\] , \A\[42\] , \A\[41\] , \A\[40\] , \A\[39\] , \A\[38\] ,
         \A\[37\] , \A\[36\] , \A\[35\] , \A\[34\] , \A\[33\] , \A\[32\] ,
         \A\[31\] , \A\[30\] , \A\[29\] , \A\[28\] , \A\[27\] , \A\[26\] ,
         \A\[25\] , \A\[24\] , \A\[23\] , \A\[22\] , \A\[21\] , \A\[20\] ,
         \A\[19\] , \A\[18\] , \A\[17\] , \A\[16\] , \A\[15\] , \A\[14\] ,
         \A\[13\] , \A\[12\] , \A\[11\] , \A\[10\] , \A\[9\] , \A\[8\] ,
         \A\[7\] , \A\[6\] , \A\[5\] , \A\[4\] , \A\[3\] , \A\[2\] , \A\[1\] ,
         \A\[0\] , \B\[55\] , \B\[54\] , \B\[53\] , \B\[52\] , \B\[51\] ,
         \B\[50\] , \B\[49\] , \B\[48\] , \B\[47\] , \B\[46\] , \B\[45\] ,
         \B\[44\] , \B\[43\] , \B\[42\] , \B\[41\] , \B\[40\] , \B\[39\] ,
         \B\[38\] , \B\[37\] , \B\[36\] , \B\[35\] , \B\[34\] , \B\[33\] ,
         \B\[32\] , \B\[31\] , \B\[30\] , \B\[29\] , \B\[28\] , \B\[27\] ,
         \B\[26\] , \B\[25\] , \B\[24\] , \B\[23\] , \B\[22\] , \B\[21\] ,
         \B\[20\] , \B\[19\] , \B\[18\] , \B\[17\] , \B\[16\] , \B\[15\] ,
         \B\[14\] , \B\[13\] , \B\[12\] , \B\[11\] , \B\[10\] , \B\[9\] ,
         \B\[8\] , \B\[7\] , \B\[6\] , \B\[5\] , \B\[4\] , \B\[3\] , \B\[2\] ,
         \B\[1\] , \B\[0\] , CI;
  output \SUM\[55\] , \SUM\[54\] , \SUM\[53\] , \SUM\[52\] , \SUM\[51\] ,
         \SUM\[50\] , \SUM\[49\] , \SUM\[48\] , \SUM\[47\] , \SUM\[46\] ,
         \SUM\[45\] , \SUM\[44\] , \SUM\[43\] , \SUM\[42\] , \SUM\[41\] ,
         \SUM\[40\] , \SUM\[39\] , \SUM\[38\] , \SUM\[37\] , \SUM\[36\] ,
         \SUM\[35\] , \SUM\[34\] , \SUM\[33\] , \SUM\[32\] , \SUM\[31\] ,
         \SUM\[30\] , \SUM\[29\] , \SUM\[28\] , \SUM\[27\] , \SUM\[26\] ,
         \SUM\[25\] , \SUM\[24\] , \SUM\[23\] , \SUM\[22\] , \SUM\[21\] ,
         \SUM\[20\] , \SUM\[19\] , \SUM\[18\] , \SUM\[17\] , \SUM\[16\] ,
         \SUM\[15\] , \SUM\[14\] , \SUM\[13\] , \SUM\[12\] , \SUM\[11\] ,
         \SUM\[10\] , \SUM\[9\] , \SUM\[8\] , \SUM\[7\] , \SUM\[6\] ,
         \SUM\[5\] , \SUM\[4\] , \SUM\[3\] , \SUM\[2\] , \SUM\[1\] ,
         \SUM\[0\] , CO;
  wire   n1, n3, n4, n5, n6, n7, n8, n9, n11, n12, n13, n14, n15, n16, n17,
         n18, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46,
         n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60,
         n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74,
         n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88,
         n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101,
         n102, n103, n104, n105, n106, n107, n108, n109, n110, n111, n112,
         n113, n114, n115, n116, n117, n118, n119, n120, n121, n122, n123,
         n124, n125, n126, n127, n128, n129, n130, n131, n132, n133, n134,
         n135, n136, n137, n138, n139, n140, n141, n142, n143, n144, n145,
         n146, n147, n148, n149, n150, n151, n152, n153, n154, n155, n156,
         n157, n158, n159, n160, n161, n162, n163, n164, n165, n166, n167,
         n168, n169, n170, n171, n172, n173, n174, n175, n176, n177, n178,
         n179, n180, n181, n182, n183, n184, n185, n186, n187, n188, n189,
         n190, n191, n192, n193, n194, n195, n196, n197, n198, n199, n200;

  NOR2xp33_ASAP7_75t_R U2 ( .A(n45), .B(n46), .Y(n44) );
  AOI21xp5_ASAP7_75t_R U3 ( .A1(n47), .A2(n48), .B(n49), .Y(n45) );
  AOI21xp5_ASAP7_75t_R U4 ( .A1(n128), .A2(n129), .B(n130), .Y(n110) );
  NOR2xp33_ASAP7_75t_R U5 ( .A(n124), .B(n131), .Y(n130) );
  NOR2xp33_ASAP7_75t_R U6 ( .A(n124), .B(n118), .Y(n128) );
  NOR2xp33_ASAP7_75t_R U7 ( .A(n16), .B(n99), .Y(n105) );
  AOI21xp5_ASAP7_75t_R U8 ( .A1(n104), .A2(n102), .B(n16), .Y(n103) );
  NAND4xp25_ASAP7_75t_R U9 ( .A(n133), .B(n134), .C(n135), .D(n123), .Y(n124)
         );
  NAND4xp25_ASAP7_75t_R U10 ( .A(n149), .B(n151), .C(n150), .D(n155), .Y(n118)
         );
  AOI21xp5_ASAP7_75t_R U11 ( .A1(n152), .A2(n151), .B(n153), .Y(n145) );
  NAND4xp25_ASAP7_75t_R U12 ( .A(\A\[24\] ), .B(\B\[24\] ), .C(n150), .D(n151), 
        .Y(n146) );
  NOR2xp33_ASAP7_75t_R U13 ( .A(n118), .B(n119), .Y(n113) );
  OAI31xp33_ASAP7_75t_R U14 ( .A1(n193), .A2(n5), .A3(n14), .B(n194), .Y(n191)
         );
  NOR2xp33_ASAP7_75t_R U15 ( .A(n30), .B(n31), .Y(n29) );
  NOR2xp33_ASAP7_75t_R U16 ( .A(n33), .B(n9), .Y(n32) );
  NOR3xp33_ASAP7_75t_R U17 ( .A(n39), .B(n38), .C(n20), .Y(n36) );
  AOI21xp5_ASAP7_75t_R U18 ( .A1(n42), .A2(n43), .B(n44), .Y(n38) );
  AOI22xp5_ASAP7_75t_R U19 ( .A1(\B\[16\] ), .A2(\A\[16\] ), .B1(\B\[17\] ), 
        .B2(\A\[17\] ), .Y(n193) );
  NAND4xp25_ASAP7_75t_R U20 ( .A(\A\[43\] ), .B(\A\[42\] ), .C(\A\[41\] ), .D(
        \A\[40\] ), .Y(n46) );
  NOR3xp33_ASAP7_75t_R U21 ( .A(n46), .B(n50), .C(n51), .Y(n43) );
  INVx1_ASAP7_75t_R U22 ( .A(n165), .Y(n143) );
  O2A1O1Ixp33_ASAP7_75t_R U23 ( .A1(n96), .A2(n97), .B(n98), .C(n99), .Y(n94)
         );
  NAND4xp25_ASAP7_75t_R U24 ( .A(n100), .B(n101), .C(n102), .D(n95), .Y(n51)
         );
  O2A1O1Ixp33_ASAP7_75t_R U25 ( .A1(n74), .A2(n75), .B(n76), .C(n77), .Y(n71)
         );
  NAND4xp25_ASAP7_75t_R U26 ( .A(n73), .B(n78), .C(n79), .D(n80), .Y(n50) );
  NOR2xp33_ASAP7_75t_R U27 ( .A(n27), .B(n28), .Y(n24) );
  OAI21xp5_ASAP7_75t_R U28 ( .A1(n190), .A2(n119), .B(n132), .Y(n165) );
  NAND4xp25_ASAP7_75t_R U29 ( .A(n110), .B(n111), .C(n15), .D(n112), .Y(n42)
         );
  AOI31xp33_ASAP7_75t_R U30 ( .A1(n113), .A2(n114), .A3(n115), .B(n116), .Y(
        n112) );
  AOI22xp5_ASAP7_75t_R U31 ( .A1(n125), .A2(n123), .B1(n115), .B2(n126), .Y(
        n111) );
  NOR2xp33_ASAP7_75t_R U32 ( .A(n72), .B(n77), .Y(n84) );
  NOR2xp33_ASAP7_75t_R U33 ( .A(n41), .B(n4), .Y(n52) );
  OA21x2_ASAP7_75t_R U34 ( .A1(n143), .A2(n118), .B(n144), .Y(n1) );
  XOR2xp5_ASAP7_75t_R U35 ( .A(n106), .B(n17), .Y(\SUM\[33\] ) );
  OR2x2_ASAP7_75t_R U36 ( .A(n57), .B(n46), .Y(n3) );
  OR2x2_ASAP7_75t_R U37 ( .A(n53), .B(n54), .Y(n4) );
  AND2x2_ASAP7_75t_R U38 ( .A(n197), .B(n198), .Y(n5) );
  AND2x2_ASAP7_75t_R U39 ( .A(\B\[19\] ), .B(\A\[19\] ), .Y(n6) );
  OA21x2_ASAP7_75t_R U40 ( .A1(n74), .A2(n85), .B(n76), .Y(n7) );
  OR2x2_ASAP7_75t_R U41 ( .A(n35), .B(n22), .Y(n8) );
  OR2x2_ASAP7_75t_R U42 ( .A(n34), .B(n8), .Y(n9) );
  XOR2xp5_ASAP7_75t_R U43 ( .A(\A\[53\] ), .B(n29), .Y(\SUM\[53\] ) );
  OA21x2_ASAP7_75t_R U44 ( .A1(n141), .A2(n1), .B(n131), .Y(n11) );
  OA21x2_ASAP7_75t_R U45 ( .A1(n139), .A2(n11), .B(n121), .Y(n12) );
  AOI21xp5_ASAP7_75t_R U46 ( .A1(n160), .A2(n150), .B(n152), .Y(n13) );
  AND2x2_ASAP7_75t_R U47 ( .A(n199), .B(n200), .Y(n14) );
  OR3x1_ASAP7_75t_R U48 ( .A(n120), .B(n121), .C(n122), .Y(n15) );
  AND2x2_ASAP7_75t_R U49 ( .A(\B\[34\] ), .B(\A\[34\] ), .Y(n16) );
  OA21x2_ASAP7_75t_R U50 ( .A1(n107), .A2(n108), .B(n97), .Y(n17) );
  AND2x2_ASAP7_75t_R U51 ( .A(\A\[54\] ), .B(n24), .Y(n18) );
  XOR2xp5_ASAP7_75t_R U52 ( .A(\A\[52\] ), .B(n32), .Y(\SUM\[52\] ) );
  OR2x2_ASAP7_75t_R U53 ( .A(n40), .B(n41), .Y(n20) );
  AND2x2_ASAP7_75t_R U54 ( .A(n92), .B(n95), .Y(n21) );
  NOR2x1_ASAP7_75t_R U55 ( .A(n56), .B(n3), .Y(n55) );
  INVx1_ASAP7_75t_R U56 ( .A(\A\[42\] ), .Y(n61) );
  NOR2x1_ASAP7_75t_R U57 ( .A(n62), .B(n63), .Y(n59) );
  NOR2x1_ASAP7_75t_R U58 ( .A(n65), .B(n57), .Y(n64) );
  NAND2xp5_ASAP7_75t_R U59 ( .A(n36), .B(\A\[48\] ), .Y(n22) );
  NAND2xp5_ASAP7_75t_R U60 ( .A(n59), .B(\A\[42\] ), .Y(n58) );
  INVx1_ASAP7_75t_R U61 ( .A(\A\[43\] ), .Y(n60) );
  INVx1_ASAP7_75t_R U62 ( .A(\A\[47\] ), .Y(n40) );
  INVx1_ASAP7_75t_R U63 ( .A(\A\[48\] ), .Y(n37) );
  INVx1_ASAP7_75t_R U64 ( .A(\A\[49\] ), .Y(n35) );
  INVx1_ASAP7_75t_R U65 ( .A(\A\[50\] ), .Y(n34) );
  INVx1_ASAP7_75t_R U66 ( .A(\A\[51\] ), .Y(n33) );
  INVx1_ASAP7_75t_R U67 ( .A(\A\[52\] ), .Y(n31) );
  INVx1_ASAP7_75t_R U68 ( .A(\A\[54\] ), .Y(n25) );
  INVx1_ASAP7_75t_R U69 ( .A(\A\[53\] ), .Y(n28) );
  INVx1_ASAP7_75t_R U70 ( .A(\A\[55\] ), .Y(n23) );
  XNOR2xp5_ASAP7_75t_R U71 ( .A(n18), .B(n23), .Y(\SUM\[55\] ) );
  XOR2xp5_ASAP7_75t_R U72 ( .A(n25), .B(n26), .Y(\SUM\[54\] ) );
  INVx1_ASAP7_75t_R U73 ( .A(n24), .Y(n26) );
  INVx1_ASAP7_75t_R U74 ( .A(n29), .Y(n27) );
  INVx1_ASAP7_75t_R U75 ( .A(n32), .Y(n30) );
  XOR2xp5_ASAP7_75t_R U76 ( .A(n33), .B(n9), .Y(\SUM\[51\] ) );
  XNOR2xp5_ASAP7_75t_R U77 ( .A(n8), .B(\A\[50\] ), .Y(\SUM\[50\] ) );
  XOR2xp5_ASAP7_75t_R U78 ( .A(n35), .B(n22), .Y(\SUM\[49\] ) );
  XNOR2xp5_ASAP7_75t_R U79 ( .A(n36), .B(n37), .Y(\SUM\[48\] ) );
  NAND2xp5_ASAP7_75t_R U80 ( .A(\A\[44\] ), .B(\A\[45\] ), .Y(n39) );
  INVx1_ASAP7_75t_R U81 ( .A(n50), .Y(n47) );
  XNOR2xp5_ASAP7_75t_R U82 ( .A(n52), .B(n40), .Y(\SUM\[47\] ) );
  XNOR2xp5_ASAP7_75t_R U83 ( .A(n4), .B(\A\[46\] ), .Y(\SUM\[46\] ) );
  INVx1_ASAP7_75t_R U84 ( .A(\A\[46\] ), .Y(n41) );
  INVx1_ASAP7_75t_R U85 ( .A(n55), .Y(n54) );
  XOR2xp5_ASAP7_75t_R U86 ( .A(n55), .B(\A\[45\] ), .Y(\SUM\[45\] ) );
  INVx1_ASAP7_75t_R U87 ( .A(\A\[45\] ), .Y(n53) );
  XNOR2xp5_ASAP7_75t_R U88 ( .A(n3), .B(\A\[44\] ), .Y(\SUM\[44\] ) );
  INVx1_ASAP7_75t_R U89 ( .A(\A\[44\] ), .Y(n56) );
  XOR2xp5_ASAP7_75t_R U90 ( .A(n60), .B(n58), .Y(\SUM\[43\] ) );
  XNOR2xp5_ASAP7_75t_R U91 ( .A(n61), .B(n59), .Y(\SUM\[42\] ) );
  INVx1_ASAP7_75t_R U92 ( .A(n64), .Y(n63) );
  INVx1_ASAP7_75t_R U93 ( .A(\A\[41\] ), .Y(n62) );
  XNOR2xp5_ASAP7_75t_R U94 ( .A(n64), .B(n62), .Y(\SUM\[41\] ) );
  INVx1_ASAP7_75t_R U95 ( .A(n66), .Y(n57) );
  INVx1_ASAP7_75t_R U96 ( .A(\A\[40\] ), .Y(n65) );
  XNOR2xp5_ASAP7_75t_R U97 ( .A(n65), .B(n66), .Y(\SUM\[40\] ) );
  OAI21xp5_ASAP7_75t_R U98 ( .A1(n67), .A2(n50), .B(n68), .Y(n66) );
  INVx1_ASAP7_75t_R U99 ( .A(n49), .Y(n68) );
  NAND2xp5_ASAP7_75t_R U100 ( .A(n69), .B(n70), .Y(n49) );
  OAI21xp5_ASAP7_75t_R U101 ( .A1(n71), .A2(n72), .B(n73), .Y(n70) );
  XNOR2xp5_ASAP7_75t_R U102 ( .A(n81), .B(n82), .Y(\SUM\[39\] ) );
  NAND2xp5_ASAP7_75t_R U103 ( .A(n69), .B(n73), .Y(n82) );
  OR2x2_ASAP7_75t_R U104 ( .A(\A\[39\] ), .B(\B\[39\] ), .Y(n73) );
  NAND2xp5_ASAP7_75t_R U105 ( .A(\B\[39\] ), .B(\A\[39\] ), .Y(n69) );
  OAI21xp5_ASAP7_75t_R U106 ( .A1(n77), .A2(n7), .B(n83), .Y(n81) );
  XNOR2xp5_ASAP7_75t_R U107 ( .A(n7), .B(n84), .Y(\SUM\[38\] ) );
  INVx1_ASAP7_75t_R U108 ( .A(n78), .Y(n77) );
  OR2x2_ASAP7_75t_R U109 ( .A(\A\[38\] ), .B(\B\[38\] ), .Y(n78) );
  INVx1_ASAP7_75t_R U110 ( .A(n83), .Y(n72) );
  NAND2xp5_ASAP7_75t_R U111 ( .A(\B\[38\] ), .B(\A\[38\] ), .Y(n83) );
  INVx1_ASAP7_75t_R U112 ( .A(n86), .Y(n85) );
  INVx1_ASAP7_75t_R U113 ( .A(n79), .Y(n74) );
  XNOR2xp5_ASAP7_75t_R U114 ( .A(n87), .B(n86), .Y(\SUM\[37\] ) );
  OAI21xp5_ASAP7_75t_R U115 ( .A1(n88), .A2(n67), .B(n75), .Y(n86) );
  INVx1_ASAP7_75t_R U116 ( .A(n89), .Y(n67) );
  INVx1_ASAP7_75t_R U117 ( .A(n80), .Y(n88) );
  NAND2xp5_ASAP7_75t_R U118 ( .A(n76), .B(n79), .Y(n87) );
  OR2x2_ASAP7_75t_R U119 ( .A(\A\[37\] ), .B(\B\[37\] ), .Y(n79) );
  NAND2xp5_ASAP7_75t_R U120 ( .A(\B\[37\] ), .B(\A\[37\] ), .Y(n76) );
  XNOR2xp5_ASAP7_75t_R U121 ( .A(n89), .B(n90), .Y(\SUM\[36\] ) );
  NAND2xp5_ASAP7_75t_R U122 ( .A(n75), .B(n80), .Y(n90) );
  OR2x2_ASAP7_75t_R U123 ( .A(\A\[36\] ), .B(\B\[36\] ), .Y(n80) );
  NAND2xp5_ASAP7_75t_R U124 ( .A(\B\[36\] ), .B(\A\[36\] ), .Y(n75) );
  AO21x1_ASAP7_75t_R U125 ( .A1(n91), .A2(n42), .B(n48), .Y(n89) );
  NAND2xp5_ASAP7_75t_R U126 ( .A(n92), .B(n93), .Y(n48) );
  OAI21xp5_ASAP7_75t_R U127 ( .A1(n94), .A2(n16), .B(n95), .Y(n93) );
  INVx1_ASAP7_75t_R U128 ( .A(n51), .Y(n91) );
  XNOR2xp5_ASAP7_75t_R U129 ( .A(n103), .B(n21), .Y(\SUM\[35\] ) );
  OR2x2_ASAP7_75t_R U130 ( .A(\A\[35\] ), .B(\B\[35\] ), .Y(n95) );
  NAND2xp5_ASAP7_75t_R U131 ( .A(\B\[35\] ), .B(\A\[35\] ), .Y(n92) );
  XOR2xp5_ASAP7_75t_R U132 ( .A(n104), .B(n105), .Y(\SUM\[34\] ) );
  INVx1_ASAP7_75t_R U133 ( .A(n102), .Y(n99) );
  OR2x2_ASAP7_75t_R U134 ( .A(\A\[34\] ), .B(\B\[34\] ), .Y(n102) );
  OAI21xp5_ASAP7_75t_R U135 ( .A1(n96), .A2(n17), .B(n98), .Y(n104) );
  INVx1_ASAP7_75t_R U136 ( .A(n101), .Y(n96) );
  INVx1_ASAP7_75t_R U137 ( .A(n100), .Y(n108) );
  INVx1_ASAP7_75t_R U138 ( .A(n42), .Y(n107) );
  NAND2xp5_ASAP7_75t_R U139 ( .A(n98), .B(n101), .Y(n106) );
  OR2x2_ASAP7_75t_R U140 ( .A(\A\[33\] ), .B(\B\[33\] ), .Y(n101) );
  NAND2xp5_ASAP7_75t_R U141 ( .A(\B\[33\] ), .B(\A\[33\] ), .Y(n98) );
  XNOR2xp5_ASAP7_75t_R U142 ( .A(n109), .B(n42), .Y(\SUM\[32\] ) );
  INVx1_ASAP7_75t_R U143 ( .A(n117), .Y(n116) );
  INVx1_ASAP7_75t_R U144 ( .A(n123), .Y(n122) );
  INVx1_ASAP7_75t_R U145 ( .A(n124), .Y(n115) );
  INVx1_ASAP7_75t_R U146 ( .A(n127), .Y(n125) );
  INVx1_ASAP7_75t_R U147 ( .A(n132), .Y(n129) );
  NAND2xp5_ASAP7_75t_R U148 ( .A(n97), .B(n100), .Y(n109) );
  OR2x2_ASAP7_75t_R U149 ( .A(\A\[32\] ), .B(\B\[32\] ), .Y(n100) );
  NAND2xp5_ASAP7_75t_R U150 ( .A(\B\[32\] ), .B(\A\[32\] ), .Y(n97) );
  XNOR2xp5_ASAP7_75t_R U151 ( .A(n136), .B(n137), .Y(\SUM\[31\] ) );
  NAND2xp5_ASAP7_75t_R U152 ( .A(n123), .B(n117), .Y(n137) );
  NAND2xp5_ASAP7_75t_R U153 ( .A(\B\[31\] ), .B(\A\[31\] ), .Y(n117) );
  OR2x2_ASAP7_75t_R U154 ( .A(\A\[31\] ), .B(\B\[31\] ), .Y(n123) );
  OAI21xp5_ASAP7_75t_R U155 ( .A1(n120), .A2(n12), .B(n127), .Y(n136) );
  INVx1_ASAP7_75t_R U156 ( .A(n135), .Y(n120) );
  XOR2xp5_ASAP7_75t_R U157 ( .A(n138), .B(n12), .Y(\SUM\[30\] ) );
  INVx1_ASAP7_75t_R U158 ( .A(n134), .Y(n139) );
  NAND2xp5_ASAP7_75t_R U159 ( .A(n135), .B(n127), .Y(n138) );
  NAND2xp5_ASAP7_75t_R U160 ( .A(\B\[30\] ), .B(\A\[30\] ), .Y(n127) );
  OR2x2_ASAP7_75t_R U161 ( .A(\A\[30\] ), .B(\B\[30\] ), .Y(n135) );
  XOR2xp5_ASAP7_75t_R U162 ( .A(n140), .B(n11), .Y(\SUM\[29\] ) );
  INVx1_ASAP7_75t_R U163 ( .A(n133), .Y(n141) );
  NAND2xp5_ASAP7_75t_R U164 ( .A(n134), .B(n121), .Y(n140) );
  NAND2xp5_ASAP7_75t_R U165 ( .A(\B\[29\] ), .B(\A\[29\] ), .Y(n121) );
  OR2x2_ASAP7_75t_R U166 ( .A(\A\[29\] ), .B(\B\[29\] ), .Y(n134) );
  XOR2xp5_ASAP7_75t_R U167 ( .A(n142), .B(n1), .Y(\SUM\[28\] ) );
  INVx1_ASAP7_75t_R U168 ( .A(n126), .Y(n144) );
  A2O1A1Ixp33_ASAP7_75t_R U169 ( .A1(n145), .A2(n146), .B(n147), .C(n148), .Y(
        n126) );
  INVx1_ASAP7_75t_R U170 ( .A(n149), .Y(n147) );
  INVx1_ASAP7_75t_R U171 ( .A(n154), .Y(n153) );
  NAND2xp5_ASAP7_75t_R U172 ( .A(n133), .B(n131), .Y(n142) );
  NAND2xp5_ASAP7_75t_R U173 ( .A(\B\[28\] ), .B(\A\[28\] ), .Y(n131) );
  OR2x2_ASAP7_75t_R U174 ( .A(\A\[28\] ), .B(\B\[28\] ), .Y(n133) );
  XNOR2xp5_ASAP7_75t_R U175 ( .A(n156), .B(n157), .Y(\SUM\[27\] ) );
  NAND2xp5_ASAP7_75t_R U176 ( .A(n149), .B(n148), .Y(n157) );
  NAND2xp5_ASAP7_75t_R U177 ( .A(\B\[27\] ), .B(\A\[27\] ), .Y(n148) );
  OR2x2_ASAP7_75t_R U178 ( .A(\A\[27\] ), .B(\B\[27\] ), .Y(n149) );
  OAI21xp5_ASAP7_75t_R U179 ( .A1(n158), .A2(n13), .B(n154), .Y(n156) );
  INVx1_ASAP7_75t_R U180 ( .A(n151), .Y(n158) );
  XOR2xp5_ASAP7_75t_R U181 ( .A(n159), .B(n13), .Y(\SUM\[26\] ) );
  INVx1_ASAP7_75t_R U182 ( .A(n161), .Y(n152) );
  NAND2xp5_ASAP7_75t_R U183 ( .A(n151), .B(n154), .Y(n159) );
  NAND2xp5_ASAP7_75t_R U184 ( .A(\B\[26\] ), .B(\A\[26\] ), .Y(n154) );
  OR2x2_ASAP7_75t_R U185 ( .A(\A\[26\] ), .B(\B\[26\] ), .Y(n151) );
  XNOR2xp5_ASAP7_75t_R U186 ( .A(n160), .B(n162), .Y(\SUM\[25\] ) );
  NAND2xp5_ASAP7_75t_R U187 ( .A(n150), .B(n161), .Y(n162) );
  NAND2xp5_ASAP7_75t_R U188 ( .A(\B\[25\] ), .B(\A\[25\] ), .Y(n161) );
  OR2x2_ASAP7_75t_R U189 ( .A(\A\[25\] ), .B(\B\[25\] ), .Y(n150) );
  OAI21xp5_ASAP7_75t_R U190 ( .A1(n163), .A2(n143), .B(n164), .Y(n160) );
  INVx1_ASAP7_75t_R U191 ( .A(n155), .Y(n163) );
  XNOR2xp5_ASAP7_75t_R U192 ( .A(n165), .B(n166), .Y(\SUM\[24\] ) );
  NAND2xp5_ASAP7_75t_R U193 ( .A(n164), .B(n155), .Y(n166) );
  OR2x2_ASAP7_75t_R U194 ( .A(\A\[24\] ), .B(\B\[24\] ), .Y(n155) );
  NAND2xp5_ASAP7_75t_R U195 ( .A(\B\[24\] ), .B(\A\[24\] ), .Y(n164) );
  OAI21xp5_ASAP7_75t_R U196 ( .A1(n167), .A2(n168), .B(n169), .Y(n132) );
  INVx1_ASAP7_75t_R U197 ( .A(n170), .Y(n167) );
  OR2x2_ASAP7_75t_R U198 ( .A(n171), .B(n172), .Y(n119) );
  NAND2xp5_ASAP7_75t_R U199 ( .A(n169), .B(n173), .Y(n172) );
  XNOR2xp5_ASAP7_75t_R U200 ( .A(n174), .B(n175), .Y(\SUM\[23\] ) );
  NAND2xp5_ASAP7_75t_R U201 ( .A(n169), .B(n170), .Y(n175) );
  NAND2xp5_ASAP7_75t_R U202 ( .A(\B\[23\] ), .B(\A\[23\] ), .Y(n170) );
  OR2x2_ASAP7_75t_R U203 ( .A(\A\[23\] ), .B(\B\[23\] ), .Y(n169) );
  OAI21xp5_ASAP7_75t_R U204 ( .A1(n190), .A2(n176), .B(n177), .Y(n174) );
  INVx1_ASAP7_75t_R U205 ( .A(n168), .Y(n177) );
  OAI321xp33_ASAP7_75t_R U206 ( .A1(n178), .A2(n179), .A3(n180), .B1(n179), 
        .B2(n181), .C(n182), .Y(n168) );
  NAND2xp5_ASAP7_75t_R U207 ( .A(\B\[22\] ), .B(\A\[22\] ), .Y(n182) );
  NAND2xp5_ASAP7_75t_R U208 ( .A(\A\[21\] ), .B(\B\[21\] ), .Y(n181) );
  INVx1_ASAP7_75t_R U209 ( .A(n183), .Y(n180) );
  INVx1_ASAP7_75t_R U210 ( .A(n184), .Y(n179) );
  NAND2xp5_ASAP7_75t_R U211 ( .A(\B\[20\] ), .B(\A\[20\] ), .Y(n178) );
  NAND2xp5_ASAP7_75t_R U212 ( .A(n185), .B(n173), .Y(n176) );
  NAND2xp5_ASAP7_75t_R U213 ( .A(n186), .B(n187), .Y(n173) );
  INVx1_ASAP7_75t_R U214 ( .A(\A\[20\] ), .Y(n187) );
  INVx1_ASAP7_75t_R U215 ( .A(\B\[20\] ), .Y(n186) );
  INVx1_ASAP7_75t_R U216 ( .A(n171), .Y(n185) );
  NAND2xp5_ASAP7_75t_R U217 ( .A(n183), .B(n184), .Y(n171) );
  OR2x2_ASAP7_75t_R U218 ( .A(\A\[22\] ), .B(\B\[22\] ), .Y(n184) );
  NAND2xp5_ASAP7_75t_R U219 ( .A(n188), .B(n189), .Y(n183) );
  INVx1_ASAP7_75t_R U220 ( .A(\A\[21\] ), .Y(n189) );
  INVx1_ASAP7_75t_R U221 ( .A(\B\[21\] ), .Y(n188) );
  INVx1_ASAP7_75t_R U222 ( .A(n114), .Y(n190) );
  AO21x1_ASAP7_75t_R U223 ( .A1(n191), .A2(n192), .B(n6), .Y(n114) );
  NAND2xp5_ASAP7_75t_R U224 ( .A(\B\[18\] ), .B(\A\[18\] ), .Y(n194) );
  NAND2xp5_ASAP7_75t_R U225 ( .A(n195), .B(n196), .Y(n192) );
  INVx1_ASAP7_75t_R U226 ( .A(\A\[19\] ), .Y(n196) );
  INVx1_ASAP7_75t_R U227 ( .A(\B\[19\] ), .Y(n195) );
  INVx1_ASAP7_75t_R U228 ( .A(\A\[17\] ), .Y(n198) );
  INVx1_ASAP7_75t_R U229 ( .A(\B\[17\] ), .Y(n197) );
  INVx1_ASAP7_75t_R U230 ( .A(\A\[18\] ), .Y(n200) );
  INVx1_ASAP7_75t_R U231 ( .A(\B\[18\] ), .Y(n199) );
endmodule


module fp32_exp_DW01_add_J7_0 ( .A({\A\[40\] , \A\[39\] , \A\[38\] , \A\[37\] , 
        \A\[36\] , \A\[35\] , \A\[34\] , \A\[33\] , \A\[32\] , \A\[31\] , 
        \A\[30\] , \A\[29\] , \A\[28\] , \A\[27\] , \A\[26\] , \A\[25\] , 
        \A\[24\] , \A\[23\] , \A\[22\] , \A\[21\] , \A\[20\] , \A\[19\] , 
        \A\[18\] , \A\[17\] , \A\[16\] , \A\[15\] , \A\[14\] , \A\[13\] , 
        \A\[12\] , \A\[11\] , \A\[10\] , \A\[9\] , \A\[8\] , \A\[7\] , 
        \A\[6\] , \A\[5\] , \A\[4\] , \A\[3\] , \A\[2\] , \A\[1\] , \A\[0\] }), 
    .B({\B\[40\] , \B\[39\] , \B\[38\] , \B\[37\] , \B\[36\] , \B\[35\] , 
        \B\[34\] , \B\[33\] , \B\[32\] , \B\[31\] , \B\[30\] , \B\[29\] , 
        \B\[28\] , \B\[27\] , \B\[26\] , \B\[25\] , \B\[24\] , \B\[23\] , 
        \B\[22\] , \B\[21\] , \B\[20\] , \B\[19\] , \B\[18\] , \B\[17\] , 
        \B\[16\] , \B\[15\] , \B\[14\] , \B\[13\] , \B\[12\] , \B\[11\] , 
        \B\[10\] , \B\[9\] , \B\[8\] , \B\[7\] , \B\[6\] , \B\[5\] , \B\[4\] , 
        \B\[3\] , \B\[2\] , \B\[1\] , \B\[0\] }), CI, .SUM({\SUM\[40\] , 
        \SUM\[39\] , \SUM\[38\] , \SUM\[37\] , \SUM\[36\] , \SUM\[35\] , 
        \SUM\[34\] , \SUM\[33\] , \SUM\[32\] , \SUM\[31\] , \SUM\[30\] , 
        \SUM\[29\] , \SUM\[28\] , \SUM\[27\] , \SUM\[26\] , \SUM\[25\] , 
        \SUM\[24\] , \SUM\[23\] , \SUM\[22\] , \SUM\[21\] , \SUM\[20\] , 
        \SUM\[19\] , \SUM\[18\] , \SUM\[17\] , \SUM\[16\] , \SUM\[15\] , 
        \SUM\[14\] , \SUM\[13\] , \SUM\[12\] , \SUM\[11\] , \SUM\[10\] , 
        \SUM\[9\] , \SUM\[8\] , \SUM\[7\] , \SUM\[6\] , \SUM\[5\] , \SUM\[4\] , 
        \SUM\[3\] , \SUM\[2\] , \SUM\[1\] , \SUM\[0\] }), CO );
  input \A\[40\] , \A\[39\] , \A\[38\] , \A\[37\] , \A\[36\] , \A\[35\] ,
         \A\[34\] , \A\[33\] , \A\[32\] , \A\[31\] , \A\[30\] , \A\[29\] ,
         \A\[28\] , \A\[27\] , \A\[26\] , \A\[25\] , \A\[24\] , \A\[23\] ,
         \A\[22\] , \A\[21\] , \A\[20\] , \A\[19\] , \A\[18\] , \A\[17\] ,
         \A\[16\] , \A\[15\] , \A\[14\] , \A\[13\] , \A\[12\] , \A\[11\] ,
         \A\[10\] , \A\[9\] , \A\[8\] , \A\[7\] , \A\[6\] , \A\[5\] , \A\[4\] ,
         \A\[3\] , \A\[2\] , \A\[1\] , \A\[0\] , \B\[40\] , \B\[39\] ,
         \B\[38\] , \B\[37\] , \B\[36\] , \B\[35\] , \B\[34\] , \B\[33\] ,
         \B\[32\] , \B\[31\] , \B\[30\] , \B\[29\] , \B\[28\] , \B\[27\] ,
         \B\[26\] , \B\[25\] , \B\[24\] , \B\[23\] , \B\[22\] , \B\[21\] ,
         \B\[20\] , \B\[19\] , \B\[18\] , \B\[17\] , \B\[16\] , \B\[15\] ,
         \B\[14\] , \B\[13\] , \B\[12\] , \B\[11\] , \B\[10\] , \B\[9\] ,
         \B\[8\] , \B\[7\] , \B\[6\] , \B\[5\] , \B\[4\] , \B\[3\] , \B\[2\] ,
         \B\[1\] , \B\[0\] , CI;
  output \SUM\[40\] , \SUM\[39\] , \SUM\[38\] , \SUM\[37\] , \SUM\[36\] ,
         \SUM\[35\] , \SUM\[34\] , \SUM\[33\] , \SUM\[32\] , \SUM\[31\] ,
         \SUM\[30\] , \SUM\[29\] , \SUM\[28\] , \SUM\[27\] , \SUM\[26\] ,
         \SUM\[25\] , \SUM\[24\] , \SUM\[23\] , \SUM\[22\] , \SUM\[21\] ,
         \SUM\[20\] , \SUM\[19\] , \SUM\[18\] , \SUM\[17\] , \SUM\[16\] ,
         \SUM\[15\] , \SUM\[14\] , \SUM\[13\] , \SUM\[12\] , \SUM\[11\] ,
         \SUM\[10\] , \SUM\[9\] , \SUM\[8\] , \SUM\[7\] , \SUM\[6\] ,
         \SUM\[5\] , \SUM\[4\] , \SUM\[3\] , \SUM\[2\] , \SUM\[1\] ,
         \SUM\[0\] , CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72,
         n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86,
         n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100,
         n101, n102, n103, n104, n105, n106, n107, n108, n109, n110, n111,
         n112, n113, n114, n115, n116, n117, n118, n119, n120, n121, n122,
         n123, n124, n125, n126, n127, n128, n129, n130, n131, n132, n133,
         n134, n135, n136, n137, n138, n139, n140, n141, n142, n143, n144,
         n145, n146, n147, n148, n149, n150, n151, n152, n153, n154, n155,
         n156, n157, n158, n159, n160, n161, n162, n163, n164, n165, n166,
         n167, n168, n169, n170, n171, n172, n173;

  NAND4xp25_ASAP7_75t_R U2 ( .A(n107), .B(n112), .C(n113), .D(n114), .Y(n61)
         );
  NOR2xp33_ASAP7_75t_R U3 ( .A(n161), .B(n162), .Y(n148) );
  NAND4xp25_ASAP7_75t_R U4 ( .A(n136), .B(n131), .C(n137), .D(n138), .Y(n62)
         );
  NOR2xp33_ASAP7_75t_R U5 ( .A(n134), .B(n135), .Y(n129) );
  O2A1O1Ixp33_ASAP7_75t_R U6 ( .A1(n108), .A2(n109), .B(n110), .C(n111), .Y(
        n105) );
  NOR3xp33_ASAP7_75t_R U7 ( .A(n61), .B(n55), .C(n62), .Y(n52) );
  NOR2xp33_ASAP7_75t_R U8 ( .A(n12), .B(n57), .Y(n56) );
  INVx1_ASAP7_75t_R U9 ( .A(n51), .Y(n86) );
  NOR2xp33_ASAP7_75t_R U10 ( .A(n17), .B(n4), .Y(n15) );
  XNOR2xp5_ASAP7_75t_R U11 ( .A(n115), .B(n116), .Y(\SUM\[23\] ) );
  OAI21xp5_ASAP7_75t_R U12 ( .A1(n111), .A2(n5), .B(n117), .Y(n115) );
  NOR2xp33_ASAP7_75t_R U13 ( .A(n42), .B(n46), .Y(n38) );
  NOR2xp33_ASAP7_75t_R U14 ( .A(n42), .B(n43), .Y(n41) );
  OAI21xp5_ASAP7_75t_R U15 ( .A1(n86), .A2(n62), .B(n126), .Y(n124) );
  O2A1O1Ixp33_ASAP7_75t_R U16 ( .A1(n79), .A2(n80), .B(n81), .C(n82), .Y(n76)
         );
  AOI21xp5_ASAP7_75t_R U17 ( .A1(n58), .A2(n59), .B(n60), .Y(n88) );
  NAND4xp25_ASAP7_75t_R U18 ( .A(n78), .B(n83), .C(n84), .D(n85), .Y(n55) );
  NOR3xp33_ASAP7_75t_R U19 ( .A(n163), .B(n156), .C(n164), .Y(n162) );
  NOR2xp33_ASAP7_75t_R U20 ( .A(n10), .B(n156), .Y(n157) );
  AOI21xp5_ASAP7_75t_R U21 ( .A1(n58), .A2(n59), .B(n60), .Y(n54) );
  OAI31xp33_ASAP7_75t_R U22 ( .A1(n8), .A2(n69), .A3(n55), .B(n70), .Y(n67) );
  AOI21xp5_ASAP7_75t_R U23 ( .A1(n57), .A2(n48), .B(n12), .Y(n70) );
  NOR2xp33_ASAP7_75t_R U24 ( .A(\A\[16\] ), .B(\B\[16\] ), .Y(n139) );
  OAI21xp5_ASAP7_75t_R U25 ( .A1(n122), .A2(n123), .B(n109), .Y(n120) );
  OAI21xp5_ASAP7_75t_R U26 ( .A1(n86), .A2(n101), .B(n102), .Y(n99) );
  AOI21xp5_ASAP7_75t_R U27 ( .A1(n58), .A2(n59), .B(n60), .Y(n102) );
  AOI21xp5_ASAP7_75t_R U28 ( .A1(n67), .A2(n49), .B(n39), .Y(n65) );
  OAI31xp33_ASAP7_75t_R U29 ( .A1(n34), .A2(n35), .A3(n36), .B(n37), .Y(n27)
         );
  AOI211xp5_ASAP7_75t_R U30 ( .A1(n38), .A2(n39), .B(n40), .C(n41), .Y(n37) );
  NOR2xp33_ASAP7_75t_R U31 ( .A(n25), .B(n1), .Y(n24) );
  NOR2xp33_ASAP7_75t_R U32 ( .A(n77), .B(n82), .Y(n93) );
  NOR2xp33_ASAP7_75t_R U33 ( .A(n106), .B(n111), .Y(n118) );
  NOR2xp33_ASAP7_75t_R U34 ( .A(n9), .B(n135), .Y(n143) );
  AOI21xp5_ASAP7_75t_R U35 ( .A1(n142), .A2(n137), .B(n9), .Y(n141) );
  XNOR2xp5_ASAP7_75t_R U36 ( .A(n90), .B(n91), .Y(\SUM\[27\] ) );
  OAI21xp5_ASAP7_75t_R U37 ( .A1(n82), .A2(n6), .B(n92), .Y(n90) );
  NOR2xp33_ASAP7_75t_R U38 ( .A(n12), .B(n69), .Y(n72) );
  NOR2xp33_ASAP7_75t_R U39 ( .A(n21), .B(n3), .Y(n20) );
  OR2x2_ASAP7_75t_R U40 ( .A(n26), .B(n2), .Y(n1) );
  AOI21xp5_ASAP7_75t_R U41 ( .A1(n27), .A2(n28), .B(n29), .Y(n2) );
  OR2x2_ASAP7_75t_R U42 ( .A(n22), .B(n23), .Y(n3) );
  OR2x2_ASAP7_75t_R U43 ( .A(n18), .B(n19), .Y(n4) );
  OA21x2_ASAP7_75t_R U44 ( .A1(n108), .A2(n119), .B(n110), .Y(n5) );
  OA21x2_ASAP7_75t_R U45 ( .A1(n79), .A2(n94), .B(n81), .Y(n6) );
  OA21x2_ASAP7_75t_R U46 ( .A1(n150), .A2(n151), .B(n152), .Y(n7) );
  OA21x2_ASAP7_75t_R U47 ( .A1(n86), .A2(n87), .B(n88), .Y(n8) );
  AND2x2_ASAP7_75t_R U48 ( .A(\B\[18\] ), .B(\A\[18\] ), .Y(n9) );
  AND2x2_ASAP7_75t_R U49 ( .A(n164), .B(n163), .Y(n10) );
  AND2x2_ASAP7_75t_R U50 ( .A(n168), .B(n169), .Y(n11) );
  AND2x2_ASAP7_75t_R U51 ( .A(\B\[28\] ), .B(\A\[28\] ), .Y(n12) );
  OAI21xp5_ASAP7_75t_R U52 ( .A1(n159), .A2(n11), .B(n160), .Y(n158) );
  NAND3xp33_ASAP7_75t_R U53 ( .A(n149), .B(n7), .C(n148), .Y(n51) );
  NAND2xp5_ASAP7_75t_R U54 ( .A(n15), .B(\A\[39\] ), .Y(n14) );
  NAND2xp5_ASAP7_75t_R U55 ( .A(n157), .B(n158), .Y(n149) );
  INVx1_ASAP7_75t_R U56 ( .A(\A\[33\] ), .Y(n26) );
  INVx1_ASAP7_75t_R U57 ( .A(\A\[34\] ), .Y(n25) );
  INVx1_ASAP7_75t_R U58 ( .A(\A\[35\] ), .Y(n22) );
  INVx1_ASAP7_75t_R U59 ( .A(\A\[36\] ), .Y(n21) );
  INVx1_ASAP7_75t_R U60 ( .A(\A\[37\] ), .Y(n18) );
  INVx1_ASAP7_75t_R U61 ( .A(\A\[38\] ), .Y(n17) );
  INVx1_ASAP7_75t_R U62 ( .A(\A\[39\] ), .Y(n16) );
  INVx1_ASAP7_75t_R U63 ( .A(\A\[40\] ), .Y(n13) );
  AOI21xp33_ASAP7_75t_R U64 ( .A1(n51), .A2(n52), .B(n53), .Y(n34) );
  NAND4xp25_ASAP7_75t_R U65 ( .A(\B\[13\] ), .B(\A\[13\] ), .C(n153), .D(n154), 
        .Y(n152) );
  INVxp67_ASAP7_75t_R U66 ( .A(\A\[13\] ), .Y(n173) );
  XOR2xp5_ASAP7_75t_R U67 ( .A(n13), .B(n14), .Y(\SUM\[40\] ) );
  XNOR2xp5_ASAP7_75t_R U68 ( .A(n15), .B(n16), .Y(\SUM\[39\] ) );
  XOR2xp5_ASAP7_75t_R U69 ( .A(n17), .B(n4), .Y(\SUM\[38\] ) );
  INVx1_ASAP7_75t_R U70 ( .A(n20), .Y(n19) );
  XNOR2xp5_ASAP7_75t_R U71 ( .A(n20), .B(n18), .Y(\SUM\[37\] ) );
  XOR2xp5_ASAP7_75t_R U72 ( .A(n21), .B(n3), .Y(\SUM\[36\] ) );
  INVx1_ASAP7_75t_R U73 ( .A(n24), .Y(n23) );
  XNOR2xp5_ASAP7_75t_R U74 ( .A(n24), .B(n22), .Y(\SUM\[35\] ) );
  XNOR2xp5_ASAP7_75t_R U75 ( .A(n1), .B(\A\[34\] ), .Y(\SUM\[34\] ) );
  XOR2xp5_ASAP7_75t_R U76 ( .A(n26), .B(n2), .Y(\SUM\[33\] ) );
  INVx1_ASAP7_75t_R U77 ( .A(n30), .Y(n29) );
  XNOR2xp5_ASAP7_75t_R U78 ( .A(n27), .B(n31), .Y(\SUM\[32\] ) );
  NAND2xp5_ASAP7_75t_R U79 ( .A(n28), .B(n30), .Y(n31) );
  NAND2xp5_ASAP7_75t_R U80 ( .A(\B\[32\] ), .B(\A\[32\] ), .Y(n30) );
  NAND2xp5_ASAP7_75t_R U81 ( .A(n32), .B(n33), .Y(n28) );
  INVx1_ASAP7_75t_R U82 ( .A(\A\[32\] ), .Y(n33) );
  INVx1_ASAP7_75t_R U83 ( .A(\B\[32\] ), .Y(n32) );
  INVx1_ASAP7_75t_R U84 ( .A(n44), .Y(n40) );
  INVx1_ASAP7_75t_R U85 ( .A(n45), .Y(n39) );
  INVx1_ASAP7_75t_R U86 ( .A(n47), .Y(n42) );
  NAND2xp5_ASAP7_75t_R U87 ( .A(n48), .B(n49), .Y(n36) );
  NAND2xp5_ASAP7_75t_R U88 ( .A(n50), .B(n47), .Y(n35) );
  OAI21xp5_ASAP7_75t_R U89 ( .A1(n54), .A2(n55), .B(n56), .Y(n53) );
  XNOR2xp5_ASAP7_75t_R U90 ( .A(n63), .B(n64), .Y(\SUM\[31\] ) );
  NAND2xp5_ASAP7_75t_R U91 ( .A(n47), .B(n44), .Y(n64) );
  NAND2xp5_ASAP7_75t_R U92 ( .A(\B\[31\] ), .B(\A\[31\] ), .Y(n44) );
  OR2x2_ASAP7_75t_R U93 ( .A(\A\[31\] ), .B(\B\[31\] ), .Y(n47) );
  OAI21xp5_ASAP7_75t_R U94 ( .A1(n46), .A2(n65), .B(n43), .Y(n63) );
  INVx1_ASAP7_75t_R U95 ( .A(n50), .Y(n46) );
  XOR2xp5_ASAP7_75t_R U96 ( .A(n66), .B(n65), .Y(\SUM\[30\] ) );
  NAND2xp5_ASAP7_75t_R U97 ( .A(n50), .B(n43), .Y(n66) );
  NAND2xp5_ASAP7_75t_R U98 ( .A(\B\[30\] ), .B(\A\[30\] ), .Y(n43) );
  OR2x2_ASAP7_75t_R U99 ( .A(\A\[30\] ), .B(\B\[30\] ), .Y(n50) );
  XNOR2xp5_ASAP7_75t_R U100 ( .A(n67), .B(n68), .Y(\SUM\[29\] ) );
  NAND2xp5_ASAP7_75t_R U101 ( .A(n49), .B(n45), .Y(n68) );
  NAND2xp5_ASAP7_75t_R U102 ( .A(\B\[29\] ), .B(\A\[29\] ), .Y(n45) );
  OR2x2_ASAP7_75t_R U103 ( .A(\A\[29\] ), .B(\B\[29\] ), .Y(n49) );
  XOR2xp5_ASAP7_75t_R U104 ( .A(n71), .B(n72), .Y(\SUM\[28\] ) );
  INVx1_ASAP7_75t_R U105 ( .A(n48), .Y(n69) );
  OR2x2_ASAP7_75t_R U106 ( .A(\A\[28\] ), .B(\B\[28\] ), .Y(n48) );
  OAI21xp5_ASAP7_75t_R U107 ( .A1(n8), .A2(n55), .B(n73), .Y(n71) );
  INVx1_ASAP7_75t_R U108 ( .A(n57), .Y(n73) );
  NAND2xp5_ASAP7_75t_R U109 ( .A(n74), .B(n75), .Y(n57) );
  OAI21xp5_ASAP7_75t_R U110 ( .A1(n76), .A2(n77), .B(n78), .Y(n75) );
  NAND2xp5_ASAP7_75t_R U111 ( .A(n58), .B(n89), .Y(n87) );
  NAND2xp5_ASAP7_75t_R U112 ( .A(n74), .B(n78), .Y(n91) );
  OR2x2_ASAP7_75t_R U113 ( .A(\A\[27\] ), .B(\B\[27\] ), .Y(n78) );
  NAND2xp5_ASAP7_75t_R U114 ( .A(\B\[27\] ), .B(\A\[27\] ), .Y(n74) );
  XNOR2xp5_ASAP7_75t_R U115 ( .A(n6), .B(n93), .Y(\SUM\[26\] ) );
  INVx1_ASAP7_75t_R U116 ( .A(n83), .Y(n82) );
  OR2x2_ASAP7_75t_R U117 ( .A(\A\[26\] ), .B(\B\[26\] ), .Y(n83) );
  INVx1_ASAP7_75t_R U118 ( .A(n92), .Y(n77) );
  NAND2xp5_ASAP7_75t_R U119 ( .A(\B\[26\] ), .B(\A\[26\] ), .Y(n92) );
  INVx1_ASAP7_75t_R U120 ( .A(n95), .Y(n94) );
  INVx1_ASAP7_75t_R U121 ( .A(n84), .Y(n79) );
  XNOR2xp5_ASAP7_75t_R U122 ( .A(n96), .B(n95), .Y(\SUM\[25\] ) );
  OAI21xp5_ASAP7_75t_R U123 ( .A1(n97), .A2(n98), .B(n80), .Y(n95) );
  INVx1_ASAP7_75t_R U124 ( .A(n99), .Y(n98) );
  INVx1_ASAP7_75t_R U125 ( .A(n85), .Y(n97) );
  NAND2xp5_ASAP7_75t_R U126 ( .A(n81), .B(n84), .Y(n96) );
  OR2x2_ASAP7_75t_R U127 ( .A(\A\[25\] ), .B(\B\[25\] ), .Y(n84) );
  NAND2xp5_ASAP7_75t_R U128 ( .A(\B\[25\] ), .B(\A\[25\] ), .Y(n81) );
  XNOR2xp5_ASAP7_75t_R U129 ( .A(n99), .B(n100), .Y(\SUM\[24\] ) );
  NAND2xp5_ASAP7_75t_R U130 ( .A(n80), .B(n85), .Y(n100) );
  OR2x2_ASAP7_75t_R U131 ( .A(\A\[24\] ), .B(\B\[24\] ), .Y(n85) );
  NAND2xp5_ASAP7_75t_R U132 ( .A(\B\[24\] ), .B(\A\[24\] ), .Y(n80) );
  NAND2xp5_ASAP7_75t_R U133 ( .A(n103), .B(n104), .Y(n60) );
  OAI21xp5_ASAP7_75t_R U134 ( .A1(n105), .A2(n106), .B(n107), .Y(n104) );
  NAND2xp5_ASAP7_75t_R U135 ( .A(n58), .B(n89), .Y(n101) );
  INVx1_ASAP7_75t_R U136 ( .A(n62), .Y(n89) );
  INVx1_ASAP7_75t_R U137 ( .A(n61), .Y(n58) );
  NAND2xp5_ASAP7_75t_R U138 ( .A(n103), .B(n107), .Y(n116) );
  OR2x2_ASAP7_75t_R U139 ( .A(\A\[23\] ), .B(\B\[23\] ), .Y(n107) );
  NAND2xp5_ASAP7_75t_R U140 ( .A(\B\[23\] ), .B(\A\[23\] ), .Y(n103) );
  XNOR2xp5_ASAP7_75t_R U141 ( .A(n5), .B(n118), .Y(\SUM\[22\] ) );
  INVx1_ASAP7_75t_R U142 ( .A(n112), .Y(n111) );
  OR2x2_ASAP7_75t_R U143 ( .A(\A\[22\] ), .B(\B\[22\] ), .Y(n112) );
  INVx1_ASAP7_75t_R U144 ( .A(n117), .Y(n106) );
  NAND2xp5_ASAP7_75t_R U145 ( .A(\B\[22\] ), .B(\A\[22\] ), .Y(n117) );
  INVx1_ASAP7_75t_R U146 ( .A(n120), .Y(n119) );
  INVx1_ASAP7_75t_R U147 ( .A(n113), .Y(n108) );
  XNOR2xp5_ASAP7_75t_R U148 ( .A(n121), .B(n120), .Y(\SUM\[21\] ) );
  INVx1_ASAP7_75t_R U149 ( .A(n124), .Y(n123) );
  INVx1_ASAP7_75t_R U150 ( .A(n114), .Y(n122) );
  NAND2xp5_ASAP7_75t_R U151 ( .A(n110), .B(n113), .Y(n121) );
  OR2x2_ASAP7_75t_R U152 ( .A(\A\[21\] ), .B(\B\[21\] ), .Y(n113) );
  NAND2xp5_ASAP7_75t_R U153 ( .A(\B\[21\] ), .B(\A\[21\] ), .Y(n110) );
  XNOR2xp5_ASAP7_75t_R U154 ( .A(n124), .B(n125), .Y(\SUM\[20\] ) );
  NAND2xp5_ASAP7_75t_R U155 ( .A(n109), .B(n114), .Y(n125) );
  OR2x2_ASAP7_75t_R U156 ( .A(\A\[20\] ), .B(\B\[20\] ), .Y(n114) );
  NAND2xp5_ASAP7_75t_R U157 ( .A(\B\[20\] ), .B(\A\[20\] ), .Y(n109) );
  INVx1_ASAP7_75t_R U158 ( .A(n59), .Y(n126) );
  NAND2xp5_ASAP7_75t_R U159 ( .A(n127), .B(n128), .Y(n59) );
  A2O1A1Ixp33_ASAP7_75t_R U160 ( .A1(n129), .A2(n130), .B(n9), .C(n131), .Y(
        n128) );
  NAND2xp5_ASAP7_75t_R U161 ( .A(n132), .B(n133), .Y(n130) );
  NAND2xp5_ASAP7_75t_R U162 ( .A(\B\[16\] ), .B(\A\[16\] ), .Y(n133) );
  INVx1_ASAP7_75t_R U163 ( .A(n139), .Y(n136) );
  XOR2xp5_ASAP7_75t_R U164 ( .A(n140), .B(n141), .Y(\SUM\[19\] ) );
  NAND2xp5_ASAP7_75t_R U165 ( .A(n127), .B(n131), .Y(n140) );
  OR2x2_ASAP7_75t_R U166 ( .A(\A\[19\] ), .B(\B\[19\] ), .Y(n131) );
  NAND2xp5_ASAP7_75t_R U167 ( .A(\B\[19\] ), .B(\A\[19\] ), .Y(n127) );
  XOR2xp5_ASAP7_75t_R U168 ( .A(n142), .B(n143), .Y(\SUM\[18\] ) );
  INVx1_ASAP7_75t_R U169 ( .A(n137), .Y(n135) );
  OR2x2_ASAP7_75t_R U170 ( .A(\A\[18\] ), .B(\B\[18\] ), .Y(n137) );
  OAI21xp5_ASAP7_75t_R U171 ( .A1(n134), .A2(n144), .B(n132), .Y(n142) );
  INVx1_ASAP7_75t_R U172 ( .A(n145), .Y(n144) );
  INVx1_ASAP7_75t_R U173 ( .A(n138), .Y(n134) );
  XNOR2xp5_ASAP7_75t_R U174 ( .A(n145), .B(n146), .Y(\SUM\[17\] ) );
  NAND2xp5_ASAP7_75t_R U175 ( .A(n132), .B(n138), .Y(n146) );
  OR2x2_ASAP7_75t_R U176 ( .A(\A\[17\] ), .B(\B\[17\] ), .Y(n138) );
  NAND2xp5_ASAP7_75t_R U177 ( .A(\B\[17\] ), .B(\A\[17\] ), .Y(n132) );
  OAI21xp5_ASAP7_75t_R U178 ( .A1(n86), .A2(n139), .B(n147), .Y(n145) );
  NAND2xp5_ASAP7_75t_R U179 ( .A(\B\[16\] ), .B(\A\[16\] ), .Y(n147) );
  NAND2xp5_ASAP7_75t_R U180 ( .A(n155), .B(n153), .Y(n151) );
  NAND3xp33_ASAP7_75t_R U181 ( .A(\A\[12\] ), .B(\B\[12\] ), .C(n154), .Y(n150) );
  NAND2xp5_ASAP7_75t_R U182 ( .A(\B\[10\] ), .B(\A\[10\] ), .Y(n160) );
  NAND2xp5_ASAP7_75t_R U183 ( .A(\B\[9\] ), .B(\A\[9\] ), .Y(n159) );
  OAI21xp5_ASAP7_75t_R U184 ( .A1(n165), .A2(n166), .B(n167), .Y(n161) );
  NAND2xp5_ASAP7_75t_R U185 ( .A(\B\[15\] ), .B(\A\[15\] ), .Y(n167) );
  INVx1_ASAP7_75t_R U186 ( .A(n154), .Y(n166) );
  NAND2xp5_ASAP7_75t_R U187 ( .A(\A\[14\] ), .B(\B\[14\] ), .Y(n165) );
  INVx1_ASAP7_75t_R U188 ( .A(\A\[10\] ), .Y(n169) );
  INVx1_ASAP7_75t_R U189 ( .A(\B\[10\] ), .Y(n168) );
  INVx1_ASAP7_75t_R U190 ( .A(\A\[11\] ), .Y(n163) );
  INVx1_ASAP7_75t_R U191 ( .A(\B\[11\] ), .Y(n164) );
  OR2x2_ASAP7_75t_R U192 ( .A(n170), .B(n171), .Y(n156) );
  OAI21xp5_ASAP7_75t_R U193 ( .A1(\A\[12\] ), .A2(\B\[12\] ), .B(n155), .Y(
        n171) );
  NAND2xp5_ASAP7_75t_R U194 ( .A(n172), .B(n173), .Y(n155) );
  INVx1_ASAP7_75t_R U195 ( .A(\B\[13\] ), .Y(n172) );
  NAND2xp5_ASAP7_75t_R U196 ( .A(n153), .B(n154), .Y(n170) );
  OR2x2_ASAP7_75t_R U197 ( .A(\A\[15\] ), .B(\B\[15\] ), .Y(n154) );
  OR2x2_ASAP7_75t_R U198 ( .A(\A\[14\] ), .B(\B\[14\] ), .Y(n153) );
endmodule


module fp32_exp_DW01_add_44 ( .A({\A\[31\] , \A\[30\] , \A\[29\] , \A\[28\] , 
        \A\[27\] , \A\[26\] , \A\[25\] , \A\[24\] , \A\[23\] , \A\[22\] , 
        \A\[21\] , \A\[20\] , \A\[19\] , \A\[18\] , \A\[17\] , \A\[16\] , 
        \A\[15\] , \A\[14\] , \A\[13\] , \A\[12\] , \A\[11\] , \A\[10\] , 
        \A\[9\] , \A\[8\] , \A\[7\] , \A\[6\] , \A\[5\] , \A\[4\] , \A\[3\] , 
        \A\[2\] , \A\[1\] , \A\[0\] }), .B({\B\[31\] , \B\[30\] , \B\[29\] , 
        \B\[28\] , \B\[27\] , \B\[26\] , \B\[25\] , \B\[24\] , \B\[23\] , 
        \B\[22\] , \B\[21\] , \B\[20\] , \B\[19\] , \B\[18\] , \B\[17\] , 
        \B\[16\] , \B\[15\] , \B\[14\] , \B\[13\] , \B\[12\] , \B\[11\] , 
        \B\[10\] , \B\[9\] , \B\[8\] , \B\[7\] , \B\[6\] , \B\[5\] , \B\[4\] , 
        \B\[3\] , \B\[2\] , \B\[1\] , \B\[0\] }), CI, .SUM({\SUM\[31\] , 
        \SUM\[30\] , \SUM\[29\] , \SUM\[28\] , \SUM\[27\] , \SUM\[26\] , 
        \SUM\[25\] , \SUM\[24\] , \SUM\[23\] , \SUM\[22\] , \SUM\[21\] , 
        \SUM\[20\] , \SUM\[19\] , \SUM\[18\] , \SUM\[17\] , \SUM\[16\] , 
        \SUM\[15\] , \SUM\[14\] , \SUM\[13\] , \SUM\[12\] , \SUM\[11\] , 
        \SUM\[10\] , \SUM\[9\] , \SUM\[8\] , \SUM\[7\] , \SUM\[6\] , 
        \SUM\[5\] , \SUM\[4\] , \SUM\[3\] , \SUM\[2\] , \SUM\[1\] , \SUM\[0\] 
        }), CO );
  input \A\[31\] , \A\[30\] , \A\[29\] , \A\[28\] , \A\[27\] , \A\[26\] ,
         \A\[25\] , \A\[24\] , \A\[23\] , \A\[22\] , \A\[21\] , \A\[20\] ,
         \A\[19\] , \A\[18\] , \A\[17\] , \A\[16\] , \A\[15\] , \A\[14\] ,
         \A\[13\] , \A\[12\] , \A\[11\] , \A\[10\] , \A\[9\] , \A\[8\] ,
         \A\[7\] , \A\[6\] , \A\[5\] , \A\[4\] , \A\[3\] , \A\[2\] , \A\[1\] ,
         \A\[0\] , \B\[31\] , \B\[30\] , \B\[29\] , \B\[28\] , \B\[27\] ,
         \B\[26\] , \B\[25\] , \B\[24\] , \B\[23\] , \B\[22\] , \B\[21\] ,
         \B\[20\] , \B\[19\] , \B\[18\] , \B\[17\] , \B\[16\] , \B\[15\] ,
         \B\[14\] , \B\[13\] , \B\[12\] , \B\[11\] , \B\[10\] , \B\[9\] ,
         \B\[8\] , \B\[7\] , \B\[6\] , \B\[5\] , \B\[4\] , \B\[3\] , \B\[2\] ,
         \B\[1\] , \B\[0\] , CI;
  output \SUM\[31\] , \SUM\[30\] , \SUM\[29\] , \SUM\[28\] , \SUM\[27\] ,
         \SUM\[26\] , \SUM\[25\] , \SUM\[24\] , \SUM\[23\] , \SUM\[22\] ,
         \SUM\[21\] , \SUM\[20\] , \SUM\[19\] , \SUM\[18\] , \SUM\[17\] ,
         \SUM\[16\] , \SUM\[15\] , \SUM\[14\] , \SUM\[13\] , \SUM\[12\] ,
         \SUM\[11\] , \SUM\[10\] , \SUM\[9\] , \SUM\[8\] , \SUM\[7\] ,
         \SUM\[6\] , \SUM\[5\] , \SUM\[4\] , \SUM\[3\] , \SUM\[2\] ,
         \SUM\[1\] , \SUM\[0\] , CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72,
         n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86,
         n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100,
         n101, n102, n103, n104, n105, n106, n107, n108, n109, n110, n111,
         n112, n113, n114, n115, n116, n117, n118, n119, n120, n121, n122,
         n123, n124, n125, n126, n127, n128, n129, n130, n131, n132, n133,
         n134, n135, n136, n137, n138, n139, n140, n141, n142, n143, n144,
         n145, n146, n147, n148, n149, n150, n151, n152, n153, n154, n155,
         n156, n157, n158, n159, n160, n161, n162, n163, n164, n165, n166,
         n167, n168, n169, n170, n171, n172, n173, n174, n175, n176, n177,
         n178, n179, n180, n181, n182, n183, n184;

  AOI21xp5_ASAP7_75t_R U2 ( .A1(n164), .A2(n165), .B(n166), .Y(n163) );
  NAND4xp25_ASAP7_75t_R U3 ( .A(n165), .B(n168), .C(n169), .D(n172), .Y(n132)
         );
  AOI21xp5_ASAP7_75t_R U4 ( .A1(n182), .A2(n22), .B(n183), .Y(n181) );
  OAI21xp5_ASAP7_75t_R U5 ( .A1(n120), .A2(n121), .B(n122), .Y(n113) );
  NOR2xp33_ASAP7_75t_R U6 ( .A(n39), .B(n40), .Y(n36) );
  OAI21xp5_ASAP7_75t_R U7 ( .A1(n63), .A2(n1), .B(n64), .Y(n54) );
  NOR3xp33_ASAP7_75t_R U8 ( .A(n128), .B(n129), .C(n130), .Y(n121) );
  NOR2xp33_ASAP7_75t_R U9 ( .A(n164), .B(n175), .Y(n177) );
  NOR2xp33_ASAP7_75t_R U10 ( .A(n148), .B(n133), .Y(n159) );
  NOR2xp33_ASAP7_75t_R U11 ( .A(n15), .B(n16), .Y(n14) );
  NOR2xp33_ASAP7_75t_R U12 ( .A(n18), .B(n19), .Y(n17) );
  NOR2xp33_ASAP7_75t_R U13 ( .A(n33), .B(n13), .Y(\SUM\[4\] ) );
  OA21x2_ASAP7_75t_R U14 ( .A1(n67), .A2(n4), .B(n68), .Y(n1) );
  OA21x2_ASAP7_75t_R U15 ( .A1(n12), .A2(n16), .B(n171), .Y(n2) );
  OA21x2_ASAP7_75t_R U16 ( .A1(n28), .A2(n32), .B(n29), .Y(n3) );
  OA21x2_ASAP7_75t_R U17 ( .A1(n73), .A2(n74), .B(n75), .Y(n4) );
  AND2x2_ASAP7_75t_R U18 ( .A(\A\[29\] ), .B(n36), .Y(n5) );
  AOI21xp5_ASAP7_75t_R U19 ( .A1(n87), .A2(n88), .B(n89), .Y(n6) );
  AOI21xp5_ASAP7_75t_R U20 ( .A1(n54), .A2(n55), .B(n56), .Y(n7) );
  AND2x2_ASAP7_75t_R U21 ( .A(\A\[30\] ), .B(n5), .Y(n8) );
  AND3x1_ASAP7_75t_R U22 ( .A(n149), .B(n140), .C(n150), .Y(n9) );
  OA21x2_ASAP7_75t_R U23 ( .A1(n178), .A2(n132), .B(n160), .Y(n10) );
  OA21x2_ASAP7_75t_R U24 ( .A1(n133), .A2(n10), .B(n158), .Y(n11) );
  OA21x2_ASAP7_75t_R U25 ( .A1(n178), .A2(n19), .B(n170), .Y(n12) );
  NOR2xp33_ASAP7_75t_R U26 ( .A(\A\[4\] ), .B(\B\[4\] ), .Y(n13) );
  INVx1_ASAP7_75t_R U27 ( .A(\A\[29\] ), .Y(n37) );
  INVx1_ASAP7_75t_R U28 ( .A(\A\[28\] ), .Y(n40) );
  INVx1_ASAP7_75t_R U29 ( .A(\A\[30\] ), .Y(n35) );
  INVx1_ASAP7_75t_R U30 ( .A(\A\[31\] ), .Y(n34) );
  NAND4xp25_ASAP7_75t_R U31 ( .A(n137), .B(n138), .C(n139), .D(n9), .Y(n136)
         );
  INVxp67_ASAP7_75t_R U32 ( .A(n139), .Y(n178) );
  XNOR2xp5_ASAP7_75t_R U33 ( .A(n12), .B(n14), .Y(\SUM\[9\] ) );
  XNOR2xp5_ASAP7_75t_R U34 ( .A(n178), .B(n17), .Y(\SUM\[8\] ) );
  XNOR2xp5_ASAP7_75t_R U35 ( .A(n20), .B(n21), .Y(\SUM\[7\] ) );
  NAND2xp5_ASAP7_75t_R U36 ( .A(n22), .B(n23), .Y(n21) );
  OAI21xp5_ASAP7_75t_R U37 ( .A1(n24), .A2(n3), .B(n25), .Y(n20) );
  INVx1_ASAP7_75t_R U38 ( .A(n26), .Y(n24) );
  XOR2xp5_ASAP7_75t_R U39 ( .A(n27), .B(n3), .Y(\SUM\[6\] ) );
  INVx1_ASAP7_75t_R U40 ( .A(n30), .Y(n28) );
  NAND2xp5_ASAP7_75t_R U41 ( .A(n26), .B(n25), .Y(n27) );
  XNOR2xp5_ASAP7_75t_R U42 ( .A(n33), .B(n31), .Y(\SUM\[5\] ) );
  NAND2xp5_ASAP7_75t_R U43 ( .A(n30), .B(n29), .Y(n31) );
  XNOR2xp5_ASAP7_75t_R U44 ( .A(n34), .B(n8), .Y(\SUM\[31\] ) );
  XNOR2xp5_ASAP7_75t_R U45 ( .A(n5), .B(n35), .Y(\SUM\[30\] ) );
  XOR2xp5_ASAP7_75t_R U46 ( .A(n37), .B(n38), .Y(\SUM\[29\] ) );
  INVx1_ASAP7_75t_R U47 ( .A(n36), .Y(n38) );
  INVx1_ASAP7_75t_R U48 ( .A(n41), .Y(n39) );
  XNOR2xp5_ASAP7_75t_R U49 ( .A(n41), .B(n40), .Y(\SUM\[28\] ) );
  OAI21xp5_ASAP7_75t_R U50 ( .A1(n42), .A2(n43), .B(n44), .Y(n41) );
  INVx1_ASAP7_75t_R U51 ( .A(n45), .Y(n43) );
  INVx1_ASAP7_75t_R U52 ( .A(n46), .Y(n42) );
  XNOR2xp5_ASAP7_75t_R U53 ( .A(n45), .B(n47), .Y(\SUM\[27\] ) );
  NAND2xp5_ASAP7_75t_R U54 ( .A(n44), .B(n46), .Y(n47) );
  NAND2xp5_ASAP7_75t_R U55 ( .A(n48), .B(n49), .Y(n46) );
  INVx1_ASAP7_75t_R U56 ( .A(\A\[27\] ), .Y(n49) );
  INVx1_ASAP7_75t_R U57 ( .A(\B\[27\] ), .Y(n48) );
  NAND2xp5_ASAP7_75t_R U58 ( .A(\B\[27\] ), .B(\A\[27\] ), .Y(n44) );
  OAI21xp5_ASAP7_75t_R U59 ( .A1(n50), .A2(n7), .B(n51), .Y(n45) );
  INVx1_ASAP7_75t_R U60 ( .A(n52), .Y(n50) );
  XOR2xp5_ASAP7_75t_R U61 ( .A(n53), .B(n7), .Y(\SUM\[26\] ) );
  INVx1_ASAP7_75t_R U62 ( .A(n57), .Y(n56) );
  NAND2xp5_ASAP7_75t_R U63 ( .A(n52), .B(n51), .Y(n53) );
  NAND2xp5_ASAP7_75t_R U64 ( .A(\B\[26\] ), .B(\A\[26\] ), .Y(n51) );
  NAND2xp5_ASAP7_75t_R U65 ( .A(n58), .B(n59), .Y(n52) );
  INVx1_ASAP7_75t_R U66 ( .A(\A\[26\] ), .Y(n59) );
  INVx1_ASAP7_75t_R U67 ( .A(\B\[26\] ), .Y(n58) );
  XNOR2xp5_ASAP7_75t_R U68 ( .A(n54), .B(n60), .Y(\SUM\[25\] ) );
  NAND2xp5_ASAP7_75t_R U69 ( .A(n55), .B(n57), .Y(n60) );
  NAND2xp5_ASAP7_75t_R U70 ( .A(\B\[25\] ), .B(\A\[25\] ), .Y(n57) );
  NAND2xp5_ASAP7_75t_R U71 ( .A(n61), .B(n62), .Y(n55) );
  INVx1_ASAP7_75t_R U72 ( .A(\A\[25\] ), .Y(n62) );
  INVx1_ASAP7_75t_R U73 ( .A(\B\[25\] ), .Y(n61) );
  INVx1_ASAP7_75t_R U74 ( .A(n65), .Y(n63) );
  XOR2xp5_ASAP7_75t_R U75 ( .A(n66), .B(n1), .Y(\SUM\[24\] ) );
  INVx1_ASAP7_75t_R U76 ( .A(n69), .Y(n67) );
  NAND2xp5_ASAP7_75t_R U77 ( .A(n65), .B(n64), .Y(n66) );
  NAND2xp5_ASAP7_75t_R U78 ( .A(\B\[24\] ), .B(\A\[24\] ), .Y(n64) );
  NAND2xp5_ASAP7_75t_R U79 ( .A(n70), .B(n71), .Y(n65) );
  INVx1_ASAP7_75t_R U80 ( .A(\A\[24\] ), .Y(n71) );
  INVx1_ASAP7_75t_R U81 ( .A(\B\[24\] ), .Y(n70) );
  XOR2xp5_ASAP7_75t_R U82 ( .A(n72), .B(n4), .Y(\SUM\[23\] ) );
  INVx1_ASAP7_75t_R U83 ( .A(n76), .Y(n74) );
  INVx1_ASAP7_75t_R U84 ( .A(n77), .Y(n73) );
  NAND2xp5_ASAP7_75t_R U85 ( .A(n69), .B(n68), .Y(n72) );
  NAND2xp5_ASAP7_75t_R U86 ( .A(\B\[23\] ), .B(\A\[23\] ), .Y(n68) );
  NAND2xp5_ASAP7_75t_R U87 ( .A(n78), .B(n79), .Y(n69) );
  INVx1_ASAP7_75t_R U88 ( .A(\A\[23\] ), .Y(n79) );
  INVx1_ASAP7_75t_R U89 ( .A(\B\[23\] ), .Y(n78) );
  XNOR2xp5_ASAP7_75t_R U90 ( .A(n76), .B(n80), .Y(\SUM\[22\] ) );
  NAND2xp5_ASAP7_75t_R U91 ( .A(n75), .B(n77), .Y(n80) );
  NAND2xp5_ASAP7_75t_R U92 ( .A(n81), .B(n82), .Y(n77) );
  INVx1_ASAP7_75t_R U93 ( .A(\A\[22\] ), .Y(n82) );
  INVx1_ASAP7_75t_R U94 ( .A(\B\[22\] ), .Y(n81) );
  NAND2xp5_ASAP7_75t_R U95 ( .A(\B\[22\] ), .B(\A\[22\] ), .Y(n75) );
  OAI21xp5_ASAP7_75t_R U96 ( .A1(n83), .A2(n6), .B(n84), .Y(n76) );
  INVx1_ASAP7_75t_R U97 ( .A(n85), .Y(n83) );
  XOR2xp5_ASAP7_75t_R U98 ( .A(n86), .B(n6), .Y(\SUM\[21\] ) );
  INVx1_ASAP7_75t_R U99 ( .A(n90), .Y(n89) );
  NAND2xp5_ASAP7_75t_R U100 ( .A(n85), .B(n84), .Y(n86) );
  NAND2xp5_ASAP7_75t_R U101 ( .A(\B\[21\] ), .B(\A\[21\] ), .Y(n84) );
  NAND2xp5_ASAP7_75t_R U102 ( .A(n91), .B(n92), .Y(n85) );
  INVx1_ASAP7_75t_R U103 ( .A(\A\[21\] ), .Y(n92) );
  INVx1_ASAP7_75t_R U104 ( .A(\B\[21\] ), .Y(n91) );
  XNOR2xp5_ASAP7_75t_R U105 ( .A(n87), .B(n93), .Y(\SUM\[20\] ) );
  NAND2xp5_ASAP7_75t_R U106 ( .A(n88), .B(n90), .Y(n93) );
  NAND2xp5_ASAP7_75t_R U107 ( .A(\B\[20\] ), .B(\A\[20\] ), .Y(n90) );
  NAND2xp5_ASAP7_75t_R U108 ( .A(n94), .B(n95), .Y(n88) );
  INVx1_ASAP7_75t_R U109 ( .A(\A\[20\] ), .Y(n95) );
  INVx1_ASAP7_75t_R U110 ( .A(\B\[20\] ), .Y(n94) );
  OAI21xp5_ASAP7_75t_R U111 ( .A1(n96), .A2(n97), .B(n98), .Y(n87) );
  INVx1_ASAP7_75t_R U112 ( .A(n99), .Y(n97) );
  INVx1_ASAP7_75t_R U113 ( .A(n100), .Y(n96) );
  XNOR2xp5_ASAP7_75t_R U114 ( .A(n99), .B(n101), .Y(\SUM\[19\] ) );
  NAND2xp5_ASAP7_75t_R U115 ( .A(n98), .B(n100), .Y(n101) );
  NAND2xp5_ASAP7_75t_R U116 ( .A(n102), .B(n103), .Y(n100) );
  INVx1_ASAP7_75t_R U117 ( .A(\A\[19\] ), .Y(n103) );
  INVx1_ASAP7_75t_R U118 ( .A(\B\[19\] ), .Y(n102) );
  NAND2xp5_ASAP7_75t_R U119 ( .A(\B\[19\] ), .B(\A\[19\] ), .Y(n98) );
  OAI21xp5_ASAP7_75t_R U120 ( .A1(n104), .A2(n105), .B(n106), .Y(n99) );
  INVx1_ASAP7_75t_R U121 ( .A(n107), .Y(n105) );
  INVx1_ASAP7_75t_R U122 ( .A(n108), .Y(n104) );
  XNOR2xp5_ASAP7_75t_R U123 ( .A(n109), .B(n107), .Y(\SUM\[18\] ) );
  OAI21xp5_ASAP7_75t_R U124 ( .A1(n110), .A2(n111), .B(n112), .Y(n107) );
  INVx1_ASAP7_75t_R U125 ( .A(n113), .Y(n111) );
  INVx1_ASAP7_75t_R U126 ( .A(n114), .Y(n110) );
  NAND2xp5_ASAP7_75t_R U127 ( .A(n106), .B(n108), .Y(n109) );
  NAND2xp5_ASAP7_75t_R U128 ( .A(n115), .B(n116), .Y(n108) );
  INVx1_ASAP7_75t_R U129 ( .A(\A\[18\] ), .Y(n116) );
  INVx1_ASAP7_75t_R U130 ( .A(\B\[18\] ), .Y(n115) );
  NAND2xp5_ASAP7_75t_R U131 ( .A(\B\[18\] ), .B(\A\[18\] ), .Y(n106) );
  XNOR2xp5_ASAP7_75t_R U132 ( .A(n113), .B(n117), .Y(\SUM\[17\] ) );
  NAND2xp5_ASAP7_75t_R U133 ( .A(n112), .B(n114), .Y(n117) );
  NAND2xp5_ASAP7_75t_R U134 ( .A(n118), .B(n119), .Y(n114) );
  INVx1_ASAP7_75t_R U135 ( .A(\A\[17\] ), .Y(n119) );
  INVx1_ASAP7_75t_R U136 ( .A(\B\[17\] ), .Y(n118) );
  NAND2xp5_ASAP7_75t_R U137 ( .A(\B\[17\] ), .B(\A\[17\] ), .Y(n112) );
  INVx1_ASAP7_75t_R U138 ( .A(n123), .Y(n120) );
  XNOR2xp5_ASAP7_75t_R U139 ( .A(n124), .B(n125), .Y(\SUM\[16\] ) );
  NAND2xp5_ASAP7_75t_R U140 ( .A(n122), .B(n123), .Y(n125) );
  NAND2xp5_ASAP7_75t_R U141 ( .A(n126), .B(n127), .Y(n123) );
  INVx1_ASAP7_75t_R U142 ( .A(\A\[16\] ), .Y(n127) );
  INVx1_ASAP7_75t_R U143 ( .A(\B\[16\] ), .Y(n126) );
  NAND2xp5_ASAP7_75t_R U144 ( .A(\B\[16\] ), .B(\A\[16\] ), .Y(n122) );
  INVx1_ASAP7_75t_R U145 ( .A(n121), .Y(n124) );
  INVx1_ASAP7_75t_R U146 ( .A(n131), .Y(n130) );
  OAI21xp5_ASAP7_75t_R U147 ( .A1(n134), .A2(n135), .B(n136), .Y(n129) );
  INVx1_ASAP7_75t_R U148 ( .A(n132), .Y(n137) );
  NAND2xp5_ASAP7_75t_R U149 ( .A(n140), .B(n141), .Y(n135) );
  INVx1_ASAP7_75t_R U150 ( .A(n142), .Y(n141) );
  OAI211xp5_ASAP7_75t_R U151 ( .A1(n143), .A2(n144), .B(n145), .C(n146), .Y(
        n128) );
  NAND3xp33_ASAP7_75t_R U152 ( .A(n138), .B(n147), .C(n9), .Y(n146) );
  NAND2xp5_ASAP7_75t_R U153 ( .A(n148), .B(n9), .Y(n145) );
  INVx1_ASAP7_75t_R U154 ( .A(n140), .Y(n143) );
  XNOR2xp5_ASAP7_75t_R U155 ( .A(n151), .B(n152), .Y(\SUM\[15\] ) );
  NAND2xp5_ASAP7_75t_R U156 ( .A(n140), .B(n131), .Y(n152) );
  NAND2xp5_ASAP7_75t_R U157 ( .A(\B\[15\] ), .B(\A\[15\] ), .Y(n131) );
  OR2x2_ASAP7_75t_R U158 ( .A(\A\[15\] ), .B(\B\[15\] ), .Y(n140) );
  OAI21xp5_ASAP7_75t_R U159 ( .A1(n134), .A2(n153), .B(n144), .Y(n151) );
  INVx1_ASAP7_75t_R U160 ( .A(n154), .Y(n153) );
  INVx1_ASAP7_75t_R U161 ( .A(n149), .Y(n134) );
  XNOR2xp5_ASAP7_75t_R U162 ( .A(n154), .B(n155), .Y(\SUM\[14\] ) );
  NAND2xp5_ASAP7_75t_R U163 ( .A(n144), .B(n149), .Y(n155) );
  OR2x2_ASAP7_75t_R U164 ( .A(\A\[14\] ), .B(\B\[14\] ), .Y(n149) );
  NAND2xp5_ASAP7_75t_R U165 ( .A(\B\[14\] ), .B(\A\[14\] ), .Y(n144) );
  OAI21xp5_ASAP7_75t_R U166 ( .A1(n156), .A2(n11), .B(n142), .Y(n154) );
  INVx1_ASAP7_75t_R U167 ( .A(n150), .Y(n156) );
  XOR2xp5_ASAP7_75t_R U168 ( .A(n157), .B(n11), .Y(\SUM\[13\] ) );
  NAND2xp5_ASAP7_75t_R U169 ( .A(n150), .B(n142), .Y(n157) );
  NAND2xp5_ASAP7_75t_R U170 ( .A(\B\[13\] ), .B(\A\[13\] ), .Y(n142) );
  OR2x2_ASAP7_75t_R U171 ( .A(\A\[13\] ), .B(\B\[13\] ), .Y(n150) );
  XNOR2xp5_ASAP7_75t_R U172 ( .A(n10), .B(n159), .Y(\SUM\[12\] ) );
  INVx1_ASAP7_75t_R U173 ( .A(n138), .Y(n133) );
  OR2x2_ASAP7_75t_R U174 ( .A(\A\[12\] ), .B(\B\[12\] ), .Y(n138) );
  INVx1_ASAP7_75t_R U175 ( .A(n158), .Y(n148) );
  NAND2xp5_ASAP7_75t_R U176 ( .A(\B\[12\] ), .B(\A\[12\] ), .Y(n158) );
  INVx1_ASAP7_75t_R U177 ( .A(n147), .Y(n160) );
  OAI21xp5_ASAP7_75t_R U178 ( .A1(n161), .A2(n162), .B(n163), .Y(n147) );
  INVx1_ASAP7_75t_R U179 ( .A(n167), .Y(n166) );
  NAND2xp5_ASAP7_75t_R U180 ( .A(n165), .B(n168), .Y(n162) );
  OAI21xp5_ASAP7_75t_R U181 ( .A1(n15), .A2(n18), .B(n169), .Y(n161) );
  INVx1_ASAP7_75t_R U182 ( .A(n170), .Y(n18) );
  INVx1_ASAP7_75t_R U183 ( .A(n171), .Y(n15) );
  XNOR2xp5_ASAP7_75t_R U184 ( .A(n173), .B(n174), .Y(\SUM\[11\] ) );
  NAND2xp5_ASAP7_75t_R U185 ( .A(n165), .B(n167), .Y(n174) );
  NAND2xp5_ASAP7_75t_R U186 ( .A(\B\[11\] ), .B(\A\[11\] ), .Y(n167) );
  OR2x2_ASAP7_75t_R U187 ( .A(\A\[11\] ), .B(\B\[11\] ), .Y(n165) );
  OAI21xp5_ASAP7_75t_R U188 ( .A1(n175), .A2(n2), .B(n176), .Y(n173) );
  XNOR2xp5_ASAP7_75t_R U189 ( .A(n2), .B(n177), .Y(\SUM\[10\] ) );
  INVx1_ASAP7_75t_R U190 ( .A(n168), .Y(n175) );
  OR2x2_ASAP7_75t_R U191 ( .A(\A\[10\] ), .B(\B\[10\] ), .Y(n168) );
  INVx1_ASAP7_75t_R U192 ( .A(n176), .Y(n164) );
  NAND2xp5_ASAP7_75t_R U193 ( .A(\B\[10\] ), .B(\A\[10\] ), .Y(n176) );
  NAND2xp5_ASAP7_75t_R U194 ( .A(\B\[9\] ), .B(\A\[9\] ), .Y(n171) );
  INVx1_ASAP7_75t_R U195 ( .A(n169), .Y(n16) );
  OR2x2_ASAP7_75t_R U196 ( .A(\A\[9\] ), .B(\B\[9\] ), .Y(n169) );
  NAND2xp5_ASAP7_75t_R U197 ( .A(\B\[8\] ), .B(\A\[8\] ), .Y(n170) );
  INVx1_ASAP7_75t_R U198 ( .A(n172), .Y(n19) );
  OR2x2_ASAP7_75t_R U199 ( .A(\A\[8\] ), .B(\B\[8\] ), .Y(n172) );
  OAI21xp5_ASAP7_75t_R U200 ( .A1(n179), .A2(n180), .B(n181), .Y(n139) );
  INVx1_ASAP7_75t_R U201 ( .A(n23), .Y(n183) );
  NAND2xp5_ASAP7_75t_R U202 ( .A(\B\[7\] ), .B(\A\[7\] ), .Y(n23) );
  INVx1_ASAP7_75t_R U203 ( .A(n25), .Y(n182) );
  NAND2xp5_ASAP7_75t_R U204 ( .A(\B\[6\] ), .B(\A\[6\] ), .Y(n25) );
  NAND2xp5_ASAP7_75t_R U205 ( .A(n22), .B(n26), .Y(n180) );
  OAI21xp5_ASAP7_75t_R U206 ( .A1(n184), .A2(n33), .B(n30), .Y(n179) );
  INVx1_ASAP7_75t_R U207 ( .A(n32), .Y(n33) );
  NAND2xp5_ASAP7_75t_R U208 ( .A(\B\[4\] ), .B(\A\[4\] ), .Y(n32) );
  INVx1_ASAP7_75t_R U209 ( .A(n29), .Y(n184) );
  NAND2xp5_ASAP7_75t_R U210 ( .A(\B\[5\] ), .B(\A\[5\] ), .Y(n29) );
  OR2x2_ASAP7_75t_R U211 ( .A(\A\[5\] ), .B(\B\[5\] ), .Y(n30) );
  OR2x2_ASAP7_75t_R U212 ( .A(\A\[6\] ), .B(\B\[6\] ), .Y(n26) );
  OR2x2_ASAP7_75t_R U213 ( .A(\A\[7\] ), .B(\B\[7\] ), .Y(n22) );
endmodule


module fp32_exp_DW01_add_J9_0 ( .A({\A\[31\] , \A\[30\] , \A\[29\] , \A\[28\] , 
        \A\[27\] , \A\[26\] , \A\[25\] , \A\[24\] , \A\[23\] , \A\[22\] , 
        \A\[21\] , \A\[20\] , \A\[19\] , \A\[18\] , \A\[17\] , \A\[16\] , 
        \A\[15\] , \A\[14\] , \A\[13\] , \A\[12\] , \A\[11\] , \A\[10\] , 
        \A\[9\] , \A\[8\] , \A\[7\] , \A\[6\] , \A\[5\] , \A\[4\] , \A\[3\] , 
        \A\[2\] , \A\[1\] , \A\[0\] }), .B({\B\[31\] , \B\[30\] , \B\[29\] , 
        \B\[28\] , \B\[27\] , \B\[26\] , \B\[25\] , \B\[24\] , \B\[23\] , 
        \B\[22\] , \B\[21\] , \B\[20\] , \B\[19\] , \B\[18\] , \B\[17\] , 
        \B\[16\] , \B\[15\] , \B\[14\] , \B\[13\] , \B\[12\] , \B\[11\] , 
        \B\[10\] , \B\[9\] , \B\[8\] , \B\[7\] , \B\[6\] , \B\[5\] , \B\[4\] , 
        \B\[3\] , \B\[2\] , \B\[1\] , \B\[0\] }), CI, .SUM({\SUM\[31\] , 
        \SUM\[30\] , \SUM\[29\] , \SUM\[28\] , \SUM\[27\] , \SUM\[26\] , 
        \SUM\[25\] , \SUM\[24\] , \SUM\[23\] , \SUM\[22\] , \SUM\[21\] , 
        \SUM\[20\] , \SUM\[19\] , \SUM\[18\] , \SUM\[17\] , \SUM\[16\] , 
        \SUM\[15\] , \SUM\[14\] , \SUM\[13\] , \SUM\[12\] , \SUM\[11\] , 
        \SUM\[10\] , \SUM\[9\] , \SUM\[8\] , \SUM\[7\] , \SUM\[6\] , 
        \SUM\[5\] , \SUM\[4\] , \SUM\[3\] , \SUM\[2\] , \SUM\[1\] , \SUM\[0\] 
        }), CO );
  input \A\[31\] , \A\[30\] , \A\[29\] , \A\[28\] , \A\[27\] , \A\[26\] ,
         \A\[25\] , \A\[24\] , \A\[23\] , \A\[22\] , \A\[21\] , \A\[20\] ,
         \A\[19\] , \A\[18\] , \A\[17\] , \A\[16\] , \A\[15\] , \A\[14\] ,
         \A\[13\] , \A\[12\] , \A\[11\] , \A\[10\] , \A\[9\] , \A\[8\] ,
         \A\[7\] , \A\[6\] , \A\[5\] , \A\[4\] , \A\[3\] , \A\[2\] , \A\[1\] ,
         \A\[0\] , \B\[31\] , \B\[30\] , \B\[29\] , \B\[28\] , \B\[27\] ,
         \B\[26\] , \B\[25\] , \B\[24\] , \B\[23\] , \B\[22\] , \B\[21\] ,
         \B\[20\] , \B\[19\] , \B\[18\] , \B\[17\] , \B\[16\] , \B\[15\] ,
         \B\[14\] , \B\[13\] , \B\[12\] , \B\[11\] , \B\[10\] , \B\[9\] ,
         \B\[8\] , \B\[7\] , \B\[6\] , \B\[5\] , \B\[4\] , \B\[3\] , \B\[2\] ,
         \B\[1\] , \B\[0\] , CI;
  output \SUM\[31\] , \SUM\[30\] , \SUM\[29\] , \SUM\[28\] , \SUM\[27\] ,
         \SUM\[26\] , \SUM\[25\] , \SUM\[24\] , \SUM\[23\] , \SUM\[22\] ,
         \SUM\[21\] , \SUM\[20\] , \SUM\[19\] , \SUM\[18\] , \SUM\[17\] ,
         \SUM\[16\] , \SUM\[15\] , \SUM\[14\] , \SUM\[13\] , \SUM\[12\] ,
         \SUM\[11\] , \SUM\[10\] , \SUM\[9\] , \SUM\[8\] , \SUM\[7\] ,
         \SUM\[6\] , \SUM\[5\] , \SUM\[4\] , \SUM\[3\] , \SUM\[2\] ,
         \SUM\[1\] , \SUM\[0\] , CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72,
         n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86,
         n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100,
         n101, n102, n103, n104, n105, n106, n107, n108, n109, n110, n111,
         n112, n113, n114, n115, n116, n117, n118, n119, n120, n121, n122,
         n123, n124, n125, n126, n127, n128, n129, n130, n131, n132, n133,
         n134, n135, n136, n137, n138, n139, n140, n141, n142, n143, n144,
         n145, n146, n147, n148, n149, n150, n151, n152, n153, n154, n155,
         n156, n157, n158, n159, n160, n161, n162, n163, n164, n165, n166,
         n167, n168, n169, n170, n171, n172, n173, n174, n175, n176, n177,
         n178, n179, n180, n181, n182, n183, n184;

  NAND4xp25_ASAP7_75t_R U2 ( .A(n165), .B(n168), .C(n169), .D(n172), .Y(n132)
         );
  AOI21xp5_ASAP7_75t_R U3 ( .A1(n182), .A2(n22), .B(n183), .Y(n181) );
  OAI21xp5_ASAP7_75t_R U4 ( .A1(n42), .A2(n43), .B(n44), .Y(n41) );
  NAND4xp25_ASAP7_75t_R U5 ( .A(n137), .B(n138), .C(n139), .D(n9), .Y(n136) );
  AOI21xp5_ASAP7_75t_R U6 ( .A1(n164), .A2(n165), .B(n166), .Y(n163) );
  NOR2xp33_ASAP7_75t_R U7 ( .A(n39), .B(n40), .Y(n36) );
  OAI21xp5_ASAP7_75t_R U8 ( .A1(n50), .A2(n4), .B(n51), .Y(n45) );
  OAI21xp5_ASAP7_75t_R U9 ( .A1(n83), .A2(n8), .B(n84), .Y(n76) );
  OAI21xp5_ASAP7_75t_R U10 ( .A1(n120), .A2(n121), .B(n122), .Y(n113) );
  NOR2xp33_ASAP7_75t_R U11 ( .A(n164), .B(n175), .Y(n177) );
  NOR2xp33_ASAP7_75t_R U12 ( .A(n148), .B(n133), .Y(n159) );
  NOR2xp33_ASAP7_75t_R U13 ( .A(n15), .B(n16), .Y(n14) );
  NOR2xp33_ASAP7_75t_R U14 ( .A(n18), .B(n19), .Y(n17) );
  NOR2xp33_ASAP7_75t_R U15 ( .A(n33), .B(n13), .Y(\SUM\[4\] ) );
  OA21x2_ASAP7_75t_R U16 ( .A1(n67), .A2(n5), .B(n68), .Y(n1) );
  OA21x2_ASAP7_75t_R U17 ( .A1(n12), .A2(n16), .B(n171), .Y(n2) );
  OA21x2_ASAP7_75t_R U18 ( .A1(n28), .A2(n32), .B(n29), .Y(n3) );
  AOI21xp5_ASAP7_75t_R U19 ( .A1(n54), .A2(n55), .B(n56), .Y(n4) );
  OA21x2_ASAP7_75t_R U20 ( .A1(n73), .A2(n74), .B(n75), .Y(n5) );
  AND2x2_ASAP7_75t_R U21 ( .A(\A\[29\] ), .B(n36), .Y(n6) );
  AND2x2_ASAP7_75t_R U22 ( .A(\A\[30\] ), .B(n6), .Y(n7) );
  AOI21xp5_ASAP7_75t_R U23 ( .A1(n87), .A2(n88), .B(n89), .Y(n8) );
  AND3x1_ASAP7_75t_R U24 ( .A(n149), .B(n140), .C(n150), .Y(n9) );
  OA21x2_ASAP7_75t_R U25 ( .A1(n178), .A2(n132), .B(n160), .Y(n10) );
  OA21x2_ASAP7_75t_R U26 ( .A1(n133), .A2(n10), .B(n158), .Y(n11) );
  OA21x2_ASAP7_75t_R U27 ( .A1(n178), .A2(n19), .B(n170), .Y(n12) );
  NOR2xp33_ASAP7_75t_R U28 ( .A(\A\[4\] ), .B(\B\[4\] ), .Y(n13) );
  INVx1_ASAP7_75t_R U29 ( .A(\A\[29\] ), .Y(n37) );
  INVx1_ASAP7_75t_R U30 ( .A(\A\[28\] ), .Y(n40) );
  INVx1_ASAP7_75t_R U31 ( .A(\A\[30\] ), .Y(n35) );
  INVx1_ASAP7_75t_R U32 ( .A(\A\[31\] ), .Y(n34) );
  NOR3xp33_ASAP7_75t_R U33 ( .A(n128), .B(n129), .C(n130), .Y(n121) );
  XNOR2xp5_ASAP7_75t_R U34 ( .A(n12), .B(n14), .Y(\SUM\[9\] ) );
  XNOR2xp5_ASAP7_75t_R U35 ( .A(n178), .B(n17), .Y(\SUM\[8\] ) );
  XNOR2xp5_ASAP7_75t_R U36 ( .A(n20), .B(n21), .Y(\SUM\[7\] ) );
  NAND2xp5_ASAP7_75t_R U37 ( .A(n22), .B(n23), .Y(n21) );
  OAI21xp5_ASAP7_75t_R U38 ( .A1(n24), .A2(n3), .B(n25), .Y(n20) );
  INVx1_ASAP7_75t_R U39 ( .A(n26), .Y(n24) );
  XOR2xp5_ASAP7_75t_R U40 ( .A(n27), .B(n3), .Y(\SUM\[6\] ) );
  INVx1_ASAP7_75t_R U41 ( .A(n30), .Y(n28) );
  NAND2xp5_ASAP7_75t_R U42 ( .A(n26), .B(n25), .Y(n27) );
  XNOR2xp5_ASAP7_75t_R U43 ( .A(n33), .B(n31), .Y(\SUM\[5\] ) );
  NAND2xp5_ASAP7_75t_R U44 ( .A(n30), .B(n29), .Y(n31) );
  XNOR2xp5_ASAP7_75t_R U45 ( .A(n34), .B(n7), .Y(\SUM\[31\] ) );
  XNOR2xp5_ASAP7_75t_R U46 ( .A(n6), .B(n35), .Y(\SUM\[30\] ) );
  XOR2xp5_ASAP7_75t_R U47 ( .A(n37), .B(n38), .Y(\SUM\[29\] ) );
  INVx1_ASAP7_75t_R U48 ( .A(n36), .Y(n38) );
  INVx1_ASAP7_75t_R U49 ( .A(n41), .Y(n39) );
  XNOR2xp5_ASAP7_75t_R U50 ( .A(n41), .B(n40), .Y(\SUM\[28\] ) );
  INVx1_ASAP7_75t_R U51 ( .A(n45), .Y(n43) );
  INVx1_ASAP7_75t_R U52 ( .A(n46), .Y(n42) );
  XNOR2xp5_ASAP7_75t_R U53 ( .A(n45), .B(n47), .Y(\SUM\[27\] ) );
  NAND2xp5_ASAP7_75t_R U54 ( .A(n44), .B(n46), .Y(n47) );
  NAND2xp5_ASAP7_75t_R U55 ( .A(n48), .B(n49), .Y(n46) );
  INVx1_ASAP7_75t_R U56 ( .A(\A\[27\] ), .Y(n49) );
  INVx1_ASAP7_75t_R U57 ( .A(\B\[27\] ), .Y(n48) );
  NAND2xp5_ASAP7_75t_R U58 ( .A(\B\[27\] ), .B(\A\[27\] ), .Y(n44) );
  INVx1_ASAP7_75t_R U59 ( .A(n52), .Y(n50) );
  XOR2xp5_ASAP7_75t_R U60 ( .A(n53), .B(n4), .Y(\SUM\[26\] ) );
  INVx1_ASAP7_75t_R U61 ( .A(n57), .Y(n56) );
  NAND2xp5_ASAP7_75t_R U62 ( .A(n52), .B(n51), .Y(n53) );
  NAND2xp5_ASAP7_75t_R U63 ( .A(\B\[26\] ), .B(\A\[26\] ), .Y(n51) );
  NAND2xp5_ASAP7_75t_R U64 ( .A(n58), .B(n59), .Y(n52) );
  INVx1_ASAP7_75t_R U65 ( .A(\A\[26\] ), .Y(n59) );
  INVx1_ASAP7_75t_R U66 ( .A(\B\[26\] ), .Y(n58) );
  XNOR2xp5_ASAP7_75t_R U67 ( .A(n54), .B(n60), .Y(\SUM\[25\] ) );
  NAND2xp5_ASAP7_75t_R U68 ( .A(n55), .B(n57), .Y(n60) );
  NAND2xp5_ASAP7_75t_R U69 ( .A(\B\[25\] ), .B(\A\[25\] ), .Y(n57) );
  NAND2xp5_ASAP7_75t_R U70 ( .A(n61), .B(n62), .Y(n55) );
  INVx1_ASAP7_75t_R U71 ( .A(\A\[25\] ), .Y(n62) );
  INVx1_ASAP7_75t_R U72 ( .A(\B\[25\] ), .Y(n61) );
  OAI21xp5_ASAP7_75t_R U73 ( .A1(n63), .A2(n1), .B(n64), .Y(n54) );
  INVx1_ASAP7_75t_R U74 ( .A(n65), .Y(n63) );
  XOR2xp5_ASAP7_75t_R U75 ( .A(n66), .B(n1), .Y(\SUM\[24\] ) );
  INVx1_ASAP7_75t_R U76 ( .A(n69), .Y(n67) );
  NAND2xp5_ASAP7_75t_R U77 ( .A(n65), .B(n64), .Y(n66) );
  NAND2xp5_ASAP7_75t_R U78 ( .A(\B\[24\] ), .B(\A\[24\] ), .Y(n64) );
  NAND2xp5_ASAP7_75t_R U79 ( .A(n70), .B(n71), .Y(n65) );
  INVx1_ASAP7_75t_R U80 ( .A(\A\[24\] ), .Y(n71) );
  INVx1_ASAP7_75t_R U81 ( .A(\B\[24\] ), .Y(n70) );
  XOR2xp5_ASAP7_75t_R U82 ( .A(n72), .B(n5), .Y(\SUM\[23\] ) );
  INVx1_ASAP7_75t_R U83 ( .A(n76), .Y(n74) );
  INVx1_ASAP7_75t_R U84 ( .A(n77), .Y(n73) );
  NAND2xp5_ASAP7_75t_R U85 ( .A(n69), .B(n68), .Y(n72) );
  NAND2xp5_ASAP7_75t_R U86 ( .A(\B\[23\] ), .B(\A\[23\] ), .Y(n68) );
  NAND2xp5_ASAP7_75t_R U87 ( .A(n78), .B(n79), .Y(n69) );
  INVx1_ASAP7_75t_R U88 ( .A(\A\[23\] ), .Y(n79) );
  INVx1_ASAP7_75t_R U89 ( .A(\B\[23\] ), .Y(n78) );
  XNOR2xp5_ASAP7_75t_R U90 ( .A(n76), .B(n80), .Y(\SUM\[22\] ) );
  NAND2xp5_ASAP7_75t_R U91 ( .A(n75), .B(n77), .Y(n80) );
  NAND2xp5_ASAP7_75t_R U92 ( .A(n81), .B(n82), .Y(n77) );
  INVx1_ASAP7_75t_R U93 ( .A(\A\[22\] ), .Y(n82) );
  INVx1_ASAP7_75t_R U94 ( .A(\B\[22\] ), .Y(n81) );
  NAND2xp5_ASAP7_75t_R U95 ( .A(\B\[22\] ), .B(\A\[22\] ), .Y(n75) );
  INVx1_ASAP7_75t_R U96 ( .A(n85), .Y(n83) );
  XOR2xp5_ASAP7_75t_R U97 ( .A(n86), .B(n8), .Y(\SUM\[21\] ) );
  INVx1_ASAP7_75t_R U98 ( .A(n90), .Y(n89) );
  NAND2xp5_ASAP7_75t_R U99 ( .A(n85), .B(n84), .Y(n86) );
  NAND2xp5_ASAP7_75t_R U100 ( .A(\B\[21\] ), .B(\A\[21\] ), .Y(n84) );
  NAND2xp5_ASAP7_75t_R U101 ( .A(n91), .B(n92), .Y(n85) );
  INVx1_ASAP7_75t_R U102 ( .A(\A\[21\] ), .Y(n92) );
  INVx1_ASAP7_75t_R U103 ( .A(\B\[21\] ), .Y(n91) );
  XNOR2xp5_ASAP7_75t_R U104 ( .A(n87), .B(n93), .Y(\SUM\[20\] ) );
  NAND2xp5_ASAP7_75t_R U105 ( .A(n88), .B(n90), .Y(n93) );
  NAND2xp5_ASAP7_75t_R U106 ( .A(\B\[20\] ), .B(\A\[20\] ), .Y(n90) );
  NAND2xp5_ASAP7_75t_R U107 ( .A(n94), .B(n95), .Y(n88) );
  INVx1_ASAP7_75t_R U108 ( .A(\A\[20\] ), .Y(n95) );
  INVx1_ASAP7_75t_R U109 ( .A(\B\[20\] ), .Y(n94) );
  OAI21xp5_ASAP7_75t_R U110 ( .A1(n96), .A2(n97), .B(n98), .Y(n87) );
  INVx1_ASAP7_75t_R U111 ( .A(n99), .Y(n97) );
  INVx1_ASAP7_75t_R U112 ( .A(n100), .Y(n96) );
  XNOR2xp5_ASAP7_75t_R U113 ( .A(n99), .B(n101), .Y(\SUM\[19\] ) );
  NAND2xp5_ASAP7_75t_R U114 ( .A(n98), .B(n100), .Y(n101) );
  NAND2xp5_ASAP7_75t_R U115 ( .A(n102), .B(n103), .Y(n100) );
  INVx1_ASAP7_75t_R U116 ( .A(\A\[19\] ), .Y(n103) );
  INVx1_ASAP7_75t_R U117 ( .A(\B\[19\] ), .Y(n102) );
  NAND2xp5_ASAP7_75t_R U118 ( .A(\B\[19\] ), .B(\A\[19\] ), .Y(n98) );
  OAI21xp5_ASAP7_75t_R U119 ( .A1(n104), .A2(n105), .B(n106), .Y(n99) );
  INVx1_ASAP7_75t_R U120 ( .A(n107), .Y(n105) );
  INVx1_ASAP7_75t_R U121 ( .A(n108), .Y(n104) );
  XNOR2xp5_ASAP7_75t_R U122 ( .A(n109), .B(n107), .Y(\SUM\[18\] ) );
  OAI21xp5_ASAP7_75t_R U123 ( .A1(n110), .A2(n111), .B(n112), .Y(n107) );
  INVx1_ASAP7_75t_R U124 ( .A(n113), .Y(n111) );
  INVx1_ASAP7_75t_R U125 ( .A(n114), .Y(n110) );
  NAND2xp5_ASAP7_75t_R U126 ( .A(n106), .B(n108), .Y(n109) );
  NAND2xp5_ASAP7_75t_R U127 ( .A(n115), .B(n116), .Y(n108) );
  INVx1_ASAP7_75t_R U128 ( .A(\A\[18\] ), .Y(n116) );
  INVx1_ASAP7_75t_R U129 ( .A(\B\[18\] ), .Y(n115) );
  NAND2xp5_ASAP7_75t_R U130 ( .A(\B\[18\] ), .B(\A\[18\] ), .Y(n106) );
  XNOR2xp5_ASAP7_75t_R U131 ( .A(n113), .B(n117), .Y(\SUM\[17\] ) );
  NAND2xp5_ASAP7_75t_R U132 ( .A(n112), .B(n114), .Y(n117) );
  NAND2xp5_ASAP7_75t_R U133 ( .A(n118), .B(n119), .Y(n114) );
  INVx1_ASAP7_75t_R U134 ( .A(\A\[17\] ), .Y(n119) );
  INVx1_ASAP7_75t_R U135 ( .A(\B\[17\] ), .Y(n118) );
  NAND2xp5_ASAP7_75t_R U136 ( .A(\B\[17\] ), .B(\A\[17\] ), .Y(n112) );
  INVx1_ASAP7_75t_R U137 ( .A(n123), .Y(n120) );
  XNOR2xp5_ASAP7_75t_R U138 ( .A(n124), .B(n125), .Y(\SUM\[16\] ) );
  NAND2xp5_ASAP7_75t_R U139 ( .A(n122), .B(n123), .Y(n125) );
  NAND2xp5_ASAP7_75t_R U140 ( .A(n126), .B(n127), .Y(n123) );
  INVx1_ASAP7_75t_R U141 ( .A(\A\[16\] ), .Y(n127) );
  INVx1_ASAP7_75t_R U142 ( .A(\B\[16\] ), .Y(n126) );
  NAND2xp5_ASAP7_75t_R U143 ( .A(\B\[16\] ), .B(\A\[16\] ), .Y(n122) );
  INVx1_ASAP7_75t_R U144 ( .A(n121), .Y(n124) );
  INVx1_ASAP7_75t_R U145 ( .A(n131), .Y(n130) );
  OAI21xp5_ASAP7_75t_R U146 ( .A1(n134), .A2(n135), .B(n136), .Y(n129) );
  INVx1_ASAP7_75t_R U147 ( .A(n132), .Y(n137) );
  NAND2xp5_ASAP7_75t_R U148 ( .A(n140), .B(n141), .Y(n135) );
  INVx1_ASAP7_75t_R U149 ( .A(n142), .Y(n141) );
  OAI211xp5_ASAP7_75t_R U150 ( .A1(n143), .A2(n144), .B(n145), .C(n146), .Y(
        n128) );
  NAND3xp33_ASAP7_75t_R U151 ( .A(n138), .B(n147), .C(n9), .Y(n146) );
  NAND2xp5_ASAP7_75t_R U152 ( .A(n148), .B(n9), .Y(n145) );
  INVx1_ASAP7_75t_R U153 ( .A(n140), .Y(n143) );
  XNOR2xp5_ASAP7_75t_R U154 ( .A(n151), .B(n152), .Y(\SUM\[15\] ) );
  NAND2xp5_ASAP7_75t_R U155 ( .A(n140), .B(n131), .Y(n152) );
  NAND2xp5_ASAP7_75t_R U156 ( .A(\B\[15\] ), .B(\A\[15\] ), .Y(n131) );
  OR2x2_ASAP7_75t_R U157 ( .A(\A\[15\] ), .B(\B\[15\] ), .Y(n140) );
  OAI21xp5_ASAP7_75t_R U158 ( .A1(n134), .A2(n153), .B(n144), .Y(n151) );
  INVx1_ASAP7_75t_R U159 ( .A(n154), .Y(n153) );
  INVx1_ASAP7_75t_R U160 ( .A(n149), .Y(n134) );
  XNOR2xp5_ASAP7_75t_R U161 ( .A(n154), .B(n155), .Y(\SUM\[14\] ) );
  NAND2xp5_ASAP7_75t_R U162 ( .A(n144), .B(n149), .Y(n155) );
  OR2x2_ASAP7_75t_R U163 ( .A(\A\[14\] ), .B(\B\[14\] ), .Y(n149) );
  NAND2xp5_ASAP7_75t_R U164 ( .A(\B\[14\] ), .B(\A\[14\] ), .Y(n144) );
  OAI21xp5_ASAP7_75t_R U165 ( .A1(n156), .A2(n11), .B(n142), .Y(n154) );
  INVx1_ASAP7_75t_R U166 ( .A(n150), .Y(n156) );
  XOR2xp5_ASAP7_75t_R U167 ( .A(n157), .B(n11), .Y(\SUM\[13\] ) );
  NAND2xp5_ASAP7_75t_R U168 ( .A(n150), .B(n142), .Y(n157) );
  NAND2xp5_ASAP7_75t_R U169 ( .A(\B\[13\] ), .B(\A\[13\] ), .Y(n142) );
  OR2x2_ASAP7_75t_R U170 ( .A(\A\[13\] ), .B(\B\[13\] ), .Y(n150) );
  XNOR2xp5_ASAP7_75t_R U171 ( .A(n10), .B(n159), .Y(\SUM\[12\] ) );
  INVx1_ASAP7_75t_R U172 ( .A(n138), .Y(n133) );
  OR2x2_ASAP7_75t_R U173 ( .A(\A\[12\] ), .B(\B\[12\] ), .Y(n138) );
  INVx1_ASAP7_75t_R U174 ( .A(n158), .Y(n148) );
  NAND2xp5_ASAP7_75t_R U175 ( .A(\B\[12\] ), .B(\A\[12\] ), .Y(n158) );
  INVx1_ASAP7_75t_R U176 ( .A(n147), .Y(n160) );
  OAI21xp5_ASAP7_75t_R U177 ( .A1(n161), .A2(n162), .B(n163), .Y(n147) );
  INVx1_ASAP7_75t_R U178 ( .A(n167), .Y(n166) );
  NAND2xp5_ASAP7_75t_R U179 ( .A(n165), .B(n168), .Y(n162) );
  OAI21xp5_ASAP7_75t_R U180 ( .A1(n15), .A2(n18), .B(n169), .Y(n161) );
  INVx1_ASAP7_75t_R U181 ( .A(n170), .Y(n18) );
  INVx1_ASAP7_75t_R U182 ( .A(n171), .Y(n15) );
  XNOR2xp5_ASAP7_75t_R U183 ( .A(n173), .B(n174), .Y(\SUM\[11\] ) );
  NAND2xp5_ASAP7_75t_R U184 ( .A(n165), .B(n167), .Y(n174) );
  NAND2xp5_ASAP7_75t_R U185 ( .A(\B\[11\] ), .B(\A\[11\] ), .Y(n167) );
  OR2x2_ASAP7_75t_R U186 ( .A(\A\[11\] ), .B(\B\[11\] ), .Y(n165) );
  OAI21xp5_ASAP7_75t_R U187 ( .A1(n175), .A2(n2), .B(n176), .Y(n173) );
  XNOR2xp5_ASAP7_75t_R U188 ( .A(n2), .B(n177), .Y(\SUM\[10\] ) );
  INVx1_ASAP7_75t_R U189 ( .A(n168), .Y(n175) );
  OR2x2_ASAP7_75t_R U190 ( .A(\A\[10\] ), .B(\B\[10\] ), .Y(n168) );
  INVx1_ASAP7_75t_R U191 ( .A(n176), .Y(n164) );
  NAND2xp5_ASAP7_75t_R U192 ( .A(\B\[10\] ), .B(\A\[10\] ), .Y(n176) );
  NAND2xp5_ASAP7_75t_R U193 ( .A(\B\[9\] ), .B(\A\[9\] ), .Y(n171) );
  INVx1_ASAP7_75t_R U194 ( .A(n169), .Y(n16) );
  OR2x2_ASAP7_75t_R U195 ( .A(\A\[9\] ), .B(\B\[9\] ), .Y(n169) );
  NAND2xp5_ASAP7_75t_R U196 ( .A(\B\[8\] ), .B(\A\[8\] ), .Y(n170) );
  INVx1_ASAP7_75t_R U197 ( .A(n172), .Y(n19) );
  OR2x2_ASAP7_75t_R U198 ( .A(\A\[8\] ), .B(\B\[8\] ), .Y(n172) );
  INVx1_ASAP7_75t_R U199 ( .A(n139), .Y(n178) );
  OAI21xp5_ASAP7_75t_R U200 ( .A1(n179), .A2(n180), .B(n181), .Y(n139) );
  INVx1_ASAP7_75t_R U201 ( .A(n23), .Y(n183) );
  NAND2xp5_ASAP7_75t_R U202 ( .A(\B\[7\] ), .B(\A\[7\] ), .Y(n23) );
  INVx1_ASAP7_75t_R U203 ( .A(n25), .Y(n182) );
  NAND2xp5_ASAP7_75t_R U204 ( .A(\B\[6\] ), .B(\A\[6\] ), .Y(n25) );
  NAND2xp5_ASAP7_75t_R U205 ( .A(n22), .B(n26), .Y(n180) );
  OAI21xp5_ASAP7_75t_R U206 ( .A1(n184), .A2(n33), .B(n30), .Y(n179) );
  INVx1_ASAP7_75t_R U207 ( .A(n32), .Y(n33) );
  NAND2xp5_ASAP7_75t_R U208 ( .A(\B\[4\] ), .B(\A\[4\] ), .Y(n32) );
  INVx1_ASAP7_75t_R U209 ( .A(n29), .Y(n184) );
  NAND2xp5_ASAP7_75t_R U210 ( .A(\B\[5\] ), .B(\A\[5\] ), .Y(n29) );
  OR2x2_ASAP7_75t_R U211 ( .A(\A\[5\] ), .B(\B\[5\] ), .Y(n30) );
  OR2x2_ASAP7_75t_R U212 ( .A(\A\[6\] ), .B(\B\[6\] ), .Y(n26) );
  OR2x2_ASAP7_75t_R U213 ( .A(\A\[7\] ), .B(\B\[7\] ), .Y(n22) );
endmodule


module fp32_exp_DW01_add_45 ( .A({\A\[31\] , \A\[30\] , \A\[29\] , \A\[28\] , 
        \A\[27\] , \A\[26\] , \A\[25\] , \A\[24\] , \A\[23\] , \A\[22\] , 
        \A\[21\] , \A\[20\] , \A\[19\] , \A\[18\] , \A\[17\] , \A\[16\] , 
        \A\[15\] , \A\[14\] , \A\[13\] , \A\[12\] , \A\[11\] , \A\[10\] , 
        \A\[9\] , \A\[8\] , \A\[7\] , \A\[6\] , \A\[5\] , \A\[4\] , \A\[3\] , 
        \A\[2\] , \A\[1\] , \A\[0\] }), .B({\B\[31\] , \B\[30\] , \B\[29\] , 
        \B\[28\] , \B\[27\] , \B\[26\] , \B\[25\] , \B\[24\] , \B\[23\] , 
        \B\[22\] , \B\[21\] , \B\[20\] , \B\[19\] , \B\[18\] , \B\[17\] , 
        \B\[16\] , \B\[15\] , \B\[14\] , \B\[13\] , \B\[12\] , \B\[11\] , 
        \B\[10\] , \B\[9\] , \B\[8\] , \B\[7\] , \B\[6\] , \B\[5\] , \B\[4\] , 
        \B\[3\] , \B\[2\] , \B\[1\] , \B\[0\] }), CI, .SUM({\SUM\[31\] , 
        \SUM\[30\] , \SUM\[29\] , \SUM\[28\] , \SUM\[27\] , \SUM\[26\] , 
        \SUM\[25\] , \SUM\[24\] , \SUM\[23\] , \SUM\[22\] , \SUM\[21\] , 
        \SUM\[20\] , \SUM\[19\] , \SUM\[18\] , \SUM\[17\] , \SUM\[16\] , 
        \SUM\[15\] , \SUM\[14\] , \SUM\[13\] , \SUM\[12\] , \SUM\[11\] , 
        \SUM\[10\] , \SUM\[9\] , \SUM\[8\] , \SUM\[7\] , \SUM\[6\] , 
        \SUM\[5\] , \SUM\[4\] , \SUM\[3\] , \SUM\[2\] , \SUM\[1\] , \SUM\[0\] 
        }), CO );
  input \A\[31\] , \A\[30\] , \A\[29\] , \A\[28\] , \A\[27\] , \A\[26\] ,
         \A\[25\] , \A\[24\] , \A\[23\] , \A\[22\] , \A\[21\] , \A\[20\] ,
         \A\[19\] , \A\[18\] , \A\[17\] , \A\[16\] , \A\[15\] , \A\[14\] ,
         \A\[13\] , \A\[12\] , \A\[11\] , \A\[10\] , \A\[9\] , \A\[8\] ,
         \A\[7\] , \A\[6\] , \A\[5\] , \A\[4\] , \A\[3\] , \A\[2\] , \A\[1\] ,
         \A\[0\] , \B\[31\] , \B\[30\] , \B\[29\] , \B\[28\] , \B\[27\] ,
         \B\[26\] , \B\[25\] , \B\[24\] , \B\[23\] , \B\[22\] , \B\[21\] ,
         \B\[20\] , \B\[19\] , \B\[18\] , \B\[17\] , \B\[16\] , \B\[15\] ,
         \B\[14\] , \B\[13\] , \B\[12\] , \B\[11\] , \B\[10\] , \B\[9\] ,
         \B\[8\] , \B\[7\] , \B\[6\] , \B\[5\] , \B\[4\] , \B\[3\] , \B\[2\] ,
         \B\[1\] , \B\[0\] , CI;
  output \SUM\[31\] , \SUM\[30\] , \SUM\[29\] , \SUM\[28\] , \SUM\[27\] ,
         \SUM\[26\] , \SUM\[25\] , \SUM\[24\] , \SUM\[23\] , \SUM\[22\] ,
         \SUM\[21\] , \SUM\[20\] , \SUM\[19\] , \SUM\[18\] , \SUM\[17\] ,
         \SUM\[16\] , \SUM\[15\] , \SUM\[14\] , \SUM\[13\] , \SUM\[12\] ,
         \SUM\[11\] , \SUM\[10\] , \SUM\[9\] , \SUM\[8\] , \SUM\[7\] ,
         \SUM\[6\] , \SUM\[5\] , \SUM\[4\] , \SUM\[3\] , \SUM\[2\] ,
         \SUM\[1\] , \SUM\[0\] , CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72,
         n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86,
         n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100,
         n101, n102, n103, n104, n105, n106, n107, n108, n109, n110, n111,
         n112, n113, n114, n115, n116, n117, n118, n119, n120, n121, n122,
         n123, n124, n125, n126, n127, n128, n129, n130, n131, n132, n133,
         n134, n135, n136, n137, n138, n139, n140, n141, n142, n143, n144,
         n145, n146, n147, n148, n149, n150, n151, n152, n153, n154, n155,
         n156, n157, n158, n159, n160, n161, n162, n163, n164, n165, n166,
         n167, n168, n169, n170, n171, n172, n173, n174, n175, n176, n177,
         n178, n179, n180, n181, n182, n183, n184;

  AOI21xp5_ASAP7_75t_R U2 ( .A1(n164), .A2(n165), .B(n166), .Y(n163) );
  NAND4xp25_ASAP7_75t_R U3 ( .A(n165), .B(n168), .C(n169), .D(n172), .Y(n132)
         );
  AOI21xp5_ASAP7_75t_R U4 ( .A1(n182), .A2(n22), .B(n183), .Y(n181) );
  OAI21xp5_ASAP7_75t_R U5 ( .A1(n120), .A2(n121), .B(n122), .Y(n113) );
  NOR2xp33_ASAP7_75t_R U6 ( .A(n39), .B(n40), .Y(n36) );
  OAI21xp5_ASAP7_75t_R U7 ( .A1(n63), .A2(n1), .B(n64), .Y(n54) );
  NOR3xp33_ASAP7_75t_R U8 ( .A(n128), .B(n129), .C(n130), .Y(n121) );
  NOR2xp33_ASAP7_75t_R U9 ( .A(n164), .B(n175), .Y(n177) );
  NOR2xp33_ASAP7_75t_R U10 ( .A(n148), .B(n133), .Y(n159) );
  NOR2xp33_ASAP7_75t_R U11 ( .A(n15), .B(n16), .Y(n14) );
  NOR2xp33_ASAP7_75t_R U12 ( .A(n18), .B(n19), .Y(n17) );
  NOR2xp33_ASAP7_75t_R U13 ( .A(n33), .B(n13), .Y(\SUM\[4\] ) );
  OA21x2_ASAP7_75t_R U14 ( .A1(n67), .A2(n4), .B(n68), .Y(n1) );
  OA21x2_ASAP7_75t_R U15 ( .A1(n12), .A2(n16), .B(n171), .Y(n2) );
  OA21x2_ASAP7_75t_R U16 ( .A1(n28), .A2(n32), .B(n29), .Y(n3) );
  OA21x2_ASAP7_75t_R U17 ( .A1(n73), .A2(n74), .B(n75), .Y(n4) );
  AND2x2_ASAP7_75t_R U18 ( .A(\A\[29\] ), .B(n36), .Y(n5) );
  AOI21xp5_ASAP7_75t_R U19 ( .A1(n87), .A2(n88), .B(n89), .Y(n6) );
  AOI21xp5_ASAP7_75t_R U20 ( .A1(n54), .A2(n55), .B(n56), .Y(n7) );
  AND2x2_ASAP7_75t_R U21 ( .A(\A\[30\] ), .B(n5), .Y(n8) );
  AND3x1_ASAP7_75t_R U22 ( .A(n149), .B(n140), .C(n150), .Y(n9) );
  OA21x2_ASAP7_75t_R U23 ( .A1(n178), .A2(n132), .B(n160), .Y(n10) );
  OA21x2_ASAP7_75t_R U24 ( .A1(n133), .A2(n10), .B(n158), .Y(n11) );
  OA21x2_ASAP7_75t_R U25 ( .A1(n178), .A2(n19), .B(n170), .Y(n12) );
  NOR2xp33_ASAP7_75t_R U26 ( .A(\A\[4\] ), .B(\B\[4\] ), .Y(n13) );
  INVx1_ASAP7_75t_R U27 ( .A(\A\[29\] ), .Y(n37) );
  INVx1_ASAP7_75t_R U28 ( .A(\A\[28\] ), .Y(n40) );
  INVx1_ASAP7_75t_R U29 ( .A(\A\[30\] ), .Y(n35) );
  INVx1_ASAP7_75t_R U30 ( .A(\A\[31\] ), .Y(n34) );
  NAND4xp25_ASAP7_75t_R U31 ( .A(n137), .B(n138), .C(n139), .D(n9), .Y(n136)
         );
  INVxp67_ASAP7_75t_R U32 ( .A(n139), .Y(n178) );
  XNOR2xp5_ASAP7_75t_R U33 ( .A(n12), .B(n14), .Y(\SUM\[9\] ) );
  XNOR2xp5_ASAP7_75t_R U34 ( .A(n178), .B(n17), .Y(\SUM\[8\] ) );
  XNOR2xp5_ASAP7_75t_R U35 ( .A(n20), .B(n21), .Y(\SUM\[7\] ) );
  NAND2xp5_ASAP7_75t_R U36 ( .A(n22), .B(n23), .Y(n21) );
  OAI21xp5_ASAP7_75t_R U37 ( .A1(n24), .A2(n3), .B(n25), .Y(n20) );
  INVx1_ASAP7_75t_R U38 ( .A(n26), .Y(n24) );
  XOR2xp5_ASAP7_75t_R U39 ( .A(n27), .B(n3), .Y(\SUM\[6\] ) );
  INVx1_ASAP7_75t_R U40 ( .A(n30), .Y(n28) );
  NAND2xp5_ASAP7_75t_R U41 ( .A(n26), .B(n25), .Y(n27) );
  XNOR2xp5_ASAP7_75t_R U42 ( .A(n33), .B(n31), .Y(\SUM\[5\] ) );
  NAND2xp5_ASAP7_75t_R U43 ( .A(n30), .B(n29), .Y(n31) );
  XNOR2xp5_ASAP7_75t_R U44 ( .A(n34), .B(n8), .Y(\SUM\[31\] ) );
  XNOR2xp5_ASAP7_75t_R U45 ( .A(n5), .B(n35), .Y(\SUM\[30\] ) );
  XOR2xp5_ASAP7_75t_R U46 ( .A(n37), .B(n38), .Y(\SUM\[29\] ) );
  INVx1_ASAP7_75t_R U47 ( .A(n36), .Y(n38) );
  INVx1_ASAP7_75t_R U48 ( .A(n41), .Y(n39) );
  XNOR2xp5_ASAP7_75t_R U49 ( .A(n41), .B(n40), .Y(\SUM\[28\] ) );
  OAI21xp5_ASAP7_75t_R U50 ( .A1(n42), .A2(n43), .B(n44), .Y(n41) );
  INVx1_ASAP7_75t_R U51 ( .A(n45), .Y(n43) );
  INVx1_ASAP7_75t_R U52 ( .A(n46), .Y(n42) );
  XNOR2xp5_ASAP7_75t_R U53 ( .A(n45), .B(n47), .Y(\SUM\[27\] ) );
  NAND2xp5_ASAP7_75t_R U54 ( .A(n44), .B(n46), .Y(n47) );
  NAND2xp5_ASAP7_75t_R U55 ( .A(n48), .B(n49), .Y(n46) );
  INVx1_ASAP7_75t_R U56 ( .A(\A\[27\] ), .Y(n49) );
  INVx1_ASAP7_75t_R U57 ( .A(\B\[27\] ), .Y(n48) );
  NAND2xp5_ASAP7_75t_R U58 ( .A(\B\[27\] ), .B(\A\[27\] ), .Y(n44) );
  OAI21xp5_ASAP7_75t_R U59 ( .A1(n50), .A2(n7), .B(n51), .Y(n45) );
  INVx1_ASAP7_75t_R U60 ( .A(n52), .Y(n50) );
  XOR2xp5_ASAP7_75t_R U61 ( .A(n53), .B(n7), .Y(\SUM\[26\] ) );
  INVx1_ASAP7_75t_R U62 ( .A(n57), .Y(n56) );
  NAND2xp5_ASAP7_75t_R U63 ( .A(n52), .B(n51), .Y(n53) );
  NAND2xp5_ASAP7_75t_R U64 ( .A(\B\[26\] ), .B(\A\[26\] ), .Y(n51) );
  NAND2xp5_ASAP7_75t_R U65 ( .A(n58), .B(n59), .Y(n52) );
  INVx1_ASAP7_75t_R U66 ( .A(\A\[26\] ), .Y(n59) );
  INVx1_ASAP7_75t_R U67 ( .A(\B\[26\] ), .Y(n58) );
  XNOR2xp5_ASAP7_75t_R U68 ( .A(n54), .B(n60), .Y(\SUM\[25\] ) );
  NAND2xp5_ASAP7_75t_R U69 ( .A(n55), .B(n57), .Y(n60) );
  NAND2xp5_ASAP7_75t_R U70 ( .A(\B\[25\] ), .B(\A\[25\] ), .Y(n57) );
  NAND2xp5_ASAP7_75t_R U71 ( .A(n61), .B(n62), .Y(n55) );
  INVx1_ASAP7_75t_R U72 ( .A(\A\[25\] ), .Y(n62) );
  INVx1_ASAP7_75t_R U73 ( .A(\B\[25\] ), .Y(n61) );
  INVx1_ASAP7_75t_R U74 ( .A(n65), .Y(n63) );
  XOR2xp5_ASAP7_75t_R U75 ( .A(n66), .B(n1), .Y(\SUM\[24\] ) );
  INVx1_ASAP7_75t_R U76 ( .A(n69), .Y(n67) );
  NAND2xp5_ASAP7_75t_R U77 ( .A(n65), .B(n64), .Y(n66) );
  NAND2xp5_ASAP7_75t_R U78 ( .A(\B\[24\] ), .B(\A\[24\] ), .Y(n64) );
  NAND2xp5_ASAP7_75t_R U79 ( .A(n70), .B(n71), .Y(n65) );
  INVx1_ASAP7_75t_R U80 ( .A(\A\[24\] ), .Y(n71) );
  INVx1_ASAP7_75t_R U81 ( .A(\B\[24\] ), .Y(n70) );
  XOR2xp5_ASAP7_75t_R U82 ( .A(n72), .B(n4), .Y(\SUM\[23\] ) );
  INVx1_ASAP7_75t_R U83 ( .A(n76), .Y(n74) );
  INVx1_ASAP7_75t_R U84 ( .A(n77), .Y(n73) );
  NAND2xp5_ASAP7_75t_R U85 ( .A(n69), .B(n68), .Y(n72) );
  NAND2xp5_ASAP7_75t_R U86 ( .A(\B\[23\] ), .B(\A\[23\] ), .Y(n68) );
  NAND2xp5_ASAP7_75t_R U87 ( .A(n78), .B(n79), .Y(n69) );
  INVx1_ASAP7_75t_R U88 ( .A(\A\[23\] ), .Y(n79) );
  INVx1_ASAP7_75t_R U89 ( .A(\B\[23\] ), .Y(n78) );
  XNOR2xp5_ASAP7_75t_R U90 ( .A(n76), .B(n80), .Y(\SUM\[22\] ) );
  NAND2xp5_ASAP7_75t_R U91 ( .A(n75), .B(n77), .Y(n80) );
  NAND2xp5_ASAP7_75t_R U92 ( .A(n81), .B(n82), .Y(n77) );
  INVx1_ASAP7_75t_R U93 ( .A(\A\[22\] ), .Y(n82) );
  INVx1_ASAP7_75t_R U94 ( .A(\B\[22\] ), .Y(n81) );
  NAND2xp5_ASAP7_75t_R U95 ( .A(\B\[22\] ), .B(\A\[22\] ), .Y(n75) );
  OAI21xp5_ASAP7_75t_R U96 ( .A1(n83), .A2(n6), .B(n84), .Y(n76) );
  INVx1_ASAP7_75t_R U97 ( .A(n85), .Y(n83) );
  XOR2xp5_ASAP7_75t_R U98 ( .A(n86), .B(n6), .Y(\SUM\[21\] ) );
  INVx1_ASAP7_75t_R U99 ( .A(n90), .Y(n89) );
  NAND2xp5_ASAP7_75t_R U100 ( .A(n85), .B(n84), .Y(n86) );
  NAND2xp5_ASAP7_75t_R U101 ( .A(\B\[21\] ), .B(\A\[21\] ), .Y(n84) );
  NAND2xp5_ASAP7_75t_R U102 ( .A(n91), .B(n92), .Y(n85) );
  INVx1_ASAP7_75t_R U103 ( .A(\A\[21\] ), .Y(n92) );
  INVx1_ASAP7_75t_R U104 ( .A(\B\[21\] ), .Y(n91) );
  XNOR2xp5_ASAP7_75t_R U105 ( .A(n87), .B(n93), .Y(\SUM\[20\] ) );
  NAND2xp5_ASAP7_75t_R U106 ( .A(n88), .B(n90), .Y(n93) );
  NAND2xp5_ASAP7_75t_R U107 ( .A(\B\[20\] ), .B(\A\[20\] ), .Y(n90) );
  NAND2xp5_ASAP7_75t_R U108 ( .A(n94), .B(n95), .Y(n88) );
  INVx1_ASAP7_75t_R U109 ( .A(\A\[20\] ), .Y(n95) );
  INVx1_ASAP7_75t_R U110 ( .A(\B\[20\] ), .Y(n94) );
  OAI21xp5_ASAP7_75t_R U111 ( .A1(n96), .A2(n97), .B(n98), .Y(n87) );
  INVx1_ASAP7_75t_R U112 ( .A(n99), .Y(n97) );
  INVx1_ASAP7_75t_R U113 ( .A(n100), .Y(n96) );
  XNOR2xp5_ASAP7_75t_R U114 ( .A(n99), .B(n101), .Y(\SUM\[19\] ) );
  NAND2xp5_ASAP7_75t_R U115 ( .A(n98), .B(n100), .Y(n101) );
  NAND2xp5_ASAP7_75t_R U116 ( .A(n102), .B(n103), .Y(n100) );
  INVx1_ASAP7_75t_R U117 ( .A(\A\[19\] ), .Y(n103) );
  INVx1_ASAP7_75t_R U118 ( .A(\B\[19\] ), .Y(n102) );
  NAND2xp5_ASAP7_75t_R U119 ( .A(\B\[19\] ), .B(\A\[19\] ), .Y(n98) );
  OAI21xp5_ASAP7_75t_R U120 ( .A1(n104), .A2(n105), .B(n106), .Y(n99) );
  INVx1_ASAP7_75t_R U121 ( .A(n107), .Y(n105) );
  INVx1_ASAP7_75t_R U122 ( .A(n108), .Y(n104) );
  XNOR2xp5_ASAP7_75t_R U123 ( .A(n109), .B(n107), .Y(\SUM\[18\] ) );
  OAI21xp5_ASAP7_75t_R U124 ( .A1(n110), .A2(n111), .B(n112), .Y(n107) );
  INVx1_ASAP7_75t_R U125 ( .A(n113), .Y(n111) );
  INVx1_ASAP7_75t_R U126 ( .A(n114), .Y(n110) );
  NAND2xp5_ASAP7_75t_R U127 ( .A(n106), .B(n108), .Y(n109) );
  NAND2xp5_ASAP7_75t_R U128 ( .A(n115), .B(n116), .Y(n108) );
  INVx1_ASAP7_75t_R U129 ( .A(\A\[18\] ), .Y(n116) );
  INVx1_ASAP7_75t_R U130 ( .A(\B\[18\] ), .Y(n115) );
  NAND2xp5_ASAP7_75t_R U131 ( .A(\B\[18\] ), .B(\A\[18\] ), .Y(n106) );
  XNOR2xp5_ASAP7_75t_R U132 ( .A(n113), .B(n117), .Y(\SUM\[17\] ) );
  NAND2xp5_ASAP7_75t_R U133 ( .A(n112), .B(n114), .Y(n117) );
  NAND2xp5_ASAP7_75t_R U134 ( .A(n118), .B(n119), .Y(n114) );
  INVx1_ASAP7_75t_R U135 ( .A(\A\[17\] ), .Y(n119) );
  INVx1_ASAP7_75t_R U136 ( .A(\B\[17\] ), .Y(n118) );
  NAND2xp5_ASAP7_75t_R U137 ( .A(\B\[17\] ), .B(\A\[17\] ), .Y(n112) );
  INVx1_ASAP7_75t_R U138 ( .A(n123), .Y(n120) );
  XNOR2xp5_ASAP7_75t_R U139 ( .A(n124), .B(n125), .Y(\SUM\[16\] ) );
  NAND2xp5_ASAP7_75t_R U140 ( .A(n122), .B(n123), .Y(n125) );
  NAND2xp5_ASAP7_75t_R U141 ( .A(n126), .B(n127), .Y(n123) );
  INVx1_ASAP7_75t_R U142 ( .A(\A\[16\] ), .Y(n127) );
  INVx1_ASAP7_75t_R U143 ( .A(\B\[16\] ), .Y(n126) );
  NAND2xp5_ASAP7_75t_R U144 ( .A(\B\[16\] ), .B(\A\[16\] ), .Y(n122) );
  INVx1_ASAP7_75t_R U145 ( .A(n121), .Y(n124) );
  INVx1_ASAP7_75t_R U146 ( .A(n131), .Y(n130) );
  OAI21xp5_ASAP7_75t_R U147 ( .A1(n134), .A2(n135), .B(n136), .Y(n129) );
  INVx1_ASAP7_75t_R U148 ( .A(n132), .Y(n137) );
  NAND2xp5_ASAP7_75t_R U149 ( .A(n140), .B(n141), .Y(n135) );
  INVx1_ASAP7_75t_R U150 ( .A(n142), .Y(n141) );
  OAI211xp5_ASAP7_75t_R U151 ( .A1(n143), .A2(n144), .B(n145), .C(n146), .Y(
        n128) );
  NAND3xp33_ASAP7_75t_R U152 ( .A(n138), .B(n147), .C(n9), .Y(n146) );
  NAND2xp5_ASAP7_75t_R U153 ( .A(n148), .B(n9), .Y(n145) );
  INVx1_ASAP7_75t_R U154 ( .A(n140), .Y(n143) );
  XNOR2xp5_ASAP7_75t_R U155 ( .A(n151), .B(n152), .Y(\SUM\[15\] ) );
  NAND2xp5_ASAP7_75t_R U156 ( .A(n140), .B(n131), .Y(n152) );
  NAND2xp5_ASAP7_75t_R U157 ( .A(\B\[15\] ), .B(\A\[15\] ), .Y(n131) );
  OR2x2_ASAP7_75t_R U158 ( .A(\A\[15\] ), .B(\B\[15\] ), .Y(n140) );
  OAI21xp5_ASAP7_75t_R U159 ( .A1(n134), .A2(n153), .B(n144), .Y(n151) );
  INVx1_ASAP7_75t_R U160 ( .A(n154), .Y(n153) );
  INVx1_ASAP7_75t_R U161 ( .A(n149), .Y(n134) );
  XNOR2xp5_ASAP7_75t_R U162 ( .A(n154), .B(n155), .Y(\SUM\[14\] ) );
  NAND2xp5_ASAP7_75t_R U163 ( .A(n144), .B(n149), .Y(n155) );
  OR2x2_ASAP7_75t_R U164 ( .A(\A\[14\] ), .B(\B\[14\] ), .Y(n149) );
  NAND2xp5_ASAP7_75t_R U165 ( .A(\B\[14\] ), .B(\A\[14\] ), .Y(n144) );
  OAI21xp5_ASAP7_75t_R U166 ( .A1(n156), .A2(n11), .B(n142), .Y(n154) );
  INVx1_ASAP7_75t_R U167 ( .A(n150), .Y(n156) );
  XOR2xp5_ASAP7_75t_R U168 ( .A(n157), .B(n11), .Y(\SUM\[13\] ) );
  NAND2xp5_ASAP7_75t_R U169 ( .A(n150), .B(n142), .Y(n157) );
  NAND2xp5_ASAP7_75t_R U170 ( .A(\B\[13\] ), .B(\A\[13\] ), .Y(n142) );
  OR2x2_ASAP7_75t_R U171 ( .A(\A\[13\] ), .B(\B\[13\] ), .Y(n150) );
  XNOR2xp5_ASAP7_75t_R U172 ( .A(n10), .B(n159), .Y(\SUM\[12\] ) );
  INVx1_ASAP7_75t_R U173 ( .A(n138), .Y(n133) );
  OR2x2_ASAP7_75t_R U174 ( .A(\A\[12\] ), .B(\B\[12\] ), .Y(n138) );
  INVx1_ASAP7_75t_R U175 ( .A(n158), .Y(n148) );
  NAND2xp5_ASAP7_75t_R U176 ( .A(\B\[12\] ), .B(\A\[12\] ), .Y(n158) );
  INVx1_ASAP7_75t_R U177 ( .A(n147), .Y(n160) );
  OAI21xp5_ASAP7_75t_R U178 ( .A1(n161), .A2(n162), .B(n163), .Y(n147) );
  INVx1_ASAP7_75t_R U179 ( .A(n167), .Y(n166) );
  NAND2xp5_ASAP7_75t_R U180 ( .A(n165), .B(n168), .Y(n162) );
  OAI21xp5_ASAP7_75t_R U181 ( .A1(n15), .A2(n18), .B(n169), .Y(n161) );
  INVx1_ASAP7_75t_R U182 ( .A(n170), .Y(n18) );
  INVx1_ASAP7_75t_R U183 ( .A(n171), .Y(n15) );
  XNOR2xp5_ASAP7_75t_R U184 ( .A(n173), .B(n174), .Y(\SUM\[11\] ) );
  NAND2xp5_ASAP7_75t_R U185 ( .A(n165), .B(n167), .Y(n174) );
  NAND2xp5_ASAP7_75t_R U186 ( .A(\B\[11\] ), .B(\A\[11\] ), .Y(n167) );
  OR2x2_ASAP7_75t_R U187 ( .A(\A\[11\] ), .B(\B\[11\] ), .Y(n165) );
  OAI21xp5_ASAP7_75t_R U188 ( .A1(n175), .A2(n2), .B(n176), .Y(n173) );
  XNOR2xp5_ASAP7_75t_R U189 ( .A(n2), .B(n177), .Y(\SUM\[10\] ) );
  INVx1_ASAP7_75t_R U190 ( .A(n168), .Y(n175) );
  OR2x2_ASAP7_75t_R U191 ( .A(\A\[10\] ), .B(\B\[10\] ), .Y(n168) );
  INVx1_ASAP7_75t_R U192 ( .A(n176), .Y(n164) );
  NAND2xp5_ASAP7_75t_R U193 ( .A(\B\[10\] ), .B(\A\[10\] ), .Y(n176) );
  NAND2xp5_ASAP7_75t_R U194 ( .A(\B\[9\] ), .B(\A\[9\] ), .Y(n171) );
  INVx1_ASAP7_75t_R U195 ( .A(n169), .Y(n16) );
  OR2x2_ASAP7_75t_R U196 ( .A(\A\[9\] ), .B(\B\[9\] ), .Y(n169) );
  NAND2xp5_ASAP7_75t_R U197 ( .A(\B\[8\] ), .B(\A\[8\] ), .Y(n170) );
  INVx1_ASAP7_75t_R U198 ( .A(n172), .Y(n19) );
  OR2x2_ASAP7_75t_R U199 ( .A(\A\[8\] ), .B(\B\[8\] ), .Y(n172) );
  OAI21xp5_ASAP7_75t_R U200 ( .A1(n179), .A2(n180), .B(n181), .Y(n139) );
  INVx1_ASAP7_75t_R U201 ( .A(n23), .Y(n183) );
  NAND2xp5_ASAP7_75t_R U202 ( .A(\B\[7\] ), .B(\A\[7\] ), .Y(n23) );
  INVx1_ASAP7_75t_R U203 ( .A(n25), .Y(n182) );
  NAND2xp5_ASAP7_75t_R U204 ( .A(\B\[6\] ), .B(\A\[6\] ), .Y(n25) );
  NAND2xp5_ASAP7_75t_R U205 ( .A(n22), .B(n26), .Y(n180) );
  OAI21xp5_ASAP7_75t_R U206 ( .A1(n184), .A2(n33), .B(n30), .Y(n179) );
  INVx1_ASAP7_75t_R U207 ( .A(n32), .Y(n33) );
  NAND2xp5_ASAP7_75t_R U208 ( .A(\B\[4\] ), .B(\A\[4\] ), .Y(n32) );
  INVx1_ASAP7_75t_R U209 ( .A(n29), .Y(n184) );
  NAND2xp5_ASAP7_75t_R U210 ( .A(\B\[5\] ), .B(\A\[5\] ), .Y(n29) );
  OR2x2_ASAP7_75t_R U211 ( .A(\A\[5\] ), .B(\B\[5\] ), .Y(n30) );
  OR2x2_ASAP7_75t_R U212 ( .A(\A\[6\] ), .B(\B\[6\] ), .Y(n26) );
  OR2x2_ASAP7_75t_R U213 ( .A(\A\[7\] ), .B(\B\[7\] ), .Y(n22) );
endmodule


module fp32_exp_DW01_add_J9_1 ( .A({\A\[31\] , \A\[30\] , \A\[29\] , \A\[28\] , 
        \A\[27\] , \A\[26\] , \A\[25\] , \A\[24\] , \A\[23\] , \A\[22\] , 
        \A\[21\] , \A\[20\] , \A\[19\] , \A\[18\] , \A\[17\] , \A\[16\] , 
        \A\[15\] , \A\[14\] , \A\[13\] , \A\[12\] , \A\[11\] , \A\[10\] , 
        \A\[9\] , \A\[8\] , \A\[7\] , \A\[6\] , \A\[5\] , \A\[4\] , \A\[3\] , 
        \A\[2\] , \A\[1\] , \A\[0\] }), .B({\B\[31\] , \B\[30\] , \B\[29\] , 
        \B\[28\] , \B\[27\] , \B\[26\] , \B\[25\] , \B\[24\] , \B\[23\] , 
        \B\[22\] , \B\[21\] , \B\[20\] , \B\[19\] , \B\[18\] , \B\[17\] , 
        \B\[16\] , \B\[15\] , \B\[14\] , \B\[13\] , \B\[12\] , \B\[11\] , 
        \B\[10\] , \B\[9\] , \B\[8\] , \B\[7\] , \B\[6\] , \B\[5\] , \B\[4\] , 
        \B\[3\] , \B\[2\] , \B\[1\] , \B\[0\] }), CI, .SUM({\SUM\[31\] , 
        \SUM\[30\] , \SUM\[29\] , \SUM\[28\] , \SUM\[27\] , \SUM\[26\] , 
        \SUM\[25\] , \SUM\[24\] , \SUM\[23\] , \SUM\[22\] , \SUM\[21\] , 
        \SUM\[20\] , \SUM\[19\] , \SUM\[18\] , \SUM\[17\] , \SUM\[16\] , 
        \SUM\[15\] , \SUM\[14\] , \SUM\[13\] , \SUM\[12\] , \SUM\[11\] , 
        \SUM\[10\] , \SUM\[9\] , \SUM\[8\] , \SUM\[7\] , \SUM\[6\] , 
        \SUM\[5\] , \SUM\[4\] , \SUM\[3\] , \SUM\[2\] , \SUM\[1\] , \SUM\[0\] 
        }), CO );
  input \A\[31\] , \A\[30\] , \A\[29\] , \A\[28\] , \A\[27\] , \A\[26\] ,
         \A\[25\] , \A\[24\] , \A\[23\] , \A\[22\] , \A\[21\] , \A\[20\] ,
         \A\[19\] , \A\[18\] , \A\[17\] , \A\[16\] , \A\[15\] , \A\[14\] ,
         \A\[13\] , \A\[12\] , \A\[11\] , \A\[10\] , \A\[9\] , \A\[8\] ,
         \A\[7\] , \A\[6\] , \A\[5\] , \A\[4\] , \A\[3\] , \A\[2\] , \A\[1\] ,
         \A\[0\] , \B\[31\] , \B\[30\] , \B\[29\] , \B\[28\] , \B\[27\] ,
         \B\[26\] , \B\[25\] , \B\[24\] , \B\[23\] , \B\[22\] , \B\[21\] ,
         \B\[20\] , \B\[19\] , \B\[18\] , \B\[17\] , \B\[16\] , \B\[15\] ,
         \B\[14\] , \B\[13\] , \B\[12\] , \B\[11\] , \B\[10\] , \B\[9\] ,
         \B\[8\] , \B\[7\] , \B\[6\] , \B\[5\] , \B\[4\] , \B\[3\] , \B\[2\] ,
         \B\[1\] , \B\[0\] , CI;
  output \SUM\[31\] , \SUM\[30\] , \SUM\[29\] , \SUM\[28\] , \SUM\[27\] ,
         \SUM\[26\] , \SUM\[25\] , \SUM\[24\] , \SUM\[23\] , \SUM\[22\] ,
         \SUM\[21\] , \SUM\[20\] , \SUM\[19\] , \SUM\[18\] , \SUM\[17\] ,
         \SUM\[16\] , \SUM\[15\] , \SUM\[14\] , \SUM\[13\] , \SUM\[12\] ,
         \SUM\[11\] , \SUM\[10\] , \SUM\[9\] , \SUM\[8\] , \SUM\[7\] ,
         \SUM\[6\] , \SUM\[5\] , \SUM\[4\] , \SUM\[3\] , \SUM\[2\] ,
         \SUM\[1\] , \SUM\[0\] , CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72,
         n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86,
         n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100,
         n101, n102, n103, n104, n105, n106, n107, n108, n109, n110, n111,
         n112, n113, n114, n115, n116, n117, n118, n119, n120, n121, n122,
         n123, n124, n125, n126, n127, n128, n129, n130, n131, n132, n133,
         n134, n135, n136, n137, n138, n139, n140, n141, n142, n143, n144,
         n145, n146, n147, n148, n149, n150, n151, n152, n153, n154, n155,
         n156, n157, n158, n159, n160, n161, n162, n163, n164, n165, n166,
         n167, n168, n169, n170, n171, n172, n173, n174, n175, n176, n177,
         n178, n179, n180, n181, n182, n183, n184;

  NAND4xp25_ASAP7_75t_R U2 ( .A(n165), .B(n168), .C(n169), .D(n172), .Y(n132)
         );
  AOI21xp5_ASAP7_75t_R U3 ( .A1(n182), .A2(n22), .B(n183), .Y(n181) );
  OAI21xp5_ASAP7_75t_R U4 ( .A1(n42), .A2(n43), .B(n44), .Y(n41) );
  NAND4xp25_ASAP7_75t_R U5 ( .A(n137), .B(n138), .C(n139), .D(n9), .Y(n136) );
  AOI21xp5_ASAP7_75t_R U6 ( .A1(n164), .A2(n165), .B(n166), .Y(n163) );
  NOR2xp33_ASAP7_75t_R U7 ( .A(n39), .B(n40), .Y(n36) );
  OAI21xp5_ASAP7_75t_R U8 ( .A1(n50), .A2(n4), .B(n51), .Y(n45) );
  OAI21xp5_ASAP7_75t_R U9 ( .A1(n83), .A2(n8), .B(n84), .Y(n76) );
  OAI21xp5_ASAP7_75t_R U10 ( .A1(n120), .A2(n121), .B(n122), .Y(n113) );
  NOR2xp33_ASAP7_75t_R U11 ( .A(n164), .B(n175), .Y(n177) );
  NOR2xp33_ASAP7_75t_R U12 ( .A(n148), .B(n133), .Y(n159) );
  NOR2xp33_ASAP7_75t_R U13 ( .A(n15), .B(n16), .Y(n14) );
  NOR2xp33_ASAP7_75t_R U14 ( .A(n18), .B(n19), .Y(n17) );
  NOR2xp33_ASAP7_75t_R U15 ( .A(n33), .B(n13), .Y(\SUM\[4\] ) );
  OA21x2_ASAP7_75t_R U16 ( .A1(n67), .A2(n5), .B(n68), .Y(n1) );
  OA21x2_ASAP7_75t_R U17 ( .A1(n12), .A2(n16), .B(n171), .Y(n2) );
  OA21x2_ASAP7_75t_R U18 ( .A1(n28), .A2(n32), .B(n29), .Y(n3) );
  AOI21xp5_ASAP7_75t_R U19 ( .A1(n54), .A2(n55), .B(n56), .Y(n4) );
  OA21x2_ASAP7_75t_R U20 ( .A1(n73), .A2(n74), .B(n75), .Y(n5) );
  AND2x2_ASAP7_75t_R U21 ( .A(\A\[29\] ), .B(n36), .Y(n6) );
  AND2x2_ASAP7_75t_R U22 ( .A(\A\[30\] ), .B(n6), .Y(n7) );
  AOI21xp5_ASAP7_75t_R U23 ( .A1(n87), .A2(n88), .B(n89), .Y(n8) );
  AND3x1_ASAP7_75t_R U24 ( .A(n149), .B(n140), .C(n150), .Y(n9) );
  OA21x2_ASAP7_75t_R U25 ( .A1(n178), .A2(n132), .B(n160), .Y(n10) );
  OA21x2_ASAP7_75t_R U26 ( .A1(n133), .A2(n10), .B(n158), .Y(n11) );
  OA21x2_ASAP7_75t_R U27 ( .A1(n178), .A2(n19), .B(n170), .Y(n12) );
  NOR2xp33_ASAP7_75t_R U28 ( .A(\A\[4\] ), .B(\B\[4\] ), .Y(n13) );
  INVx1_ASAP7_75t_R U29 ( .A(\A\[29\] ), .Y(n37) );
  INVx1_ASAP7_75t_R U30 ( .A(\A\[28\] ), .Y(n40) );
  INVx1_ASAP7_75t_R U31 ( .A(\A\[30\] ), .Y(n35) );
  INVx1_ASAP7_75t_R U32 ( .A(\A\[31\] ), .Y(n34) );
  NOR3xp33_ASAP7_75t_R U33 ( .A(n128), .B(n129), .C(n130), .Y(n121) );
  XNOR2xp5_ASAP7_75t_R U34 ( .A(n12), .B(n14), .Y(\SUM\[9\] ) );
  XNOR2xp5_ASAP7_75t_R U35 ( .A(n178), .B(n17), .Y(\SUM\[8\] ) );
  XNOR2xp5_ASAP7_75t_R U36 ( .A(n20), .B(n21), .Y(\SUM\[7\] ) );
  NAND2xp5_ASAP7_75t_R U37 ( .A(n22), .B(n23), .Y(n21) );
  OAI21xp5_ASAP7_75t_R U38 ( .A1(n24), .A2(n3), .B(n25), .Y(n20) );
  INVx1_ASAP7_75t_R U39 ( .A(n26), .Y(n24) );
  XOR2xp5_ASAP7_75t_R U40 ( .A(n27), .B(n3), .Y(\SUM\[6\] ) );
  INVx1_ASAP7_75t_R U41 ( .A(n30), .Y(n28) );
  NAND2xp5_ASAP7_75t_R U42 ( .A(n26), .B(n25), .Y(n27) );
  XNOR2xp5_ASAP7_75t_R U43 ( .A(n33), .B(n31), .Y(\SUM\[5\] ) );
  NAND2xp5_ASAP7_75t_R U44 ( .A(n30), .B(n29), .Y(n31) );
  XNOR2xp5_ASAP7_75t_R U45 ( .A(n34), .B(n7), .Y(\SUM\[31\] ) );
  XNOR2xp5_ASAP7_75t_R U46 ( .A(n6), .B(n35), .Y(\SUM\[30\] ) );
  XOR2xp5_ASAP7_75t_R U47 ( .A(n37), .B(n38), .Y(\SUM\[29\] ) );
  INVx1_ASAP7_75t_R U48 ( .A(n36), .Y(n38) );
  INVx1_ASAP7_75t_R U49 ( .A(n41), .Y(n39) );
  XNOR2xp5_ASAP7_75t_R U50 ( .A(n41), .B(n40), .Y(\SUM\[28\] ) );
  INVx1_ASAP7_75t_R U51 ( .A(n45), .Y(n43) );
  INVx1_ASAP7_75t_R U52 ( .A(n46), .Y(n42) );
  XNOR2xp5_ASAP7_75t_R U53 ( .A(n45), .B(n47), .Y(\SUM\[27\] ) );
  NAND2xp5_ASAP7_75t_R U54 ( .A(n44), .B(n46), .Y(n47) );
  NAND2xp5_ASAP7_75t_R U55 ( .A(n48), .B(n49), .Y(n46) );
  INVx1_ASAP7_75t_R U56 ( .A(\A\[27\] ), .Y(n49) );
  INVx1_ASAP7_75t_R U57 ( .A(\B\[27\] ), .Y(n48) );
  NAND2xp5_ASAP7_75t_R U58 ( .A(\B\[27\] ), .B(\A\[27\] ), .Y(n44) );
  INVx1_ASAP7_75t_R U59 ( .A(n52), .Y(n50) );
  XOR2xp5_ASAP7_75t_R U60 ( .A(n53), .B(n4), .Y(\SUM\[26\] ) );
  INVx1_ASAP7_75t_R U61 ( .A(n57), .Y(n56) );
  NAND2xp5_ASAP7_75t_R U62 ( .A(n52), .B(n51), .Y(n53) );
  NAND2xp5_ASAP7_75t_R U63 ( .A(\B\[26\] ), .B(\A\[26\] ), .Y(n51) );
  NAND2xp5_ASAP7_75t_R U64 ( .A(n58), .B(n59), .Y(n52) );
  INVx1_ASAP7_75t_R U65 ( .A(\A\[26\] ), .Y(n59) );
  INVx1_ASAP7_75t_R U66 ( .A(\B\[26\] ), .Y(n58) );
  XNOR2xp5_ASAP7_75t_R U67 ( .A(n54), .B(n60), .Y(\SUM\[25\] ) );
  NAND2xp5_ASAP7_75t_R U68 ( .A(n55), .B(n57), .Y(n60) );
  NAND2xp5_ASAP7_75t_R U69 ( .A(\B\[25\] ), .B(\A\[25\] ), .Y(n57) );
  NAND2xp5_ASAP7_75t_R U70 ( .A(n61), .B(n62), .Y(n55) );
  INVx1_ASAP7_75t_R U71 ( .A(\A\[25\] ), .Y(n62) );
  INVx1_ASAP7_75t_R U72 ( .A(\B\[25\] ), .Y(n61) );
  OAI21xp5_ASAP7_75t_R U73 ( .A1(n63), .A2(n1), .B(n64), .Y(n54) );
  INVx1_ASAP7_75t_R U74 ( .A(n65), .Y(n63) );
  XOR2xp5_ASAP7_75t_R U75 ( .A(n66), .B(n1), .Y(\SUM\[24\] ) );
  INVx1_ASAP7_75t_R U76 ( .A(n69), .Y(n67) );
  NAND2xp5_ASAP7_75t_R U77 ( .A(n65), .B(n64), .Y(n66) );
  NAND2xp5_ASAP7_75t_R U78 ( .A(\B\[24\] ), .B(\A\[24\] ), .Y(n64) );
  NAND2xp5_ASAP7_75t_R U79 ( .A(n70), .B(n71), .Y(n65) );
  INVx1_ASAP7_75t_R U80 ( .A(\A\[24\] ), .Y(n71) );
  INVx1_ASAP7_75t_R U81 ( .A(\B\[24\] ), .Y(n70) );
  XOR2xp5_ASAP7_75t_R U82 ( .A(n72), .B(n5), .Y(\SUM\[23\] ) );
  INVx1_ASAP7_75t_R U83 ( .A(n76), .Y(n74) );
  INVx1_ASAP7_75t_R U84 ( .A(n77), .Y(n73) );
  NAND2xp5_ASAP7_75t_R U85 ( .A(n69), .B(n68), .Y(n72) );
  NAND2xp5_ASAP7_75t_R U86 ( .A(\B\[23\] ), .B(\A\[23\] ), .Y(n68) );
  NAND2xp5_ASAP7_75t_R U87 ( .A(n78), .B(n79), .Y(n69) );
  INVx1_ASAP7_75t_R U88 ( .A(\A\[23\] ), .Y(n79) );
  INVx1_ASAP7_75t_R U89 ( .A(\B\[23\] ), .Y(n78) );
  XNOR2xp5_ASAP7_75t_R U90 ( .A(n76), .B(n80), .Y(\SUM\[22\] ) );
  NAND2xp5_ASAP7_75t_R U91 ( .A(n75), .B(n77), .Y(n80) );
  NAND2xp5_ASAP7_75t_R U92 ( .A(n81), .B(n82), .Y(n77) );
  INVx1_ASAP7_75t_R U93 ( .A(\A\[22\] ), .Y(n82) );
  INVx1_ASAP7_75t_R U94 ( .A(\B\[22\] ), .Y(n81) );
  NAND2xp5_ASAP7_75t_R U95 ( .A(\B\[22\] ), .B(\A\[22\] ), .Y(n75) );
  INVx1_ASAP7_75t_R U96 ( .A(n85), .Y(n83) );
  XOR2xp5_ASAP7_75t_R U97 ( .A(n86), .B(n8), .Y(\SUM\[21\] ) );
  INVx1_ASAP7_75t_R U98 ( .A(n90), .Y(n89) );
  NAND2xp5_ASAP7_75t_R U99 ( .A(n85), .B(n84), .Y(n86) );
  NAND2xp5_ASAP7_75t_R U100 ( .A(\B\[21\] ), .B(\A\[21\] ), .Y(n84) );
  NAND2xp5_ASAP7_75t_R U101 ( .A(n91), .B(n92), .Y(n85) );
  INVx1_ASAP7_75t_R U102 ( .A(\A\[21\] ), .Y(n92) );
  INVx1_ASAP7_75t_R U103 ( .A(\B\[21\] ), .Y(n91) );
  XNOR2xp5_ASAP7_75t_R U104 ( .A(n87), .B(n93), .Y(\SUM\[20\] ) );
  NAND2xp5_ASAP7_75t_R U105 ( .A(n88), .B(n90), .Y(n93) );
  NAND2xp5_ASAP7_75t_R U106 ( .A(\B\[20\] ), .B(\A\[20\] ), .Y(n90) );
  NAND2xp5_ASAP7_75t_R U107 ( .A(n94), .B(n95), .Y(n88) );
  INVx1_ASAP7_75t_R U108 ( .A(\A\[20\] ), .Y(n95) );
  INVx1_ASAP7_75t_R U109 ( .A(\B\[20\] ), .Y(n94) );
  OAI21xp5_ASAP7_75t_R U110 ( .A1(n96), .A2(n97), .B(n98), .Y(n87) );
  INVx1_ASAP7_75t_R U111 ( .A(n99), .Y(n97) );
  INVx1_ASAP7_75t_R U112 ( .A(n100), .Y(n96) );
  XNOR2xp5_ASAP7_75t_R U113 ( .A(n99), .B(n101), .Y(\SUM\[19\] ) );
  NAND2xp5_ASAP7_75t_R U114 ( .A(n98), .B(n100), .Y(n101) );
  NAND2xp5_ASAP7_75t_R U115 ( .A(n102), .B(n103), .Y(n100) );
  INVx1_ASAP7_75t_R U116 ( .A(\A\[19\] ), .Y(n103) );
  INVx1_ASAP7_75t_R U117 ( .A(\B\[19\] ), .Y(n102) );
  NAND2xp5_ASAP7_75t_R U118 ( .A(\B\[19\] ), .B(\A\[19\] ), .Y(n98) );
  OAI21xp5_ASAP7_75t_R U119 ( .A1(n104), .A2(n105), .B(n106), .Y(n99) );
  INVx1_ASAP7_75t_R U120 ( .A(n107), .Y(n105) );
  INVx1_ASAP7_75t_R U121 ( .A(n108), .Y(n104) );
  XNOR2xp5_ASAP7_75t_R U122 ( .A(n109), .B(n107), .Y(\SUM\[18\] ) );
  OAI21xp5_ASAP7_75t_R U123 ( .A1(n110), .A2(n111), .B(n112), .Y(n107) );
  INVx1_ASAP7_75t_R U124 ( .A(n113), .Y(n111) );
  INVx1_ASAP7_75t_R U125 ( .A(n114), .Y(n110) );
  NAND2xp5_ASAP7_75t_R U126 ( .A(n106), .B(n108), .Y(n109) );
  NAND2xp5_ASAP7_75t_R U127 ( .A(n115), .B(n116), .Y(n108) );
  INVx1_ASAP7_75t_R U128 ( .A(\A\[18\] ), .Y(n116) );
  INVx1_ASAP7_75t_R U129 ( .A(\B\[18\] ), .Y(n115) );
  NAND2xp5_ASAP7_75t_R U130 ( .A(\B\[18\] ), .B(\A\[18\] ), .Y(n106) );
  XNOR2xp5_ASAP7_75t_R U131 ( .A(n113), .B(n117), .Y(\SUM\[17\] ) );
  NAND2xp5_ASAP7_75t_R U132 ( .A(n112), .B(n114), .Y(n117) );
  NAND2xp5_ASAP7_75t_R U133 ( .A(n118), .B(n119), .Y(n114) );
  INVx1_ASAP7_75t_R U134 ( .A(\A\[17\] ), .Y(n119) );
  INVx1_ASAP7_75t_R U135 ( .A(\B\[17\] ), .Y(n118) );
  NAND2xp5_ASAP7_75t_R U136 ( .A(\B\[17\] ), .B(\A\[17\] ), .Y(n112) );
  INVx1_ASAP7_75t_R U137 ( .A(n123), .Y(n120) );
  XNOR2xp5_ASAP7_75t_R U138 ( .A(n124), .B(n125), .Y(\SUM\[16\] ) );
  NAND2xp5_ASAP7_75t_R U139 ( .A(n122), .B(n123), .Y(n125) );
  NAND2xp5_ASAP7_75t_R U140 ( .A(n126), .B(n127), .Y(n123) );
  INVx1_ASAP7_75t_R U141 ( .A(\A\[16\] ), .Y(n127) );
  INVx1_ASAP7_75t_R U142 ( .A(\B\[16\] ), .Y(n126) );
  NAND2xp5_ASAP7_75t_R U143 ( .A(\B\[16\] ), .B(\A\[16\] ), .Y(n122) );
  INVx1_ASAP7_75t_R U144 ( .A(n121), .Y(n124) );
  INVx1_ASAP7_75t_R U145 ( .A(n131), .Y(n130) );
  OAI21xp5_ASAP7_75t_R U146 ( .A1(n134), .A2(n135), .B(n136), .Y(n129) );
  INVx1_ASAP7_75t_R U147 ( .A(n132), .Y(n137) );
  NAND2xp5_ASAP7_75t_R U148 ( .A(n140), .B(n141), .Y(n135) );
  INVx1_ASAP7_75t_R U149 ( .A(n142), .Y(n141) );
  OAI211xp5_ASAP7_75t_R U150 ( .A1(n143), .A2(n144), .B(n145), .C(n146), .Y(
        n128) );
  NAND3xp33_ASAP7_75t_R U151 ( .A(n138), .B(n147), .C(n9), .Y(n146) );
  NAND2xp5_ASAP7_75t_R U152 ( .A(n148), .B(n9), .Y(n145) );
  INVx1_ASAP7_75t_R U153 ( .A(n140), .Y(n143) );
  XNOR2xp5_ASAP7_75t_R U154 ( .A(n151), .B(n152), .Y(\SUM\[15\] ) );
  NAND2xp5_ASAP7_75t_R U155 ( .A(n140), .B(n131), .Y(n152) );
  NAND2xp5_ASAP7_75t_R U156 ( .A(\B\[15\] ), .B(\A\[15\] ), .Y(n131) );
  OR2x2_ASAP7_75t_R U157 ( .A(\A\[15\] ), .B(\B\[15\] ), .Y(n140) );
  OAI21xp5_ASAP7_75t_R U158 ( .A1(n134), .A2(n153), .B(n144), .Y(n151) );
  INVx1_ASAP7_75t_R U159 ( .A(n154), .Y(n153) );
  INVx1_ASAP7_75t_R U160 ( .A(n149), .Y(n134) );
  XNOR2xp5_ASAP7_75t_R U161 ( .A(n154), .B(n155), .Y(\SUM\[14\] ) );
  NAND2xp5_ASAP7_75t_R U162 ( .A(n144), .B(n149), .Y(n155) );
  OR2x2_ASAP7_75t_R U163 ( .A(\A\[14\] ), .B(\B\[14\] ), .Y(n149) );
  NAND2xp5_ASAP7_75t_R U164 ( .A(\B\[14\] ), .B(\A\[14\] ), .Y(n144) );
  OAI21xp5_ASAP7_75t_R U165 ( .A1(n156), .A2(n11), .B(n142), .Y(n154) );
  INVx1_ASAP7_75t_R U166 ( .A(n150), .Y(n156) );
  XOR2xp5_ASAP7_75t_R U167 ( .A(n157), .B(n11), .Y(\SUM\[13\] ) );
  NAND2xp5_ASAP7_75t_R U168 ( .A(n150), .B(n142), .Y(n157) );
  NAND2xp5_ASAP7_75t_R U169 ( .A(\B\[13\] ), .B(\A\[13\] ), .Y(n142) );
  OR2x2_ASAP7_75t_R U170 ( .A(\A\[13\] ), .B(\B\[13\] ), .Y(n150) );
  XNOR2xp5_ASAP7_75t_R U171 ( .A(n10), .B(n159), .Y(\SUM\[12\] ) );
  INVx1_ASAP7_75t_R U172 ( .A(n138), .Y(n133) );
  OR2x2_ASAP7_75t_R U173 ( .A(\A\[12\] ), .B(\B\[12\] ), .Y(n138) );
  INVx1_ASAP7_75t_R U174 ( .A(n158), .Y(n148) );
  NAND2xp5_ASAP7_75t_R U175 ( .A(\B\[12\] ), .B(\A\[12\] ), .Y(n158) );
  INVx1_ASAP7_75t_R U176 ( .A(n147), .Y(n160) );
  OAI21xp5_ASAP7_75t_R U177 ( .A1(n161), .A2(n162), .B(n163), .Y(n147) );
  INVx1_ASAP7_75t_R U178 ( .A(n167), .Y(n166) );
  NAND2xp5_ASAP7_75t_R U179 ( .A(n165), .B(n168), .Y(n162) );
  OAI21xp5_ASAP7_75t_R U180 ( .A1(n15), .A2(n18), .B(n169), .Y(n161) );
  INVx1_ASAP7_75t_R U181 ( .A(n170), .Y(n18) );
  INVx1_ASAP7_75t_R U182 ( .A(n171), .Y(n15) );
  XNOR2xp5_ASAP7_75t_R U183 ( .A(n173), .B(n174), .Y(\SUM\[11\] ) );
  NAND2xp5_ASAP7_75t_R U184 ( .A(n165), .B(n167), .Y(n174) );
  NAND2xp5_ASAP7_75t_R U185 ( .A(\B\[11\] ), .B(\A\[11\] ), .Y(n167) );
  OR2x2_ASAP7_75t_R U186 ( .A(\A\[11\] ), .B(\B\[11\] ), .Y(n165) );
  OAI21xp5_ASAP7_75t_R U187 ( .A1(n175), .A2(n2), .B(n176), .Y(n173) );
  XNOR2xp5_ASAP7_75t_R U188 ( .A(n2), .B(n177), .Y(\SUM\[10\] ) );
  INVx1_ASAP7_75t_R U189 ( .A(n168), .Y(n175) );
  OR2x2_ASAP7_75t_R U190 ( .A(\A\[10\] ), .B(\B\[10\] ), .Y(n168) );
  INVx1_ASAP7_75t_R U191 ( .A(n176), .Y(n164) );
  NAND2xp5_ASAP7_75t_R U192 ( .A(\B\[10\] ), .B(\A\[10\] ), .Y(n176) );
  NAND2xp5_ASAP7_75t_R U193 ( .A(\B\[9\] ), .B(\A\[9\] ), .Y(n171) );
  INVx1_ASAP7_75t_R U194 ( .A(n169), .Y(n16) );
  OR2x2_ASAP7_75t_R U195 ( .A(\A\[9\] ), .B(\B\[9\] ), .Y(n169) );
  NAND2xp5_ASAP7_75t_R U196 ( .A(\B\[8\] ), .B(\A\[8\] ), .Y(n170) );
  INVx1_ASAP7_75t_R U197 ( .A(n172), .Y(n19) );
  OR2x2_ASAP7_75t_R U198 ( .A(\A\[8\] ), .B(\B\[8\] ), .Y(n172) );
  INVx1_ASAP7_75t_R U199 ( .A(n139), .Y(n178) );
  OAI21xp5_ASAP7_75t_R U200 ( .A1(n179), .A2(n180), .B(n181), .Y(n139) );
  INVx1_ASAP7_75t_R U201 ( .A(n23), .Y(n183) );
  NAND2xp5_ASAP7_75t_R U202 ( .A(\B\[7\] ), .B(\A\[7\] ), .Y(n23) );
  INVx1_ASAP7_75t_R U203 ( .A(n25), .Y(n182) );
  NAND2xp5_ASAP7_75t_R U204 ( .A(\B\[6\] ), .B(\A\[6\] ), .Y(n25) );
  NAND2xp5_ASAP7_75t_R U205 ( .A(n22), .B(n26), .Y(n180) );
  OAI21xp5_ASAP7_75t_R U206 ( .A1(n184), .A2(n33), .B(n30), .Y(n179) );
  INVx1_ASAP7_75t_R U207 ( .A(n32), .Y(n33) );
  NAND2xp5_ASAP7_75t_R U208 ( .A(\B\[4\] ), .B(\A\[4\] ), .Y(n32) );
  INVx1_ASAP7_75t_R U209 ( .A(n29), .Y(n184) );
  NAND2xp5_ASAP7_75t_R U210 ( .A(\B\[5\] ), .B(\A\[5\] ), .Y(n29) );
  OR2x2_ASAP7_75t_R U211 ( .A(\A\[5\] ), .B(\B\[5\] ), .Y(n30) );
  OR2x2_ASAP7_75t_R U212 ( .A(\A\[6\] ), .B(\B\[6\] ), .Y(n26) );
  OR2x2_ASAP7_75t_R U213 ( .A(\A\[7\] ), .B(\B\[7\] ), .Y(n22) );
endmodule


module fp32_exp ( clk, rst_n, in_valid, .x({\x\[31\] , \x\[30\] , \x\[29\] , 
        \x\[28\] , \x\[27\] , \x\[26\] , \x\[25\] , \x\[24\] , \x\[23\] , 
        \x\[22\] , \x\[21\] , \x\[20\] , \x\[19\] , \x\[18\] , \x\[17\] , 
        \x\[16\] , \x\[15\] , \x\[14\] , \x\[13\] , \x\[12\] , \x\[11\] , 
        \x\[10\] , \x\[9\] , \x\[8\] , \x\[7\] , \x\[6\] , \x\[5\] , \x\[4\] , 
        \x\[3\] , \x\[2\] , \x\[1\] , \x\[0\] }), .y({\y\[31\] , \y\[30\] , 
        \y\[29\] , \y\[28\] , \y\[27\] , \y\[26\] , \y\[25\] , \y\[24\] , 
        \y\[23\] , \y\[22\] , \y\[21\] , \y\[20\] , \y\[19\] , \y\[18\] , 
        \y\[17\] , \y\[16\] , \y\[15\] , \y\[14\] , \y\[13\] , \y\[12\] , 
        \y\[11\] , \y\[10\] , \y\[9\] , \y\[8\] , \y\[7\] , \y\[6\] , \y\[5\] , 
        \y\[4\] , \y\[3\] , \y\[2\] , \y\[1\] , \y\[0\] }), out_valid );
  input clk, rst_n, in_valid, \x\[31\] , \x\[30\] , \x\[29\] , \x\[28\] ,
         \x\[27\] , \x\[26\] , \x\[25\] , \x\[24\] , \x\[23\] , \x\[22\] ,
         \x\[21\] , \x\[20\] , \x\[19\] , \x\[18\] , \x\[17\] , \x\[16\] ,
         \x\[15\] , \x\[14\] , \x\[13\] , \x\[12\] , \x\[11\] , \x\[10\] ,
         \x\[9\] , \x\[8\] , \x\[7\] , \x\[6\] , \x\[5\] , \x\[4\] , \x\[3\] ,
         \x\[2\] , \x\[1\] , \x\[0\] ;
  output \y\[31\] , \y\[30\] , \y\[29\] , \y\[28\] , \y\[27\] , \y\[26\] ,
         \y\[25\] , \y\[24\] , \y\[23\] , \y\[22\] , \y\[21\] , \y\[20\] ,
         \y\[19\] , \y\[18\] , \y\[17\] , \y\[16\] , \y\[15\] , \y\[14\] ,
         \y\[13\] , \y\[12\] , \y\[11\] , \y\[10\] , \y\[9\] , \y\[8\] ,
         \y\[7\] , \y\[6\] , \y\[5\] , \y\[4\] , \y\[3\] , \y\[2\] , \y\[1\] ,
         \y\[0\] , out_valid;
  wire   \rexp\[9\] , \rexp\[7\] , \rexp\[6\] , \rexp\[4\] , \rexp\[3\] , N135,
         N192, N193, N194, N195, N196, N197, N198, N199, N200, N201, N202,
         N203, N204, N205, N206, N207, N208, N209, N210, N211, N212, N213,
         N214, N215, s1_valid, s1_is_nan, s1_is_inf, s1_is_zero_sub, s1_is_pos,
         s1_clamp_big, \s1_mag_u\[30\] , \s1_mag_u\[29\] , \s1_mag_u\[28\] ,
         \s1_mag_u\[27\] , \s1_mag_u\[26\] , \s1_mag_u\[25\] ,
         \s1_mag_u\[24\] , \s1_mag_u\[23\] , \s1_mag_u\[22\] ,
         \s1_mag_u\[21\] , \s1_mag_u\[20\] , \s1_mag_u\[19\] ,
         \s1_mag_u\[18\] , \s1_mag_u\[17\] , \s1_mag_u\[16\] ,
         \s1_mag_u\[15\] , \s1_mag_u\[14\] , \s1_mag_u\[13\] ,
         \s1_mag_u\[12\] , \s1_mag_u\[11\] , \s1_mag_u\[10\] , \s1_mag_u\[9\] ,
         \s1_mag_u\[8\] , \s1_mag_u\[7\] , \s1_mag_u\[6\] , \s1_mag_u\[5\] ,
         \s1_mag_u\[4\] , \s1_mag_u\[3\] , \s1_mag_u\[2\] , \s1_mag_u\[1\] ,
         \s1_mag_u\[0\] , \p0\[27\] , \p0\[26\] , \p0\[25\] , \p0\[24\] ,
         \p0\[23\] , \p0\[22\] , \p0\[21\] , \p0\[20\] , \p0\[19\] ,
         \p0\[18\] , \p0\[17\] , \p0\[16\] , \p0\[15\] , \p0\[14\] ,
         \p0\[13\] , \p0\[12\] , \p0\[11\] , \p0\[10\] , \p0\[9\] , \p0\[8\] ,
         \p0\[7\] , \p0\[6\] , \p0\[5\] , \p0\[4\] , \p0\[3\] , \p0\[2\] ,
         \p0\[1\] , \p1\[27\] , \p1\[26\] , \p1\[25\] , \p1\[24\] , \p1\[23\] ,
         \p1\[22\] , \p1\[21\] , \p1\[20\] , \p1\[19\] , \p1\[18\] ,
         \p1\[17\] , \p1\[16\] , \p1\[15\] , \p1\[14\] , \p1\[13\] ,
         \p1\[12\] , \p1\[11\] , \p1\[10\] , \p1\[9\] , \p1\[8\] , \p1\[7\] ,
         \p1\[6\] , \p1\[5\] , \p1\[4\] , \p1\[3\] , \p1\[2\] , \p1\[1\] ,
         \p2\[27\] , \p2\[26\] , \p2\[25\] , \p2\[24\] , \p2\[23\] ,
         \p2\[22\] , \p2\[21\] , \p2\[20\] , \p2\[19\] , \p2\[18\] ,
         \p2\[17\] , \p2\[16\] , \p2\[15\] , \p2\[14\] , \p2\[13\] ,
         \p2\[12\] , \p2\[11\] , \p2\[10\] , \p2\[9\] , \p2\[8\] , \p2\[7\] ,
         \p2\[6\] , \p2\[5\] , \p2\[4\] , \p2\[3\] , \p2\[2\] , \p2\[1\] ,
         \p3\[27\] , \p3\[26\] , \p3\[25\] , \p3\[24\] , \p3\[23\] ,
         \p3\[22\] , \p3\[21\] , \p3\[20\] , \p3\[19\] , \p3\[18\] ,
         \p3\[17\] , \p3\[16\] , \p3\[15\] , \p3\[14\] , \p3\[13\] ,
         \p3\[12\] , \p3\[11\] , \p3\[10\] , \p3\[9\] , \p3\[8\] , \p3\[7\] ,
         \p3\[6\] , \p3\[5\] , \p3\[4\] , \p3\[3\] , \p3\[2\] , \p3\[1\] ,
         \p4\[27\] , \p4\[26\] , \p4\[25\] , \p4\[24\] , \p4\[23\] ,
         \p4\[22\] , \p4\[21\] , \p4\[20\] , \p4\[19\] , \p4\[18\] ,
         \p4\[17\] , \p4\[16\] , \p4\[15\] , \p4\[14\] , \p4\[13\] ,
         \p4\[12\] , \p4\[11\] , \p4\[10\] , \p4\[9\] , \p4\[8\] , \p4\[7\] ,
         \p4\[6\] , \p4\[5\] , \p4\[4\] , \p4\[3\] , \p4\[2\] , \p4\[1\] ,
         \p5\[27\] , \p5\[26\] , \p5\[25\] , \p5\[24\] , \p5\[23\] ,
         \p5\[22\] , \p5\[21\] , \p5\[20\] , \p5\[19\] , \p5\[18\] ,
         \p5\[17\] , \p5\[16\] , \p5\[15\] , \p5\[14\] , \p5\[13\] ,
         \p5\[12\] , \p5\[11\] , \p5\[10\] , \p5\[9\] , \p5\[8\] , \p5\[7\] ,
         \p5\[6\] , \p5\[5\] , \p5\[4\] , \p5\[3\] , \p5\[2\] , \p5\[1\] ,
         \p6\[27\] , \p6\[26\] , \p6\[25\] , \p6\[24\] , \p6\[23\] ,
         \p6\[22\] , \p6\[21\] , \p6\[20\] , \p6\[19\] , \p6\[18\] ,
         \p6\[17\] , \p6\[16\] , \p6\[15\] , \p6\[14\] , \p6\[13\] ,
         \p6\[12\] , \p6\[11\] , \p6\[10\] , \p6\[9\] , \p6\[8\] , \p6\[7\] ,
         \p6\[6\] , \p6\[5\] , \p6\[4\] , \p6\[3\] , \p6\[2\] , \p6\[1\] ,
         \p7\[27\] , \p7\[26\] , \p7\[25\] , \p7\[24\] , \p7\[23\] ,
         \p7\[22\] , \p7\[21\] , \p7\[20\] , \p7\[19\] , \p7\[18\] ,
         \p7\[17\] , \p7\[16\] , \p7\[15\] , \p7\[14\] , \p7\[13\] ,
         \p7\[12\] , \p7\[11\] , \p7\[10\] , \p7\[9\] , \p7\[8\] , \p7\[7\] ,
         \p7\[6\] , \p7\[5\] , \p7\[4\] , \p7\[3\] , \p7\[2\] , \p7\[1\] ,
         \s2q_p1\[27\] , \s2q_p1\[26\] , \s2q_p1\[25\] , \s2q_p1\[24\] ,
         \s2q_p1\[23\] , \s2q_p1\[22\] , \s2q_p1\[21\] , \s2q_p1\[20\] ,
         \s2q_p1\[19\] , \s2q_p1\[18\] , \s2q_p1\[17\] , \s2q_p1\[16\] ,
         \s2q_p1\[15\] , \s2q_p1\[14\] , \s2q_p1\[13\] , \s2q_p1\[12\] ,
         \s2q_p1\[11\] , \s2q_p1\[10\] , \s2q_p1\[9\] , \s2q_p1\[8\] ,
         \s2q_p1\[7\] , \s2q_p1\[6\] , \s2q_p1\[5\] , \s2q_p1\[4\] ,
         \s2q_p1\[3\] , \s2q_p1\[2\] , \s2q_p1\[1\] , \s2q_p1\[0\] ,
         \s2q_p0\[27\] , \s2q_p0\[26\] , \s2q_p0\[25\] , \s2q_p0\[24\] ,
         \s2q_p0\[23\] , \s2q_p0\[22\] , \s2q_p0\[21\] , \s2q_p0\[20\] ,
         \s2q_p0\[19\] , \s2q_p0\[18\] , \s2q_p0\[17\] , \s2q_p0\[16\] ,
         \s2q_p0\[15\] , \s2q_p0\[14\] , \s2q_p0\[13\] , \s2q_p0\[12\] ,
         \s2q_p0\[11\] , \s2q_p0\[10\] , \s2q_p0\[9\] , \s2q_p0\[8\] ,
         \s2q_p0\[7\] , \s2q_p0\[6\] , \s2q_p0\[5\] , \s2q_p0\[4\] ,
         \s2q_p0\[3\] , \s2q_p0\[2\] , \s2q_p0\[1\] , \s2q_p0\[0\] ,
         \prod_lo_lo\[31\] , \prod_lo_lo\[30\] , \prod_lo_lo\[29\] ,
         \prod_lo_lo\[28\] , \prod_lo_lo\[27\] , \prod_lo_lo\[26\] ,
         \prod_lo_lo\[25\] , \prod_lo_lo\[24\] , \prod_lo_lo\[23\] ,
         \prod_lo_lo\[22\] , \prod_lo_lo\[21\] , \prod_lo_lo\[20\] ,
         \prod_lo_lo\[19\] , \prod_lo_lo\[18\] , \prod_lo_lo\[17\] ,
         \prod_lo_lo\[16\] , \prod_lo_lo\[15\] , \prod_lo_lo\[14\] ,
         \prod_lo_lo\[13\] , \prod_lo_lo\[12\] , \prod_lo_lo\[11\] ,
         \prod_lo_lo\[10\] , \prod_lo_lo\[9\] , \prod_lo_lo\[8\] ,
         \prod_lo_lo\[7\] , \prod_lo_lo\[6\] , \prod_lo_lo\[5\] ,
         \prod_lo_lo\[4\] , \s2q_p3\[27\] , \s2q_p3\[26\] , \s2q_p3\[25\] ,
         \s2q_p3\[24\] , \s2q_p3\[23\] , \s2q_p3\[22\] , \s2q_p3\[21\] ,
         \s2q_p3\[20\] , \s2q_p3\[19\] , \s2q_p3\[18\] , \s2q_p3\[17\] ,
         \s2q_p3\[16\] , \s2q_p3\[15\] , \s2q_p3\[14\] , \s2q_p3\[13\] ,
         \s2q_p3\[12\] , \s2q_p3\[11\] , \s2q_p3\[10\] , \s2q_p3\[9\] ,
         \s2q_p3\[8\] , \s2q_p3\[7\] , \s2q_p3\[6\] , \s2q_p3\[5\] ,
         \s2q_p3\[4\] , \s2q_p3\[3\] , \s2q_p3\[2\] , \s2q_p3\[1\] ,
         \s2q_p3\[0\] , \s2q_p2\[27\] , \s2q_p2\[26\] , \s2q_p2\[25\] ,
         \s2q_p2\[24\] , \s2q_p2\[23\] , \s2q_p2\[22\] , \s2q_p2\[21\] ,
         \s2q_p2\[20\] , \s2q_p2\[19\] , \s2q_p2\[18\] , \s2q_p2\[17\] ,
         \s2q_p2\[16\] , \s2q_p2\[15\] , \s2q_p2\[14\] , \s2q_p2\[13\] ,
         \s2q_p2\[12\] , \s2q_p2\[11\] , \s2q_p2\[10\] , \s2q_p2\[9\] ,
         \s2q_p2\[8\] , \s2q_p2\[7\] , \s2q_p2\[6\] , \s2q_p2\[5\] ,
         \s2q_p2\[4\] , \s2q_p2\[3\] , \s2q_p2\[2\] , \s2q_p2\[1\] ,
         \s2q_p2\[0\] , \prod_lo_hi\[31\] , \prod_lo_hi\[30\] ,
         \prod_lo_hi\[29\] , \prod_lo_hi\[28\] , \prod_lo_hi\[27\] ,
         \prod_lo_hi\[26\] , \prod_lo_hi\[25\] , \prod_lo_hi\[24\] ,
         \prod_lo_hi\[23\] , \prod_lo_hi\[22\] , \prod_lo_hi\[21\] ,
         \prod_lo_hi\[20\] , \prod_lo_hi\[19\] , \prod_lo_hi\[18\] ,
         \prod_lo_hi\[17\] , \prod_lo_hi\[16\] , \prod_lo_hi\[15\] ,
         \prod_lo_hi\[14\] , \prod_lo_hi\[13\] , \prod_lo_hi\[12\] ,
         \prod_lo_hi\[11\] , \prod_lo_hi\[10\] , \prod_lo_hi\[9\] ,
         \prod_lo_hi\[8\] , \prod_lo_hi\[7\] , \prod_lo_hi\[6\] ,
         \prod_lo_hi\[5\] , \prod_lo_hi\[4\] , \s2q_p5\[27\] , \s2q_p5\[26\] ,
         \s2q_p5\[25\] , \s2q_p5\[24\] , \s2q_p5\[23\] , \s2q_p5\[22\] ,
         \s2q_p5\[21\] , \s2q_p5\[20\] , \s2q_p5\[19\] , \s2q_p5\[18\] ,
         \s2q_p5\[17\] , \s2q_p5\[16\] , \s2q_p5\[15\] , \s2q_p5\[14\] ,
         \s2q_p5\[13\] , \s2q_p5\[12\] , \s2q_p5\[11\] , \s2q_p5\[10\] ,
         \s2q_p5\[9\] , \s2q_p5\[8\] , \s2q_p5\[7\] , \s2q_p5\[6\] ,
         \s2q_p5\[5\] , \s2q_p5\[4\] , \s2q_p5\[3\] , \s2q_p5\[2\] ,
         \s2q_p5\[1\] , \s2q_p5\[0\] , \s2q_p4\[27\] , \s2q_p4\[26\] ,
         \s2q_p4\[25\] , \s2q_p4\[24\] , \s2q_p4\[23\] , \s2q_p4\[22\] ,
         \s2q_p4\[21\] , \s2q_p4\[20\] , \s2q_p4\[19\] , \s2q_p4\[18\] ,
         \s2q_p4\[17\] , \s2q_p4\[16\] , \s2q_p4\[15\] , \s2q_p4\[14\] ,
         \s2q_p4\[13\] , \s2q_p4\[12\] , \s2q_p4\[11\] , \s2q_p4\[10\] ,
         \s2q_p4\[9\] , \s2q_p4\[8\] , \s2q_p4\[7\] , \s2q_p4\[6\] ,
         \s2q_p4\[5\] , \s2q_p4\[4\] , \s2q_p4\[3\] , \s2q_p4\[2\] ,
         \s2q_p4\[1\] , \s2q_p4\[0\] , \prod_hi_lo\[31\] , \prod_hi_lo\[30\] ,
         \prod_hi_lo\[29\] , \prod_hi_lo\[28\] , \prod_hi_lo\[27\] ,
         \prod_hi_lo\[26\] , \prod_hi_lo\[25\] , \prod_hi_lo\[24\] ,
         \prod_hi_lo\[23\] , \prod_hi_lo\[22\] , \prod_hi_lo\[21\] ,
         \prod_hi_lo\[20\] , \prod_hi_lo\[19\] , \prod_hi_lo\[18\] ,
         \prod_hi_lo\[17\] , \prod_hi_lo\[16\] , \prod_hi_lo\[15\] ,
         \prod_hi_lo\[14\] , \prod_hi_lo\[13\] , \prod_hi_lo\[12\] ,
         \prod_hi_lo\[11\] , \prod_hi_lo\[10\] , \prod_hi_lo\[9\] ,
         \prod_hi_lo\[8\] , \prod_hi_lo\[7\] , \prod_hi_lo\[6\] ,
         \prod_hi_lo\[5\] , \prod_hi_lo\[4\] , \s2q_p7\[27\] , \s2q_p7\[26\] ,
         \s2q_p7\[25\] , \s2q_p7\[24\] , \s2q_p7\[23\] , \s2q_p7\[22\] ,
         \s2q_p7\[21\] , \s2q_p7\[20\] , \s2q_p7\[19\] , \s2q_p7\[18\] ,
         \s2q_p7\[17\] , \s2q_p7\[16\] , \s2q_p7\[15\] , \s2q_p7\[14\] ,
         \s2q_p7\[13\] , \s2q_p7\[12\] , \s2q_p7\[11\] , \s2q_p7\[10\] ,
         \s2q_p7\[9\] , \s2q_p7\[8\] , \s2q_p7\[7\] , \s2q_p7\[6\] ,
         \s2q_p7\[5\] , \s2q_p7\[4\] , \s2q_p7\[3\] , \s2q_p7\[2\] ,
         \s2q_p7\[1\] , \s2q_p7\[0\] , \s2q_p6\[27\] , \s2q_p6\[26\] ,
         \s2q_p6\[25\] , \s2q_p6\[24\] , \s2q_p6\[23\] , \s2q_p6\[22\] ,
         \s2q_p6\[21\] , \s2q_p6\[20\] , \s2q_p6\[19\] , \s2q_p6\[18\] ,
         \s2q_p6\[17\] , \s2q_p6\[16\] , \s2q_p6\[15\] , \s2q_p6\[14\] ,
         \s2q_p6\[13\] , \s2q_p6\[12\] , \s2q_p6\[11\] , \s2q_p6\[10\] ,
         \s2q_p6\[9\] , \s2q_p6\[8\] , \s2q_p6\[7\] , \s2q_p6\[6\] ,
         \s2q_p6\[5\] , \s2q_p6\[4\] , \s2q_p6\[3\] , \s2q_p6\[2\] ,
         \s2q_p6\[1\] , \s2q_p6\[0\] , \prod_hi_hi\[31\] , \prod_hi_hi\[30\] ,
         \prod_hi_hi\[29\] , \prod_hi_hi\[28\] , \prod_hi_hi\[27\] ,
         \prod_hi_hi\[26\] , \prod_hi_hi\[25\] , \prod_hi_hi\[24\] ,
         \prod_hi_hi\[23\] , \prod_hi_hi\[22\] , \prod_hi_hi\[21\] ,
         \prod_hi_hi\[20\] , \prod_hi_hi\[19\] , \prod_hi_hi\[18\] ,
         \prod_hi_hi\[17\] , \prod_hi_hi\[16\] , \prod_hi_hi\[15\] ,
         \prod_hi_hi\[14\] , \prod_hi_hi\[13\] , \prod_hi_hi\[12\] ,
         \prod_hi_hi\[11\] , \prod_hi_hi\[10\] , \prod_hi_hi\[9\] ,
         \prod_hi_hi\[8\] , \prod_hi_hi\[7\] , \prod_hi_hi\[6\] ,
         \prod_hi_hi\[5\] , \prod_hi_hi\[4\] , \s2p_lo_hi\[31\] ,
         \s2p_lo_hi\[30\] , \s2p_lo_hi\[29\] , \s2p_lo_hi\[28\] ,
         \s2p_lo_hi\[27\] , \s2p_lo_hi\[26\] , \s2p_lo_hi\[25\] ,
         \s2p_lo_hi\[24\] , \s2p_lo_hi\[23\] , \s2p_lo_hi\[22\] ,
         \s2p_lo_hi\[21\] , \s2p_lo_hi\[20\] , \s2p_lo_hi\[19\] ,
         \s2p_lo_hi\[18\] , \s2p_lo_hi\[17\] , \s2p_lo_hi\[16\] ,
         \s2p_lo_hi\[15\] , \s2p_lo_hi\[14\] , \s2p_lo_hi\[13\] ,
         \s2p_lo_hi\[12\] , \s2p_lo_hi\[11\] , \s2p_lo_hi\[10\] ,
         \s2p_lo_hi\[9\] , \s2p_lo_hi\[8\] , \s2p_lo_hi\[7\] ,
         \s2p_lo_hi\[6\] , \s2p_lo_hi\[5\] , \s2p_lo_hi\[4\] ,
         \s2p_lo_hi\[3\] , \s2p_lo_hi\[2\] , \s2p_lo_hi\[1\] ,
         \s2p_lo_hi\[0\] , \s2p_lo_lo\[31\] , \s2p_lo_lo\[30\] ,
         \s2p_lo_lo\[29\] , \s2p_lo_lo\[28\] , \s2p_lo_lo\[27\] ,
         \s2p_lo_lo\[26\] , \s2p_lo_lo\[25\] , \s2p_lo_lo\[24\] ,
         \s2p_lo_lo\[23\] , \s2p_lo_lo\[22\] , \s2p_lo_lo\[21\] ,
         \s2p_lo_lo\[20\] , \s2p_lo_lo\[19\] , \s2p_lo_lo\[18\] ,
         \s2p_lo_lo\[17\] , \s2p_lo_lo\[16\] , \s2p_lo_lo\[15\] ,
         \s2p_lo_lo\[14\] , \s2p_lo_lo\[13\] , \s2p_lo_lo\[12\] ,
         \s2p_lo_lo\[11\] , \s2p_lo_lo\[10\] , \s2p_lo_lo\[9\] ,
         \s2p_lo_lo\[8\] , \s2p_lo_lo\[7\] , \s2p_lo_lo\[6\] ,
         \s2p_lo_lo\[5\] , \s2p_lo_lo\[4\] , \s2p_lo_lo\[3\] ,
         \s2p_lo_lo\[2\] , \s2p_lo_lo\[1\] , \s2p_lo_lo\[0\] , \prod_lo\[39\] ,
         \prod_lo\[38\] , \prod_lo\[37\] , \prod_lo\[36\] , \prod_lo\[35\] ,
         \prod_lo\[34\] , \prod_lo\[33\] , \prod_lo\[32\] , \prod_lo\[31\] ,
         \prod_lo\[30\] , \prod_lo\[29\] , \prod_lo\[28\] , \prod_lo\[27\] ,
         \prod_lo\[26\] , \prod_lo\[25\] , \prod_lo\[24\] , \prod_lo\[23\] ,
         \prod_lo\[22\] , \prod_lo\[21\] , \prod_lo\[20\] , \prod_lo\[19\] ,
         \prod_lo\[18\] , \prod_lo\[17\] , \prod_lo\[16\] , \prod_lo\[15\] ,
         \prod_lo\[14\] , \prod_lo\[13\] , \prod_lo\[12\] , \prod_lo\[11\] ,
         \prod_lo\[10\] , \prod_lo\[9\] , \prod_lo\[8\] , \s2p_hi_hi\[31\] ,
         \s2p_hi_hi\[30\] , \s2p_hi_hi\[29\] , \s2p_hi_hi\[28\] ,
         \s2p_hi_hi\[27\] , \s2p_hi_hi\[26\] , \s2p_hi_hi\[25\] ,
         \s2p_hi_hi\[24\] , \s2p_hi_hi\[23\] , \s2p_hi_hi\[22\] ,
         \s2p_hi_hi\[21\] , \s2p_hi_hi\[20\] , \s2p_hi_hi\[19\] ,
         \s2p_hi_hi\[18\] , \s2p_hi_hi\[17\] , \s2p_hi_hi\[16\] ,
         \s2p_hi_hi\[15\] , \s2p_hi_hi\[14\] , \s2p_hi_hi\[13\] ,
         \s2p_hi_hi\[12\] , \s2p_hi_hi\[11\] , \s2p_hi_hi\[10\] ,
         \s2p_hi_hi\[9\] , \s2p_hi_hi\[8\] , \s2p_hi_hi\[7\] ,
         \s2p_hi_hi\[6\] , \s2p_hi_hi\[5\] , \s2p_hi_hi\[4\] ,
         \s2p_hi_hi\[3\] , \s2p_hi_hi\[2\] , \s2p_hi_hi\[1\] ,
         \s2p_hi_hi\[0\] , \s2p_hi_lo\[31\] , \s2p_hi_lo\[30\] ,
         \s2p_hi_lo\[29\] , \s2p_hi_lo\[28\] , \s2p_hi_lo\[27\] ,
         \s2p_hi_lo\[26\] , \s2p_hi_lo\[25\] , \s2p_hi_lo\[24\] ,
         \s2p_hi_lo\[23\] , \s2p_hi_lo\[22\] , \s2p_hi_lo\[21\] ,
         \s2p_hi_lo\[20\] , \s2p_hi_lo\[19\] , \s2p_hi_lo\[18\] ,
         \s2p_hi_lo\[17\] , \s2p_hi_lo\[16\] , \s2p_hi_lo\[15\] ,
         \s2p_hi_lo\[14\] , \s2p_hi_lo\[13\] , \s2p_hi_lo\[12\] ,
         \s2p_hi_lo\[11\] , \s2p_hi_lo\[10\] , \s2p_hi_lo\[9\] ,
         \s2p_hi_lo\[8\] , \s2p_hi_lo\[7\] , \s2p_hi_lo\[6\] ,
         \s2p_hi_lo\[5\] , \s2p_hi_lo\[4\] , \s2p_hi_lo\[3\] ,
         \s2p_hi_lo\[2\] , \s2p_hi_lo\[1\] , \s2p_hi_lo\[0\] , \prod_hi\[39\] ,
         \prod_hi\[38\] , \prod_hi\[37\] , \prod_hi\[36\] , \prod_hi\[35\] ,
         \prod_hi\[34\] , \prod_hi\[33\] , \prod_hi\[32\] , \prod_hi\[31\] ,
         \prod_hi\[30\] , \prod_hi\[29\] , \prod_hi\[28\] , \prod_hi\[27\] ,
         \prod_hi\[26\] , \prod_hi\[25\] , \prod_hi\[24\] , \prod_hi\[23\] ,
         \prod_hi\[22\] , \prod_hi\[21\] , \prod_hi\[20\] , \prod_hi\[19\] ,
         \prod_hi\[18\] , \prod_hi\[17\] , \prod_hi\[16\] , \prod_hi\[15\] ,
         \prod_hi\[14\] , \prod_hi\[13\] , \prod_hi\[12\] , \prod_hi\[11\] ,
         \prod_hi\[10\] , \prod_hi\[9\] , \prod_hi\[8\] , \s2m_prod_hi\[39\] ,
         \s2m_prod_hi\[38\] , \s2m_prod_hi\[37\] , \s2m_prod_hi\[36\] ,
         \s2m_prod_hi\[35\] , \s2m_prod_hi\[34\] , \s2m_prod_hi\[33\] ,
         \s2m_prod_hi\[32\] , \s2m_prod_hi\[31\] , \s2m_prod_hi\[30\] ,
         \s2m_prod_hi\[29\] , \s2m_prod_hi\[28\] , \s2m_prod_hi\[27\] ,
         \s2m_prod_hi\[26\] , \s2m_prod_hi\[25\] , \s2m_prod_hi\[24\] ,
         \s2m_prod_hi\[23\] , \s2m_prod_hi\[22\] , \s2m_prod_hi\[21\] ,
         \s2m_prod_hi\[20\] , \s2m_prod_hi\[19\] , \s2m_prod_hi\[18\] ,
         \s2m_prod_hi\[17\] , \s2m_prod_hi\[16\] , \s2m_prod_hi\[15\] ,
         \s2m_prod_hi\[14\] , \s2m_prod_hi\[13\] , \s2m_prod_hi\[12\] ,
         \s2m_prod_hi\[11\] , \s2m_prod_hi\[10\] , \s2m_prod_hi\[9\] ,
         \s2m_prod_hi\[8\] , \s2m_prod_hi\[7\] , \s2m_prod_hi\[6\] ,
         \s2m_prod_hi\[5\] , \s2m_prod_hi\[4\] , \s2m_prod_hi\[3\] ,
         \s2m_prod_hi\[2\] , \s2m_prod_hi\[1\] , \s2m_prod_hi\[0\] ,
         \s2m_prod_lo\[39\] , \s2m_prod_lo\[38\] , \s2m_prod_lo\[37\] ,
         \s2m_prod_lo\[36\] , \s2m_prod_lo\[35\] , \s2m_prod_lo\[34\] ,
         \s2m_prod_lo\[33\] , \s2m_prod_lo\[32\] , \s2m_prod_lo\[31\] ,
         \s2m_prod_lo\[30\] , \s2m_prod_lo\[29\] , \s2m_prod_lo\[28\] ,
         \s2m_prod_lo\[27\] , \s2m_prod_lo\[26\] , \s2m_prod_lo\[25\] ,
         \s2m_prod_lo\[24\] , \s2m_prod_lo\[23\] , \s2m_prod_lo\[22\] ,
         \s2m_prod_lo\[21\] , \s2m_prod_lo\[20\] , \s2m_prod_lo\[19\] ,
         \s2m_prod_lo\[18\] , \s2m_prod_lo\[17\] , \s2m_prod_lo\[16\] ,
         \s2m_prod_lo\[15\] , \s2m_prod_lo\[14\] , \s2m_prod_lo\[13\] ,
         \s2m_prod_lo\[12\] , \s2m_prod_lo\[11\] , \s2m_prod_lo\[10\] ,
         \s2m_prod_lo\[9\] , \s2m_prod_lo\[8\] , \s2m_prod_lo\[7\] ,
         \s2m_prod_lo\[6\] , \s2m_prod_lo\[5\] , \s2m_prod_lo\[4\] ,
         \s2m_prod_lo\[3\] , \s2m_prod_lo\[2\] , \s2m_prod_lo\[1\] ,
         \s2m_prod_lo\[0\] , \prod\[55\] , \prod\[54\] , \prod\[53\] ,
         \prod\[52\] , \prod\[51\] , \prod\[50\] , \prod\[49\] , \prod\[48\] ,
         \prod\[47\] , \prod\[46\] , \prod\[45\] , \prod\[44\] , \prod\[43\] ,
         \prod\[42\] , \prod\[41\] , \prod\[40\] , \prod\[39\] , \prod\[38\] ,
         \prod\[37\] , \prod\[36\] , \prod\[35\] , \prod\[34\] , \prod\[33\] ,
         \prod\[32\] , \prod\[31\] , \prod\[30\] , \prod\[29\] , \prod\[28\] ,
         \prod\[27\] , \prod\[26\] , \prod\[25\] , \prod\[24\] , \prod\[23\] ,
         N224, N225, N226, N227, N228, N229, N230, N231, N232, N233, N234,
         N235, N236, N237, N238, N239, N240, N241, N242, N243, N244, N245,
         N246, N247, N248, N249, N250, N251, N252, N253, N254, N255, N256,
         N257, s2m_clamp_big, s2q_valid, s2q_is_nan, s2q_is_inf,
         s2q_is_zero_sub, s2q_is_pos, s2q_clamp_big, s2p_valid, s2p_is_nan,
         s2p_is_inf, s2p_is_zero_sub, s2p_is_pos, s2p_clamp_big, s2m_valid,
         s2m_is_nan, s2m_is_inf, s2m_is_zero_sub, s2m_is_pos, s2_valid,
         s2_is_nan, s2_is_inf, s2_is_zero_sub, s2_is_pos, s2_underflow,
         \s2_floor_mag\[8\] , \s2_floor_mag\[7\] , \s2_floor_mag\[6\] ,
         \s2_floor_mag\[5\] , \s2_floor_mag\[4\] , \s2_floor_mag\[3\] ,
         \s2_floor_mag\[2\] , \s2_floor_mag\[1\] , \s2_floor_mag\[0\] ,
         \s2_f_u\[22\] , \s2_f_u\[21\] , \s2_f_u\[20\] , \s2_f_u\[19\] ,
         \s2_f_u\[18\] , \s2_f_u\[17\] , \s2_f_u\[16\] , \s2_f_u\[15\] ,
         \s2_f_u\[14\] , \s2_f_u\[13\] , \s2_f_u\[12\] , \s2_f_u\[11\] ,
         \s2_f_u\[10\] , \s2_f_u\[9\] , \s2_f_u\[8\] , \s2_f_u\[7\] ,
         \s2_f_u\[6\] , \s2_f_u\[5\] , \s2_f_u\[4\] , \s2_f_u\[3\] ,
         \s2_f_u\[2\] , \s2_f_u\[1\] , \s2_f_u\[0\] , \s3_lut_next\[23\] ,
         \s3_lut_next\[22\] , \s3_lut_next\[21\] , \s3_lut_next\[20\] ,
         \s3_lut_next\[19\] , \s3_lut_next\[18\] , \s3_lut_next\[17\] ,
         \s3_lut_next\[16\] , \s3_lut_next\[15\] , \s3_lut_next\[14\] ,
         \s3_lut_next\[13\] , \s3_lut_next\[12\] , \s3_lut_next\[11\] ,
         \s3_lut_next\[10\] , \s3_lut_next\[9\] , \s3_lut_next\[8\] ,
         \s3_lut_next\[7\] , \s3_lut_next\[6\] , \s3_lut_next\[5\] ,
         \s3_lut_next\[4\] , \s3_lut_next\[3\] , \s3_lut_next\[2\] ,
         \s3_lut_next\[1\] , \s3_lut_next\[0\] , \s3_lut_base\[22\] ,
         \s3_lut_base\[21\] , \s3_lut_base\[20\] , \s3_lut_base\[19\] ,
         \s3_lut_base\[18\] , \s3_lut_base\[17\] , \s3_lut_base\[16\] ,
         \s3_lut_base\[15\] , \s3_lut_base\[14\] , \s3_lut_base\[13\] ,
         \s3_lut_base\[12\] , \s3_lut_base\[11\] , \s3_lut_base\[10\] ,
         \s3_lut_base\[9\] , \s3_lut_base\[8\] , \s3_lut_base\[7\] ,
         \s3_lut_base\[6\] , \s3_lut_base\[5\] , \s3_lut_base\[4\] ,
         \s3_lut_base\[3\] , \s3_lut_base\[2\] , \s3_lut_base\[1\] ,
         \s3_lut_base\[0\] , \lut_delta\[23\] , \lut_delta\[22\] ,
         \lut_delta\[21\] , \lut_delta\[20\] , \lut_delta\[19\] ,
         \lut_delta\[18\] , \lut_delta\[17\] , \lut_delta\[16\] ,
         \lut_delta\[15\] , \lut_delta\[14\] , \lut_delta\[13\] ,
         \lut_delta\[12\] , \lut_delta\[11\] , \lut_delta\[10\] ,
         \lut_delta\[9\] , \lut_delta\[8\] , \lut_delta\[7\] ,
         \lut_delta\[6\] , \lut_delta\[5\] , \lut_delta\[4\] ,
         \lut_delta\[3\] , \lut_delta\[2\] , \lut_delta\[1\] ,
         \lut_delta\[0\] , \s4_delta\[23\] , \s4_delta\[22\] ,
         \s4_delta\[21\] , \s4_delta\[20\] , \s4_delta\[19\] ,
         \s4_delta\[18\] , \s4_delta\[17\] , \s4_delta\[16\] ,
         \s4_delta\[15\] , \s4_delta\[14\] , \s4_delta\[13\] ,
         \s4_delta\[12\] , \s4_delta\[11\] , \s4_delta\[10\] , \s4_delta\[9\] ,
         \s4_delta\[8\] , \s4_delta\[7\] , \s4_delta\[6\] , \s4_delta\[5\] ,
         \s4_delta\[4\] , \s4_delta\[3\] , \s4_delta\[2\] , \s4_delta\[1\] ,
         \s4_delta\[0\] , \s4_frac_lo\[16\] , \s4_frac_lo\[15\] ,
         \s4_frac_lo\[14\] , \s4_frac_lo\[13\] , \s4_frac_lo\[12\] ,
         \s4_frac_lo\[11\] , \s4_frac_lo\[10\] , \s4_frac_lo\[9\] ,
         \s4_frac_lo\[8\] , \s4_frac_lo\[7\] , \s4_frac_lo\[6\] ,
         \s4_frac_lo\[5\] , \s4_frac_lo\[4\] , \s4_frac_lo\[3\] ,
         \s4_frac_lo\[2\] , \s4_frac_lo\[1\] , \s4_frac_lo\[0\] ,
         \interp_lo_lo_lo\[14\] , \interp_lo_lo_lo\[13\] ,
         \interp_lo_lo_lo\[12\] , \interp_lo_lo_lo\[11\] ,
         \interp_lo_lo_lo\[10\] , \interp_lo_lo_lo\[9\] ,
         \interp_lo_lo_lo\[8\] , \interp_lo_lo_lo\[7\] ,
         \interp_lo_lo_lo\[6\] , \interp_lo_lo_lo\[5\] ,
         \interp_lo_lo_lo\[4\] , \interp_lo_lo_lo\[3\] ,
         \interp_lo_lo_lo\[2\] , \interp_lo_lo_lo\[1\] ,
         \interp_lo_lo_lo\[0\] , \interp_lo_lo_hi\[14\] ,
         \interp_lo_lo_hi\[13\] , \interp_lo_lo_hi\[12\] ,
         \interp_lo_lo_hi\[11\] , \interp_lo_lo_hi\[10\] ,
         \interp_lo_lo_hi\[9\] , \interp_lo_lo_hi\[8\] ,
         \interp_lo_lo_hi\[7\] , \interp_lo_lo_hi\[6\] ,
         \interp_lo_lo_hi\[5\] , \interp_lo_lo_hi\[4\] ,
         \interp_lo_lo_hi\[3\] , \interp_lo_lo_hi\[2\] ,
         \interp_lo_lo_hi\[1\] , \interp_lo_lo_hi\[0\] ,
         \interp_lo_hi_lo\[14\] , \interp_lo_hi_lo\[13\] ,
         \interp_lo_hi_lo\[12\] , \interp_lo_hi_lo\[11\] ,
         \interp_lo_hi_lo\[10\] , \interp_lo_hi_lo\[9\] ,
         \interp_lo_hi_lo\[8\] , \interp_lo_hi_lo\[7\] ,
         \interp_lo_hi_lo\[6\] , \interp_lo_hi_lo\[5\] ,
         \interp_lo_hi_lo\[4\] , \interp_lo_hi_lo\[3\] ,
         \interp_lo_hi_lo\[2\] , \interp_lo_hi_lo\[1\] ,
         \interp_lo_hi_lo\[0\] , \interp_lo_hi_hi\[14\] ,
         \interp_lo_hi_hi\[13\] , \interp_lo_hi_hi\[12\] ,
         \interp_lo_hi_hi\[11\] , \interp_lo_hi_hi\[10\] ,
         \interp_lo_hi_hi\[9\] , \interp_lo_hi_hi\[8\] ,
         \interp_lo_hi_hi\[7\] , \interp_lo_hi_hi\[6\] ,
         \interp_lo_hi_hi\[5\] , \interp_lo_hi_hi\[4\] ,
         \interp_lo_hi_hi\[3\] , \interp_lo_hi_hi\[2\] ,
         \interp_lo_hi_hi\[1\] , \interp_lo_hi_hi\[0\] ,
         \interp_hi_lo_lo\[13\] , \interp_hi_lo_lo\[12\] ,
         \interp_hi_lo_lo\[11\] , \interp_hi_lo_lo\[10\] ,
         \interp_hi_lo_lo\[9\] , \interp_hi_lo_lo\[8\] ,
         \interp_hi_lo_lo\[7\] , \interp_hi_lo_lo\[6\] ,
         \interp_hi_lo_lo\[5\] , \interp_hi_lo_lo\[4\] ,
         \interp_hi_lo_lo\[3\] , \interp_hi_lo_lo\[2\] ,
         \interp_hi_lo_lo\[1\] , \interp_hi_lo_lo\[0\] ,
         \interp_hi_lo_hi\[13\] , \interp_hi_lo_hi\[12\] ,
         \interp_hi_lo_hi\[11\] , \interp_hi_lo_hi\[10\] ,
         \interp_hi_lo_hi\[9\] , \interp_hi_lo_hi\[8\] ,
         \interp_hi_lo_hi\[7\] , \interp_hi_lo_hi\[6\] ,
         \interp_hi_lo_hi\[5\] , \interp_hi_lo_hi\[4\] ,
         \interp_hi_lo_hi\[3\] , \interp_hi_lo_hi\[2\] ,
         \interp_hi_lo_hi\[1\] , \interp_hi_lo_hi\[0\] ,
         \interp_hi_hi_lo\[13\] , \interp_hi_hi_lo\[12\] ,
         \interp_hi_hi_lo\[11\] , \interp_hi_hi_lo\[10\] ,
         \interp_hi_hi_lo\[9\] , \interp_hi_hi_lo\[8\] ,
         \interp_hi_hi_lo\[7\] , \interp_hi_hi_lo\[6\] ,
         \interp_hi_hi_lo\[5\] , \interp_hi_hi_lo\[4\] ,
         \interp_hi_hi_lo\[3\] , \interp_hi_hi_lo\[2\] ,
         \interp_hi_hi_lo\[1\] , \interp_hi_hi_lo\[0\] ,
         \interp_hi_hi_hi\[13\] , \interp_hi_hi_hi\[12\] ,
         \interp_hi_hi_hi\[11\] , \interp_hi_hi_hi\[10\] ,
         \interp_hi_hi_hi\[9\] , \interp_hi_hi_hi\[8\] ,
         \interp_hi_hi_hi\[7\] , \interp_hi_hi_hi\[6\] ,
         \interp_hi_hi_hi\[5\] , \interp_hi_hi_hi\[4\] ,
         \interp_hi_hi_hi\[3\] , \interp_hi_hi_hi\[2\] ,
         \interp_hi_hi_hi\[1\] , \interp_hi_hi_hi\[0\] , \s7_interp_hi\[31\] ,
         \s7_interp_hi\[30\] , \s7_interp_hi\[29\] , \s7_interp_hi\[28\] ,
         \s7_interp_hi\[27\] , \s7_interp_hi\[26\] , \s7_interp_hi\[25\] ,
         \s7_interp_hi\[24\] , \s7_interp_hi\[23\] , \s7_interp_hi\[22\] ,
         \s7_interp_hi\[21\] , \s7_interp_hi\[20\] , \s7_interp_hi\[19\] ,
         \s7_interp_hi\[18\] , \s7_interp_hi\[17\] , \s7_interp_hi\[16\] ,
         \s7_interp_hi\[15\] , \s7_interp_hi\[14\] , \s7_interp_hi\[13\] ,
         \s7_interp_hi\[12\] , \s7_interp_hi\[11\] , \s7_interp_hi\[10\] ,
         \s7_interp_hi\[9\] , \s7_interp_hi\[8\] , \s7_interp_hi\[7\] ,
         \s7_interp_hi\[6\] , \s7_interp_hi\[5\] , \s7_interp_hi\[4\] ,
         \s7_interp_hi\[3\] , \s7_interp_hi\[2\] , \s7_interp_hi\[1\] ,
         \s7_interp_hi\[0\] , \s7_interp_lo\[32\] , \s7_interp_lo\[31\] ,
         \s7_interp_lo\[30\] , \s7_interp_lo\[29\] , \s7_interp_lo\[28\] ,
         \s7_interp_lo\[27\] , \s7_interp_lo\[26\] , \s7_interp_lo\[25\] ,
         \s7_interp_lo\[24\] , \s7_interp_lo\[23\] , \s7_interp_lo\[22\] ,
         \s7_interp_lo\[21\] , \s7_interp_lo\[20\] , \s7_interp_lo\[19\] ,
         \s7_interp_lo\[18\] , \s7_interp_lo\[17\] , \s7_interp_lo\[16\] ,
         \s7_interp_lo\[15\] , \s7_interp_lo\[14\] , \s7_interp_lo\[13\] ,
         \s7_interp_lo\[12\] , \s7_interp_lo\[11\] , \s7_interp_lo\[10\] ,
         \s7_interp_lo\[9\] , \s7_interp_lo\[8\] , \s7_interp_lo\[7\] ,
         \s7_interp_lo\[6\] , \s7_interp_lo\[5\] , \s7_interp_lo\[4\] ,
         \s7_interp_lo\[3\] , \s7_interp_lo\[2\] , \s7_interp_lo\[1\] ,
         \s7_interp_lo\[0\] , \s7_lut_base\[22\] , \s7_lut_base\[21\] ,
         \s7_lut_base\[20\] , \s7_lut_base\[19\] , \s7_lut_base\[18\] ,
         \s7_lut_base\[17\] , \s7_lut_base\[16\] , \s7_lut_base\[15\] ,
         \s7_lut_base\[14\] , \s7_lut_base\[13\] , \s7_lut_base\[12\] ,
         \s7_lut_base\[11\] , \s7_lut_base\[10\] , \s7_lut_base\[9\] ,
         \s7_lut_base\[8\] , \s7_lut_base\[7\] , \s7_lut_base\[6\] ,
         \s7_lut_base\[5\] , \s7_lut_base\[4\] , \s7_lut_base\[3\] ,
         \s7_lut_base\[2\] , \s7_lut_base\[1\] , \s7_lut_base\[0\] ,
         \mant_frac\[23\] , \mant_frac\[22\] , \mant_frac\[21\] ,
         \mant_frac\[20\] , \mant_frac\[19\] , \mant_frac\[18\] ,
         \mant_frac\[17\] , \mant_frac\[16\] , \mant_frac\[15\] ,
         \mant_frac\[14\] , \mant_frac\[13\] , \mant_frac\[12\] ,
         \mant_frac\[11\] , \mant_frac\[10\] , \mant_frac\[9\] ,
         \mant_frac\[8\] , \mant_frac\[7\] , \mant_frac\[6\] ,
         \mant_frac\[5\] , \mant_frac\[4\] , \mant_frac\[3\] ,
         \mant_frac\[2\] , \mant_frac\[1\] , \mant_frac\[0\] ,
         \s7_floor_mag\[8\] , \s7_floor_mag\[6\] , \s7_floor_mag\[5\] ,
         \s7_floor_mag\[4\] , \s7_floor_mag\[3\] , \s7_floor_mag\[2\] ,
         \s7_floor_mag\[1\] , \s7_floor_mag\[0\] , \exp_field\[9\] ,
         \exp_field\[8\] , \exp_field\[7\] , \exp_field\[6\] ,
         \exp_field\[5\] , \exp_field\[4\] , \exp_field\[3\] ,
         \exp_field\[2\] , \exp_field\[1\] , \exp_field\[0\] , s7_is_nan,
         s7_is_inf, s7_is_pos, s7_is_zero_sub, s7_underflow, s3_valid,
         s3_is_nan, s3_is_inf, s3_is_zero_sub, s3_is_pos, s3_underflow,
         \s3_floor_mag\[8\] , \s3_floor_mag\[7\] , \s3_floor_mag\[6\] ,
         \s3_floor_mag\[5\] , \s3_floor_mag\[4\] , \s3_floor_mag\[3\] ,
         \s3_floor_mag\[2\] , \s3_floor_mag\[1\] , \s3_floor_mag\[0\] ,
         \s3_frac_lo\[16\] , \s3_frac_lo\[15\] , \s3_frac_lo\[14\] ,
         \s3_frac_lo\[13\] , \s3_frac_lo\[12\] , \s3_frac_lo\[11\] ,
         \s3_frac_lo\[10\] , \s3_frac_lo\[9\] , \s3_frac_lo\[8\] ,
         \s3_frac_lo\[7\] , \s3_frac_lo\[6\] , \s3_frac_lo\[5\] ,
         \s3_frac_lo\[4\] , \s3_frac_lo\[3\] , \s3_frac_lo\[2\] ,
         \s3_frac_lo\[1\] , \s3_frac_lo\[0\] , s4_valid, s4_is_nan, s4_is_inf,
         s4_is_zero_sub, s4_is_pos, s4_underflow, \s4_floor_mag\[8\] ,
         \s4_floor_mag\[7\] , \s4_floor_mag\[6\] , \s4_floor_mag\[5\] ,
         \s4_floor_mag\[4\] , \s4_floor_mag\[3\] , \s4_floor_mag\[2\] ,
         \s4_floor_mag\[1\] , \s4_floor_mag\[0\] , \s4_lut_base\[22\] ,
         \s4_lut_base\[21\] , \s4_lut_base\[20\] , \s4_lut_base\[19\] ,
         \s4_lut_base\[18\] , \s4_lut_base\[17\] , \s4_lut_base\[16\] ,
         \s4_lut_base\[15\] , \s4_lut_base\[14\] , \s4_lut_base\[13\] ,
         \s4_lut_base\[12\] , \s4_lut_base\[11\] , \s4_lut_base\[10\] ,
         \s4_lut_base\[9\] , \s4_lut_base\[8\] , \s4_lut_base\[7\] ,
         \s4_lut_base\[6\] , \s4_lut_base\[5\] , \s4_lut_base\[4\] ,
         \s4_lut_base\[3\] , \s4_lut_base\[2\] , \s4_lut_base\[1\] ,
         \s4_lut_base\[0\] , s5_valid, s5_is_nan, s5_is_inf, s5_is_zero_sub,
         s5_is_pos, s5_underflow, \s5_floor_mag\[8\] , \s5_floor_mag\[7\] ,
         \s5_floor_mag\[6\] , \s5_floor_mag\[5\] , \s5_floor_mag\[4\] ,
         \s5_floor_mag\[3\] , \s5_floor_mag\[2\] , \s5_floor_mag\[1\] ,
         \s5_floor_mag\[0\] , \s5_lut_base\[22\] , \s5_lut_base\[21\] ,
         \s5_lut_base\[20\] , \s5_lut_base\[19\] , \s5_lut_base\[18\] ,
         \s5_lut_base\[17\] , \s5_lut_base\[16\] , \s5_lut_base\[15\] ,
         \s5_lut_base\[14\] , \s5_lut_base\[13\] , \s5_lut_base\[12\] ,
         \s5_lut_base\[11\] , \s5_lut_base\[10\] , \s5_lut_base\[9\] ,
         \s5_lut_base\[8\] , \s5_lut_base\[7\] , \s5_lut_base\[6\] ,
         \s5_lut_base\[5\] , \s5_lut_base\[4\] , \s5_lut_base\[3\] ,
         \s5_lut_base\[2\] , \s5_lut_base\[1\] , \s5_lut_base\[0\] ,
         \s5_interp_lo_lo_lo\[14\] , \s5_interp_lo_lo_lo\[13\] ,
         \s5_interp_lo_lo_lo\[12\] , \s5_interp_lo_lo_lo\[11\] ,
         \s5_interp_lo_lo_lo\[10\] , \s5_interp_lo_lo_lo\[9\] ,
         \s5_interp_lo_lo_lo\[8\] , \s5_interp_lo_lo_lo\[7\] ,
         \s5_interp_lo_lo_lo\[6\] , \s5_interp_lo_lo_lo\[5\] ,
         \s5_interp_lo_lo_lo\[4\] , \s5_interp_lo_lo_lo\[3\] ,
         \s5_interp_lo_lo_lo\[2\] , \s5_interp_lo_lo_lo\[1\] ,
         \s5_interp_lo_lo_lo\[0\] , \s5_interp_lo_lo_hi\[14\] ,
         \s5_interp_lo_lo_hi\[13\] , \s5_interp_lo_lo_hi\[12\] ,
         \s5_interp_lo_lo_hi\[11\] , \s5_interp_lo_lo_hi\[10\] ,
         \s5_interp_lo_lo_hi\[9\] , \s5_interp_lo_lo_hi\[8\] ,
         \s5_interp_lo_lo_hi\[7\] , \s5_interp_lo_lo_hi\[6\] ,
         \s5_interp_lo_lo_hi\[5\] , \s5_interp_lo_lo_hi\[4\] ,
         \s5_interp_lo_lo_hi\[3\] , \s5_interp_lo_lo_hi\[2\] ,
         \s5_interp_lo_lo_hi\[1\] , \s5_interp_lo_lo_hi\[0\] ,
         \s5_interp_lo_hi_lo\[14\] , \s5_interp_lo_hi_lo\[13\] ,
         \s5_interp_lo_hi_lo\[12\] , \s5_interp_lo_hi_lo\[11\] ,
         \s5_interp_lo_hi_lo\[10\] , \s5_interp_lo_hi_lo\[9\] ,
         \s5_interp_lo_hi_lo\[8\] , \s5_interp_lo_hi_lo\[7\] ,
         \s5_interp_lo_hi_lo\[6\] , \s5_interp_lo_hi_lo\[5\] ,
         \s5_interp_lo_hi_lo\[4\] , \s5_interp_lo_hi_lo\[3\] ,
         \s5_interp_lo_hi_lo\[2\] , \s5_interp_lo_hi_lo\[1\] ,
         \s5_interp_lo_hi_lo\[0\] , \s5_interp_lo_hi_hi\[14\] ,
         \s5_interp_lo_hi_hi\[13\] , \s5_interp_lo_hi_hi\[12\] ,
         \s5_interp_lo_hi_hi\[11\] , \s5_interp_lo_hi_hi\[10\] ,
         \s5_interp_lo_hi_hi\[9\] , \s5_interp_lo_hi_hi\[8\] ,
         \s5_interp_lo_hi_hi\[7\] , \s5_interp_lo_hi_hi\[6\] ,
         \s5_interp_lo_hi_hi\[5\] , \s5_interp_lo_hi_hi\[4\] ,
         \s5_interp_lo_hi_hi\[3\] , \s5_interp_lo_hi_hi\[2\] ,
         \s5_interp_lo_hi_hi\[1\] , \s5_interp_lo_hi_hi\[0\] ,
         \s5_interp_hi_lo_lo\[13\] , \s5_interp_hi_lo_lo\[12\] ,
         \s5_interp_hi_lo_lo\[11\] , \s5_interp_hi_lo_lo\[10\] ,
         \s5_interp_hi_lo_lo\[9\] , \s5_interp_hi_lo_lo\[8\] ,
         \s5_interp_hi_lo_lo\[7\] , \s5_interp_hi_lo_lo\[6\] ,
         \s5_interp_hi_lo_lo\[5\] , \s5_interp_hi_lo_lo\[4\] ,
         \s5_interp_hi_lo_lo\[3\] , \s5_interp_hi_lo_lo\[2\] ,
         \s5_interp_hi_lo_lo\[1\] , \s5_interp_hi_lo_lo\[0\] ,
         \s5_interp_hi_lo_hi\[13\] , \s5_interp_hi_lo_hi\[12\] ,
         \s5_interp_hi_lo_hi\[11\] , \s5_interp_hi_lo_hi\[10\] ,
         \s5_interp_hi_lo_hi\[9\] , \s5_interp_hi_lo_hi\[8\] ,
         \s5_interp_hi_lo_hi\[7\] , \s5_interp_hi_lo_hi\[6\] ,
         \s5_interp_hi_lo_hi\[5\] , \s5_interp_hi_lo_hi\[4\] ,
         \s5_interp_hi_lo_hi\[3\] , \s5_interp_hi_lo_hi\[2\] ,
         \s5_interp_hi_lo_hi\[1\] , \s5_interp_hi_lo_hi\[0\] ,
         \s5_interp_hi_hi_lo\[13\] , \s5_interp_hi_hi_lo\[12\] ,
         \s5_interp_hi_hi_lo\[11\] , \s5_interp_hi_hi_lo\[10\] ,
         \s5_interp_hi_hi_lo\[9\] , \s5_interp_hi_hi_lo\[8\] ,
         \s5_interp_hi_hi_lo\[7\] , \s5_interp_hi_hi_lo\[6\] ,
         \s5_interp_hi_hi_lo\[5\] , \s5_interp_hi_hi_lo\[4\] ,
         \s5_interp_hi_hi_lo\[3\] , \s5_interp_hi_hi_lo\[2\] ,
         \s5_interp_hi_hi_lo\[1\] , \s5_interp_hi_hi_lo\[0\] ,
         \s5_interp_hi_hi_hi\[13\] , \s5_interp_hi_hi_hi\[12\] ,
         \s5_interp_hi_hi_hi\[11\] , \s5_interp_hi_hi_hi\[10\] ,
         \s5_interp_hi_hi_hi\[9\] , \s5_interp_hi_hi_hi\[8\] ,
         \s5_interp_hi_hi_hi\[7\] , \s5_interp_hi_hi_hi\[6\] ,
         \s5_interp_hi_hi_hi\[5\] , \s5_interp_hi_hi_hi\[4\] ,
         \s5_interp_hi_hi_hi\[3\] , \s5_interp_hi_hi_hi\[2\] ,
         \s5_interp_hi_hi_hi\[1\] , \s5_interp_hi_hi_hi\[0\] , s6_valid,
         s6_is_nan, s6_is_inf, s6_is_zero_sub, s6_is_pos, s6_underflow,
         \s6_floor_mag\[8\] , \s6_floor_mag\[7\] , \s6_floor_mag\[6\] ,
         \s6_floor_mag\[5\] , \s6_floor_mag\[4\] , \s6_floor_mag\[3\] ,
         \s6_floor_mag\[2\] , \s6_floor_mag\[1\] , \s6_floor_mag\[0\] ,
         \s6_lut_base\[22\] , \s6_lut_base\[21\] , \s6_lut_base\[20\] ,
         \s6_lut_base\[19\] , \s6_lut_base\[18\] , \s6_lut_base\[17\] ,
         \s6_lut_base\[16\] , \s6_lut_base\[15\] , \s6_lut_base\[14\] ,
         \s6_lut_base\[13\] , \s6_lut_base\[12\] , \s6_lut_base\[11\] ,
         \s6_lut_base\[10\] , \s6_lut_base\[9\] , \s6_lut_base\[8\] ,
         \s6_lut_base\[7\] , \s6_lut_base\[6\] , \s6_lut_base\[5\] ,
         \s6_lut_base\[4\] , \s6_lut_base\[3\] , \s6_lut_base\[2\] ,
         \s6_lut_base\[1\] , \s6_lut_base\[0\] , \s6_interp_lo_lo\[20\] ,
         \s6_interp_lo_lo\[19\] , \s6_interp_lo_lo\[18\] ,
         \s6_interp_lo_lo\[17\] , \s6_interp_lo_lo\[16\] ,
         \s6_interp_lo_lo\[15\] , \s6_interp_lo_lo\[14\] ,
         \s6_interp_lo_lo\[13\] , \s6_interp_lo_lo\[12\] ,
         \s6_interp_lo_lo\[11\] , \s6_interp_lo_lo\[10\] ,
         \s6_interp_lo_lo\[9\] , \s6_interp_lo_lo\[8\] ,
         \s6_interp_lo_lo\[7\] , \s6_interp_lo_lo\[6\] ,
         \s6_interp_lo_lo\[5\] , \s6_interp_lo_lo\[4\] ,
         \s6_interp_lo_lo\[3\] , \s6_interp_lo_lo\[2\] ,
         \s6_interp_lo_lo\[1\] , \s6_interp_lo_lo\[0\] ,
         \s6_interp_lo_hi\[20\] , \s6_interp_lo_hi\[19\] ,
         \s6_interp_lo_hi\[18\] , \s6_interp_lo_hi\[17\] ,
         \s6_interp_lo_hi\[16\] , \s6_interp_lo_hi\[15\] ,
         \s6_interp_lo_hi\[14\] , \s6_interp_lo_hi\[13\] ,
         \s6_interp_lo_hi\[12\] , \s6_interp_lo_hi\[11\] ,
         \s6_interp_lo_hi\[10\] , \s6_interp_lo_hi\[9\] ,
         \s6_interp_lo_hi\[8\] , \s6_interp_lo_hi\[7\] ,
         \s6_interp_lo_hi\[6\] , \s6_interp_lo_hi\[5\] ,
         \s6_interp_lo_hi\[4\] , \s6_interp_lo_hi\[3\] ,
         \s6_interp_lo_hi\[2\] , \s6_interp_lo_hi\[1\] ,
         \s6_interp_lo_hi\[0\] , \s6_interp_hi_lo\[19\] ,
         \s6_interp_hi_lo\[18\] , \s6_interp_hi_lo\[17\] ,
         \s6_interp_hi_lo\[16\] , \s6_interp_hi_lo\[15\] ,
         \s6_interp_hi_lo\[14\] , \s6_interp_hi_lo\[13\] ,
         \s6_interp_hi_lo\[12\] , \s6_interp_hi_lo\[11\] ,
         \s6_interp_hi_lo\[10\] , \s6_interp_hi_lo\[9\] ,
         \s6_interp_hi_lo\[8\] , \s6_interp_hi_lo\[7\] ,
         \s6_interp_hi_lo\[6\] , \s6_interp_hi_lo\[5\] ,
         \s6_interp_hi_lo\[4\] , \s6_interp_hi_lo\[3\] ,
         \s6_interp_hi_lo\[2\] , \s6_interp_hi_lo\[1\] ,
         \s6_interp_hi_lo\[0\] , \s6_interp_hi_hi\[19\] ,
         \s6_interp_hi_hi\[18\] , \s6_interp_hi_hi\[17\] ,
         \s6_interp_hi_hi\[16\] , \s6_interp_hi_hi\[15\] ,
         \s6_interp_hi_hi\[14\] , \s6_interp_hi_hi\[13\] ,
         \s6_interp_hi_hi\[12\] , \s6_interp_hi_hi\[11\] ,
         \s6_interp_hi_hi\[10\] , \s6_interp_hi_hi\[9\] ,
         \s6_interp_hi_hi\[8\] , \s6_interp_hi_hi\[7\] ,
         \s6_interp_hi_hi\[6\] , \s6_interp_hi_hi\[5\] ,
         \s6_interp_hi_hi\[4\] , \s6_interp_hi_hi\[3\] ,
         \s6_interp_hi_hi\[2\] , \s6_interp_hi_hi\[1\] ,
         \s6_interp_hi_hi\[0\] , s7_valid, N1152, N1153, N1154, N1155, N1156,
         N1157, N1158, N1159, N1160, N1161, N1162, N1163, N1164, N1165, N1166,
         N1167, N1168, N1169, N1170, N1171, N1172, n2346, n2526,
         \interp_sum\[40\] , \interp_sum\[39\] , \interp_sum\[38\] ,
         \interp_sum\[37\] , \interp_sum\[36\] , \interp_sum\[35\] ,
         \interp_sum\[34\] , \interp_sum\[33\] , \interp_sum\[32\] ,
         \interp_sum\[31\] , \interp_sum\[30\] , \interp_sum\[29\] ,
         \interp_sum\[28\] , \interp_sum\[27\] , \interp_sum\[26\] ,
         \interp_sum\[25\] , \interp_sum\[24\] , \interp_sum\[23\] ,
         \interp_sum\[22\] , \interp_sum\[21\] , \interp_sum\[20\] ,
         \interp_sum\[19\] , \interp_sum\[18\] , \interp_sum\[17\] ,
         \sub_82/carry\[5\] , n2634, n2703, n2704, n2711, n2750, n2751, n2752,
         n2753, n2809, n2825, n2826, n2852, n2853, n2854, n2857, n2858, n2859,
         n2860, n2861, n2863, n2864, n2865, n2866, n2867, n2868, n2869, n2870,
         n2871, n2872, n2873, n2874, n2875, n2876, n2877, n2878, n2879, n2880,
         n2881, n2882, n2883, n2884, n2885, n2886, n2887, n2956, n2957, n2958,
         n2959, n2960, n2961, n2962, n2963, n2964, n2965, n2966, n2967, n2968,
         n2969, n2970, n2971, n2972, n2973, n2974, n2975, n2976, n2977, n2978,
         n2979, n2980, n2981, n2982, n2983, n2984, n2985, n2986, n2987, n2988,
         n2989, n2990, n2991, n2992, n2993, n2994, n2995, n2996, n2997, n2998,
         n2999, n3000, n3001, n3002, n3003, n3004, n3005, n3006, n3007, n3008,
         n3009, n3010, n3011, n3012, n3013, n3014, n3015, n3016, n3017, n3018,
         n3019, n3020, n3021, n3022, n3023, n3024, n3025, n3026, n3027, n3028,
         n3029, n3030, n3031, n3032, n3033, n3034, n3035, n3036, n3037, n3038,
         n3039, n3040, n3041, n3042, n3043, n3044, n3045, n3046, n3047, n3048,
         n3049, n3050, n3051, n3052, n3053, n3054, n3055, n3056, n3057, n3058,
         n3059, n3060, n3061, n3062, n3063, n3064, n3065, n3066, n3067, n3068,
         n3069, n3070, n3071, n3072, n3073, n3074, n3075, n3076, n3077, n3078,
         n3079, n3080, n3081, n3082, n3083, n3084, n3085, n3086, n3087, n3088,
         n3089, n3090, n3091, n3092, n3093, n3094, n3095, n3096, n3097, n3098,
         n3099, n3100, n3101, n3102, n3103, n3104, n3105, n3106, n3107, n3108,
         n3109, n3110, n3111, n3112, n3113, n3114, n3115, n3116, n3117, n3118,
         n3119, n3120, n3121, n3122, n3123, n3124, n3125, n3126, n3127, n3128,
         n3129, n3130, n3131, n3132, n3133, n3134, n3135, n3136, n3137, n3138,
         n3139, n3140, n3141, n3142, n3143, n3144, n3145, n3146, n3147, n3148,
         n3149, n3150, n3151, n3152, n3153, n3154, n3155, n3156, n3157, n3158,
         n3159, n3160, n3161, n3162, n3163, n3164, n3165, n3166, n3167, n3168,
         n3169, n3170, n3171, n3172, n3173, n3174, n3175, n3176, n3177, n3178,
         n3179, n3180, n3181, n3182, n3183, n3184, n3185, n3186, n3187, n3188,
         n3189, n3190, n3191, n3192, n3193, n3194, n3195, n3196, n3197, n3198,
         n3199, n3200, n3201, n3202, n3203, n3204, n3205, n3206, n3207, n3208,
         n3209, n3210, n3211, n3212, n3213, n3214, n3215, n3216, n3217, n3218,
         n3219, n3220, n3221, n3222, n3223, n3224, n3225, n3226, n3227, n3228,
         n3229, n3230, n3231, n3232, n3233, n3234, n3235, n3236, n3237, n3238,
         n3239, n3240, n3241, n3242, n3243, n3244, n3245, n3246, n3247, n3248,
         n3249, n3250, n3251, n3252, n3253, n3254, n3255, n3256, n3257, n3258,
         n3259, n3260, n3261, n3262, n3263, n3264, n3265, n3266, n3267, n3268,
         n3269, n3270, n3271, n3272, n3273, n3274, n3275, n3276, n3277, n3278,
         n3279, n3280, n3281, n3282, n3283, n3284, n3285, n3286, n3287, n3288,
         n3289, n3290, n3291, n3292, n3293, n3294, n3295, n3296, n3297, n3298,
         n3299, n3300, n3301, n3302, n3303, n3304, n3305, n3306, n3307, n3308,
         n3309, n3310, n3311, n3312, n3313, n3314, n3315, n3316, n3317, n3318,
         n3319, n3320, n3321, n3322, n3323, n3324, n3325, n3326, n3327, n3328,
         n3329, n3330, n3331, n3332, n3333, n3334, n3335, n3336, n3337, n3338,
         n3339, n3340, n3341, n3342, n3343, n3344, n3345, n3346, n3347, n3348,
         n3349, n3350, n3351, n3352, n3353, n3354, n3355, n3356, n3357, n3358,
         n3359, n3360, n3361, n3362, n3363, n3364, n3365, n3366, n3367, n3368,
         n3369, n3370, n3371, n3372, n3373, n3374, n3375, n3376, n3377, n3378,
         n3379, n3380, n3381, n3382, n3383, n3384, n3385, n3386, n3387, n3388,
         n3389, n3390, n3391, n3392, n3393, n3394, n3395, n3396, n3397, n3398,
         n3399, n3400, n3401, n3402, n3403, n3404, n3405, n3406, n3407, n3408,
         n3409, n3410, n3411, n3412, n3413, n3414, n3415, n3416, n3417, n3418,
         n3419, n3420, n3421, n3422, n3423, n3424, n3425, n3426, n3427, n3428,
         n3429, n3430, n3431, n3432, n3433, n3434, n3435, n3436, n3437, n3438,
         n3439, n3440, n3441, n3442, n3443, n3444, n3445, n3446, n3447, n3448,
         n3449, n3450, n3451, n3452, n3453, n3454, n3455, n3456, n3457, n3458,
         n3459, n3460, n3461, n3462, n3463, n3464, n3465, n3466, n3467, n3468,
         n3469, n3470, n3471, n3472, n3473, n3474, n3475, n3476, n3477, n3478,
         n3479, n3480, n3481, n3482, n3483, n3484, n3485, n3486, n3487, n3488,
         n3489, n3490, n3491, n3492, n3493, n3494, n3495, n3496, n3497, n3498,
         n3499, n3500, n3501, n3502, n3503, n3504, n3505, n3506, n3507, n3508,
         n3509, n3510, n3511, n3512, n3513, n3514, n3515, n3516, n3517, n3518,
         n3519, n3520, n3521, n3522, n3523, n3524, n3525, n3526, n3527, n3528,
         n3529, n3530, n3531, n3532, n3533, n3534, n3535, n3536, n3537, n3538,
         n3539, n3540, n3541, n3542, n3543, n3544, n3545, n3546, n3547, n3548,
         n3549, n3550, n3551, n3552, n3553, n3554, n3555, n3556, n3557, n3558,
         n3559, n3560, n3561, n3562, n3563, n3564, n3565, n3566, n3567, n3568,
         n3569, n3570, n3571, n3572, n3573, n3574, n3575, n3576, n3577, n3578,
         n3579, n3580, n3581, n3582, n3583, n3584, n3585, n3586, n3587, n3588,
         n3589, n3590, n3591, n3592, n3593, n3594, n3595, n3596, n3597, n3598,
         n3599, n3600, n3601, n3602, n3603, n3604, n3605, n3606, n3607, n3608,
         n3609, n3610, n3611, n3612, n3613, n3614, n3615, n3616, n3617, n3618,
         n3619, n3620, n3621, n3622, n3623, n3624, n3625, n3626, n3627, n3628,
         n3629, n3630, n3631, n3632, n3633, n3634, n3635, n3636, n3637, n3638,
         n3639, n3640, n3641, n3642, n3643, n3644, n3645, n3646, n3647, n3648,
         n3649, n3650, n3651, n3652, n3653, n3654, n3655, n3656, n3657, n3658,
         n3659, n3660, n3661, n3662, n3663, n3664, n3665, n3666, n3667, n3668,
         n3669, n3670, n3671, n3672, n3673, n3674, n3675, n3676, n3677, n3678,
         n3679, n3680, n3681, n3682, n3683, n3684, n3685, n3686, n3687, n3688,
         n3689, n3690, n3691, n3692, n3693, n3694, n3695, n3696, n3697, n3698,
         n3699, n3700, n3701, n3702, n3703, n3704, n3705, n3706, n3707, n3708,
         n3709, n3710, n3711, n3712, n3713, n3714, n3715, n3716, n3717, n3718,
         n3719, n3720, n3721, n3722, n3723, n3724, n3725, n3726, n3727, n3728,
         n3729, n3730, n3731, n3732, n3733, n3734, n3735, n3736, n3737, n3738,
         n3739, n3740, n3741, n3742, n3743, n3744, n3745, n3746, n3747, n3748,
         n3749, n3750, n3751, n3752, n3753, n3754, n3755, n3756, n3757, n3758,
         n3759, n3760, n3761, n3762, n3763, n3764, n3765, n3766, n3767, n3768,
         n3769, n3770, n3771, n3772, n3773, n3774, n3775, n3776, n3777, n3778,
         n3779, n3780, n3781, n3782, n3783, n3784, n3785, n3786, n3787, n3788,
         n3789, n3790, n3791, n3792, n3793, n3794, n3795, n3796, n3797, n3798,
         n3799, n3800, n3801, n3802, n3803, n3804, n3805, n3806, n3807, n3808,
         n3809, n3810, n3811, n3812, n3813, n3814, n3815, n3816, n3817, n3818,
         n3819, n3820, n3821, n3822, n3823, n3824, n3825, n3826, n3827, n3828,
         n3829, n3830, n3831, n3832, n3833, n3834, n3835, n3836, n3837, n3838,
         n3839, n3840, n3841, n3842, n3843, n3844, n3845, n3846, n3847, n3848,
         n3849, n3850, n3851, n3852, n3853, n3854, n3855, n3856, n3857, n3858,
         n3859, n3860, n3861, n3862, n3863, n3864, n3865, n3866, n3867, n3868,
         n3869, n3870, n3871, n3872, n3873, n3874, n3875, n3876, n3877, n3878,
         n3879, n3880, n3881, n3882, n3883, n3884, n3885, n3886, n3887, n3888,
         n3889, n3890, n3891, n3892, n3893, n3894, n3895, n3896, n3897, n3898,
         n3899, n3900, n3901, n3902, n3903, n3904, n3905, n3906, n3907, n3908,
         n3909, n3910, n3911, n3912, n3913, n3914, n3915, n3916, n3917, n3918,
         n3919, n3920, n3921, n3922, n3923, n3924, n3925, n3926, n3927, n3928,
         n3929, n3930, n3931, n3932, n3933, n3934, n3935, n3936, n3937, n3938,
         n3939, n3940, n3941, n3942, n3943, n3944, n3945, n3946, n3947, n3948,
         n3949, n3950, n3951, n3952, n3953, n3954, n3955, n3956, n3957, n3958,
         n3959, n3960, n3961, n3962, n3963, n3964, n3965, n3966, n3967, n3968,
         n3969, n3970, n3971, n3972, n3973, n3974, n3975, n3976, n3977, n3978,
         n3979, n3980, n3981, n3982, n3983, n3984, n3985, n3986, n3987, n3988,
         n3989, n3990, n3991, n3992, n3993, n3994, n3995, n3996, n3997, n3998,
         n3999, n4000, n4001, n4002, n4003, n4004, n4005, n4006, n4007, n4008,
         n4009, n4010, n4011, n4012, n4013, n4014, n4015, n4016, n4017, n4018,
         n4019, n4020, n4021, n4022, n4023, n4024, n4025, n4026, n4027, n4028,
         n4029, n4030, n4031, n4032, n4033, n4034, n4035, n4036, n4037, n4038,
         n4039, n4040, n4041, n4042, n4043, n4044, n4045, n4046, n4047, n4048,
         n4049, n4050, n4051, n4052, n4053, n4054, n4055, n4056, n4057, n4058,
         n4059, n4060, n4061, n4062, n4063, n4064, n4065, n4066, n4067, n4068,
         n4069, n4070, n4071, n4072, n4073, n4074, n4075, n4076, n4077, n4078,
         n4079, n4080, n4081, n4082, n4083, n4084, n4085, n4086, n4087, n4088,
         n4089, n4090, n4091, n4092, n4093, n4094, n4095, n4096, n4097, n4098,
         n4099, n4100, n4101, n4102, n4103, n4104, n4105, n4106, n4107, n4108,
         n4109, n4110, n4111, n4112, n4113, n4114, n4115, n4116, n4117, n4118,
         n4119, n4120, n4121, n4122, n4123, n4124, n4125, n4126, n4127, n4128,
         n4129, n4130, n4131, n4132, n4133, n4134, n4135, n4136, n4137, n4138,
         n4139, n4140, n4141, n4142, n4143, n4144, n4145, n4146, n4147, n4148,
         n4149, n4150, n4151, n4152, n4153, n4154, n4155, n4156, n4157, n4158,
         n4159, n4160, n4161, n4162, n4163, n4164, n4165, n4166, n4167, n4168,
         n4169, n4170, n4171, n4172, n4173, n4174, n4175, n4176, n4177, n4178,
         n4179, n4180, n4181, n4182, n4183, n4184, n4185, n4186, n4187, n4188,
         n4189, n4190, n4191, n4192, n4193, n4194, n4195, n4196, n4197, n4198,
         n4199, n4200, n4201, n4202, n4203, n4204, n4205, n4206, n4207, n4208,
         n4209, n4210, n4211, n4212, n4213, n4214, n4215, n4216, n4217, n4218,
         n4219, n4220, n4221, n4222, n4223, n4224, n4225, n4226, n4227, n4228,
         n4229, n4230, n4231, n4232, n4233, n4234, n4235, n4236, n4237, n4238,
         n4239, n4240, n4241, n4242, n4243, n4244, n4245, n4246, n4247, n4248,
         n4249, n4250, n4251, n4252, n4253, n4254, n4255, n4256, n4257, n4258,
         n4259, n4260, n4261, n4262, n4263, n4264, n4265, n4266, n4267, n4268,
         n4269, n4270, n4271, n4272, n4273, n4274, n4275, n4276, n4277, n4278,
         n4279, n4280, n4281, n4282, n4283, n4284, n4285, n4286, n4287, n4288,
         n4289, n4290, n4291, n4292, n4293, n4294, n4295, n4296, n4297, n4298,
         n4299, n4300, n4301, n4302, n4303, n4304, n4305, n4306, n4307, n4308,
         n4309, n4310, n4311, n4312, n4313, n4314, n4315, n4316, n4317, n4318,
         n4319, n4320, n4321, n4322, n4323, n4324, n4325, n4326, n4327, n4328,
         n4329, n4330, n4331, n4332, n4333, n4334, n4335, n4336, n4337, n4338,
         n4339, n4340, n4341, n4342, n4343, n4344, n4345, n4346, n4347, n4348,
         n4349, n4350, n4351, n4352, n4353, n4354, n4355, n4356, n4357, n4358,
         n4359, n4360, n4361, n4362, n4363, n4364, n4365, n4366, n4367, n4368,
         n4369, n4370, n4371, n4372, n4373, n4374, n4375, n4376, n4377, n4378,
         n4379, n4380, n4381, n4382, n4383, n4384, n4385, n4386, n4387, n4388,
         n4389, n4390, n4391, n4392, n4393, n4394, n4395, n4396, n4397, n4398,
         n4399, n4400, n4401, n4402, n4403, n4404, n4405, n4406, n4407, n4408,
         n4409, n4410, n4411, n4412, n4413, n4414, n4415, n4416, n4417, n4418,
         n4419, n4420, n4421, n4422, n4423, n4424, n4425, n4426, n4427, n4428,
         n4429, n4430, n4431, n4432, n4433, n4434, n4435, n4436, n4437, n4438,
         n4439, n4440, n4441, n4442, n4443, n4444, n4445, n4446, n4447, n4448,
         n4449, n4450, n4451, n4452, n4453, n4454, n4455, n4456, n4457, n4458,
         n4459, n4460, n4461, n4462, n4463, n4464, n4465, n4466, n4467, n4468,
         n4469, n4470, n4471, n4472, n4473, n4474, n4475, n4476, n4477, n4478,
         n4479, n4480, n4481, n4482, n4483, n4484, n4485, n4486, n4487, n4488,
         n4489, n4490, n4491, n4492, n4493, n4494, n4495, n4496, n4497, n4498,
         n4499, n4500, n4501, n4502, n4503, n4504, n4505, n4506, n4507, n4508,
         n4509, n4510, n4511, n4512, n4513, n4514, n4515, n4516, n4517, n4518,
         n4519, n4520, n4521, n4522, n4523, n4524, n4525, n4526, n4527, n4528,
         n4529, n4530, n4531, n4532, n4533, n4534, n4535, n4536, n4537, n4538,
         n4539, n4540, n4541, n4542, n4543, n4544, n4545, n4546, n4547, n4548,
         n4549, n4550, n4551, n4552, n4553, n4554, n4555, n4556, n4557, n4558,
         n4559, n4560, n4561, n4562, n4563, n4564, n4565, n4566, n4567, n4568,
         n4569, n4570, n4571, n4572, n4573, n4574, n4575, n4576, n4577, n4578,
         n4579, n4580, n4581, n4582, n4583, n4584, n4586, n4587, n4588, n4589,
         n4590, n4591, n4592, n4593, n4594, n4595, n4596, n4597, n4598, n4599,
         n4600, n4601, n4602, n4603, n4604, n4605, n4606, n4607, n4608, n4609,
         n4610, n4611, n4612, n4613, n4614, n4615, n4616, n4617, n4618, n4619,
         n4620, n4621, n4622, n4623, n4624, n4625, n4626, n4627, n4628, n4629,
         n4630, n4631, n4632, n4633, n4634, n4635, n4636, n4637, n4638, n4639,
         n4640, n4641, n4642, n4643, n4644, n4645, n4646, n4647, n4648, n4649,
         n4650, n4651, n4652, n4653, n4654, n4655, n4656, n4657, n4658, n4659,
         n4660, n4661, n4662, n4663, n4664, n4665, n4666, n4667, n4668, n4669,
         n4670, n4671, n4672, n4673, n4674, n4675, n4676, n4677, n4678, n4679,
         n4680, n4681, n4682, n4683, n4684, n4685, n4686, n4687, n4688, n4689,
         n4690, n4691, n4692, n4693, n4694, n4695, n4696, n4697, n4698, n4699,
         n4700, n4701, n4702, n4703, n4704, n4705, n4706, n4707, n4708, n4709,
         n4710, n4711, n4712, n4713, n4714, n4715, n4716, n4717, n4718, n4719,
         n4720, n4721, n4722, n4723, n4724, n4725, n4726, n4727, n4728, n4729,
         n4730, n4731, n4732, n4733, n4734, n4735, n4736, n4737, n4738, n4739,
         n4740, n4741, n4742, n4743, n4744, n4745, n4746, n4747, n4748, n4749,
         n4750, n4751, n4752, n4753, n4754, n4755, n4756, n4757, n4758, n4759,
         n4760, n4761, n4762, n4763, n4764, n4765, n4766, n4767, n4768, n4769,
         n4770, n4771, n4772, n4773, n4774, n4775, n4776, n4777, n4778, n4779,
         n4780, n4781, n4782, n4783, n4784, n4785, n4786, n4787, n4788, n4789,
         n4790, n4791, n4792, n4793, n4794, n4795, n4796, n4797, n4798, n4799,
         n4800, n4801, n4802, n4803, n4804, n4805, n4806, n4807, n4808, n4809,
         n4810, n4811, n4812, n4813, n4814, n4815, n4816, n4817, n4818, n4819,
         n4820, n4821, n4822, n4823, n4824, n4825, n4826, n4827, n4828, n4829,
         n4830, n4831, n4832, n4833, n4834, n4835, n4836, n4837, n4838, n4839,
         n4840, n4841, n4842, n4843, n4844, n4845, n4846, n4847, n4848, n4849,
         n4850, n4851, n4852, n4853, n4854, n4855, n4856, n4857, n4858, n4859,
         n4860, n4861, n4862, n4863, n4864, n4865, n4866, n4867, n4868, n4869,
         n4870, n4871, n4872, n4873, n4874, n4875, n4876, n4877, n4878, n4879,
         n4880, n4881, n4882, n4883, n4884, n4885, n4886, n4887, n4888, n4889,
         \add_161/n16 , \add_161/n15 , \add_161/n14 , \add_161/n13 ,
         \add_161/n12 , \add_161/n11 , \add_161/n10 , \add_161/n9 ,
         \add_161/n8 , \add_161/n7 , \add_161/n6 , \add_161/n5 , \add_161/n4 ,
         \add_161/n3 , \add_161/n1 , n4890, n4891, n4892, n4893, n4894, n4895,
         n4896, n4897, n4898, n4899, n4900, n4901, n4902, n4903, n4904, n4905,
         n4906, n4907, n4908, n4909, n4910, n4911, n4912, n4913, n4914, n4915,
         n4916, n4917, n4918, n4919, n4920, n4921, n4922, n4923, n4924, n4925,
         n4926, n4927, n4928, n4929, n4930, n4931, n4932, n4933, n4934, n4935,
         n4936, n4937, n4938, n4939, n4940, n4941, n4942, n4943, n4944, n4945,
         n4946, n4947, n4948, n4949, n4950, n4951, n4952, n4953, n4954, n4955,
         n4956, n4957, n4958, n4959, n4960, n4961, n4962, n4963, n4964, n4965,
         n4966, n4967, n4968, n4969, n4970, n4971, n4972, n4973, n4974, n4975,
         n4976, n4977, n4978, n4979, n4980, n4981, n4982, n4983, n4984, n4985,
         n4986, n4987, n4988, n4989, n4990, n4991, n4992, n4993, n4994, n4995,
         n4996, n4997, n4998, n4999, n5000, n5001, n5002, n5003, n5004, n5005,
         n5006, n5007, n5008, n5009, n5010, n5011, n5012, n5013, n5014, n5015,
         n5016, n5017, n5018, n5019, n5020, n5021, n5022, n5023, n5024, n5025,
         n5026, n5027, n5028, n5029, n5030, n5031, n5032, n5033, n5034, n5035,
         n5036, n5037, n5038, n5039, n5040, n5041, n5042, n5043, n5044, n5045,
         n5046, n5047, n5048, n5049, n5050, n5051, n5052, n5053, n5054, n5055,
         n5056, n5057, n5058, n5059, n5060, n5061, n5062, n5063, n5064, n5065,
         n5066, n5067, n5068, n5069, n5070, n5071, n5072, n5073, n5074, n5075,
         n5076, n5077, n5078, n5079, n5080, n5081, n5082, n5083, n5084, n5085,
         n5086, n5087, n5088, n5089, n5090, n5091, n5092, n5093, n5094, n5095,
         n5096, n5097, n5098, n5099, n5100, n5101, n5102, n5103, n5104, n5105,
         n5106, n5107, n5108, n5109, n5110, n5111, n5112, n5113, n5114, n5115,
         n5116, n5117, n5118, n5119, n5120, n5121, n5122, n5123, n5124, n5125,
         n5126, n5127, n5128, n5129, n5130, n5131, n5132, n5133, n5134, n5135,
         n5136, n5137, n5138, n5139, n5140, n5141, n5142, n5143, n5144, n5145,
         n5146, n5147, n5148, n5149, n5150, n5151, n5152, n5153, n5154, n5155,
         n5156, n5157, n5158, n5159, n5160, n5161, n5162, n5163, n5164, n5165,
         n5166, n5167, n5168, n5169, n5170, n5171, n5172, n5173, n5174, n5175,
         n5176, n5177, n5178, n5179, n5180, n5181, n5182;
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, 
        SYNOPSYS_UNCONNECTED__4, SYNOPSYS_UNCONNECTED__5, 
        SYNOPSYS_UNCONNECTED__6, SYNOPSYS_UNCONNECTED__7, 
        SYNOPSYS_UNCONNECTED__8, SYNOPSYS_UNCONNECTED__9, 
        SYNOPSYS_UNCONNECTED__10, SYNOPSYS_UNCONNECTED__11, 
        SYNOPSYS_UNCONNECTED__12, SYNOPSYS_UNCONNECTED__13, 
        SYNOPSYS_UNCONNECTED__14, SYNOPSYS_UNCONNECTED__15, 
        SYNOPSYS_UNCONNECTED__16, SYNOPSYS_UNCONNECTED__17, 
        SYNOPSYS_UNCONNECTED__18, SYNOPSYS_UNCONNECTED__19, 
        SYNOPSYS_UNCONNECTED__20, SYNOPSYS_UNCONNECTED__21, 
        SYNOPSYS_UNCONNECTED__22, SYNOPSYS_UNCONNECTED__23, 
        SYNOPSYS_UNCONNECTED__24, SYNOPSYS_UNCONNECTED__25, 
        SYNOPSYS_UNCONNECTED__26, SYNOPSYS_UNCONNECTED__27, 
        SYNOPSYS_UNCONNECTED__28, SYNOPSYS_UNCONNECTED__29, 
        SYNOPSYS_UNCONNECTED__30, SYNOPSYS_UNCONNECTED__31, 
        SYNOPSYS_UNCONNECTED__32, SYNOPSYS_UNCONNECTED__33, 
        SYNOPSYS_UNCONNECTED__34, SYNOPSYS_UNCONNECTED__35, 
        SYNOPSYS_UNCONNECTED__36, SYNOPSYS_UNCONNECTED__37, 
        SYNOPSYS_UNCONNECTED__38, SYNOPSYS_UNCONNECTED__39, 
        SYNOPSYS_UNCONNECTED__40, SYNOPSYS_UNCONNECTED__41, 
        SYNOPSYS_UNCONNECTED__42, SYNOPSYS_UNCONNECTED__43, 
        SYNOPSYS_UNCONNECTED__44, SYNOPSYS_UNCONNECTED__45, 
        SYNOPSYS_UNCONNECTED__46, SYNOPSYS_UNCONNECTED__47, 
        SYNOPSYS_UNCONNECTED__48, SYNOPSYS_UNCONNECTED__49, 
        SYNOPSYS_UNCONNECTED__50, SYNOPSYS_UNCONNECTED__51, 
        SYNOPSYS_UNCONNECTED__52, SYNOPSYS_UNCONNECTED__53, 
        SYNOPSYS_UNCONNECTED__54, SYNOPSYS_UNCONNECTED__55, 
        SYNOPSYS_UNCONNECTED__56, SYNOPSYS_UNCONNECTED__57, 
        SYNOPSYS_UNCONNECTED__58, SYNOPSYS_UNCONNECTED__59, 
        SYNOPSYS_UNCONNECTED__60, SYNOPSYS_UNCONNECTED__61, 
        SYNOPSYS_UNCONNECTED__62, SYNOPSYS_UNCONNECTED__63, 
        SYNOPSYS_UNCONNECTED__64, SYNOPSYS_UNCONNECTED__65, 
        SYNOPSYS_UNCONNECTED__66, SYNOPSYS_UNCONNECTED__67, 
        SYNOPSYS_UNCONNECTED__68, SYNOPSYS_UNCONNECTED__69, 
        SYNOPSYS_UNCONNECTED__70, SYNOPSYS_UNCONNECTED__71, 
        SYNOPSYS_UNCONNECTED__72, SYNOPSYS_UNCONNECTED__73, 
        SYNOPSYS_UNCONNECTED__74, SYNOPSYS_UNCONNECTED__75, 
        SYNOPSYS_UNCONNECTED__76, SYNOPSYS_UNCONNECTED__77, 
        SYNOPSYS_UNCONNECTED__78, SYNOPSYS_UNCONNECTED__79, 
        SYNOPSYS_UNCONNECTED__80, SYNOPSYS_UNCONNECTED__81, 
        SYNOPSYS_UNCONNECTED__82, SYNOPSYS_UNCONNECTED__83, 
        SYNOPSYS_UNCONNECTED__84, SYNOPSYS_UNCONNECTED__85, 
        SYNOPSYS_UNCONNECTED__86, SYNOPSYS_UNCONNECTED__87, 
        SYNOPSYS_UNCONNECTED__88, SYNOPSYS_UNCONNECTED__89, 
        SYNOPSYS_UNCONNECTED__90, SYNOPSYS_UNCONNECTED__91;
  assign \y\[31\]  = n4888;

  FAx1_ASAP7_75t_R \add_441/U1_7  ( .A(\s5_interp_lo_lo_hi\[1\] ), .B(
        \s5_interp_lo_lo_lo\[7\] ), .CI(n2989), .CON(n3561), .SN(n3560) );
  FAx1_ASAP7_75t_R \add_441/U1_8  ( .A(\s5_interp_lo_lo_hi\[2\] ), .B(
        \s5_interp_lo_lo_lo\[8\] ), .CI(n3567), .CON(n3563), .SN(n3562) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p7_reg\[1\]  ( .D(n4019), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p7\[1\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p6_reg\[1\]  ( .D(n3992), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p6\[1\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p5_reg\[1\]  ( .D(n3965), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p5\[1\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p4_reg\[1\]  ( .D(n3938), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p4\[1\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p3_reg\[1\]  ( .D(n3911), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p3\[1\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p2_reg\[1\]  ( .D(n3884), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p2\[1\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p1_reg\[1\]  ( .D(n3857), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p1\[1\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p0_reg\[1\]  ( .D(n3830), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p0\[1\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2m_prod_lo_reg\[12\]  ( .D(n4371), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2m_prod_lo\[12\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2m_prod_hi_reg\[12\]  ( .D(n4410), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2m_prod_hi\[12\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p7_reg\[2\]  ( .D(n4018), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p7\[2\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p6_reg\[2\]  ( .D(n3991), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p6\[2\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p5_reg\[2\]  ( .D(n3964), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p5\[2\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p4_reg\[2\]  ( .D(n3937), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p4\[2\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p3_reg\[2\]  ( .D(n3910), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p3\[2\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p2_reg\[2\]  ( .D(n3883), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p2\[2\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p1_reg\[2\]  ( .D(n3856), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p1\[2\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p0_reg\[2\]  ( .D(n3829), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p0\[2\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s4_delta_reg\[3\]  ( .D(n4435), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s4_delta\[3\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s7_interp_hi_reg\[15\]  ( .D(n4581), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s7_interp_hi\[15\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s6_interp_lo_hi_reg\[9\]  ( .D(n4480), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s6_interp_lo_hi\[9\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s6_interp_hi_lo_reg\[9\]  ( .D(n4499), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s6_interp_hi_lo\[9\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s6_interp_hi_hi_reg\[9\]  ( .D(n4518), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s6_interp_hi_hi\[9\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2p_lo_hi_reg\[9\]  ( .D(n4269), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2p_lo_hi\[9\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2p_hi_hi_reg\[9\]  ( .D(n4331), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2p_hi_hi\[9\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2p_lo_hi_reg\[12\]  ( .D(n4266), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2p_lo_hi\[12\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2p_hi_hi_reg\[12\]  ( .D(n4328), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2p_hi_hi\[12\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s7_interp_hi_reg\[16\]  ( .D(n4580), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s7_interp_hi\[16\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s4_delta_reg\[4\]  ( .D(n4434), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s4_delta\[4\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s6_interp_lo_lo_reg\[9\]  ( .D(n4463), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s6_interp_lo_lo\[9\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2m_prod_lo_reg\[13\]  ( .D(n4370), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2m_prod_lo\[13\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2m_prod_hi_reg\[13\]  ( .D(n4409), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2m_prod_hi\[13\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2p_lo_lo_reg\[9\]  ( .D(n4238), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2p_lo_lo\[9\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2p_hi_lo_reg\[9\]  ( .D(n4300), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2p_hi_lo\[9\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2p_lo_hi_reg\[16\]  ( .D(n4262), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2p_lo_hi\[16\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2p_hi_hi_reg\[16\]  ( .D(n4324), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2p_hi_hi\[16\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2p_lo_lo_reg\[12\]  ( .D(n4235), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2p_lo_lo\[12\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2p_hi_lo_reg\[12\]  ( .D(n4297), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2p_hi_lo\[12\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s5_interp_lo_hi_hi_reg\[2\]  ( .D(n4063), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s5_interp_lo_hi_hi\[2\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s5_interp_hi_hi_lo_reg\[2\]  ( .D(n4131), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s5_interp_hi_hi_lo\[2\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s7_interp_lo_reg\[16\]  ( .D(n4549), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s7_interp_lo\[16\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2p_lo_hi_reg\[17\]  ( .D(n4261), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2p_lo_hi\[17\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2p_hi_hi_reg\[17\]  ( .D(n4323), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2p_hi_hi\[17\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s5_interp_lo_hi_lo_reg\[2\]  ( .D(n4077), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s5_interp_lo_hi_lo\[2\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s5_interp_hi_lo_lo_reg\[2\]  ( .D(n4157), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s5_interp_hi_lo_lo\[2\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s5_interp_lo_lo_hi_reg\[2\]  ( .D(n4091), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s5_interp_lo_lo_hi\[2\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2p_lo_lo_reg\[16\]  ( .D(n4231), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2p_lo_lo\[16\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2p_hi_lo_reg\[16\]  ( .D(n4293), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2p_hi_lo\[16\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2p_lo_hi_reg\[13\]  ( .D(n4265), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2p_lo_hi\[13\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2p_hi_hi_reg\[13\]  ( .D(n4327), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2p_hi_hi\[13\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2p_lo_hi_reg\[10\]  ( .D(n4268), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2p_lo_hi\[10\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2p_hi_hi_reg\[10\]  ( .D(n4330), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2p_hi_hi\[10\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2p_lo_lo_reg\[17\]  ( .D(n4230), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2p_lo_lo\[17\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2p_hi_lo_reg\[17\]  ( .D(n4292), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2p_hi_lo\[17\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s4_delta_reg\[5\]  ( .D(n4433), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s4_delta\[5\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s6_interp_lo_hi_reg\[10\]  ( .D(n4479), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s6_interp_lo_hi\[10\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s6_interp_hi_lo_reg\[10\]  ( .D(n4498), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s6_interp_hi_lo\[10\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s6_interp_hi_hi_reg\[10\]  ( .D(n4517), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s6_interp_hi_hi\[10\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2m_prod_lo_reg\[16\]  ( .D(n4367), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2m_prod_lo\[16\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2m_prod_hi_reg\[16\]  ( .D(n4406), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2m_prod_hi\[16\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p7_reg\[3\]  ( .D(n4017), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p7\[3\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p6_reg\[3\]  ( .D(n3990), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p6\[3\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p5_reg\[3\]  ( .D(n3963), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p5\[3\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p4_reg\[3\]  ( .D(n3936), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p4\[3\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p3_reg\[3\]  ( .D(n3909), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p3\[3\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p2_reg\[3\]  ( .D(n3882), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p2\[3\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p1_reg\[3\]  ( .D(n3855), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p1\[3\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p0_reg\[3\]  ( .D(n3828), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p0\[3\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2p_lo_lo_reg\[13\]  ( .D(n4234), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2p_lo_lo\[13\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2p_hi_lo_reg\[13\]  ( .D(n4296), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2p_hi_lo\[13\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s4_delta_reg\[8\]  ( .D(n4430), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s4_delta\[8\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2p_lo_lo_reg\[10\]  ( .D(n4237), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2p_lo_lo\[10\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2p_hi_lo_reg\[10\]  ( .D(n4299), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2p_hi_lo\[10\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s7_interp_lo_reg\[17\]  ( .D(n4548), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s7_interp_lo\[17\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2m_prod_lo_reg\[14\]  ( .D(n4369), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2m_prod_lo\[14\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2m_prod_hi_reg\[14\]  ( .D(n4408), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2m_prod_hi\[14\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s6_interp_lo_lo_reg\[10\]  ( .D(n4462), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s6_interp_lo_lo\[10\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s5_interp_lo_lo_lo_reg\[2\]  ( .D(n4105), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s5_interp_lo_lo_lo\[2\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2m_prod_lo_reg\[15\]  ( .D(n4368), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2m_prod_lo\[15\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2m_prod_hi_reg\[15\]  ( .D(n4407), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2m_prod_hi\[15\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2p_lo_hi_reg\[18\]  ( .D(n4260), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2p_lo_hi\[18\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2p_hi_hi_reg\[18\]  ( .D(n4322), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2p_hi_hi\[18\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s7_interp_lo_reg\[20\]  ( .D(n4545), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s7_interp_lo\[20\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s5_interp_hi_lo_hi_reg\[2\]  ( .D(n4144), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s5_interp_hi_lo_hi\[2\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2p_lo_hi_reg\[11\]  ( .D(n4267), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2p_lo_hi\[11\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2p_hi_hi_reg\[11\]  ( .D(n4329), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2p_hi_hi\[11\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s4_delta_reg\[6\]  ( .D(n4432), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s4_delta\[6\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s5_interp_hi_hi_hi_reg\[2\]  ( .D(n4118), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s5_interp_hi_hi_hi\[2\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p7_reg\[4\]  ( .D(n4016), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p7\[4\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s4_delta_reg\[9\]  ( .D(n4429), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s4_delta\[9\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p6_reg\[4\]  ( .D(n3989), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p6\[4\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p5_reg\[4\]  ( .D(n3962), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p5\[4\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p4_reg\[4\]  ( .D(n3935), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p4\[4\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p3_reg\[4\]  ( .D(n3908), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p3\[4\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p2_reg\[4\]  ( .D(n3881), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p2\[4\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p1_reg\[4\]  ( .D(n3854), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p1\[4\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p0_reg\[4\]  ( .D(n3827), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p0\[4\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2p_lo_hi_reg\[14\]  ( .D(n4264), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2p_lo_hi\[14\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2p_hi_hi_reg\[14\]  ( .D(n4326), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2p_hi_hi\[14\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s4_delta_reg\[12\]  ( .D(n4426), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s4_delta\[12\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2p_lo_lo_reg\[11\]  ( .D(n4236), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2p_lo_lo\[11\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2p_hi_lo_reg\[11\]  ( .D(n4298), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2p_hi_lo\[11\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s7_interp_hi_reg\[17\]  ( .D(n4579), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s7_interp_hi\[17\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2p_lo_lo_reg\[18\]  ( .D(n4229), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2p_lo_lo\[18\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2p_hi_lo_reg\[18\]  ( .D(n4291), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2p_hi_lo\[18\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s4_delta_reg\[16\]  ( .D(n4422), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s4_delta\[16\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s7_interp_hi_reg\[18\]  ( .D(n4578), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s7_interp_hi\[18\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2m_prod_lo_reg\[17\]  ( .D(n4366), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2m_prod_lo\[17\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2m_prod_hi_reg\[17\]  ( .D(n4405), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2m_prod_hi\[17\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2p_lo_lo_reg\[14\]  ( .D(n4233), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2p_lo_lo\[14\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2p_hi_lo_reg\[14\]  ( .D(n4295), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2p_hi_lo\[14\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s6_interp_lo_hi_reg\[11\]  ( .D(n4478), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s6_interp_lo_hi\[11\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s6_interp_hi_lo_reg\[11\]  ( .D(n4497), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s6_interp_hi_lo\[11\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s6_interp_hi_hi_reg\[11\]  ( .D(n4516), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s6_interp_hi_hi\[11\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s7_interp_lo_reg\[21\]  ( .D(n4544), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s7_interp_lo\[21\] ) );
  DFFASRHQNx1_ASAP7_75t_R s1_clamp_big_reg ( .D(n2857), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(s1_clamp_big) );
  DFFASRHQNx1_ASAP7_75t_R \s2m_prod_lo_reg\[20\]  ( .D(n4363), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2m_prod_lo\[20\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2m_prod_hi_reg\[20\]  ( .D(n4402), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2m_prod_hi\[20\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s7_interp_lo_reg\[24\]  ( .D(n4541), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s7_interp_lo\[24\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s5_interp_hi_hi_lo_reg\[3\]  ( .D(n4130), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s5_interp_hi_hi_lo\[3\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s5_interp_lo_hi_hi_reg\[3\]  ( .D(n4062), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s5_interp_lo_hi_hi\[3\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s4_delta_reg\[7\]  ( .D(n4431), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s4_delta\[7\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s4_delta_reg\[17\]  ( .D(n4421), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s4_delta\[17\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s5_interp_lo_hi_lo_reg\[3\]  ( .D(n4076), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s5_interp_lo_hi_lo\[3\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2p_lo_hi_reg\[19\]  ( .D(n4259), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2p_lo_hi\[19\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2p_hi_hi_reg\[19\]  ( .D(n4321), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2p_hi_hi\[19\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s5_interp_hi_lo_lo_reg\[3\]  ( .D(n4156), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s5_interp_hi_lo_lo\[3\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s7_interp_lo_reg\[18\]  ( .D(n4547), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s7_interp_lo\[18\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s6_interp_lo_lo_reg\[11\]  ( .D(n4461), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s6_interp_lo_lo\[11\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s3_lut_base_reg\[11\]  ( .D(n4621), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s3_lut_base\[11\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p7_reg\[5\]  ( .D(n4015), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p7\[5\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2p_lo_hi_reg\[15\]  ( .D(n4263), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2p_lo_hi\[15\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2p_hi_hi_reg\[15\]  ( .D(n4325), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2p_hi_hi\[15\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p6_reg\[5\]  ( .D(n3988), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p6\[5\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p5_reg\[5\]  ( .D(n3961), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p5\[5\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p4_reg\[5\]  ( .D(n3934), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p4\[5\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p3_reg\[5\]  ( .D(n3907), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p3\[5\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p2_reg\[5\]  ( .D(n3880), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p2\[5\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p1_reg\[5\]  ( .D(n3853), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p1\[5\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p0_reg\[5\]  ( .D(n3826), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p0\[5\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s5_interp_lo_lo_hi_reg\[3\]  ( .D(n4090), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s5_interp_lo_lo_hi\[3\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s4_delta_reg\[10\]  ( .D(n4428), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s4_delta\[10\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s7_interp_lo_reg\[32\]  ( .D(n4533), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s7_interp_lo\[32\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2m_prod_lo_reg\[18\]  ( .D(n4365), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2m_prod_lo\[18\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2m_prod_hi_reg\[18\]  ( .D(n4404), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2m_prod_hi\[18\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2p_lo_lo_reg\[15\]  ( .D(n4232), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2p_lo_lo\[15\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2p_hi_lo_reg\[15\]  ( .D(n4294), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2p_hi_lo\[15\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2p_lo_lo_reg\[19\]  ( .D(n4228), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2p_lo_lo\[19\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2p_hi_lo_reg\[19\]  ( .D(n4290), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2p_hi_lo\[19\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s3_lut_base_reg\[19\]  ( .D(n4628), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s3_lut_base\[19\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s3_lut_base_reg\[9\]  ( .D(n4623), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s3_lut_base\[9\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s5_interp_lo_lo_lo_reg\[3\]  ( .D(n4104), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s5_interp_lo_lo_lo\[3\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s7_interp_lo_reg\[19\]  ( .D(n4546), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s7_interp_lo\[19\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s3_lut_base_reg\[3\]  ( .D(n4620), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s3_lut_base\[3\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s7_interp_lo_reg\[22\]  ( .D(n4543), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s7_interp_lo\[22\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s3_lut_next_reg\[0\]  ( .D(n4608), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s3_lut_next\[0\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s7_interp_hi_reg\[20\]  ( .D(n4576), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s7_interp_hi\[20\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s4_delta_reg\[13\]  ( .D(n4425), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s4_delta\[13\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s3_lut_base_reg\[12\]  ( .D(n4627), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s3_lut_base\[12\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s5_interp_hi_lo_hi_reg\[3\]  ( .D(n4143), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s5_interp_hi_lo_hi\[3\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s7_interp_lo_reg\[25\]  ( .D(n4540), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s7_interp_lo\[25\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2m_prod_lo_reg\[21\]  ( .D(n4362), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2m_prod_lo\[21\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2m_prod_hi_reg\[21\]  ( .D(n4401), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2m_prod_hi\[21\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s3_lut_next_reg\[6\]  ( .D(n4610), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s3_lut_next\[6\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s6_interp_lo_hi_reg\[12\]  ( .D(n4477), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s6_interp_lo_hi\[12\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s6_interp_hi_lo_reg\[12\]  ( .D(n4496), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s6_interp_hi_lo\[12\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s6_interp_hi_hi_reg\[12\]  ( .D(n4515), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s6_interp_hi_hi\[12\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2m_prod_lo_reg\[24\]  ( .D(n4359), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2m_prod_lo\[24\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2m_prod_hi_reg\[24\]  ( .D(n4398), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2m_prod_hi\[24\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s5_interp_hi_hi_hi_reg\[3\]  ( .D(n4117), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s5_interp_hi_hi_hi\[3\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s3_lut_next_reg\[16\]  ( .D(n4609), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s3_lut_next\[16\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s3_lut_next_reg\[5\]  ( .D(n4648), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s3_lut_next\[5\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2p_lo_hi_reg\[20\]  ( .D(n4258), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2p_lo_hi\[20\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2p_hi_hi_reg\[20\]  ( .D(n4320), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2p_hi_hi\[20\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s3_lut_base_reg\[8\]  ( .D(n4636), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s3_lut_base\[8\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s3_lut_next_reg\[18\]  ( .D(n4645), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s3_lut_next\[18\] ) );
  DFFASRHQNx1_ASAP7_75t_R \y_reg\[30\]  ( .D(n4446), .CLK(clk), .RESETN(n4889), 
        .SETN(rst_n), .QN(\y\[30\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s4_delta_reg\[11\]  ( .D(n4427), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s4_delta\[11\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s4_delta_reg\[18\]  ( .D(n4420), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s4_delta\[18\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s7_interp_lo_reg\[23\]  ( .D(n4542), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s7_interp_lo\[23\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s3_lut_next_reg\[10\]  ( .D(n4607), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s3_lut_next\[10\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p7_reg\[6\]  ( .D(n4014), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p7\[6\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s6_interp_lo_lo_reg\[12\]  ( .D(n4460), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s6_interp_lo_lo\[12\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p6_reg\[6\]  ( .D(n3987), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p6\[6\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p5_reg\[6\]  ( .D(n3960), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p5\[6\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p4_reg\[6\]  ( .D(n3933), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p4\[6\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p3_reg\[6\]  ( .D(n3906), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p3\[6\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p2_reg\[6\]  ( .D(n3879), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p2\[6\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p1_reg\[6\]  ( .D(n3852), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p1\[6\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p0_reg\[6\]  ( .D(n3825), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p0\[6\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s3_lut_base_reg\[10\]  ( .D(n4611), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s3_lut_base\[10\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2m_prod_lo_reg\[19\]  ( .D(n4364), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2m_prod_lo\[19\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2m_prod_hi_reg\[19\]  ( .D(n4403), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2m_prod_hi\[19\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s3_lut_base_reg\[18\]  ( .D(n4647), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s3_lut_base\[18\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s3_lut_next_reg\[19\]  ( .D(n4626), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s3_lut_next\[19\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s3_lut_base_reg\[16\]  ( .D(n4622), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s3_lut_base\[16\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s7_interp_hi_reg\[19\]  ( .D(n4577), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s7_interp_hi\[19\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s7_interp_lo_reg\[28\]  ( .D(n4537), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s7_interp_lo\[28\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2p_lo_lo_reg\[20\]  ( .D(n4227), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2p_lo_lo\[20\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2p_hi_lo_reg\[20\]  ( .D(n4289), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2p_hi_lo\[20\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s4_delta_reg\[14\]  ( .D(n4424), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s4_delta\[14\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s3_lut_next_reg\[11\]  ( .D(n4633), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s3_lut_next\[11\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s3_lut_next_reg\[17\]  ( .D(n4612), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s3_lut_next\[17\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s3_lut_next_reg\[1\]  ( .D(n4625), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s3_lut_next\[1\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s5_interp_hi_hi_lo_reg\[4\]  ( .D(n4129), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s5_interp_hi_hi_lo\[4\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s3_lut_next_reg\[15\]  ( .D(n4624), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s3_lut_next\[15\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s7_interp_hi_reg\[21\]  ( .D(n4575), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s7_interp_hi\[21\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s5_interp_hi_lo_lo_reg\[4\]  ( .D(n4155), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s5_interp_hi_lo_lo\[4\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2m_prod_lo_reg\[22\]  ( .D(n4361), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2m_prod_lo\[22\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2m_prod_hi_reg\[22\]  ( .D(n4400), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2m_prod_hi\[22\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s3_lut_base_reg\[21\]  ( .D(n4639), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s3_lut_base\[21\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s3_lut_next_reg\[21\]  ( .D(n4640), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s3_lut_next\[21\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s4_delta_reg\[19\]  ( .D(n4419), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s4_delta\[19\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s3_lut_base_reg\[7\]  ( .D(n4629), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s3_lut_base\[7\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s3_lut_base_reg\[6\]  ( .D(n4613), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s3_lut_base\[6\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2m_prod_lo_reg\[32\]  ( .D(n4351), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2m_prod_lo\[32\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2m_prod_hi_reg\[32\]  ( .D(n4390), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2m_prod_hi\[32\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s5_interp_lo_hi_hi_reg\[4\]  ( .D(n4061), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s5_interp_lo_hi_hi\[4\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s3_lut_next_reg\[13\]  ( .D(n4631), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s3_lut_next\[13\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s3_lut_base_reg\[17\]  ( .D(n4644), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s3_lut_base\[17\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s5_interp_lo_hi_lo_reg\[4\]  ( .D(n4075), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s5_interp_lo_hi_lo\[4\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s3_lut_next_reg\[3\]  ( .D(n4603), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s3_lut_next\[3\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s3_lut_next_reg\[4\]  ( .D(n4630), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s3_lut_next\[4\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s3_lut_base_reg\[4\]  ( .D(n4646), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s3_lut_base\[4\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s5_interp_lo_lo_lo_reg\[4\]  ( .D(n4103), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s5_interp_lo_lo_lo\[4\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s3_lut_next_reg\[9\]  ( .D(n4619), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s3_lut_next\[9\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2m_prod_lo_reg\[25\]  ( .D(n4358), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2m_prod_lo\[25\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2m_prod_hi_reg\[25\]  ( .D(n4397), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2m_prod_hi\[25\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2m_prod_lo_reg\[28\]  ( .D(n4355), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2m_prod_lo\[28\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2m_prod_hi_reg\[28\]  ( .D(n4394), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2m_prod_hi\[28\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s6_interp_lo_hi_reg\[13\]  ( .D(n4476), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s6_interp_lo_hi\[13\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s6_interp_hi_lo_reg\[13\]  ( .D(n4495), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s6_interp_hi_lo\[13\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s6_interp_hi_hi_reg\[13\]  ( .D(n4514), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s6_interp_hi_hi\[13\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s5_interp_lo_lo_hi_reg\[4\]  ( .D(n4089), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s5_interp_lo_lo_hi\[4\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s7_interp_lo_reg\[26\]  ( .D(n4539), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s7_interp_lo\[26\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s7_interp_lo_reg\[29\]  ( .D(n4536), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s7_interp_lo\[29\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s4_delta_reg\[15\]  ( .D(n4423), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s4_delta\[15\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s3_lut_next_reg\[7\]  ( .D(n4618), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s3_lut_next\[7\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2p_lo_lo_reg\[21\]  ( .D(n4226), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2p_lo_lo\[21\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2p_hi_lo_reg\[21\]  ( .D(n4288), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2p_hi_lo\[21\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s3_lut_base_reg\[5\]  ( .D(n4643), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s3_lut_base\[5\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s3_lut_next_reg\[20\]  ( .D(n4642), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s3_lut_next\[20\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s3_lut_base_reg\[20\]  ( .D(n4641), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s3_lut_base\[20\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2p_lo_hi_reg\[21\]  ( .D(n4257), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2p_lo_hi\[21\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2p_hi_hi_reg\[21\]  ( .D(n4319), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2p_hi_hi\[21\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p7_reg\[7\]  ( .D(n4013), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p7\[7\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p6_reg\[7\]  ( .D(n3986), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p6\[7\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p5_reg\[7\]  ( .D(n3959), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p5\[7\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p4_reg\[7\]  ( .D(n3932), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p4\[7\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p3_reg\[7\]  ( .D(n3905), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p3\[7\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p2_reg\[7\]  ( .D(n3878), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p2\[7\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p1_reg\[7\]  ( .D(n3851), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p1\[7\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p0_reg\[7\]  ( .D(n3824), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p0\[7\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s5_interp_hi_lo_hi_reg\[4\]  ( .D(n4142), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s5_interp_hi_lo_hi\[4\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s6_interp_lo_lo_reg\[13\]  ( .D(n4459), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s6_interp_lo_lo\[13\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s3_lut_base_reg\[14\]  ( .D(n4637), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s3_lut_base\[14\] ) );
  DFFASRHQNx1_ASAP7_75t_R \y_reg\[29\]  ( .D(n4445), .CLK(clk), .RESETN(n4889), 
        .SETN(rst_n), .QN(\y\[29\] ) );
  DFFASRHQNx1_ASAP7_75t_R \y_reg\[28\]  ( .D(n4444), .CLK(clk), .RESETN(n4889), 
        .SETN(rst_n), .QN(\y\[28\] ) );
  DFFASRHQNx1_ASAP7_75t_R \y_reg\[27\]  ( .D(n4443), .CLK(clk), .RESETN(n4889), 
        .SETN(rst_n), .QN(\y\[27\] ) );
  DFFASRHQNx1_ASAP7_75t_R \y_reg\[26\]  ( .D(n4442), .CLK(clk), .RESETN(n4889), 
        .SETN(rst_n), .QN(\y\[26\] ) );
  DFFASRHQNx1_ASAP7_75t_R \y_reg\[25\]  ( .D(n4441), .CLK(clk), .RESETN(n4889), 
        .SETN(rst_n), .QN(\y\[25\] ) );
  DFFASRHQNx1_ASAP7_75t_R \y_reg\[24\]  ( .D(n4440), .CLK(clk), .RESETN(n4889), 
        .SETN(rst_n), .QN(\y\[24\] ) );
  DFFASRHQNx1_ASAP7_75t_R \y_reg\[23\]  ( .D(n4439), .CLK(clk), .RESETN(n4889), 
        .SETN(rst_n), .QN(\y\[23\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s5_interp_hi_hi_hi_reg\[4\]  ( .D(n4116), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s5_interp_hi_hi_hi\[4\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s3_lut_next_reg\[8\]  ( .D(n4638), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s3_lut_next\[8\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s7_interp_hi_reg\[22\]  ( .D(n4574), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s7_interp_hi\[22\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s7_interp_lo_reg\[27\]  ( .D(n4538), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s7_interp_lo\[27\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s3_lut_next_reg\[14\]  ( .D(n4615), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s3_lut_next\[14\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2m_prod_lo_reg\[23\]  ( .D(n4360), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2m_prod_lo\[23\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2m_prod_hi_reg\[23\]  ( .D(n4399), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2m_prod_hi\[23\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s3_lut_next_reg\[12\]  ( .D(n4635), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s3_lut_next\[12\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2m_prod_lo_reg\[33\]  ( .D(n4350), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2m_prod_lo\[33\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2m_prod_hi_reg\[33\]  ( .D(n4389), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2m_prod_hi\[33\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s6_interp_hi_lo_reg\[14\]  ( .D(n4494), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s6_interp_hi_lo\[14\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s6_interp_hi_hi_reg\[14\]  ( .D(n4513), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s6_interp_hi_hi\[14\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s3_lut_base_reg\[0\]  ( .D(n4614), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s3_lut_base\[0\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s7_interp_lo_reg\[30\]  ( .D(n4535), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s7_interp_lo\[30\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2p_lo_hi_reg\[22\]  ( .D(n4256), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2p_lo_hi\[22\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2p_hi_hi_reg\[22\]  ( .D(n4318), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2p_hi_hi\[22\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2m_prod_lo_reg\[26\]  ( .D(n4357), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2m_prod_lo\[26\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2m_prod_hi_reg\[26\]  ( .D(n4396), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2m_prod_hi\[26\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2m_prod_lo_reg\[29\]  ( .D(n4354), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2m_prod_lo\[29\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2m_prod_hi_reg\[29\]  ( .D(n4393), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2m_prod_hi\[29\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s3_lut_base_reg\[15\]  ( .D(n4632), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s3_lut_base\[15\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2p_lo_lo_reg\[22\]  ( .D(n4225), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2p_lo_lo\[22\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2p_hi_lo_reg\[22\]  ( .D(n4287), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2p_hi_lo\[22\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s1_mag_u_reg\[29\]  ( .D(n4891), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s1_mag_u\[29\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s1_mag_u_reg\[28\]  ( .D(n4890), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s1_mag_u\[28\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p7_reg\[8\]  ( .D(n4012), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p7\[8\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p6_reg\[8\]  ( .D(n3985), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p6\[8\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p5_reg\[8\]  ( .D(n3958), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p5\[8\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p4_reg\[8\]  ( .D(n3931), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p4\[8\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p3_reg\[8\]  ( .D(n3904), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p3\[8\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p2_reg\[8\]  ( .D(n3877), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p2\[8\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p1_reg\[8\]  ( .D(n3850), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p1\[8\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p0_reg\[8\]  ( .D(n3823), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p0\[8\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s3_lut_base_reg\[2\]  ( .D(n4605), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s3_lut_base\[2\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s1_mag_u_reg\[25\]  ( .D(n2752), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s1_mag_u\[25\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s1_mag_u_reg\[24\]  ( .D(n2634), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s1_mag_u\[24\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s6_interp_lo_hi_reg\[14\]  ( .D(n4475), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s6_interp_lo_hi\[14\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s1_mag_u_reg\[30\]  ( .D(n4205), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s1_mag_u\[30\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s1_mag_u_reg\[27\]  ( .D(n2825), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s1_mag_u\[27\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p7_reg\[10\]  ( .D(n4010), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p7\[10\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p5_reg\[10\]  ( .D(n3956), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p5\[10\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p3_reg\[10\]  ( .D(n3902), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p3\[10\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p1_reg\[10\]  ( .D(n3848), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p1\[10\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s5_interp_hi_lo_lo_reg\[5\]  ( .D(n4154), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s5_interp_hi_lo_lo\[5\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s5_interp_hi_hi_lo_reg\[5\]  ( .D(n4128), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s5_interp_hi_hi_lo\[5\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p6_reg\[10\]  ( .D(n3983), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p6\[10\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p4_reg\[10\]  ( .D(n3929), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p4\[10\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p2_reg\[10\]  ( .D(n3875), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p2\[10\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p0_reg\[10\]  ( .D(n3821), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p0\[10\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s1_mag_u_reg\[26\]  ( .D(n2865), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s1_mag_u\[26\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s7_interp_hi_reg\[23\]  ( .D(n4573), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s7_interp_hi\[23\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s3_lut_next_reg\[2\]  ( .D(n4616), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s3_lut_next\[2\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s7_interp_lo_reg\[31\]  ( .D(n4534), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s7_interp_lo\[31\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s6_interp_hi_lo_reg\[15\]  ( .D(n4493), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s6_interp_hi_lo\[15\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s6_interp_hi_hi_reg\[15\]  ( .D(n4512), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s6_interp_hi_hi\[15\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s6_interp_lo_lo_reg\[14\]  ( .D(n4458), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s6_interp_lo_lo\[14\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s3_lut_next_reg\[22\]  ( .D(n4606), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s3_lut_next\[22\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s3_lut_base_reg\[22\]  ( .D(n4604), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s3_lut_base\[22\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p7_reg\[18\]  ( .D(n4002), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p7\[18\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s6_interp_lo_hi_reg\[15\]  ( .D(n4474), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s6_interp_lo_hi\[15\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2m_prod_lo_reg\[34\]  ( .D(n4349), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2m_prod_lo\[34\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2m_prod_hi_reg\[34\]  ( .D(n4388), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2m_prod_hi\[34\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p6_reg\[18\]  ( .D(n3975), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p6\[18\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p4_reg\[18\]  ( .D(n3921), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p4\[18\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p2_reg\[18\]  ( .D(n3867), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p2\[18\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p0_reg\[18\]  ( .D(n3813), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p0\[18\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p5_reg\[18\]  ( .D(n3948), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p5\[18\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p3_reg\[18\]  ( .D(n3894), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p3\[18\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p1_reg\[18\]  ( .D(n3840), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p1\[18\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s3_lut_base_reg\[1\]  ( .D(n4634), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s3_lut_base\[1\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2m_prod_lo_reg\[27\]  ( .D(n4356), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2m_prod_lo\[27\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2m_prod_hi_reg\[27\]  ( .D(n4395), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2m_prod_hi\[27\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s5_interp_lo_hi_hi_reg\[5\]  ( .D(n4060), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s5_interp_lo_hi_hi\[5\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s5_interp_hi_lo_hi_reg\[5\]  ( .D(n4141), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s5_interp_hi_lo_hi\[5\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s5_interp_lo_hi_lo_reg\[5\]  ( .D(n4074), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s5_interp_lo_hi_lo\[5\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s5_interp_lo_lo_lo_reg\[5\]  ( .D(n4102), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s5_interp_lo_lo_lo\[5\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s6_interp_lo_lo_reg\[15\]  ( .D(n4457), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s6_interp_lo_lo\[15\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2p_lo_lo_reg\[23\]  ( .D(n4224), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2p_lo_lo\[23\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2p_hi_lo_reg\[23\]  ( .D(n4286), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2p_hi_lo\[23\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p7_reg\[9\]  ( .D(n4011), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p7\[9\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s5_interp_hi_hi_hi_reg\[5\]  ( .D(n4115), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s5_interp_hi_hi_hi\[5\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p6_reg\[9\]  ( .D(n3984), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p6\[9\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p5_reg\[9\]  ( .D(n3957), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p5\[9\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p4_reg\[9\]  ( .D(n3930), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p4\[9\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p3_reg\[9\]  ( .D(n3903), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p3\[9\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p2_reg\[9\]  ( .D(n3876), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p2\[9\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p1_reg\[9\]  ( .D(n3849), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p1\[9\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p0_reg\[9\]  ( .D(n3822), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p0\[9\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2m_prod_lo_reg\[30\]  ( .D(n4353), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2m_prod_lo\[30\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2m_prod_hi_reg\[30\]  ( .D(n4392), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2m_prod_hi\[30\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s5_interp_lo_lo_hi_reg\[5\]  ( .D(n4088), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s5_interp_lo_lo_hi\[5\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s4_delta_reg\[20\]  ( .D(n4418), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s4_delta\[20\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p7_reg\[11\]  ( .D(n4009), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p7\[11\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p7_reg\[14\]  ( .D(n4006), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p7\[14\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p5_reg\[11\]  ( .D(n3955), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p5\[11\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p3_reg\[11\]  ( .D(n3901), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p3\[11\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p1_reg\[11\]  ( .D(n3847), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p1\[11\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p5_reg\[14\]  ( .D(n3952), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p5\[14\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p3_reg\[14\]  ( .D(n3898), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p3\[14\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p1_reg\[14\]  ( .D(n3844), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p1\[14\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p6_reg\[11\]  ( .D(n3982), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p6\[11\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p4_reg\[11\]  ( .D(n3928), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p4\[11\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p2_reg\[11\]  ( .D(n3874), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p2\[11\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p0_reg\[11\]  ( .D(n3820), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p0\[11\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2p_lo_hi_reg\[23\]  ( .D(n4255), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2p_lo_hi\[23\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2p_hi_hi_reg\[23\]  ( .D(n4317), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2p_hi_hi\[23\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p6_reg\[14\]  ( .D(n3979), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p6\[14\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p4_reg\[14\]  ( .D(n3925), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p4\[14\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p2_reg\[14\]  ( .D(n3871), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p2\[14\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p0_reg\[14\]  ( .D(n3817), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p0\[14\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s7_interp_hi_reg\[24\]  ( .D(n4572), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s7_interp_hi\[24\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2m_prod_lo_reg\[35\]  ( .D(n4348), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2m_prod_lo\[35\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2m_prod_hi_reg\[35\]  ( .D(n4387), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2m_prod_hi\[35\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s3_lut_base_reg\[13\]  ( .D(n4617), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s3_lut_base\[13\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s6_interp_lo_hi_reg\[16\]  ( .D(n4473), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s6_interp_lo_hi\[16\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s5_interp_hi_lo_lo_reg\[6\]  ( .D(n4153), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s5_interp_hi_lo_lo\[6\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s5_interp_hi_hi_lo_reg\[6\]  ( .D(n4127), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s5_interp_hi_hi_lo\[6\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p7_reg\[19\]  ( .D(n4001), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p7\[19\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s5_interp_hi_lo_hi_reg\[6\]  ( .D(n4140), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s5_interp_hi_lo_hi\[6\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p6_reg\[19\]  ( .D(n3974), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p6\[19\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p4_reg\[19\]  ( .D(n3920), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p4\[19\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p2_reg\[19\]  ( .D(n3866), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p2\[19\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p0_reg\[19\]  ( .D(n3812), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p0\[19\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p5_reg\[19\]  ( .D(n3947), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p5\[19\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p3_reg\[19\]  ( .D(n3893), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p3\[19\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p1_reg\[19\]  ( .D(n3839), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p1\[19\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s5_interp_lo_lo_lo_reg\[6\]  ( .D(n4101), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s5_interp_lo_lo_lo\[6\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s5_interp_hi_hi_hi_reg\[6\]  ( .D(n4114), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s5_interp_hi_hi_hi\[6\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2m_prod_lo_reg\[31\]  ( .D(n4352), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2m_prod_lo\[31\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2m_prod_hi_reg\[31\]  ( .D(n4391), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2m_prod_hi\[31\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2p_lo_lo_reg\[24\]  ( .D(n4223), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2p_lo_lo\[24\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2p_hi_lo_reg\[24\]  ( .D(n4285), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2p_hi_lo\[24\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s6_interp_hi_lo_reg\[16\]  ( .D(n4492), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s6_interp_hi_lo\[16\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s6_interp_hi_hi_reg\[16\]  ( .D(n4511), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s6_interp_hi_hi\[16\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s5_interp_lo_hi_hi_reg\[6\]  ( .D(n4059), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s5_interp_lo_hi_hi\[6\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s5_interp_lo_lo_hi_reg\[6\]  ( .D(n4087), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s5_interp_lo_lo_hi\[6\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s5_interp_lo_hi_lo_reg\[6\]  ( .D(n4073), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s5_interp_lo_hi_lo\[6\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s6_interp_lo_lo_reg\[16\]  ( .D(n4456), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s6_interp_lo_lo\[16\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p7_reg\[12\]  ( .D(n4008), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p7\[12\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p5_reg\[12\]  ( .D(n3954), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p5\[12\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p3_reg\[12\]  ( .D(n3900), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p3\[12\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p1_reg\[12\]  ( .D(n3846), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p1\[12\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p7_reg\[15\]  ( .D(n4005), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p7\[15\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p6_reg\[12\]  ( .D(n3981), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p6\[12\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p4_reg\[12\]  ( .D(n3927), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p4\[12\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p2_reg\[12\]  ( .D(n3873), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p2\[12\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p0_reg\[12\]  ( .D(n3819), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p0\[12\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p5_reg\[15\]  ( .D(n3951), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p5\[15\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p3_reg\[15\]  ( .D(n3897), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p3\[15\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p1_reg\[15\]  ( .D(n3843), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p1\[15\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2m_prod_lo_reg\[36\]  ( .D(n4347), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2m_prod_lo\[36\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2m_prod_hi_reg\[36\]  ( .D(n4386), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2m_prod_hi\[36\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p6_reg\[15\]  ( .D(n3978), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p6\[15\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p4_reg\[15\]  ( .D(n3924), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p4\[15\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p2_reg\[15\]  ( .D(n3870), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p2\[15\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p0_reg\[15\]  ( .D(n3816), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p0\[15\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2p_lo_hi_reg\[24\]  ( .D(n4254), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2p_lo_hi\[24\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2p_hi_hi_reg\[24\]  ( .D(n4316), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2p_hi_hi\[24\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p7_reg\[20\]  ( .D(n4000), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p7\[20\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s7_interp_hi_reg\[25\]  ( .D(n4571), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s7_interp_hi\[25\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p5_reg\[20\]  ( .D(n3946), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p5\[20\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p3_reg\[20\]  ( .D(n3892), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p3\[20\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p1_reg\[20\]  ( .D(n3838), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p1\[20\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p6_reg\[20\]  ( .D(n3973), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p6\[20\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p4_reg\[20\]  ( .D(n3919), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p4\[20\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p2_reg\[20\]  ( .D(n3865), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p2\[20\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p0_reg\[20\]  ( .D(n3811), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p0\[20\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s4_delta_reg\[21\]  ( .D(n4417), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s4_delta\[21\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2p_lo_hi_reg\[25\]  ( .D(n4253), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2p_lo_hi\[25\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2p_hi_hi_reg\[25\]  ( .D(n4315), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2p_hi_hi\[25\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2p_lo_lo_reg\[25\]  ( .D(n4222), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2p_lo_lo\[25\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2p_hi_lo_reg\[25\]  ( .D(n4284), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2p_hi_lo\[25\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s5_interp_hi_hi_lo_reg\[7\]  ( .D(n4126), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s5_interp_hi_hi_lo\[7\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s5_interp_hi_hi_hi_reg\[7\]  ( .D(n4113), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s5_interp_hi_hi_hi\[7\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p7_reg\[21\]  ( .D(n3999), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p7\[21\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p5_reg\[21\]  ( .D(n3945), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p5\[21\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p3_reg\[21\]  ( .D(n3891), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p3\[21\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p1_reg\[21\]  ( .D(n3837), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p1\[21\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p7_reg\[13\]  ( .D(n4007), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p7\[13\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p5_reg\[13\]  ( .D(n3953), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p5\[13\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p3_reg\[13\]  ( .D(n3899), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p3\[13\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p1_reg\[13\]  ( .D(n3845), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p1\[13\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p6_reg\[13\]  ( .D(n3980), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p6\[13\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p4_reg\[13\]  ( .D(n3926), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p4\[13\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p2_reg\[13\]  ( .D(n3872), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p2\[13\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p0_reg\[13\]  ( .D(n3818), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p0\[13\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s6_interp_lo_lo_reg\[17\]  ( .D(n4455), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s6_interp_lo_lo\[17\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s5_interp_hi_lo_lo_reg\[7\]  ( .D(n4152), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s5_interp_hi_lo_lo\[7\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s5_interp_hi_lo_hi_reg\[7\]  ( .D(n4139), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s5_interp_hi_lo_hi\[7\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s6_interp_lo_hi_reg\[17\]  ( .D(n4472), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s6_interp_lo_hi\[17\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p6_reg\[21\]  ( .D(n3972), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p6\[21\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p4_reg\[21\]  ( .D(n3918), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p4\[21\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p2_reg\[21\]  ( .D(n3864), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p2\[21\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p0_reg\[21\]  ( .D(n3810), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p0\[21\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s1_mag_u_reg\[17\]  ( .D(n2861), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s1_mag_u\[17\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s1_mag_u_reg\[16\]  ( .D(n2858), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s1_mag_u\[16\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p7_reg\[16\]  ( .D(n4004), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p7\[16\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p5_reg\[16\]  ( .D(n3950), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p5\[16\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p3_reg\[16\]  ( .D(n3896), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p3\[16\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p1_reg\[16\]  ( .D(n3842), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p1\[16\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p6_reg\[16\]  ( .D(n3977), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p6\[16\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p4_reg\[16\]  ( .D(n3923), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p4\[16\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p2_reg\[16\]  ( .D(n3869), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p2\[16\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p0_reg\[16\]  ( .D(n3815), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p0\[16\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2m_prod_lo_reg\[37\]  ( .D(n4346), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2m_prod_lo\[37\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2m_prod_hi_reg\[37\]  ( .D(n4385), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2m_prod_hi\[37\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s6_interp_hi_lo_reg\[17\]  ( .D(n4491), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s6_interp_hi_lo\[17\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s6_interp_hi_hi_reg\[17\]  ( .D(n4510), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s6_interp_hi_hi\[17\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p7_reg\[17\]  ( .D(n4003), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p7\[17\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s7_interp_hi_reg\[26\]  ( .D(n4570), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s7_interp_hi\[26\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p5_reg\[17\]  ( .D(n3949), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p5\[17\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p3_reg\[17\]  ( .D(n3895), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p3\[17\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p1_reg\[17\]  ( .D(n3841), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p1\[17\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p6_reg\[17\]  ( .D(n3976), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p6\[17\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p4_reg\[17\]  ( .D(n3922), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p4\[17\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p2_reg\[17\]  ( .D(n3868), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p2\[17\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p0_reg\[17\]  ( .D(n3814), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p0\[17\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s5_interp_hi_lo_lo_reg\[8\]  ( .D(n4151), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s5_interp_hi_lo_lo\[8\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s5_interp_hi_lo_hi_reg\[8\]  ( .D(n4138), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s5_interp_hi_lo_hi\[8\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s5_interp_hi_hi_lo_reg\[8\]  ( .D(n4125), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s5_interp_hi_hi_lo\[8\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s5_interp_hi_hi_hi_reg\[8\]  ( .D(n4112), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s5_interp_hi_hi_hi\[8\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s4_delta_reg\[23\]  ( .D(n4415), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s4_delta\[23\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s5_interp_lo_hi_hi_reg\[7\]  ( .D(n4058), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s5_interp_lo_hi_hi\[7\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s5_interp_lo_hi_lo_reg\[7\]  ( .D(n4072), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s5_interp_lo_hi_lo\[7\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2p_lo_lo_reg\[26\]  ( .D(n4221), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2p_lo_lo\[26\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2p_hi_lo_reg\[26\]  ( .D(n4283), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2p_hi_lo\[26\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s4_delta_reg\[22\]  ( .D(n4416), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s4_delta\[22\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2p_lo_hi_reg\[26\]  ( .D(n4252), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2p_lo_hi\[26\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2p_hi_hi_reg\[26\]  ( .D(n4314), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2p_hi_hi\[26\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s5_interp_lo_hi_hi_reg\[8\]  ( .D(n4057), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s5_interp_lo_hi_hi\[8\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s1_mag_u_reg\[22\]  ( .D(n2876), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s1_mag_u\[22\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s1_mag_u_reg\[18\]  ( .D(n2809), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s1_mag_u\[18\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s1_mag_u_reg\[19\]  ( .D(n2860), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s1_mag_u\[19\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p7_reg\[22\]  ( .D(n3998), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p7\[22\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p5_reg\[22\]  ( .D(n3944), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p5\[22\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p3_reg\[22\]  ( .D(n3890), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p3\[22\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p1_reg\[22\]  ( .D(n3836), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p1\[22\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p6_reg\[22\]  ( .D(n3971), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p6\[22\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p4_reg\[22\]  ( .D(n3917), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p4\[22\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p2_reg\[22\]  ( .D(n3863), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p2\[22\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p0_reg\[22\]  ( .D(n3809), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p0\[22\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2m_prod_lo_reg\[38\]  ( .D(n4345), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2m_prod_lo\[38\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2m_prod_hi_reg\[38\]  ( .D(n4384), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2m_prod_hi\[38\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s5_interp_lo_lo_lo_reg\[7\]  ( .D(n4100), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s5_interp_lo_lo_lo\[7\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2_f_u_reg\[14\]  ( .D(n4034), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2_f_u\[14\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s5_interp_lo_lo_hi_reg\[8\]  ( .D(n4085), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s5_interp_lo_lo_hi\[8\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s5_interp_hi_hi_lo_reg\[9\]  ( .D(n4124), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s5_interp_hi_hi_lo\[9\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s5_interp_lo_hi_hi_reg\[9\]  ( .D(n4056), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s5_interp_lo_hi_hi\[9\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s5_interp_hi_lo_hi_reg\[9\]  ( .D(n4137), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s5_interp_hi_lo_hi\[9\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s7_interp_hi_reg\[27\]  ( .D(n4569), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s7_interp_hi\[27\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2_floor_mag_reg\[1\]  ( .D(n4026), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2_floor_mag\[1\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2_floor_mag_reg\[0\]  ( .D(n4027), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2_floor_mag\[0\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s6_interp_lo_lo_reg\[18\]  ( .D(n4454), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s6_interp_lo_lo\[18\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s5_interp_hi_lo_lo_reg\[9\]  ( .D(n4150), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s5_interp_hi_lo_lo\[9\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2_f_u_reg\[19\]  ( .D(n4039), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2_f_u\[19\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2_f_u_reg\[18\]  ( .D(n4038), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2_f_u\[18\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2_f_u_reg\[17\]  ( .D(n4037), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2_f_u\[17\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2_f_u_reg\[16\]  ( .D(n4036), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2_f_u\[16\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2_f_u_reg\[15\]  ( .D(n4035), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2_f_u\[15\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2_f_u_reg\[13\]  ( .D(n4033), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2_f_u\[13\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2_f_u_reg\[12\]  ( .D(n4032), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2_f_u\[12\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2_f_u_reg\[11\]  ( .D(n4031), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2_f_u\[11\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2_f_u_reg\[10\]  ( .D(n4030), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2_f_u\[10\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2_f_u_reg\[9\]  ( .D(n4050), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2_f_u\[9\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2_f_u_reg\[8\]  ( .D(n4049), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2_f_u\[8\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2_f_u_reg\[7\]  ( .D(n4048), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2_f_u\[7\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2_f_u_reg\[6\]  ( .D(n4047), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2_f_u\[6\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2_f_u_reg\[5\]  ( .D(n4046), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2_f_u\[5\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2_f_u_reg\[4\]  ( .D(n4045), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2_f_u\[4\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2_f_u_reg\[3\]  ( .D(n4044), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2_f_u\[3\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2_f_u_reg\[2\]  ( .D(n4043), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2_f_u\[2\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2_f_u_reg\[1\]  ( .D(n4040), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2_f_u\[1\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2_f_u_reg\[0\]  ( .D(n4029), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2_f_u\[0\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s6_interp_lo_hi_reg\[18\]  ( .D(n4471), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s6_interp_lo_hi\[18\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2_floor_mag_reg\[2\]  ( .D(n4025), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2_floor_mag\[2\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s5_interp_lo_hi_lo_reg\[8\]  ( .D(n4071), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s5_interp_lo_hi_lo\[8\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s5_interp_lo_hi_lo_reg\[9\]  ( .D(n4070), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s5_interp_lo_hi_lo\[9\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2p_lo_hi_reg\[27\]  ( .D(n4251), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2p_lo_hi\[27\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2p_hi_hi_reg\[27\]  ( .D(n4313), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2p_hi_hi\[27\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s5_interp_hi_hi_hi_reg\[9\]  ( .D(n4111), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s5_interp_hi_hi_hi\[9\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s1_mag_u_reg\[3\]  ( .D(n2873), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s1_mag_u\[3\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s1_mag_u_reg\[2\]  ( .D(n4204), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s1_mag_u\[2\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s5_interp_lo_lo_lo_reg\[9\]  ( .D(n4098), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s5_interp_lo_lo_lo\[9\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s5_interp_lo_lo_hi_reg\[7\]  ( .D(n4086), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s5_interp_lo_lo_hi\[7\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s5_interp_lo_lo_lo_reg\[8\]  ( .D(n4099), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s5_interp_lo_lo_lo\[8\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2p_lo_lo_reg\[27\]  ( .D(n4220), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2p_lo_lo\[27\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2p_hi_lo_reg\[27\]  ( .D(n4282), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2p_hi_lo\[27\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s6_interp_hi_lo_reg\[18\]  ( .D(n4490), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s6_interp_hi_lo\[18\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s6_interp_hi_hi_reg\[18\]  ( .D(n4509), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s6_interp_hi_hi\[18\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s5_interp_lo_lo_hi_reg\[9\]  ( .D(n4084), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s5_interp_lo_lo_hi\[9\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p7_reg\[23\]  ( .D(n3997), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p7\[23\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2m_prod_lo_reg\[39\]  ( .D(n4344), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2m_prod_lo\[39\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2m_prod_hi_reg\[39\]  ( .D(n4383), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2m_prod_hi\[39\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p5_reg\[23\]  ( .D(n3943), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p5\[23\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p3_reg\[23\]  ( .D(n3889), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p3\[23\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p1_reg\[23\]  ( .D(n3835), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p1\[23\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p6_reg\[23\]  ( .D(n3970), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p6\[23\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p4_reg\[23\]  ( .D(n3916), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p4\[23\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p2_reg\[23\]  ( .D(n3862), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p2\[23\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p0_reg\[23\]  ( .D(n3808), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p0\[23\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2_f_u_reg\[20\]  ( .D(n4041), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2_f_u\[20\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s5_interp_lo_lo_lo_reg\[10\]  ( .D(n4097), .CLK(clk), .RESETN(n4889), .SETN(rst_n), .QN(\s5_interp_lo_lo_lo\[10\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s1_mag_u_reg\[23\]  ( .D(n2867), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s1_mag_u\[23\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s1_mag_u_reg\[21\]  ( .D(n2869), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s1_mag_u\[21\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s1_mag_u_reg\[20\]  ( .D(n2877), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s1_mag_u\[20\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2_floor_mag_reg\[3\]  ( .D(n4024), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2_floor_mag\[3\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s1_mag_u_reg\[0\]  ( .D(n2854), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s1_mag_u\[0\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s1_mag_u_reg\[1\]  ( .D(n2753), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s1_mag_u\[1\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s5_interp_lo_lo_hi_reg\[10\]  ( .D(n4083), .CLK(clk), .RESETN(n4889), .SETN(rst_n), .QN(\s5_interp_lo_lo_hi\[10\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s5_interp_lo_hi_lo_reg\[10\]  ( .D(n4069), .CLK(clk), .RESETN(n4889), .SETN(rst_n), .QN(\s5_interp_lo_hi_lo\[10\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s5_interp_lo_hi_hi_reg\[10\]  ( .D(n4055), .CLK(clk), .RESETN(n4889), .SETN(rst_n), .QN(\s5_interp_lo_hi_hi\[10\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s7_interp_hi_reg\[28\]  ( .D(n4568), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s7_interp_hi\[28\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2_floor_mag_reg\[4\]  ( .D(n4023), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2_floor_mag\[4\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2p_lo_lo_reg\[28\]  ( .D(n4219), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2p_lo_lo\[28\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2p_hi_lo_reg\[28\]  ( .D(n4281), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2p_hi_lo\[28\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s1_mag_u_reg\[8\]  ( .D(n2852), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s1_mag_u\[8\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s1_mag_u_reg\[9\]  ( .D(n2711), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s1_mag_u\[9\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p7_reg\[24\]  ( .D(n3996), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p7\[24\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s5_interp_lo_lo_hi_reg\[11\]  ( .D(n4082), .CLK(clk), .RESETN(n4889), .SETN(rst_n), .QN(\s5_interp_lo_lo_hi\[11\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p5_reg\[24\]  ( .D(n3942), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p5\[24\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p3_reg\[24\]  ( .D(n3888), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p3\[24\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p1_reg\[24\]  ( .D(n3834), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p1\[24\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s1_mag_u_reg\[14\]  ( .D(n2887), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s1_mag_u\[14\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2p_lo_hi_reg\[28\]  ( .D(n4250), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2p_lo_hi\[28\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2p_hi_hi_reg\[28\]  ( .D(n4312), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2p_hi_hi\[28\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2_f_u_reg\[21\]  ( .D(n4042), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2_f_u\[21\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2_floor_mag_reg\[5\]  ( .D(n4022), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2_floor_mag\[5\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s1_mag_u_reg\[11\]  ( .D(n2886), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s1_mag_u\[11\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s1_mag_u_reg\[10\]  ( .D(n2885), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s1_mag_u\[10\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s5_interp_lo_lo_lo_reg\[11\]  ( .D(n4096), .CLK(clk), .RESETN(n4889), .SETN(rst_n), .QN(\s5_interp_lo_lo_lo\[11\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p6_reg\[24\]  ( .D(n3969), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p6\[24\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p4_reg\[24\]  ( .D(n3915), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p4\[24\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p2_reg\[24\]  ( .D(n3861), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p2\[24\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p0_reg\[24\]  ( .D(n3807), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p0\[24\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s5_interp_lo_hi_lo_reg\[11\]  ( .D(n4068), .CLK(clk), .RESETN(n4889), .SETN(rst_n), .QN(\s5_interp_lo_hi_lo\[11\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s6_interp_hi_lo_reg\[19\]  ( .D(n4489), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s6_interp_hi_lo\[19\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s6_interp_hi_hi_reg\[19\]  ( .D(n4508), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s6_interp_hi_hi\[19\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s6_interp_lo_lo_reg\[19\]  ( .D(n4453), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s6_interp_lo_lo\[19\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s5_interp_hi_lo_lo_reg\[10\]  ( .D(n4149), .CLK(clk), .RESETN(n4889), .SETN(rst_n), .QN(\s5_interp_hi_lo_lo\[10\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s6_interp_lo_hi_reg\[19\]  ( .D(n4470), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s6_interp_lo_hi\[19\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s5_interp_lo_hi_hi_reg\[11\]  ( .D(n4054), .CLK(clk), .RESETN(n4889), .SETN(rst_n), .QN(\s5_interp_lo_hi_hi\[11\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s7_interp_hi_reg\[29\]  ( .D(n4567), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s7_interp_hi\[29\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2_floor_mag_reg\[6\]  ( .D(n4021), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2_floor_mag\[6\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2_f_u_reg\[22\]  ( .D(n4028), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2_f_u\[22\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s5_interp_lo_hi_hi_reg\[12\]  ( .D(n4053), .CLK(clk), .RESETN(n4889), .SETN(rst_n), .QN(\s5_interp_lo_hi_hi\[12\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s5_interp_lo_hi_lo_reg\[12\]  ( .D(n4067), .CLK(clk), .RESETN(n4889), .SETN(rst_n), .QN(\s5_interp_lo_hi_lo\[12\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s5_interp_lo_lo_hi_reg\[12\]  ( .D(n4081), .CLK(clk), .RESETN(n4889), .SETN(rst_n), .QN(\s5_interp_lo_lo_hi\[12\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2p_lo_lo_reg\[29\]  ( .D(n4218), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2p_lo_lo\[29\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2p_hi_lo_reg\[29\]  ( .D(n4280), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2p_hi_lo\[29\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s5_interp_lo_lo_lo_reg\[12\]  ( .D(n4095), .CLK(clk), .RESETN(n4889), .SETN(rst_n), .QN(\s5_interp_lo_lo_lo\[12\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p7_reg\[25\]  ( .D(n3995), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p7\[25\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p5_reg\[25\]  ( .D(n3941), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p5\[25\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p3_reg\[25\]  ( .D(n3887), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p3\[25\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p1_reg\[25\]  ( .D(n3833), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p1\[25\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p7_reg\[27\]  ( .D(n3993), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p7\[27\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p5_reg\[27\]  ( .D(n3939), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p5\[27\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p3_reg\[27\]  ( .D(n3885), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p3\[27\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p1_reg\[27\]  ( .D(n3831), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p1\[27\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s5_interp_hi_lo_hi_reg\[10\]  ( .D(n4136), .CLK(clk), .RESETN(n4889), .SETN(rst_n), .QN(\s5_interp_hi_lo_hi\[10\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s5_interp_hi_hi_lo_reg\[10\]  ( .D(n4123), .CLK(clk), .RESETN(n4889), .SETN(rst_n), .QN(\s5_interp_hi_hi_lo\[10\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s5_interp_hi_hi_lo_reg\[11\]  ( .D(n4122), .CLK(clk), .RESETN(n4889), .SETN(rst_n), .QN(\s5_interp_hi_hi_lo\[11\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s5_interp_lo_hi_hi_reg\[13\]  ( .D(n4052), .CLK(clk), .RESETN(n4889), .SETN(rst_n), .QN(\s5_interp_lo_hi_hi\[13\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p7_reg\[26\]  ( .D(n3994), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p7\[26\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p5_reg\[26\]  ( .D(n3940), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p5\[26\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p3_reg\[26\]  ( .D(n3886), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p3\[26\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p1_reg\[26\]  ( .D(n3832), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p1\[26\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s6_interp_lo_lo_reg\[20\]  ( .D(n4452), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s6_interp_lo_lo\[20\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s5_interp_hi_lo_hi_reg\[11\]  ( .D(n4135), .CLK(clk), .RESETN(n4889), .SETN(rst_n), .QN(\s5_interp_hi_lo_hi\[11\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s5_interp_hi_hi_hi_reg\[10\]  ( .D(n4110), .CLK(clk), .RESETN(n4889), .SETN(rst_n), .QN(\s5_interp_hi_hi_hi\[10\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2_floor_mag_reg\[7\]  ( .D(n3473), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2_floor_mag\[7\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p6_reg\[26\]  ( .D(n3967), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p6\[26\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p4_reg\[26\]  ( .D(n3913), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p4\[26\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p2_reg\[26\]  ( .D(n3859), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p2\[26\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p0_reg\[26\]  ( .D(n3805), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p0\[26\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s6_interp_lo_hi_reg\[20\]  ( .D(n4469), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s6_interp_lo_hi\[20\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p6_reg\[25\]  ( .D(n3968), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p6\[25\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p4_reg\[25\]  ( .D(n3914), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p4\[25\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p2_reg\[25\]  ( .D(n3860), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p2\[25\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p0_reg\[25\]  ( .D(n3806), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p0\[25\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s5_interp_lo_lo_hi_reg\[13\]  ( .D(n4080), .CLK(clk), .RESETN(n4889), .SETN(rst_n), .QN(\s5_interp_lo_lo_hi\[13\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p6_reg\[27\]  ( .D(n3966), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p6\[27\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p4_reg\[27\]  ( .D(n3912), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p4\[27\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p2_reg\[27\]  ( .D(n3858), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p2\[27\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p0_reg\[27\]  ( .D(n3804), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p0\[27\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s5_interp_lo_lo_lo_reg\[13\]  ( .D(n4094), .CLK(clk), .RESETN(n4889), .SETN(rst_n), .QN(\s5_interp_lo_lo_lo\[13\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s5_interp_lo_hi_lo_reg\[13\]  ( .D(n4066), .CLK(clk), .RESETN(n4889), .SETN(rst_n), .QN(\s5_interp_lo_hi_lo\[13\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2p_lo_hi_reg\[29\]  ( .D(n4249), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2p_lo_hi\[29\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2p_hi_hi_reg\[29\]  ( .D(n4311), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2p_hi_hi\[29\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s5_interp_hi_lo_lo_reg\[11\]  ( .D(n4148), .CLK(clk), .RESETN(n4889), .SETN(rst_n), .QN(\s5_interp_hi_lo_lo\[11\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s7_interp_hi_reg\[30\]  ( .D(n4566), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s7_interp_hi\[30\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s5_interp_hi_hi_lo_reg\[12\]  ( .D(n4121), .CLK(clk), .RESETN(n4889), .SETN(rst_n), .QN(\s5_interp_hi_hi_lo\[12\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s5_interp_hi_hi_hi_reg\[11\]  ( .D(n4109), .CLK(clk), .RESETN(n4889), .SETN(rst_n), .QN(\s5_interp_hi_hi_hi\[11\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s5_interp_hi_lo_hi_reg\[12\]  ( .D(n4134), .CLK(clk), .RESETN(n4889), .SETN(rst_n), .QN(\s5_interp_hi_lo_hi\[12\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2p_lo_lo_reg\[30\]  ( .D(n4217), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2p_lo_lo\[30\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2p_hi_lo_reg\[30\]  ( .D(n4279), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2p_hi_lo\[30\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s5_interp_hi_hi_hi_reg\[12\]  ( .D(n4108), .CLK(clk), .RESETN(n4889), .SETN(rst_n), .QN(\s5_interp_hi_hi_hi\[12\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2p_lo_hi_reg\[30\]  ( .D(n4248), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2p_lo_hi\[30\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2p_hi_hi_reg\[30\]  ( .D(n4310), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2p_hi_hi\[30\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s5_interp_hi_lo_lo_reg\[12\]  ( .D(n4147), .CLK(clk), .RESETN(n4889), .SETN(rst_n), .QN(\s5_interp_hi_lo_lo\[12\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s5_interp_hi_hi_lo_reg\[13\]  ( .D(n4120), .CLK(clk), .RESETN(n4889), .SETN(rst_n), .QN(\s5_interp_hi_hi_lo\[13\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s5_interp_hi_lo_lo_reg\[13\]  ( .D(n4146), .CLK(clk), .RESETN(n4889), .SETN(rst_n), .QN(\s5_interp_hi_lo_lo\[13\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s5_interp_hi_lo_hi_reg\[13\]  ( .D(n4133), .CLK(clk), .RESETN(n4889), .SETN(rst_n), .QN(\s5_interp_hi_lo_hi\[13\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s5_interp_lo_hi_lo_reg\[14\]  ( .D(n4065), .CLK(clk), .RESETN(n4889), .SETN(rst_n), .QN(\s5_interp_lo_hi_lo\[14\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s5_interp_lo_lo_lo_reg\[14\]  ( .D(n4093), .CLK(clk), .RESETN(n4889), .SETN(rst_n), .QN(\s5_interp_lo_lo_lo\[14\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s5_interp_lo_lo_hi_reg\[14\]  ( .D(n4079), .CLK(clk), .RESETN(n4889), .SETN(rst_n), .QN(\s5_interp_lo_lo_hi\[14\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s5_interp_lo_hi_hi_reg\[14\]  ( .D(n4051), .CLK(clk), .RESETN(n4889), .SETN(rst_n), .QN(\s5_interp_lo_hi_hi\[14\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s5_interp_hi_hi_hi_reg\[13\]  ( .D(n4107), .CLK(clk), .RESETN(n4889), .SETN(rst_n), .QN(\s5_interp_hi_hi_hi\[13\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2_floor_mag_reg\[8\]  ( .D(n3472), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2_floor_mag\[8\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2p_lo_lo_reg\[31\]  ( .D(n4216), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2p_lo_lo\[31\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2p_hi_lo_reg\[31\]  ( .D(n4278), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2p_hi_lo\[31\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s7_interp_hi_reg\[31\]  ( .D(n4565), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s7_interp_hi\[31\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2p_lo_hi_reg\[31\]  ( .D(n4247), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2p_lo_hi\[31\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2p_hi_hi_reg\[31\]  ( .D(n4309), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2p_hi_hi\[31\] ) );
  DFFASRHQNx1_ASAP7_75t_R \y_reg\[21\]  ( .D(n4172), .CLK(clk), .RESETN(n4889), 
        .SETN(rst_n), .QN(\y\[21\] ) );
  DFFASRHQNx1_ASAP7_75t_R \y_reg\[20\]  ( .D(n4171), .CLK(clk), .RESETN(n4889), 
        .SETN(rst_n), .QN(\y\[20\] ) );
  DFFASRHQNx1_ASAP7_75t_R \y_reg\[19\]  ( .D(n4169), .CLK(clk), .RESETN(n4889), 
        .SETN(rst_n), .QN(\y\[19\] ) );
  DFFASRHQNx1_ASAP7_75t_R \y_reg\[18\]  ( .D(n4168), .CLK(clk), .RESETN(n4889), 
        .SETN(rst_n), .QN(\y\[18\] ) );
  DFFASRHQNx1_ASAP7_75t_R \y_reg\[17\]  ( .D(n4167), .CLK(clk), .RESETN(n4889), 
        .SETN(rst_n), .QN(\y\[17\] ) );
  DFFASRHQNx1_ASAP7_75t_R \y_reg\[16\]  ( .D(n4166), .CLK(clk), .RESETN(n4889), 
        .SETN(rst_n), .QN(\y\[16\] ) );
  DFFASRHQNx1_ASAP7_75t_R \y_reg\[15\]  ( .D(n4165), .CLK(clk), .RESETN(n4889), 
        .SETN(rst_n), .QN(\y\[15\] ) );
  DFFASRHQNx1_ASAP7_75t_R \y_reg\[11\]  ( .D(n4161), .CLK(clk), .RESETN(n4889), 
        .SETN(rst_n), .QN(\y\[11\] ) );
  DFFASRHQNx1_ASAP7_75t_R \y_reg\[10\]  ( .D(n4160), .CLK(clk), .RESETN(n4889), 
        .SETN(rst_n), .QN(\y\[10\] ) );
  DFFASRHQNx1_ASAP7_75t_R \y_reg\[8\]  ( .D(n4179), .CLK(clk), .RESETN(n4889), 
        .SETN(rst_n), .QN(\y\[8\] ) );
  DFFASRHQNx1_ASAP7_75t_R \y_reg\[7\]  ( .D(n4178), .CLK(clk), .RESETN(n4889), 
        .SETN(rst_n), .QN(\y\[7\] ) );
  DFFASRHQNx1_ASAP7_75t_R \y_reg\[4\]  ( .D(n4175), .CLK(clk), .RESETN(n4889), 
        .SETN(rst_n), .QN(\y\[4\] ) );
  DFFASRHQNx1_ASAP7_75t_R \y_reg\[3\]  ( .D(n4174), .CLK(clk), .RESETN(n4889), 
        .SETN(rst_n), .QN(\y\[3\] ) );
  DFFASRHQNx1_ASAP7_75t_R \y_reg\[2\]  ( .D(n4173), .CLK(clk), .RESETN(n4889), 
        .SETN(rst_n), .QN(\y\[2\] ) );
  DFFASRHQNx1_ASAP7_75t_R \y_reg\[1\]  ( .D(n4170), .CLK(clk), .RESETN(n4889), 
        .SETN(rst_n), .QN(\y\[1\] ) );
  DFFASRHQNx1_ASAP7_75t_R \y_reg\[0\]  ( .D(n4159), .CLK(clk), .RESETN(n4889), 
        .SETN(rst_n), .QN(\y\[0\] ) );
  DFFASRHQNx1_ASAP7_75t_R \y_reg\[5\]  ( .D(n4176), .CLK(clk), .RESETN(n4889), 
        .SETN(rst_n), .QN(\y\[5\] ) );
  DFFASRHQNx1_ASAP7_75t_R \y_reg\[13\]  ( .D(n4163), .CLK(clk), .RESETN(n4889), 
        .SETN(rst_n), .QN(\y\[13\] ) );
  DFFASRHQNx1_ASAP7_75t_R \y_reg\[9\]  ( .D(n4180), .CLK(clk), .RESETN(n4889), 
        .SETN(rst_n), .QN(\y\[9\] ) );
  DFFASRHQNx1_ASAP7_75t_R \y_reg\[12\]  ( .D(n4162), .CLK(clk), .RESETN(n4889), 
        .SETN(rst_n), .QN(\y\[12\] ) );
  DFFASRHQNx1_ASAP7_75t_R \y_reg\[6\]  ( .D(n4177), .CLK(clk), .RESETN(n4889), 
        .SETN(rst_n), .QN(\y\[6\] ) );
  DFFASRHQNx1_ASAP7_75t_R \y_reg\[14\]  ( .D(n4164), .CLK(clk), .RESETN(n4889), 
        .SETN(rst_n), .QN(\y\[14\] ) );
  DFFASRHQNx1_ASAP7_75t_R \y_reg\[22\]  ( .D(n2346), .CLK(clk), .RESETN(n4889), 
        .SETN(rst_n), .QN(\y\[22\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s1_mag_u_reg\[15\]  ( .D(n2872), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s1_mag_u\[15\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s1_mag_u_reg\[13\]  ( .D(n2884), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s1_mag_u\[13\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s1_mag_u_reg\[12\]  ( .D(n2704), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s1_mag_u\[12\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s1_mag_u_reg\[6\]  ( .D(n2863), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s1_mag_u\[6\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s1_mag_u_reg\[4\]  ( .D(n2868), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s1_mag_u\[4\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s1_mag_u_reg\[7\]  ( .D(n2871), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s1_mag_u\[7\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s1_mag_u_reg\[5\]  ( .D(n2878), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s1_mag_u\[5\] ) );
  DFFASRHQNx1_ASAP7_75t_R s2_underflow_reg ( .D(n4020), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(s2_underflow) );
  INVxp33_ASAP7_75t_R U2727 ( .A(\s5_interp_hi_lo_lo\[4\] ), .Y(n4485) );
  INVxp33_ASAP7_75t_R U2729 ( .A(\s5_interp_hi_lo_lo\[5\] ), .Y(n4484) );
  INVxp33_ASAP7_75t_R U2731 ( .A(\s5_interp_lo_hi_lo\[0\] ), .Y(n4844) );
  INVxp33_ASAP7_75t_R U2733 ( .A(\s5_interp_lo_hi_lo\[1\] ), .Y(n4468) );
  INVxp33_ASAP7_75t_R U2735 ( .A(\s5_interp_lo_hi_lo\[2\] ), .Y(n4467) );
  INVxp33_ASAP7_75t_R U2737 ( .A(\s5_interp_lo_hi_lo\[3\] ), .Y(n4466) );
  INVxp33_ASAP7_75t_R U2739 ( .A(\s5_interp_lo_hi_lo\[4\] ), .Y(n4465) );
  INVxp33_ASAP7_75t_R U2741 ( .A(\s5_interp_lo_hi_lo\[5\] ), .Y(n4464) );
  INVxp33_ASAP7_75t_R U2743 ( .A(\s5_interp_lo_lo_lo\[0\] ), .Y(n4843) );
  INVxp33_ASAP7_75t_R U2745 ( .A(\s5_interp_lo_lo_lo\[1\] ), .Y(n4451) );
  INVxp33_ASAP7_75t_R U2747 ( .A(\s5_interp_lo_lo_lo\[2\] ), .Y(n4450) );
  INVxp33_ASAP7_75t_R U2749 ( .A(\s5_interp_lo_lo_lo\[3\] ), .Y(n4449) );
  HB2xp67_ASAP7_75t_R U2750 ( .A(n4198), .Y(n2634) );
  AOI22xp33_ASAP7_75t_R U2751 ( .A1(n3044), .A2(n3034), .B1(n3033), .B2(n3038), 
        .Y(n4198) );
  NAND2xp33_ASAP7_75t_R U2752 ( .A(n3643), .B(\x\[19\] ), .Y(n3036) );
  INVxp33_ASAP7_75t_R U2754 ( .A(s5_is_pos), .Y(n4809) );
  INVxp33_ASAP7_75t_R U2756 ( .A(s5_is_zero_sub), .Y(n4808) );
  INVxp33_ASAP7_75t_R U2758 ( .A(\s5_lut_base\[0\] ), .Y(n4842) );
  INVxp33_ASAP7_75t_R U2760 ( .A(\s5_lut_base\[1\] ), .Y(n4841) );
  INVxp33_ASAP7_75t_R U2762 ( .A(\s5_lut_base\[2\] ), .Y(n4840) );
  INVxp33_ASAP7_75t_R U2764 ( .A(\s5_lut_base\[3\] ), .Y(n4839) );
  INVxp33_ASAP7_75t_R U2766 ( .A(\s5_lut_base\[4\] ), .Y(n4838) );
  INVxp33_ASAP7_75t_R U2768 ( .A(\s5_lut_base\[5\] ), .Y(n4837) );
  INVxp33_ASAP7_75t_R U2770 ( .A(\s5_lut_base\[6\] ), .Y(n4836) );
  INVxp33_ASAP7_75t_R U2772 ( .A(\s5_lut_base\[7\] ), .Y(n4835) );
  INVxp33_ASAP7_75t_R U2774 ( .A(\s5_lut_base\[8\] ), .Y(n4834) );
  INVxp33_ASAP7_75t_R U2776 ( .A(\s5_lut_base\[9\] ), .Y(n4833) );
  INVxp33_ASAP7_75t_R U2778 ( .A(\s5_lut_base\[10\] ), .Y(n4832) );
  INVxp33_ASAP7_75t_R U2780 ( .A(\s5_lut_base\[11\] ), .Y(n4831) );
  INVxp33_ASAP7_75t_R U2782 ( .A(\s5_lut_base\[12\] ), .Y(n4830) );
  INVxp33_ASAP7_75t_R U2784 ( .A(\s5_lut_base\[13\] ), .Y(n4829) );
  INVxp33_ASAP7_75t_R U2786 ( .A(\s5_lut_base\[14\] ), .Y(n4828) );
  INVxp33_ASAP7_75t_R U2788 ( .A(\s5_lut_base\[15\] ), .Y(n4827) );
  INVxp33_ASAP7_75t_R U2790 ( .A(\s5_lut_base\[16\] ), .Y(n4826) );
  INVxp33_ASAP7_75t_R U2792 ( .A(\s5_lut_base\[17\] ), .Y(n4825) );
  INVxp33_ASAP7_75t_R U2794 ( .A(\s5_lut_base\[18\] ), .Y(n4824) );
  INVxp33_ASAP7_75t_R U2796 ( .A(\s5_lut_base\[19\] ), .Y(n4823) );
  INVxp33_ASAP7_75t_R U2798 ( .A(\s5_lut_base\[20\] ), .Y(n4822) );
  INVxp33_ASAP7_75t_R U2800 ( .A(s4_underflow), .Y(n4764) );
  INVxp33_ASAP7_75t_R U2802 ( .A(s4_valid), .Y(n4759) );
  INVxp33_ASAP7_75t_R U2804 ( .A(\s5_floor_mag\[0\] ), .Y(n4819) );
  INVxp33_ASAP7_75t_R U2806 ( .A(\s5_floor_mag\[1\] ), .Y(n4818) );
  INVxp33_ASAP7_75t_R U2808 ( .A(\s5_floor_mag\[2\] ), .Y(n4817) );
  INVxp33_ASAP7_75t_R U2810 ( .A(\s5_floor_mag\[3\] ), .Y(n4816) );
  INVxp33_ASAP7_75t_R U2812 ( .A(\s5_floor_mag\[4\] ), .Y(n4815) );
  INVxp33_ASAP7_75t_R U2814 ( .A(\s5_floor_mag\[5\] ), .Y(n4814) );
  INVxp33_ASAP7_75t_R U2816 ( .A(\s5_floor_mag\[6\] ), .Y(n4813) );
  INVxp33_ASAP7_75t_R U2818 ( .A(\s5_lut_base\[21\] ), .Y(n4821) );
  INVxp33_ASAP7_75t_R U2820 ( .A(s5_is_inf), .Y(n4807) );
  INVxp33_ASAP7_75t_R U2822 ( .A(s5_is_nan), .Y(n4806) );
  INVxp33_ASAP7_75t_R U2824 ( .A(\s5_interp_lo_lo_lo\[4\] ), .Y(n4448) );
  INVxp33_ASAP7_75t_R U2826 ( .A(\s5_interp_lo_lo_lo\[5\] ), .Y(n4447) );
  INVxp33_ASAP7_75t_R U2828 ( .A(\s5_lut_base\[22\] ), .Y(n4820) );
  INVxp33_ASAP7_75t_R U2830 ( .A(\s5_interp_hi_lo_lo\[3\] ), .Y(n4486) );
  INVxp33_ASAP7_75t_R U2832 ( .A(\s5_interp_hi_lo_lo\[2\] ), .Y(n4487) );
  INVxp33_ASAP7_75t_R U2834 ( .A(\s5_interp_hi_lo_lo\[1\] ), .Y(n4488) );
  INVxp33_ASAP7_75t_R U2836 ( .A(\s5_interp_hi_lo_lo\[0\] ), .Y(n4845) );
  INVxp33_ASAP7_75t_R U2838 ( .A(\s5_interp_hi_hi_lo\[5\] ), .Y(n4503) );
  INVxp33_ASAP7_75t_R U2840 ( .A(\s5_interp_hi_hi_lo\[4\] ), .Y(n4504) );
  INVxp33_ASAP7_75t_R U2842 ( .A(\s5_interp_hi_hi_lo\[3\] ), .Y(n4505) );
  INVxp33_ASAP7_75t_R U2844 ( .A(\s5_interp_hi_hi_lo\[2\] ), .Y(n4506) );
  INVxp33_ASAP7_75t_R U2846 ( .A(\s5_interp_hi_hi_lo\[1\] ), .Y(n4507) );
  INVxp33_ASAP7_75t_R U2848 ( .A(\s5_interp_hi_hi_lo\[0\] ), .Y(n4846) );
  INVxp33_ASAP7_75t_R U2850 ( .A(\s5_floor_mag\[8\] ), .Y(n4811) );
  INVxp33_ASAP7_75t_R U2852 ( .A(\s5_floor_mag\[7\] ), .Y(n4812) );
  INVxp33_ASAP7_75t_R U2854 ( .A(\s3_frac_lo\[6\] ), .Y(n4729) );
  INVxp33_ASAP7_75t_R U2856 ( .A(\s3_frac_lo\[7\] ), .Y(n4728) );
  INVxp33_ASAP7_75t_R U2858 ( .A(\s3_frac_lo\[8\] ), .Y(n4727) );
  INVxp33_ASAP7_75t_R U2860 ( .A(\s3_frac_lo\[9\] ), .Y(n4726) );
  INVxp33_ASAP7_75t_R U2862 ( .A(\s3_frac_lo\[10\] ), .Y(n4725) );
  INVxp33_ASAP7_75t_R U2864 ( .A(\s3_frac_lo\[11\] ), .Y(n4724) );
  INVxp33_ASAP7_75t_R U2866 ( .A(\s3_frac_lo\[12\] ), .Y(n4723) );
  INVxp33_ASAP7_75t_R U2868 ( .A(\s3_frac_lo\[13\] ), .Y(n4722) );
  INVxp33_ASAP7_75t_R U2870 ( .A(\s3_frac_lo\[14\] ), .Y(n4721) );
  INVxp33_ASAP7_75t_R U2872 ( .A(\s3_frac_lo\[15\] ), .Y(n4720) );
  INVxp33_ASAP7_75t_R U2874 ( .A(\s3_frac_lo\[16\] ), .Y(n4719) );
  INVxp33_ASAP7_75t_R U2876 ( .A(s3_is_inf), .Y(n4706) );
  INVxp33_ASAP7_75t_R U2878 ( .A(s3_is_nan), .Y(n4705) );
  INVxp33_ASAP7_75t_R U2880 ( .A(s3_is_pos), .Y(n4708) );
  INVxp33_ASAP7_75t_R U2882 ( .A(s3_is_zero_sub), .Y(n4707) );
  INVxp33_ASAP7_75t_R U2884 ( .A(s3_underflow), .Y(n4709) );
  INVxp33_ASAP7_75t_R U2886 ( .A(s3_valid), .Y(n4704) );
  INVxp33_ASAP7_75t_R U2888 ( .A(\s4_floor_mag\[0\] ), .Y(n4773) );
  HB1xp67_ASAP7_75t_R U2889 ( .A(n3062), .Y(n2703) );
  HB1xp67_ASAP7_75t_R U2890 ( .A(n4185), .Y(n2704) );
  NAND2xp33_ASAP7_75t_R U2891 ( .A(n3643), .B(\x\[7\] ), .Y(n3055) );
  INVxp33_ASAP7_75t_R U2893 ( .A(\s4_floor_mag\[1\] ), .Y(n4772) );
  INVxp33_ASAP7_75t_R U2895 ( .A(\s4_floor_mag\[2\] ), .Y(n4771) );
  INVxp33_ASAP7_75t_R U2897 ( .A(\s4_floor_mag\[3\] ), .Y(n4770) );
  INVxp33_ASAP7_75t_R U2899 ( .A(\s4_floor_mag\[4\] ), .Y(n4769) );
  INVxp33_ASAP7_75t_R U2901 ( .A(\s4_floor_mag\[5\] ), .Y(n4768) );
  INVxp33_ASAP7_75t_R U2903 ( .A(\s4_floor_mag\[6\] ), .Y(n4767) );
  HB1xp67_ASAP7_75t_R U2904 ( .A(n4212), .Y(n2711) );
  INVxp33_ASAP7_75t_R U2906 ( .A(s4_is_pos), .Y(n4763) );
  INVxp33_ASAP7_75t_R U2908 ( .A(s4_is_zero_sub), .Y(n4762) );
  INVxp33_ASAP7_75t_R U2910 ( .A(\s4_lut_base\[0\] ), .Y(n4796) );
  INVxp33_ASAP7_75t_R U2912 ( .A(\s4_lut_base\[1\] ), .Y(n4795) );
  INVxp33_ASAP7_75t_R U2914 ( .A(\s4_lut_base\[2\] ), .Y(n4794) );
  INVxp33_ASAP7_75t_R U2916 ( .A(\s4_lut_base\[3\] ), .Y(n4793) );
  INVxp33_ASAP7_75t_R U2918 ( .A(\s4_lut_base\[4\] ), .Y(n4792) );
  INVxp33_ASAP7_75t_R U2920 ( .A(\s4_lut_base\[5\] ), .Y(n4791) );
  INVxp33_ASAP7_75t_R U2922 ( .A(\s4_lut_base\[6\] ), .Y(n4790) );
  INVxp33_ASAP7_75t_R U2924 ( .A(\s4_lut_base\[7\] ), .Y(n4789) );
  INVxp33_ASAP7_75t_R U2926 ( .A(\s4_lut_base\[8\] ), .Y(n4788) );
  INVxp33_ASAP7_75t_R U2928 ( .A(\s4_lut_base\[9\] ), .Y(n4787) );
  INVxp33_ASAP7_75t_R U2930 ( .A(\s4_lut_base\[10\] ), .Y(n4786) );
  INVxp33_ASAP7_75t_R U2932 ( .A(\s4_lut_base\[11\] ), .Y(n4785) );
  INVxp33_ASAP7_75t_R U2934 ( .A(\s4_lut_base\[12\] ), .Y(n4784) );
  INVxp33_ASAP7_75t_R U2936 ( .A(\s4_lut_base\[13\] ), .Y(n4783) );
  INVxp33_ASAP7_75t_R U2938 ( .A(\s4_lut_base\[14\] ), .Y(n4782) );
  INVxp33_ASAP7_75t_R U2940 ( .A(\s4_lut_base\[15\] ), .Y(n4781) );
  INVxp33_ASAP7_75t_R U2942 ( .A(\s4_lut_base\[16\] ), .Y(n4780) );
  INVxp33_ASAP7_75t_R U2944 ( .A(\s4_lut_base\[17\] ), .Y(n4779) );
  INVxp33_ASAP7_75t_R U2946 ( .A(\s4_lut_base\[18\] ), .Y(n4778) );
  INVxp33_ASAP7_75t_R U2948 ( .A(\s4_lut_base\[19\] ), .Y(n4777) );
  INVxp33_ASAP7_75t_R U2950 ( .A(\s4_lut_base\[20\] ), .Y(n4776) );
  INVxp33_ASAP7_75t_R U2952 ( .A(\s3_floor_mag\[6\] ), .Y(n4712) );
  INVxp33_ASAP7_75t_R U2954 ( .A(\s3_floor_mag\[7\] ), .Y(n4711) );
  INVxp33_ASAP7_75t_R U2956 ( .A(\s3_floor_mag\[8\] ), .Y(n4710) );
  INVxp33_ASAP7_75t_R U2958 ( .A(\s3_frac_lo\[0\] ), .Y(n4735) );
  INVxp33_ASAP7_75t_R U2960 ( .A(\s3_frac_lo\[1\] ), .Y(n4734) );
  INVxp33_ASAP7_75t_R U2962 ( .A(\s3_frac_lo\[2\] ), .Y(n4733) );
  INVxp33_ASAP7_75t_R U2964 ( .A(\s3_frac_lo\[3\] ), .Y(n4732) );
  INVxp33_ASAP7_75t_R U2966 ( .A(\s3_frac_lo\[4\] ), .Y(n4731) );
  INVxp33_ASAP7_75t_R U2968 ( .A(\s3_frac_lo\[5\] ), .Y(n4730) );
  INVxp33_ASAP7_75t_R U2970 ( .A(\s4_lut_base\[21\] ), .Y(n4775) );
  INVxp33_ASAP7_75t_R U2972 ( .A(s4_is_inf), .Y(n4761) );
  INVxp33_ASAP7_75t_R U2974 ( .A(s4_is_nan), .Y(n4760) );
  INVxp33_ASAP7_75t_R U2976 ( .A(\s4_floor_mag\[7\] ), .Y(n4766) );
  INVxp33_ASAP7_75t_R U2978 ( .A(\s4_floor_mag\[8\] ), .Y(n4765) );
  INVxp33_ASAP7_75t_R U2980 ( .A(\s4_lut_base\[22\] ), .Y(n4774) );
  HB1xp67_ASAP7_75t_R U2981 ( .A(n3047), .Y(n2750) );
  INVxp33_ASAP7_75t_R U2982 ( .A(n4199), .Y(n2751) );
  AOI22xp5_ASAP7_75t_R U2983 ( .A1(n3034), .A2(n2750), .B1(n3033), .B2(n3041), 
        .Y(n4199) );
  INVx1_ASAP7_75t_R U2984 ( .A(n2751), .Y(n2752) );
  AOI22xp33_ASAP7_75t_R U2985 ( .A1(n3033), .A2(n3071), .B1(N193), .B2(n2960), 
        .Y(n4193) );
  HB1xp67_ASAP7_75t_R U2986 ( .A(n4193), .Y(n2753) );
  INVxp33_ASAP7_75t_R U2988 ( .A(\s2_f_u\[4\] ), .Y(n4661) );
  INVxp33_ASAP7_75t_R U2990 ( .A(\s2_f_u\[5\] ), .Y(n4660) );
  INVxp33_ASAP7_75t_R U2992 ( .A(\s2_f_u\[6\] ), .Y(n4659) );
  INVxp33_ASAP7_75t_R U2994 ( .A(\s2_f_u\[7\] ), .Y(n4658) );
  INVxp33_ASAP7_75t_R U2996 ( .A(\s2_f_u\[8\] ), .Y(n4657) );
  INVxp33_ASAP7_75t_R U2998 ( .A(\s2_f_u\[9\] ), .Y(n4656) );
  INVxp33_ASAP7_75t_R U3000 ( .A(\s2_f_u\[10\] ), .Y(n4655) );
  INVxp33_ASAP7_75t_R U3002 ( .A(\s2_f_u\[11\] ), .Y(n4654) );
  INVxp33_ASAP7_75t_R U3004 ( .A(\s2_f_u\[12\] ), .Y(n4653) );
  INVxp33_ASAP7_75t_R U3006 ( .A(\s2_f_u\[13\] ), .Y(n4652) );
  INVxp33_ASAP7_75t_R U3008 ( .A(\s2_f_u\[14\] ), .Y(n4651) );
  INVxp33_ASAP7_75t_R U3010 ( .A(\s2_f_u\[15\] ), .Y(n4650) );
  INVxp33_ASAP7_75t_R U3012 ( .A(\s2_f_u\[16\] ), .Y(n4649) );
  INVxp33_ASAP7_75t_R U3014 ( .A(s2_is_inf), .Y(n4691) );
  INVxp33_ASAP7_75t_R U3016 ( .A(s2_is_nan), .Y(n4690) );
  INVxp33_ASAP7_75t_R U3018 ( .A(s2_is_pos), .Y(n4693) );
  INVxp33_ASAP7_75t_R U3020 ( .A(s2_is_zero_sub), .Y(n4692) );
  INVxp33_ASAP7_75t_R U3022 ( .A(s2_underflow), .Y(n4694) );
  INVxp33_ASAP7_75t_R U3024 ( .A(s2_valid), .Y(n4689) );
  INVxp33_ASAP7_75t_R U3026 ( .A(\s3_floor_mag\[0\] ), .Y(n4718) );
  INVxp33_ASAP7_75t_R U3028 ( .A(\s3_floor_mag\[1\] ), .Y(n4717) );
  INVxp33_ASAP7_75t_R U3030 ( .A(\s3_floor_mag\[2\] ), .Y(n4716) );
  INVxp33_ASAP7_75t_R U3032 ( .A(\s3_floor_mag\[3\] ), .Y(n4715) );
  INVxp33_ASAP7_75t_R U3034 ( .A(\s2_floor_mag\[0\] ), .Y(n4703) );
  INVxp33_ASAP7_75t_R U3036 ( .A(\s2_floor_mag\[1\] ), .Y(n4702) );
  INVxp33_ASAP7_75t_R U3038 ( .A(\s2_floor_mag\[2\] ), .Y(n4701) );
  INVxp33_ASAP7_75t_R U3040 ( .A(\s2_floor_mag\[3\] ), .Y(n4700) );
  INVxp33_ASAP7_75t_R U3042 ( .A(\s2_floor_mag\[4\] ), .Y(n4699) );
  INVxp33_ASAP7_75t_R U3044 ( .A(\s2_floor_mag\[5\] ), .Y(n4698) );
  INVxp33_ASAP7_75t_R U3046 ( .A(\s2_floor_mag\[6\] ), .Y(n4697) );
  INVxp33_ASAP7_75t_R U3048 ( .A(\s2_floor_mag\[7\] ), .Y(n4696) );
  INVxp33_ASAP7_75t_R U3050 ( .A(\s2_floor_mag\[8\] ), .Y(n4695) );
  INVxp33_ASAP7_75t_R U3052 ( .A(\s3_floor_mag\[4\] ), .Y(n4714) );
  INVxp33_ASAP7_75t_R U3054 ( .A(\s2_f_u\[2\] ), .Y(n4663) );
  INVxp33_ASAP7_75t_R U3056 ( .A(\s2_f_u\[3\] ), .Y(n4662) );
  INVxp33_ASAP7_75t_R U3058 ( .A(\s2_f_u\[0\] ), .Y(n4665) );
  INVxp33_ASAP7_75t_R U3060 ( .A(\s2_f_u\[1\] ), .Y(n4664) );
  INVxp33_ASAP7_75t_R U3062 ( .A(\s3_floor_mag\[5\] ), .Y(n4713) );
  INVxp33_ASAP7_75t_R U3064 ( .A(\s2q_p4\[0\] ), .Y(n4674) );
  INVxp33_ASAP7_75t_R U3066 ( .A(\s2q_p4\[1\] ), .Y(n4277) );
  INVxp33_ASAP7_75t_R U3068 ( .A(\s2q_p4\[2\] ), .Y(n4276) );
  INVxp33_ASAP7_75t_R U3070 ( .A(\s2q_p4\[3\] ), .Y(n4275) );
  INVxp33_ASAP7_75t_R U3072 ( .A(s2q_is_inf), .Y(n4668) );
  INVxp33_ASAP7_75t_R U3074 ( .A(s2q_is_nan), .Y(n4667) );
  INVxp33_ASAP7_75t_R U3076 ( .A(s2q_is_pos), .Y(n4670) );
  INVxp33_ASAP7_75t_R U3078 ( .A(s2q_is_zero_sub), .Y(n4669) );
  INVxp33_ASAP7_75t_R U3080 ( .A(\s2q_p2\[0\] ), .Y(n4673) );
  INVxp33_ASAP7_75t_R U3082 ( .A(\s2q_p2\[1\] ), .Y(n4246) );
  INVxp33_ASAP7_75t_R U3084 ( .A(\s2q_p2\[2\] ), .Y(n4245) );
  INVxp33_ASAP7_75t_R U3086 ( .A(\s2q_p2\[3\] ), .Y(n4244) );
  INVxp33_ASAP7_75t_R U3088 ( .A(\s2q_p0\[0\] ), .Y(n4672) );
  INVxp33_ASAP7_75t_R U3090 ( .A(\s2q_p0\[1\] ), .Y(n4215) );
  INVxp33_ASAP7_75t_R U3092 ( .A(\s2q_p0\[2\] ), .Y(n4214) );
  INVxp33_ASAP7_75t_R U3094 ( .A(\s2q_p0\[3\] ), .Y(n4213) );
  INVxp33_ASAP7_75t_R U3096 ( .A(s2q_valid), .Y(n4666) );
  HB1xp67_ASAP7_75t_R U3097 ( .A(n4191), .Y(n2809) );
  INVxp33_ASAP7_75t_R U3099 ( .A(\s2p_lo_lo\[5\] ), .Y(n4339) );
  INVxp33_ASAP7_75t_R U3101 ( .A(\s2p_lo_lo\[6\] ), .Y(n4338) );
  INVxp33_ASAP7_75t_R U3103 ( .A(\s2p_lo_lo\[7\] ), .Y(n4337) );
  INVxp33_ASAP7_75t_R U3105 ( .A(s2p_valid), .Y(n4676) );
  INVxp33_ASAP7_75t_R U3107 ( .A(s2q_clamp_big), .Y(n4671) );
  INVxp33_ASAP7_75t_R U3109 ( .A(\s2q_p6\[0\] ), .Y(n4675) );
  INVxp33_ASAP7_75t_R U3111 ( .A(\s2q_p6\[1\] ), .Y(n4308) );
  INVxp33_ASAP7_75t_R U3113 ( .A(\s2q_p6\[2\] ), .Y(n4307) );
  INVxp33_ASAP7_75t_R U3115 ( .A(\s2q_p6\[3\] ), .Y(n4306) );
  INVxp33_ASAP7_75t_R U3117 ( .A(s1_is_zero_sub), .Y(n4600) );
  INVxp33_ASAP7_75t_R U3119 ( .A(s1_is_nan), .Y(n4598) );
  INVxp33_ASAP7_75t_R U3121 ( .A(s1_is_pos), .Y(n4601) );
  INVxp33_ASAP7_75t_R U3123 ( .A(s1_clamp_big), .Y(n4602) );
  INVxp33_ASAP7_75t_R U3125 ( .A(s1_is_inf), .Y(n4599) );
  INVxp33_ASAP7_75t_R U3127 ( .A(s1_valid), .Y(n4597) );
  HB1xp67_ASAP7_75t_R U3128 ( .A(n4201), .Y(n2825) );
  HB1xp67_ASAP7_75t_R U3129 ( .A(n4202), .Y(n2826) );
  INVxp33_ASAP7_75t_R U3131 ( .A(s2m_is_inf), .Y(n4686) );
  INVxp33_ASAP7_75t_R U3133 ( .A(s2m_is_nan), .Y(n4685) );
  INVxp33_ASAP7_75t_R U3135 ( .A(s2m_is_pos), .Y(n4688) );
  INVxp33_ASAP7_75t_R U3137 ( .A(s2m_is_zero_sub), .Y(n4687) );
  INVxp33_ASAP7_75t_R U3139 ( .A(s2m_valid), .Y(n4684) );
  INVxp33_ASAP7_75t_R U3141 ( .A(s2p_clamp_big), .Y(n4681) );
  INVxp33_ASAP7_75t_R U3143 ( .A(s2p_is_inf), .Y(n4678) );
  INVxp33_ASAP7_75t_R U3145 ( .A(s2p_is_nan), .Y(n4677) );
  INVxp33_ASAP7_75t_R U3147 ( .A(s2p_is_pos), .Y(n4680) );
  INVxp33_ASAP7_75t_R U3149 ( .A(s2p_is_zero_sub), .Y(n4679) );
  INVxp33_ASAP7_75t_R U3151 ( .A(\s2p_hi_lo\[0\] ), .Y(n4683) );
  INVxp33_ASAP7_75t_R U3153 ( .A(\s2p_hi_lo\[1\] ), .Y(n4382) );
  INVxp33_ASAP7_75t_R U3155 ( .A(\s2p_hi_lo\[2\] ), .Y(n4381) );
  INVxp33_ASAP7_75t_R U3157 ( .A(\s2p_hi_lo\[3\] ), .Y(n4380) );
  INVxp33_ASAP7_75t_R U3159 ( .A(\s2p_hi_lo\[4\] ), .Y(n4379) );
  INVxp33_ASAP7_75t_R U3161 ( .A(\s2p_hi_lo\[5\] ), .Y(n4378) );
  INVxp33_ASAP7_75t_R U3163 ( .A(\s2p_hi_lo\[6\] ), .Y(n4377) );
  OR5x2_ASAP7_75t_R U3165 ( .A(\x\[23\] ), .B(\x\[24\] ), .C(\x\[25\] ), .D(
        \x\[26\] ), .E(n3656), .Y(n4586) );
  INVxp33_ASAP7_75t_R U3167 ( .A(s7_valid), .Y(n4887) );
  INVxp33_ASAP7_75t_R U3169 ( .A(\s2p_lo_lo\[3\] ), .Y(n4341) );
  INVxp33_ASAP7_75t_R U3171 ( .A(\s2p_lo_lo\[1\] ), .Y(n4343) );
  INVxp33_ASAP7_75t_R U3173 ( .A(\s2p_lo_lo\[2\] ), .Y(n4342) );
  INVxp33_ASAP7_75t_R U3175 ( .A(\s2p_hi_lo\[7\] ), .Y(n4376) );
  INVxp33_ASAP7_75t_R U3177 ( .A(\s2p_lo_lo\[0\] ), .Y(n4682) );
  INVxp33_ASAP7_75t_R U3179 ( .A(\s2p_lo_lo\[4\] ), .Y(n4340) );
  HB1xp67_ASAP7_75t_R U3180 ( .A(n2853), .Y(n2852) );
  HB1xp67_ASAP7_75t_R U3181 ( .A(n4211), .Y(n2853) );
  AOI22xp33_ASAP7_75t_R U3182 ( .A1(n3070), .A2(n3033), .B1(N192), .B2(n2960), 
        .Y(n4182) );
  HB1xp67_ASAP7_75t_R U3183 ( .A(n4182), .Y(n2854) );
  HB1xp67_ASAP7_75t_R U3186 ( .A(n4181), .Y(n2857) );
  HB1xp67_ASAP7_75t_R U3187 ( .A(n2859), .Y(n2858) );
  HB1xp67_ASAP7_75t_R U3188 ( .A(n4189), .Y(n2859) );
  HB1xp67_ASAP7_75t_R U3189 ( .A(n4192), .Y(n2860) );
  HB1xp67_ASAP7_75t_R U3190 ( .A(n4190), .Y(n2861) );
  HB1xp67_ASAP7_75t_R U3192 ( .A(n4209), .Y(n2863) );
  HB1xp67_ASAP7_75t_R U3193 ( .A(\x\[20\] ), .Y(n2864) );
  HB1xp67_ASAP7_75t_R U3194 ( .A(n4200), .Y(n2865) );
  HB1xp67_ASAP7_75t_R U3195 ( .A(\x\[22\] ), .Y(n2866) );
  HB1xp67_ASAP7_75t_R U3196 ( .A(n4197), .Y(n2867) );
  HB1xp67_ASAP7_75t_R U3197 ( .A(n4207), .Y(n2868) );
  HB1xp67_ASAP7_75t_R U3198 ( .A(n4195), .Y(n2869) );
  HB1xp67_ASAP7_75t_R U3199 ( .A(n3053), .Y(n2870) );
  HB1xp67_ASAP7_75t_R U3200 ( .A(n4210), .Y(n2871) );
  HB1xp67_ASAP7_75t_R U3201 ( .A(n4188), .Y(n2872) );
  HB1xp67_ASAP7_75t_R U3202 ( .A(n4206), .Y(n2873) );
  HB1xp67_ASAP7_75t_R U3203 ( .A(\x\[3\] ), .Y(n2874) );
  HB1xp67_ASAP7_75t_R U3204 ( .A(\x\[2\] ), .Y(n2875) );
  HB1xp67_ASAP7_75t_R U3205 ( .A(n4196), .Y(n2876) );
  HB2xp67_ASAP7_75t_R U3206 ( .A(n4194), .Y(n2877) );
  HB1xp67_ASAP7_75t_R U3207 ( .A(n4208), .Y(n2878) );
  HB1xp67_ASAP7_75t_R U3208 ( .A(\x\[1\] ), .Y(n2879) );
  HB1xp67_ASAP7_75t_R U3209 ( .A(n3069), .Y(n2880) );
  HB1xp67_ASAP7_75t_R U3210 ( .A(\x\[0\] ), .Y(n2881) );
  HB1xp67_ASAP7_75t_R U3211 ( .A(n3059), .Y(n2882) );
  HB1xp67_ASAP7_75t_R U3212 ( .A(n3065), .Y(n2883) );
  HB1xp67_ASAP7_75t_R U3213 ( .A(n4186), .Y(n2884) );
  HB1xp67_ASAP7_75t_R U3214 ( .A(n4183), .Y(n2885) );
  HB1xp67_ASAP7_75t_R U3215 ( .A(n4184), .Y(n2886) );
  HB1xp67_ASAP7_75t_R U3216 ( .A(n4187), .Y(n2887) );
  INVxp33_ASAP7_75t_R U3221 ( .A(s5_underflow), .Y(n4810) );
  INVxp33_ASAP7_75t_R U3225 ( .A(s6_valid), .Y(n4847) );
  INVxp33_ASAP7_75t_R U3227 ( .A(s6_underflow), .Y(n4852) );
  INVxp33_ASAP7_75t_R U3229 ( .A(\s6_lut_base\[22\] ), .Y(n4862) );
  INVxp33_ASAP7_75t_R U3231 ( .A(\s6_lut_base\[21\] ), .Y(n4863) );
  INVxp33_ASAP7_75t_R U3233 ( .A(\s6_lut_base\[20\] ), .Y(n4864) );
  INVxp33_ASAP7_75t_R U3235 ( .A(\s6_lut_base\[19\] ), .Y(n4865) );
  INVxp33_ASAP7_75t_R U3237 ( .A(\s6_lut_base\[18\] ), .Y(n4866) );
  INVxp33_ASAP7_75t_R U3239 ( .A(\s6_lut_base\[17\] ), .Y(n4867) );
  INVxp33_ASAP7_75t_R U3241 ( .A(\s6_lut_base\[16\] ), .Y(n4868) );
  INVxp33_ASAP7_75t_R U3243 ( .A(\s6_lut_base\[15\] ), .Y(n4869) );
  INVxp33_ASAP7_75t_R U3245 ( .A(\s6_lut_base\[14\] ), .Y(n4870) );
  INVxp33_ASAP7_75t_R U3247 ( .A(\s6_lut_base\[13\] ), .Y(n4871) );
  INVxp33_ASAP7_75t_R U3249 ( .A(\s6_lut_base\[12\] ), .Y(n4872) );
  INVxp33_ASAP7_75t_R U3251 ( .A(\s6_lut_base\[11\] ), .Y(n4873) );
  INVxp33_ASAP7_75t_R U3253 ( .A(\s6_lut_base\[10\] ), .Y(n4874) );
  INVxp33_ASAP7_75t_R U3255 ( .A(\s6_lut_base\[9\] ), .Y(n4875) );
  INVxp33_ASAP7_75t_R U3257 ( .A(\s6_lut_base\[8\] ), .Y(n4876) );
  INVxp33_ASAP7_75t_R U3259 ( .A(\s6_lut_base\[7\] ), .Y(n4877) );
  INVxp33_ASAP7_75t_R U3261 ( .A(\s6_lut_base\[6\] ), .Y(n4878) );
  INVxp33_ASAP7_75t_R U3263 ( .A(\s6_lut_base\[5\] ), .Y(n4879) );
  INVxp33_ASAP7_75t_R U3265 ( .A(\s6_lut_base\[4\] ), .Y(n4880) );
  INVxp33_ASAP7_75t_R U3267 ( .A(\s6_lut_base\[3\] ), .Y(n4881) );
  INVxp33_ASAP7_75t_R U3269 ( .A(\s6_lut_base\[2\] ), .Y(n4882) );
  INVxp33_ASAP7_75t_R U3271 ( .A(\s6_lut_base\[1\] ), .Y(n4883) );
  INVxp33_ASAP7_75t_R U3273 ( .A(\s6_lut_base\[0\] ), .Y(n4884) );
  INVxp33_ASAP7_75t_R U3275 ( .A(s6_is_zero_sub), .Y(n4850) );
  INVxp33_ASAP7_75t_R U3277 ( .A(s6_is_pos), .Y(n4851) );
  INVxp33_ASAP7_75t_R U3279 ( .A(s6_is_nan), .Y(n4848) );
  INVxp33_ASAP7_75t_R U3281 ( .A(s6_is_inf), .Y(n4849) );
  INVxp33_ASAP7_75t_R U3283 ( .A(\s6_interp_lo_lo\[11\] ), .Y(n4522) );
  INVxp33_ASAP7_75t_R U3285 ( .A(\s6_interp_lo_lo\[10\] ), .Y(n4523) );
  INVxp33_ASAP7_75t_R U3287 ( .A(\s6_interp_lo_lo\[9\] ), .Y(n4524) );
  INVxp33_ASAP7_75t_R U3289 ( .A(\s6_interp_lo_lo\[8\] ), .Y(n4525) );
  INVxp33_ASAP7_75t_R U3291 ( .A(\s6_interp_lo_lo\[7\] ), .Y(n4526) );
  INVxp33_ASAP7_75t_R U3293 ( .A(\s6_interp_lo_lo\[6\] ), .Y(n4527) );
  INVxp33_ASAP7_75t_R U3295 ( .A(\s6_interp_lo_lo\[5\] ), .Y(n4528) );
  INVxp33_ASAP7_75t_R U3297 ( .A(\s6_interp_lo_lo\[4\] ), .Y(n4529) );
  INVxp33_ASAP7_75t_R U3299 ( .A(\s6_interp_lo_lo\[3\] ), .Y(n4530) );
  INVxp33_ASAP7_75t_R U3301 ( .A(\s6_interp_lo_lo\[2\] ), .Y(n4531) );
  INVxp33_ASAP7_75t_R U3303 ( .A(\s6_interp_lo_lo\[1\] ), .Y(n4532) );
  INVxp33_ASAP7_75t_R U3305 ( .A(\s6_interp_lo_lo\[0\] ), .Y(n4885) );
  INVxp33_ASAP7_75t_R U3307 ( .A(\s6_interp_hi_lo\[11\] ), .Y(n4554) );
  INVxp33_ASAP7_75t_R U3309 ( .A(\s6_interp_hi_lo\[10\] ), .Y(n4555) );
  INVxp33_ASAP7_75t_R U3311 ( .A(\s6_interp_hi_lo\[9\] ), .Y(n4556) );
  INVxp33_ASAP7_75t_R U3313 ( .A(\s6_interp_hi_lo\[8\] ), .Y(n4557) );
  INVxp33_ASAP7_75t_R U3315 ( .A(\s6_interp_hi_lo\[7\] ), .Y(n4558) );
  INVxp33_ASAP7_75t_R U3317 ( .A(\s6_interp_hi_lo\[6\] ), .Y(n4559) );
  INVxp33_ASAP7_75t_R U3319 ( .A(\s6_interp_hi_lo\[5\] ), .Y(n4560) );
  INVxp33_ASAP7_75t_R U3321 ( .A(\s6_interp_hi_lo\[4\] ), .Y(n4561) );
  INVxp33_ASAP7_75t_R U3323 ( .A(\s6_interp_hi_lo\[3\] ), .Y(n4562) );
  INVxp33_ASAP7_75t_R U3325 ( .A(\s6_interp_hi_lo\[2\] ), .Y(n4563) );
  INVxp33_ASAP7_75t_R U3327 ( .A(\s6_interp_hi_lo\[1\] ), .Y(n4564) );
  INVxp33_ASAP7_75t_R U3329 ( .A(\s6_interp_hi_lo\[0\] ), .Y(n4886) );
  INVxp33_ASAP7_75t_R U3331 ( .A(\s6_floor_mag\[8\] ), .Y(n4853) );
  INVxp33_ASAP7_75t_R U3333 ( .A(\s6_floor_mag\[7\] ), .Y(n4854) );
  INVxp33_ASAP7_75t_R U3335 ( .A(\s6_floor_mag\[6\] ), .Y(n4855) );
  INVxp33_ASAP7_75t_R U3337 ( .A(\s6_floor_mag\[5\] ), .Y(n4856) );
  INVxp33_ASAP7_75t_R U3339 ( .A(\s6_floor_mag\[4\] ), .Y(n4857) );
  INVxp33_ASAP7_75t_R U3341 ( .A(\s6_floor_mag\[3\] ), .Y(n4858) );
  INVxp33_ASAP7_75t_R U3343 ( .A(\s6_floor_mag\[2\] ), .Y(n4859) );
  INVxp33_ASAP7_75t_R U3345 ( .A(\s6_floor_mag\[1\] ), .Y(n4860) );
  INVxp33_ASAP7_75t_R U3347 ( .A(\s6_floor_mag\[0\] ), .Y(n4861) );
  INVxp33_ASAP7_75t_R U3349 ( .A(s5_valid), .Y(n4805) );
  HB1xp67_ASAP7_75t_R U3350 ( .A(\s4_frac_lo\[15\] ), .Y(n3027) );
  NOR2xp33_ASAP7_75t_R U3351 ( .A(\prod\[55\] ), .B(n3029), .Y(n3389) );
  NOR3xp33_ASAP7_75t_R U3352 ( .A(n2966), .B(N234), .C(N233), .Y(n3390) );
  INVx1_ASAP7_75t_R U3353 ( .A(n2966), .Y(n3029) );
  NAND4xp25_ASAP7_75t_R U3354 ( .A(n3758), .B(n3695), .C(n3741), .D(n3767), 
        .Y(n3288) );
  HB1xp67_ASAP7_75t_R U3355 ( .A(n3013), .Y(n3031) );
  BUFx2_ASAP7_75t_R U3356 ( .A(\mant_frac\[23\] ), .Y(n3028) );
  NOR2xp33_ASAP7_75t_R U3357 ( .A(n3077), .B(n3076), .Y(n3079) );
  NOR2xp33_ASAP7_75t_R U3358 ( .A(n3075), .B(n3074), .Y(n3080) );
  NOR2xp33_ASAP7_75t_R U3359 ( .A(n3169), .B(n3168), .Y(n3171) );
  NOR4xp25_ASAP7_75t_R U3360 ( .A(n3680), .B(n3482), .C(n3483), .D(n3777), .Y(
        n3170) );
  NOR2xp33_ASAP7_75t_R U3361 ( .A(n3485), .B(n3497), .Y(n3285) );
  NAND4xp25_ASAP7_75t_R U3362 ( .A(n3198), .B(n3687), .C(n3286), .D(n3117), 
        .Y(n3178) );
  NOR3xp33_ASAP7_75t_R U3363 ( .A(n3713), .B(n3487), .C(n3182), .Y(n3117) );
  NAND2xp5_ASAP7_75t_R U3364 ( .A(n2958), .B(n2964), .Y(n3702) );
  HB1xp67_ASAP7_75t_R U3365 ( .A(n3013), .Y(n3032) );
  NAND4xp25_ASAP7_75t_R U3366 ( .A(n3257), .B(n3278), .C(n3741), .D(n3668), 
        .Y(n3179) );
  NAND2xp5_ASAP7_75t_R U3367 ( .A(n3012), .B(n3125), .Y(n3360) );
  NAND2xp5_ASAP7_75t_R U3368 ( .A(n3730), .B(n2963), .Y(n3673) );
  NOR3xp33_ASAP7_75t_R U3369 ( .A(n3724), .B(n3790), .C(n3183), .Y(n3126) );
  NOR4xp25_ASAP7_75t_R U3370 ( .A(n3228), .B(n3219), .C(n3712), .D(n3502), .Y(
        n3127) );
  NAND4xp25_ASAP7_75t_R U3371 ( .A(n3146), .B(n3360), .C(n3705), .D(n3756), 
        .Y(n3204) );
  NOR2xp33_ASAP7_75t_R U3372 ( .A(n3498), .B(n3229), .Y(n3146) );
  NAND4xp25_ASAP7_75t_R U3373 ( .A(n3111), .B(n3676), .C(n3110), .D(n3109), 
        .Y(n3186) );
  NOR3xp33_ASAP7_75t_R U3374 ( .A(n3691), .B(n3494), .C(n3690), .Y(n3109) );
  NAND4xp25_ASAP7_75t_R U3375 ( .A(n3723), .B(n3722), .C(n3685), .D(n3710), 
        .Y(n3279) );
  NOR2xp33_ASAP7_75t_R U3376 ( .A(n3229), .B(n3147), .Y(n3112) );
  INVx1_ASAP7_75t_R U3377 ( .A(n3085), .Y(n3125) );
  NOR2xp33_ASAP7_75t_R U3378 ( .A(n3073), .B(n3072), .Y(n3081) );
  INVx1_ASAP7_75t_R U3379 ( .A(n3628), .Y(n3521) );
  INVx1_ASAP7_75t_R U3380 ( .A(n3631), .Y(n3603) );
  INVx1_ASAP7_75t_R U3381 ( .A(n3643), .Y(n3522) );
  NOR3xp33_ASAP7_75t_R U3382 ( .A(s7_is_zero_sub), .B(s7_is_nan), .C(s7_is_inf), .Y(n3353) );
  NOR4xp25_ASAP7_75t_R U3383 ( .A(s7_is_pos), .B(s7_underflow), .C(n3802), .D(
        \exp_field\[9\] ), .Y(n3354) );
  INVx1_ASAP7_75t_R U3384 ( .A(n2966), .Y(n3030) );
  NAND4xp25_ASAP7_75t_R U3385 ( .A(n3781), .B(n3099), .C(n3694), .D(n3782), 
        .Y(n3192) );
  NOR3xp33_ASAP7_75t_R U3386 ( .A(n3750), .B(n3724), .C(n3242), .Y(n3156) );
  NOR2xp33_ASAP7_75t_R U3387 ( .A(n3498), .B(n3219), .Y(n3157) );
  NAND4xp25_ASAP7_75t_R U3388 ( .A(n3097), .B(n3715), .C(n3023), .D(n3096), 
        .Y(n3190) );
  NOR2xp33_ASAP7_75t_R U3389 ( .A(n3775), .B(n3228), .Y(n3096) );
  NAND4xp25_ASAP7_75t_R U3390 ( .A(n3702), .B(n3715), .C(n3693), .D(n3167), 
        .Y(n3245) );
  NOR3xp33_ASAP7_75t_R U3391 ( .A(n3182), .B(n3479), .C(n3477), .Y(n3167) );
  NOR2xp33_ASAP7_75t_R U3392 ( .A(n3229), .B(n3228), .Y(n3230) );
  AOI21xp5_ASAP7_75t_R U3393 ( .A1(n3440), .A2(n3416), .B(n3415), .Y(n3439) );
  NOR2xp33_ASAP7_75t_R U3394 ( .A(\s6_interp_hi_hi\[7\] ), .B(
        \s6_interp_hi_lo\[19\] ), .Y(n3415) );
  AOI21xp5_ASAP7_75t_R U3395 ( .A1(n3443), .A2(n3413), .B(n3412), .Y(n3442) );
  NOR2xp33_ASAP7_75t_R U3396 ( .A(\s6_interp_hi_hi\[5\] ), .B(
        \s6_interp_hi_lo\[17\] ), .Y(n3412) );
  AOI21xp5_ASAP7_75t_R U3397 ( .A1(n3446), .A2(n3410), .B(n3409), .Y(n3445) );
  NOR2xp33_ASAP7_75t_R U3398 ( .A(\s6_interp_hi_hi\[3\] ), .B(
        \s6_interp_hi_lo\[15\] ), .Y(n3409) );
  AOI21xp5_ASAP7_75t_R U3399 ( .A1(n3450), .A2(n3407), .B(n3406), .Y(n3448) );
  NOR2xp33_ASAP7_75t_R U3400 ( .A(\s6_interp_hi_hi\[1\] ), .B(
        \s6_interp_hi_lo\[13\] ), .Y(n3406) );
  AOI211xp5_ASAP7_75t_R U3401 ( .A1(n3394), .A2(n3393), .B(n3392), .C(n3391), 
        .Y(n4020) );
  NOR2xp33_ASAP7_75t_R U3402 ( .A(n4022), .B(n4021), .Y(n3393) );
  AOI221xp5_ASAP7_75t_R U3403 ( .A1(n3028), .A2(n3031), .B1(\mant_frac\[22\] ), 
        .B2(n3031), .C(s7_is_nan), .Y(n2346) );
  NOR4xp25_ASAP7_75t_R U3404 ( .A(n3297), .B(n3296), .C(n3295), .D(n3294), .Y(
        n4634) );
  NOR2xp33_ASAP7_75t_R U3405 ( .A(n3191), .B(n3189), .Y(n4604) );
  NOR2xp33_ASAP7_75t_R U3406 ( .A(n3721), .B(n3189), .Y(n4606) );
  NOR4xp25_ASAP7_75t_R U3407 ( .A(n3174), .B(n3173), .C(n3276), .D(n3220), .Y(
        n4616) );
  NOR2xp33_ASAP7_75t_R U3408 ( .A(n3724), .B(n3769), .Y(n3284) );
  NOR4xp25_ASAP7_75t_R U3409 ( .A(n3765), .B(n3688), .C(n3292), .D(n3215), .Y(
        n4635) );
  NOR2xp33_ASAP7_75t_R U3410 ( .A(n3774), .B(n3775), .Y(n3138) );
  NOR2xp33_ASAP7_75t_R U3411 ( .A(n3194), .B(n3192), .Y(n4641) );
  NOR2xp33_ASAP7_75t_R U3412 ( .A(n3275), .B(n3192), .Y(n4642) );
  NOR4xp25_ASAP7_75t_R U3413 ( .A(n3300), .B(n3264), .C(n3263), .D(n3262), .Y(
        n3265) );
  NOR4xp25_ASAP7_75t_R U3414 ( .A(n3145), .B(n3144), .C(n3143), .D(n3142), .Y(
        n4618) );
  NOR4xp25_ASAP7_75t_R U3415 ( .A(n3135), .B(n3134), .C(n3133), .D(n3279), .Y(
        n4619) );
  NOR4xp25_ASAP7_75t_R U3416 ( .A(n3166), .B(n3165), .C(n3261), .D(n3212), .Y(
        n4603) );
  NOR3xp33_ASAP7_75t_R U3417 ( .A(n3498), .B(n3219), .C(n3190), .Y(n4640) );
  NOR3xp33_ASAP7_75t_R U3418 ( .A(n3721), .B(n3191), .C(n3190), .Y(n4639) );
  NOR4xp25_ASAP7_75t_R U3419 ( .A(n3119), .B(n3263), .C(n3118), .D(n3178), .Y(
        n4624) );
  NOR4xp25_ASAP7_75t_R U3420 ( .A(n3181), .B(n3180), .C(n3179), .D(n3178), .Y(
        n4625) );
  NOR2xp33_ASAP7_75t_R U3421 ( .A(n3269), .B(n3205), .Y(n3209) );
  NOR4xp25_ASAP7_75t_R U3422 ( .A(n3236), .B(n3274), .C(n3736), .D(n3737), .Y(
        n4626) );
  NOR4xp25_ASAP7_75t_R U3423 ( .A(n3239), .B(n3238), .C(n3237), .D(n3236), .Y(
        n4611) );
  NOR4xp25_ASAP7_75t_R U3424 ( .A(n3131), .B(n3130), .C(n3258), .D(n3129), .Y(
        n4607) );
  NOR4xp25_ASAP7_75t_R U3425 ( .A(n3206), .B(n3148), .C(n3497), .D(n3147), .Y(
        n3149) );
  NOR3xp33_ASAP7_75t_R U3426 ( .A(n3215), .B(n3262), .C(n3204), .Y(n3150) );
  NOR4xp25_ASAP7_75t_R U3427 ( .A(n3188), .B(n3187), .C(n3186), .D(n3185), .Y(
        n4608) );
  NOR4xp25_ASAP7_75t_R U3428 ( .A(n3283), .B(n3282), .C(n3281), .D(n3280), .Y(
        n4620) );
  NOR4xp25_ASAP7_75t_R U3429 ( .A(n3725), .B(n3274), .C(n3235), .D(n3234), .Y(
        n4621) );
  XOR2xp5_ASAP7_75t_R U3430 ( .A(n3525), .B(n3555), .Y(n2956) );
  XOR2xp5_ASAP7_75t_R U3431 ( .A(n3525), .B(n2998), .Y(n2957) );
  AND2x2_ASAP7_75t_R U3432 ( .A(n2972), .B(n3001), .Y(n2958) );
  XOR2xp5_ASAP7_75t_R U3433 ( .A(n3546), .B(n3554), .Y(n2959) );
  AND2x2_ASAP7_75t_R U3434 ( .A(\rexp\[9\] ), .B(n2971), .Y(n2960) );
  XOR2xp5_ASAP7_75t_R U3435 ( .A(n3546), .B(n2997), .Y(n2961) );
  NOR2xp33_ASAP7_75t_R U3436 ( .A(\s2_f_u\[19\] ), .B(\s2_f_u\[20\] ), .Y(
        n2962) );
  AND2x2_ASAP7_75t_R U3437 ( .A(\s2_f_u\[20\] ), .B(n3083), .Y(n2963) );
  AND2x2_ASAP7_75t_R U3438 ( .A(\s2_f_u\[19\] ), .B(n3082), .Y(n2964) );
  AND2x2_ASAP7_75t_R U3439 ( .A(n3553), .B(n2983), .Y(n2965) );
  INVxp33_ASAP7_75t_R U3440 ( .A(n3530), .Y(\rexp\[3\] ) );
  AND4x1_ASAP7_75t_R U3441 ( .A(n3081), .B(n3080), .C(n3079), .D(n3078), .Y(
        n2966) );
  XOR2xp5_ASAP7_75t_R U3442 ( .A(n3525), .B(n2985), .Y(n2967) );
  XOR2xp5_ASAP7_75t_R U3443 ( .A(n3545), .B(n2965), .Y(n2968) );
  AND2x2_ASAP7_75t_R U3444 ( .A(n3528), .B(n3037), .Y(n2969) );
  NOR2xp33_ASAP7_75t_R U3445 ( .A(n3647), .B(n3528), .Y(n2970) );
  OR2x2_ASAP7_75t_R U3446 ( .A(n3000), .B(n3595), .Y(n2971) );
  AND2x2_ASAP7_75t_R U3447 ( .A(\s2_f_u\[18\] ), .B(\s2_f_u\[17\] ), .Y(n2972)
         );
  AND2x2_ASAP7_75t_R U3448 ( .A(\s2_f_u\[17\] ), .B(n3095), .Y(n2973) );
  NOR2xp33_ASAP7_75t_R U3449 ( .A(\s2_f_u\[17\] ), .B(\s2_f_u\[18\] ), .Y(
        n2974) );
  AND2x2_ASAP7_75t_R U3450 ( .A(\s2_f_u\[18\] ), .B(n3086), .Y(n2975) );
  XOR2xp5_ASAP7_75t_R U3451 ( .A(n3545), .B(n2996), .Y(n2976) );
  AND2x2_ASAP7_75t_R U3452 ( .A(n2973), .B(n3008), .Y(n2977) );
  AND2x2_ASAP7_75t_R U3453 ( .A(n3008), .B(n2975), .Y(n2978) );
  AND2x2_ASAP7_75t_R U3454 ( .A(n2974), .B(n3003), .Y(n2979) );
  NOR4xp25_ASAP7_75t_R U3455 ( .A(n3229), .B(n3128), .C(n3483), .D(n3225), .Y(
        n2980) );
  AND2x2_ASAP7_75t_R U3456 ( .A(n3686), .B(n3755), .Y(n2981) );
  XOR2xp5_ASAP7_75t_R U3457 ( .A(\x\[28\] ), .B(n3541), .Y(n2982) );
  INVxp67_ASAP7_75t_R U3458 ( .A(n3535), .Y(\rexp\[6\] ) );
  INVxp67_ASAP7_75t_R U3459 ( .A(n3537), .Y(\rexp\[7\] ) );
  INVxp67_ASAP7_75t_R U3460 ( .A(n3532), .Y(\rexp\[4\] ) );
  AND2x2_ASAP7_75t_R U3461 ( .A(n3532), .B(n3552), .Y(n2983) );
  AND2x2_ASAP7_75t_R U3462 ( .A(n3528), .B(n3551), .Y(n2984) );
  AND2x2_ASAP7_75t_R U3463 ( .A(n3525), .B(n3555), .Y(n2985) );
  AND2x2_ASAP7_75t_R U3464 ( .A(\s5_interp_lo_hi_hi\[0\] ), .B(
        \s5_interp_lo_hi_lo\[6\] ), .Y(n2986) );
  MAJx2_ASAP7_75t_R U3465 ( .A(\s5_interp_lo_hi_hi\[1\] ), .B(
        \s5_interp_lo_hi_lo\[7\] ), .C(n2986), .Y(n2987) );
  MAJx2_ASAP7_75t_R U3466 ( .A(\s5_interp_lo_lo_hi\[3\] ), .B(
        \s5_interp_lo_lo_lo\[9\] ), .C(n3471), .Y(n2988) );
  AND2x2_ASAP7_75t_R U3467 ( .A(\s5_interp_lo_lo_hi\[0\] ), .B(
        \s5_interp_lo_lo_lo\[6\] ), .Y(n2989) );
  AND2x2_ASAP7_75t_R U3468 ( .A(\s5_interp_hi_hi_hi\[0\] ), .B(
        \s5_interp_hi_hi_lo\[6\] ), .Y(n2990) );
  AND2x2_ASAP7_75t_R U3469 ( .A(\s5_interp_hi_lo_hi\[0\] ), .B(
        \s5_interp_hi_lo_lo\[6\] ), .Y(n2991) );
  MAJx2_ASAP7_75t_R U3470 ( .A(\s5_interp_hi_hi_hi\[1\] ), .B(
        \s5_interp_hi_hi_lo\[7\] ), .C(n2990), .Y(n2992) );
  MAJx2_ASAP7_75t_R U3471 ( .A(\s5_interp_hi_lo_hi\[1\] ), .B(
        \s5_interp_hi_lo_lo\[7\] ), .C(n2991), .Y(n2993) );
  XOR2xp5_ASAP7_75t_R U3472 ( .A(n3553), .B(n2983), .Y(n2994) );
  XOR2xp5_ASAP7_75t_R U3473 ( .A(n3532), .B(n3552), .Y(n2995) );
  AND2x2_ASAP7_75t_R U3474 ( .A(n3544), .B(\sub_82/carry\[5\] ), .Y(n2996) );
  AND2x2_ASAP7_75t_R U3475 ( .A(n3545), .B(n2996), .Y(n2997) );
  AND2x2_ASAP7_75t_R U3476 ( .A(n3546), .B(n2997), .Y(n2998) );
  AND2x2_ASAP7_75t_R U3477 ( .A(n3525), .B(n2998), .Y(n2999) );
  XOR2xp5_ASAP7_75t_R U3478 ( .A(n3525), .B(n2999), .Y(n3000) );
  AND2x2_ASAP7_75t_R U3479 ( .A(\s2_f_u\[21\] ), .B(\s2_f_u\[22\] ), .Y(n3001)
         );
  AND2x2_ASAP7_75t_R U3480 ( .A(\s2_f_u\[22\] ), .B(n3087), .Y(n3002) );
  AND2x2_ASAP7_75t_R U3481 ( .A(\s2_f_u\[21\] ), .B(n3094), .Y(n3003) );
  AND2x2_ASAP7_75t_R U3482 ( .A(n3003), .B(n2975), .Y(n3004) );
  NOR4xp25_ASAP7_75t_R U3483 ( .A(n3516), .B(n3500), .C(n3493), .D(n3703), .Y(
        n3005) );
  XOR2xp5_ASAP7_75t_R U3484 ( .A(n3530), .B(n2984), .Y(n3006) );
  AND2x2_ASAP7_75t_R U3485 ( .A(n3001), .B(n2975), .Y(n3007) );
  HB1xp67_ASAP7_75t_R U3486 ( .A(n2969), .Y(n3033) );
  NOR2xp33_ASAP7_75t_R U3487 ( .A(\s2_f_u\[21\] ), .B(\s2_f_u\[22\] ), .Y(
        n3008) );
  AND2x2_ASAP7_75t_R U3488 ( .A(n2974), .B(n3008), .Y(n3009) );
  XOR2xp5_ASAP7_75t_R U3489 ( .A(n3526), .B(\x\[23\] ), .Y(n3010) );
  AND2x2_ASAP7_75t_R U3490 ( .A(n3002), .B(n2974), .Y(n3011) );
  AND2x2_ASAP7_75t_R U3491 ( .A(n3003), .B(n2973), .Y(n3012) );
  HB1xp67_ASAP7_75t_R U3492 ( .A(n2970), .Y(n3034) );
  AND2x2_ASAP7_75t_R U3493 ( .A(n3474), .B(n3355), .Y(n3013) );
  AND2x2_ASAP7_75t_R U3494 ( .A(n2972), .B(n3008), .Y(n3014) );
  XOR2xp5_ASAP7_75t_R U3495 ( .A(n3544), .B(\sub_82/carry\[5\] ), .Y(n3015) );
  AND4x1_ASAP7_75t_R U3496 ( .A(n3684), .B(n2980), .C(n3697), .D(n3698), .Y(
        n3016) );
  AND2x2_ASAP7_75t_R U3497 ( .A(n2981), .B(n3199), .Y(n3017) );
  AND2x2_ASAP7_75t_R U3498 ( .A(n3770), .B(n3711), .Y(n3018) );
  XOR2xp5_ASAP7_75t_R U3499 ( .A(n3528), .B(n3551), .Y(n3019) );
  OR3x1_ASAP7_75t_R U3500 ( .A(n3496), .B(n3494), .C(n3492), .Y(n3020) );
  AND2x2_ASAP7_75t_R U3501 ( .A(n3250), .B(n3162), .Y(n3021) );
  NOR4xp25_ASAP7_75t_R U3502 ( .A(n3502), .B(n3184), .C(n3183), .D(n3219), .Y(
        n3022) );
  AND2x2_ASAP7_75t_R U3503 ( .A(n3223), .B(n3694), .Y(n3023) );
  AND3x1_ASAP7_75t_R U3504 ( .A(n3681), .B(n3677), .C(n3673), .Y(n3024) );
  AND3x1_ASAP7_75t_R U3505 ( .A(n2526), .B(n3715), .C(n3223), .Y(n3025) );
  AND3x1_ASAP7_75t_R U3506 ( .A(n3668), .B(n3755), .C(n3700), .Y(n3026) );
  NAND2xp5_ASAP7_75t_R U3507 ( .A(\x\[23\] ), .B(n3526), .Y(n3636) );
  INVxp33_ASAP7_75t_R U3508 ( .A(n3636), .Y(n3602) );
  TIELOx1_ASAP7_75t_R U3509 ( .L(n4888) );
  INVx1_ASAP7_75t_R U3510 ( .A(\interp_hi_hi_hi\[13\] ), .Y(n4107) );
  XNOR2x2_ASAP7_75t_R U3511 ( .A(\x\[24\] ), .B(\x\[23\] ), .Y(n3526) );
  INVxp33_ASAP7_75t_R U3512 ( .A(n3526), .Y(n3523) );
  INVxp67_ASAP7_75t_R U3513 ( .A(\interp_hi_hi_lo\[13\] ), .Y(n4120) );
  NOR2x2_ASAP7_75t_R U3514 ( .A(n3523), .B(\x\[23\] ), .Y(n3643) );
  INVx1_ASAP7_75t_R U3515 ( .A(n2866), .Y(n3632) );
  INVx1_ASAP7_75t_R U3516 ( .A(\x\[21\] ), .Y(n3504) );
  OAI221xp5_ASAP7_75t_R U3517 ( .A1(n3631), .A2(n3632), .B1(\x\[23\] ), .B2(
        n3504), .C(n3522), .Y(n3038) );
  NAND2xp5_ASAP7_75t_R U3518 ( .A(n3034), .B(n3038), .Y(n4202) );
  OAI21xp5_ASAP7_75t_R U3519 ( .A1(n3526), .A2(n3632), .B(n3631), .Y(n3041) );
  NAND2xp5_ASAP7_75t_R U3520 ( .A(n3034), .B(n3041), .Y(n4203) );
  NAND2xp5_ASAP7_75t_R U3521 ( .A(n3628), .B(\x\[17\] ), .Y(n3035) );
  NAND3xp33_ASAP7_75t_R U3522 ( .A(n3625), .B(n3036), .C(n3035), .Y(n3044) );
  INVx1_ASAP7_75t_R U3523 ( .A(n3647), .Y(n3037) );
  NAND2xp5_ASAP7_75t_R U3524 ( .A(n2864), .B(n3643), .Y(n3040) );
  NAND2xp5_ASAP7_75t_R U3525 ( .A(n3628), .B(\x\[18\] ), .Y(n3039) );
  NAND3xp33_ASAP7_75t_R U3526 ( .A(n3627), .B(n3040), .C(n3039), .Y(n3047) );
  INVx1_ASAP7_75t_R U3527 ( .A(\x\[23\] ), .Y(N135) );
  NAND2xp5_ASAP7_75t_R U3528 ( .A(\x\[15\] ), .B(n3643), .Y(n3043) );
  NAND2xp5_ASAP7_75t_R U3529 ( .A(\x\[13\] ), .B(n3628), .Y(n3042) );
  NAND3xp33_ASAP7_75t_R U3530 ( .A(n3618), .B(n3043), .C(n3042), .Y(n3050) );
  AOI222xp33_ASAP7_75t_R U3531 ( .A1(n3034), .A2(n3050), .B1(N212), .B2(n2960), 
        .C1(n3033), .C2(n3044), .Y(n4194) );
  NAND2xp5_ASAP7_75t_R U3532 ( .A(\x\[16\] ), .B(n3643), .Y(n3046) );
  NAND2xp5_ASAP7_75t_R U3533 ( .A(\x\[14\] ), .B(n3628), .Y(n3045) );
  NAND3xp33_ASAP7_75t_R U3534 ( .A(n3620), .B(n3046), .C(n3045), .Y(n3053) );
  AOI222xp33_ASAP7_75t_R U3535 ( .A1(n3034), .A2(n2870), .B1(N213), .B2(n2960), 
        .C1(n3033), .C2(n2750), .Y(n4195) );
  NAND2xp5_ASAP7_75t_R U3536 ( .A(\x\[11\] ), .B(n3643), .Y(n3049) );
  NAND2xp5_ASAP7_75t_R U3537 ( .A(n3628), .B(\x\[9\] ), .Y(n3048) );
  NAND3xp33_ASAP7_75t_R U3538 ( .A(n3608), .B(n3049), .C(n3048), .Y(n3056) );
  AOI222xp33_ASAP7_75t_R U3539 ( .A1(n3034), .A2(n3056), .B1(N208), .B2(n2960), 
        .C1(n3033), .C2(n3050), .Y(n4189) );
  NAND2xp5_ASAP7_75t_R U3540 ( .A(\x\[12\] ), .B(n3643), .Y(n3052) );
  NAND2xp5_ASAP7_75t_R U3541 ( .A(\x\[10\] ), .B(n3628), .Y(n3051) );
  NAND3xp33_ASAP7_75t_R U3542 ( .A(n3610), .B(n3052), .C(n3051), .Y(n3059) );
  AOI222xp33_ASAP7_75t_R U3543 ( .A1(n3034), .A2(n2882), .B1(N209), .B2(n2960), 
        .C1(n3033), .C2(n2870), .Y(n4190) );
  NAND2xp5_ASAP7_75t_R U3544 ( .A(\x\[5\] ), .B(n3628), .Y(n3054) );
  NAND3xp33_ASAP7_75t_R U3545 ( .A(n3644), .B(n3055), .C(n3054), .Y(n3062) );
  AOI222xp33_ASAP7_75t_R U3546 ( .A1(n3034), .A2(n2703), .B1(N204), .B2(n2960), 
        .C1(n3033), .C2(n3056), .Y(n4185) );
  NAND2xp5_ASAP7_75t_R U3547 ( .A(n3643), .B(\x\[8\] ), .Y(n3058) );
  NAND2xp5_ASAP7_75t_R U3548 ( .A(n3628), .B(\x\[6\] ), .Y(n3057) );
  NAND3xp33_ASAP7_75t_R U3549 ( .A(n3646), .B(n3058), .C(n3057), .Y(n3065) );
  AOI222xp33_ASAP7_75t_R U3550 ( .A1(n3034), .A2(n2883), .B1(N205), .B2(n2960), 
        .C1(n3033), .C2(n2882), .Y(n4186) );
  NAND2xp5_ASAP7_75t_R U3551 ( .A(n3643), .B(n2874), .Y(n3061) );
  NAND2xp5_ASAP7_75t_R U3552 ( .A(n3628), .B(n2879), .Y(n3060) );
  NAND3xp33_ASAP7_75t_R U3553 ( .A(n3645), .B(n3061), .C(n3060), .Y(n3067) );
  AOI222xp33_ASAP7_75t_R U3554 ( .A1(n3034), .A2(n3067), .B1(N200), .B2(n2960), 
        .C1(n3033), .C2(n3062), .Y(n4211) );
  NAND2xp5_ASAP7_75t_R U3555 ( .A(\x\[4\] ), .B(n3643), .Y(n3064) );
  NAND2xp5_ASAP7_75t_R U3556 ( .A(n3628), .B(n2875), .Y(n3063) );
  NAND3xp33_ASAP7_75t_R U3557 ( .A(n3648), .B(n3064), .C(n3063), .Y(n3069) );
  AOI222xp33_ASAP7_75t_R U3558 ( .A1(n3034), .A2(n2880), .B1(N201), .B2(n2960), 
        .C1(n3033), .C2(n2883), .Y(n4212) );
  NAND2xp5_ASAP7_75t_R U3559 ( .A(n2881), .B(n3602), .Y(n3066) );
  INVx1_ASAP7_75t_R U3560 ( .A(n3066), .Y(n3070) );
  AOI222xp33_ASAP7_75t_R U3561 ( .A1(n3034), .A2(n3070), .B1(N196), .B2(n2960), 
        .C1(n3033), .C2(n3067), .Y(n4207) );
  INVx1_ASAP7_75t_R U3562 ( .A(n2879), .Y(n3513) );
  NAND2xp5_ASAP7_75t_R U3563 ( .A(n2881), .B(n3643), .Y(n3068) );
  OAI21xp5_ASAP7_75t_R U3564 ( .A1(n3636), .A2(n3513), .B(n3068), .Y(n3071) );
  AOI222xp33_ASAP7_75t_R U3565 ( .A1(n3034), .A2(n3071), .B1(N197), .B2(n2960), 
        .C1(n3033), .C2(n2880), .Y(n4208) );
  INVx1_ASAP7_75t_R U3566 ( .A(\p7\[27\] ), .Y(n3993) );
  INVx1_ASAP7_75t_R U3567 ( .A(\p7\[26\] ), .Y(n3994) );
  INVx1_ASAP7_75t_R U3568 ( .A(\p7\[25\] ), .Y(n3995) );
  INVx1_ASAP7_75t_R U3569 ( .A(\p7\[24\] ), .Y(n3996) );
  INVx1_ASAP7_75t_R U3570 ( .A(\p7\[23\] ), .Y(n3997) );
  INVx1_ASAP7_75t_R U3571 ( .A(\p7\[22\] ), .Y(n3998) );
  INVx1_ASAP7_75t_R U3572 ( .A(\p7\[21\] ), .Y(n3999) );
  INVx1_ASAP7_75t_R U3573 ( .A(\p7\[20\] ), .Y(n4000) );
  INVx1_ASAP7_75t_R U3574 ( .A(\p7\[19\] ), .Y(n4001) );
  INVx1_ASAP7_75t_R U3575 ( .A(\p7\[18\] ), .Y(n4002) );
  INVx1_ASAP7_75t_R U3576 ( .A(\p7\[17\] ), .Y(n4003) );
  INVx1_ASAP7_75t_R U3577 ( .A(\p7\[16\] ), .Y(n4004) );
  INVx1_ASAP7_75t_R U3578 ( .A(\p7\[15\] ), .Y(n4005) );
  INVx1_ASAP7_75t_R U3579 ( .A(\p7\[14\] ), .Y(n4006) );
  INVx1_ASAP7_75t_R U3580 ( .A(\p7\[13\] ), .Y(n4007) );
  INVx1_ASAP7_75t_R U3581 ( .A(\p7\[12\] ), .Y(n4008) );
  INVx1_ASAP7_75t_R U3582 ( .A(\p7\[11\] ), .Y(n4009) );
  INVx1_ASAP7_75t_R U3583 ( .A(\p7\[10\] ), .Y(n4010) );
  INVx1_ASAP7_75t_R U3584 ( .A(\p7\[9\] ), .Y(n4011) );
  INVx1_ASAP7_75t_R U3585 ( .A(\p7\[8\] ), .Y(n4012) );
  INVx1_ASAP7_75t_R U3586 ( .A(\p7\[7\] ), .Y(n4013) );
  INVx1_ASAP7_75t_R U3587 ( .A(\p7\[6\] ), .Y(n4014) );
  INVx1_ASAP7_75t_R U3588 ( .A(\p7\[5\] ), .Y(n4015) );
  INVx1_ASAP7_75t_R U3589 ( .A(\p7\[4\] ), .Y(n4016) );
  INVx1_ASAP7_75t_R U3590 ( .A(\p7\[3\] ), .Y(n4017) );
  INVx1_ASAP7_75t_R U3591 ( .A(\p7\[2\] ), .Y(n4018) );
  INVx1_ASAP7_75t_R U3592 ( .A(\p7\[1\] ), .Y(n4019) );
  INVx1_ASAP7_75t_R U3593 ( .A(\s1_mag_u\[28\] ), .Y(n4589) );
  INVx1_ASAP7_75t_R U3594 ( .A(\p6\[27\] ), .Y(n3966) );
  INVx1_ASAP7_75t_R U3595 ( .A(\p6\[26\] ), .Y(n3967) );
  INVx1_ASAP7_75t_R U3596 ( .A(\p6\[25\] ), .Y(n3968) );
  INVx1_ASAP7_75t_R U3597 ( .A(\p6\[24\] ), .Y(n3969) );
  INVx1_ASAP7_75t_R U3598 ( .A(\p6\[23\] ), .Y(n3970) );
  INVx1_ASAP7_75t_R U3599 ( .A(\p6\[22\] ), .Y(n3971) );
  INVx1_ASAP7_75t_R U3600 ( .A(\p6\[21\] ), .Y(n3972) );
  INVx1_ASAP7_75t_R U3601 ( .A(\p6\[20\] ), .Y(n3973) );
  INVx1_ASAP7_75t_R U3602 ( .A(\p6\[19\] ), .Y(n3974) );
  INVx1_ASAP7_75t_R U3603 ( .A(\p6\[18\] ), .Y(n3975) );
  INVx1_ASAP7_75t_R U3604 ( .A(\p6\[17\] ), .Y(n3976) );
  INVx1_ASAP7_75t_R U3605 ( .A(\p6\[16\] ), .Y(n3977) );
  INVx1_ASAP7_75t_R U3606 ( .A(\p6\[15\] ), .Y(n3978) );
  INVx1_ASAP7_75t_R U3607 ( .A(\p6\[14\] ), .Y(n3979) );
  INVx1_ASAP7_75t_R U3608 ( .A(\p6\[13\] ), .Y(n3980) );
  INVx1_ASAP7_75t_R U3609 ( .A(\p6\[12\] ), .Y(n3981) );
  INVx1_ASAP7_75t_R U3610 ( .A(\p6\[11\] ), .Y(n3982) );
  INVx1_ASAP7_75t_R U3611 ( .A(\p6\[10\] ), .Y(n3983) );
  INVx1_ASAP7_75t_R U3612 ( .A(\p6\[9\] ), .Y(n3984) );
  INVx1_ASAP7_75t_R U3613 ( .A(\p6\[8\] ), .Y(n3985) );
  INVx1_ASAP7_75t_R U3614 ( .A(\p6\[7\] ), .Y(n3986) );
  INVx1_ASAP7_75t_R U3615 ( .A(\p6\[6\] ), .Y(n3987) );
  INVx1_ASAP7_75t_R U3616 ( .A(\p6\[5\] ), .Y(n3988) );
  INVx1_ASAP7_75t_R U3617 ( .A(\p6\[4\] ), .Y(n3989) );
  INVx1_ASAP7_75t_R U3618 ( .A(\p6\[3\] ), .Y(n3990) );
  INVx1_ASAP7_75t_R U3619 ( .A(\p6\[2\] ), .Y(n3991) );
  INVx1_ASAP7_75t_R U3620 ( .A(\p6\[1\] ), .Y(n3992) );
  INVx1_ASAP7_75t_R U3621 ( .A(\s1_mag_u\[24\] ), .Y(n4590) );
  INVx1_ASAP7_75t_R U3622 ( .A(\prod_hi_hi\[31\] ), .Y(n4309) );
  INVx1_ASAP7_75t_R U3623 ( .A(\prod_hi_hi\[30\] ), .Y(n4310) );
  INVx1_ASAP7_75t_R U3624 ( .A(\prod_hi_hi\[29\] ), .Y(n4311) );
  INVx1_ASAP7_75t_R U3625 ( .A(\prod_hi_hi\[28\] ), .Y(n4312) );
  INVx1_ASAP7_75t_R U3626 ( .A(\prod_hi_hi\[27\] ), .Y(n4313) );
  INVx1_ASAP7_75t_R U3627 ( .A(\prod_hi_hi\[26\] ), .Y(n4314) );
  INVx1_ASAP7_75t_R U3628 ( .A(\prod_hi_hi\[25\] ), .Y(n4315) );
  INVx1_ASAP7_75t_R U3629 ( .A(\prod_hi_hi\[24\] ), .Y(n4316) );
  INVx1_ASAP7_75t_R U3630 ( .A(\prod_hi_hi\[23\] ), .Y(n4317) );
  INVx1_ASAP7_75t_R U3631 ( .A(\prod_hi_hi\[22\] ), .Y(n4318) );
  INVx1_ASAP7_75t_R U3632 ( .A(\prod_hi_hi\[21\] ), .Y(n4319) );
  INVx1_ASAP7_75t_R U3633 ( .A(\prod_hi_hi\[20\] ), .Y(n4320) );
  INVx1_ASAP7_75t_R U3634 ( .A(\prod_hi_hi\[19\] ), .Y(n4321) );
  INVx1_ASAP7_75t_R U3635 ( .A(\prod_hi_hi\[18\] ), .Y(n4322) );
  INVx1_ASAP7_75t_R U3636 ( .A(\prod_hi_hi\[17\] ), .Y(n4323) );
  INVx1_ASAP7_75t_R U3637 ( .A(\prod_hi_hi\[16\] ), .Y(n4324) );
  INVx1_ASAP7_75t_R U3638 ( .A(\prod_hi_hi\[15\] ), .Y(n4325) );
  INVx1_ASAP7_75t_R U3639 ( .A(\prod_hi_hi\[14\] ), .Y(n4326) );
  INVx1_ASAP7_75t_R U3640 ( .A(\prod_hi_hi\[13\] ), .Y(n4327) );
  INVx1_ASAP7_75t_R U3641 ( .A(\prod_hi_hi\[12\] ), .Y(n4328) );
  INVx1_ASAP7_75t_R U3642 ( .A(\prod_hi_hi\[11\] ), .Y(n4329) );
  INVx1_ASAP7_75t_R U3643 ( .A(\prod_hi_hi\[10\] ), .Y(n4330) );
  INVx1_ASAP7_75t_R U3644 ( .A(\prod_hi_hi\[9\] ), .Y(n4331) );
  INVx1_ASAP7_75t_R U3645 ( .A(\prod_hi_hi\[8\] ), .Y(n4332) );
  INVx1_ASAP7_75t_R U3646 ( .A(\prod_hi_hi\[7\] ), .Y(n4333) );
  INVx1_ASAP7_75t_R U3647 ( .A(\prod_hi_hi\[6\] ), .Y(n4334) );
  INVx1_ASAP7_75t_R U3648 ( .A(\prod_hi_hi\[5\] ), .Y(n4335) );
  INVx1_ASAP7_75t_R U3649 ( .A(\prod_hi_hi\[4\] ), .Y(n4336) );
  INVx1_ASAP7_75t_R U3650 ( .A(\p5\[27\] ), .Y(n3939) );
  INVx1_ASAP7_75t_R U3651 ( .A(\p5\[26\] ), .Y(n3940) );
  INVx1_ASAP7_75t_R U3652 ( .A(\p5\[25\] ), .Y(n3941) );
  INVx1_ASAP7_75t_R U3653 ( .A(\p5\[24\] ), .Y(n3942) );
  INVx1_ASAP7_75t_R U3654 ( .A(\p5\[23\] ), .Y(n3943) );
  INVx1_ASAP7_75t_R U3655 ( .A(\p5\[22\] ), .Y(n3944) );
  INVx1_ASAP7_75t_R U3656 ( .A(\p5\[21\] ), .Y(n3945) );
  INVx1_ASAP7_75t_R U3657 ( .A(\p5\[20\] ), .Y(n3946) );
  INVx1_ASAP7_75t_R U3658 ( .A(\p5\[19\] ), .Y(n3947) );
  INVx1_ASAP7_75t_R U3659 ( .A(\p5\[18\] ), .Y(n3948) );
  INVx1_ASAP7_75t_R U3660 ( .A(\p5\[17\] ), .Y(n3949) );
  INVx1_ASAP7_75t_R U3661 ( .A(\p5\[16\] ), .Y(n3950) );
  INVx1_ASAP7_75t_R U3662 ( .A(\p5\[15\] ), .Y(n3951) );
  INVx1_ASAP7_75t_R U3663 ( .A(\p5\[14\] ), .Y(n3952) );
  INVx1_ASAP7_75t_R U3664 ( .A(\p5\[13\] ), .Y(n3953) );
  INVx1_ASAP7_75t_R U3665 ( .A(\p5\[12\] ), .Y(n3954) );
  INVx1_ASAP7_75t_R U3666 ( .A(\p5\[11\] ), .Y(n3955) );
  INVx1_ASAP7_75t_R U3667 ( .A(\p5\[10\] ), .Y(n3956) );
  INVx1_ASAP7_75t_R U3668 ( .A(\p5\[9\] ), .Y(n3957) );
  INVx1_ASAP7_75t_R U3669 ( .A(\p5\[8\] ), .Y(n3958) );
  INVx1_ASAP7_75t_R U3670 ( .A(\p5\[7\] ), .Y(n3959) );
  INVx1_ASAP7_75t_R U3671 ( .A(\p5\[6\] ), .Y(n3960) );
  INVx1_ASAP7_75t_R U3672 ( .A(\p5\[5\] ), .Y(n3961) );
  INVx1_ASAP7_75t_R U3673 ( .A(\p5\[4\] ), .Y(n3962) );
  INVx1_ASAP7_75t_R U3674 ( .A(\p5\[3\] ), .Y(n3963) );
  INVx1_ASAP7_75t_R U3675 ( .A(\p5\[2\] ), .Y(n3964) );
  INVx1_ASAP7_75t_R U3676 ( .A(\p5\[1\] ), .Y(n3965) );
  INVx1_ASAP7_75t_R U3677 ( .A(\s1_mag_u\[20\] ), .Y(n4591) );
  INVx1_ASAP7_75t_R U3678 ( .A(\p4\[27\] ), .Y(n3912) );
  INVx1_ASAP7_75t_R U3679 ( .A(\p4\[26\] ), .Y(n3913) );
  INVx1_ASAP7_75t_R U3680 ( .A(\p4\[25\] ), .Y(n3914) );
  INVx1_ASAP7_75t_R U3681 ( .A(\p4\[24\] ), .Y(n3915) );
  INVx1_ASAP7_75t_R U3682 ( .A(\p4\[23\] ), .Y(n3916) );
  INVx1_ASAP7_75t_R U3683 ( .A(\p4\[22\] ), .Y(n3917) );
  INVx1_ASAP7_75t_R U3684 ( .A(\p4\[21\] ), .Y(n3918) );
  INVx1_ASAP7_75t_R U3685 ( .A(\p4\[20\] ), .Y(n3919) );
  INVx1_ASAP7_75t_R U3686 ( .A(\p4\[19\] ), .Y(n3920) );
  INVx1_ASAP7_75t_R U3687 ( .A(\p4\[18\] ), .Y(n3921) );
  INVx1_ASAP7_75t_R U3688 ( .A(\p4\[17\] ), .Y(n3922) );
  INVx1_ASAP7_75t_R U3689 ( .A(\p4\[16\] ), .Y(n3923) );
  INVx1_ASAP7_75t_R U3690 ( .A(\p4\[15\] ), .Y(n3924) );
  INVx1_ASAP7_75t_R U3691 ( .A(\p4\[14\] ), .Y(n3925) );
  INVx1_ASAP7_75t_R U3692 ( .A(\p4\[13\] ), .Y(n3926) );
  INVx1_ASAP7_75t_R U3693 ( .A(\p4\[12\] ), .Y(n3927) );
  INVx1_ASAP7_75t_R U3694 ( .A(\p4\[11\] ), .Y(n3928) );
  INVx1_ASAP7_75t_R U3695 ( .A(\p4\[10\] ), .Y(n3929) );
  INVx1_ASAP7_75t_R U3696 ( .A(\p4\[9\] ), .Y(n3930) );
  INVx1_ASAP7_75t_R U3697 ( .A(\p4\[8\] ), .Y(n3931) );
  INVx1_ASAP7_75t_R U3698 ( .A(\p4\[7\] ), .Y(n3932) );
  INVx1_ASAP7_75t_R U3699 ( .A(\p4\[6\] ), .Y(n3933) );
  INVx1_ASAP7_75t_R U3700 ( .A(\p4\[5\] ), .Y(n3934) );
  INVx1_ASAP7_75t_R U3701 ( .A(\p4\[4\] ), .Y(n3935) );
  INVx1_ASAP7_75t_R U3702 ( .A(\p4\[3\] ), .Y(n3936) );
  INVx1_ASAP7_75t_R U3703 ( .A(\p4\[2\] ), .Y(n3937) );
  INVx1_ASAP7_75t_R U3704 ( .A(\p4\[1\] ), .Y(n3938) );
  INVx1_ASAP7_75t_R U3705 ( .A(\s1_mag_u\[16\] ), .Y(n4592) );
  INVx1_ASAP7_75t_R U3706 ( .A(\prod_hi_lo\[31\] ), .Y(n4278) );
  INVx1_ASAP7_75t_R U3707 ( .A(\prod_hi_lo\[30\] ), .Y(n4279) );
  INVx1_ASAP7_75t_R U3708 ( .A(\prod_hi_lo\[29\] ), .Y(n4280) );
  INVx1_ASAP7_75t_R U3709 ( .A(\prod_hi_lo\[28\] ), .Y(n4281) );
  INVx1_ASAP7_75t_R U3710 ( .A(\prod_hi_lo\[27\] ), .Y(n4282) );
  INVx1_ASAP7_75t_R U3711 ( .A(\prod_hi_lo\[26\] ), .Y(n4283) );
  INVx1_ASAP7_75t_R U3712 ( .A(\prod_hi_lo\[25\] ), .Y(n4284) );
  INVx1_ASAP7_75t_R U3713 ( .A(\prod_hi_lo\[24\] ), .Y(n4285) );
  INVx1_ASAP7_75t_R U3714 ( .A(\prod_hi_lo\[23\] ), .Y(n4286) );
  INVx1_ASAP7_75t_R U3715 ( .A(\prod_hi_lo\[22\] ), .Y(n4287) );
  INVx1_ASAP7_75t_R U3716 ( .A(\prod_hi_lo\[21\] ), .Y(n4288) );
  INVx1_ASAP7_75t_R U3717 ( .A(\prod_hi_lo\[20\] ), .Y(n4289) );
  INVx1_ASAP7_75t_R U3718 ( .A(\prod_hi_lo\[19\] ), .Y(n4290) );
  INVx1_ASAP7_75t_R U3719 ( .A(\prod_hi_lo\[18\] ), .Y(n4291) );
  INVx1_ASAP7_75t_R U3720 ( .A(\prod_hi_lo\[17\] ), .Y(n4292) );
  INVx1_ASAP7_75t_R U3721 ( .A(\prod_hi_lo\[16\] ), .Y(n4293) );
  INVx1_ASAP7_75t_R U3722 ( .A(\prod_hi_lo\[15\] ), .Y(n4294) );
  INVx1_ASAP7_75t_R U3723 ( .A(\prod_hi_lo\[14\] ), .Y(n4295) );
  INVx1_ASAP7_75t_R U3724 ( .A(\prod_hi_lo\[13\] ), .Y(n4296) );
  INVx1_ASAP7_75t_R U3725 ( .A(\prod_hi_lo\[12\] ), .Y(n4297) );
  INVx1_ASAP7_75t_R U3726 ( .A(\prod_hi_lo\[11\] ), .Y(n4298) );
  INVx1_ASAP7_75t_R U3727 ( .A(\prod_hi_lo\[10\] ), .Y(n4299) );
  INVx1_ASAP7_75t_R U3728 ( .A(\prod_hi_lo\[9\] ), .Y(n4300) );
  INVx1_ASAP7_75t_R U3729 ( .A(\prod_hi_lo\[8\] ), .Y(n4301) );
  INVx1_ASAP7_75t_R U3730 ( .A(\prod_hi_lo\[7\] ), .Y(n4302) );
  INVx1_ASAP7_75t_R U3731 ( .A(\prod_hi_lo\[6\] ), .Y(n4303) );
  INVx1_ASAP7_75t_R U3732 ( .A(\prod_hi_lo\[5\] ), .Y(n4304) );
  INVx1_ASAP7_75t_R U3733 ( .A(\prod_hi_lo\[4\] ), .Y(n4305) );
  INVx1_ASAP7_75t_R U3734 ( .A(\prod_hi\[39\] ), .Y(n4383) );
  INVx1_ASAP7_75t_R U3735 ( .A(\prod_hi\[38\] ), .Y(n4384) );
  INVx1_ASAP7_75t_R U3736 ( .A(\prod_hi\[37\] ), .Y(n4385) );
  INVx1_ASAP7_75t_R U3737 ( .A(\prod_hi\[36\] ), .Y(n4386) );
  INVx1_ASAP7_75t_R U3738 ( .A(\prod_hi\[35\] ), .Y(n4387) );
  INVx1_ASAP7_75t_R U3739 ( .A(\prod_hi\[34\] ), .Y(n4388) );
  INVx1_ASAP7_75t_R U3740 ( .A(\prod_hi\[33\] ), .Y(n4389) );
  INVx1_ASAP7_75t_R U3741 ( .A(\prod_hi\[32\] ), .Y(n4390) );
  INVx1_ASAP7_75t_R U3742 ( .A(\prod_hi\[31\] ), .Y(n4391) );
  INVx1_ASAP7_75t_R U3743 ( .A(\prod_hi\[30\] ), .Y(n4392) );
  INVx1_ASAP7_75t_R U3744 ( .A(\prod_hi\[29\] ), .Y(n4393) );
  INVx1_ASAP7_75t_R U3745 ( .A(\prod_hi\[28\] ), .Y(n4394) );
  INVx1_ASAP7_75t_R U3746 ( .A(\prod_hi\[27\] ), .Y(n4395) );
  INVx1_ASAP7_75t_R U3747 ( .A(\prod_hi\[26\] ), .Y(n4396) );
  INVx1_ASAP7_75t_R U3748 ( .A(\prod_hi\[25\] ), .Y(n4397) );
  INVx1_ASAP7_75t_R U3749 ( .A(\prod_hi\[24\] ), .Y(n4398) );
  INVx1_ASAP7_75t_R U3750 ( .A(\prod_hi\[23\] ), .Y(n4399) );
  INVx1_ASAP7_75t_R U3751 ( .A(\prod_hi\[22\] ), .Y(n4400) );
  INVx1_ASAP7_75t_R U3752 ( .A(\prod_hi\[21\] ), .Y(n4401) );
  INVx1_ASAP7_75t_R U3753 ( .A(\prod_hi\[20\] ), .Y(n4402) );
  INVx1_ASAP7_75t_R U3754 ( .A(\prod_hi\[19\] ), .Y(n4403) );
  INVx1_ASAP7_75t_R U3755 ( .A(\prod_hi\[18\] ), .Y(n4404) );
  INVx1_ASAP7_75t_R U3756 ( .A(\prod_hi\[17\] ), .Y(n4405) );
  INVx1_ASAP7_75t_R U3757 ( .A(\prod_hi\[16\] ), .Y(n4406) );
  INVx1_ASAP7_75t_R U3758 ( .A(\prod_hi\[15\] ), .Y(n4407) );
  INVx1_ASAP7_75t_R U3759 ( .A(\prod_hi\[14\] ), .Y(n4408) );
  INVx1_ASAP7_75t_R U3760 ( .A(\prod_hi\[13\] ), .Y(n4409) );
  INVx1_ASAP7_75t_R U3761 ( .A(\prod_hi\[12\] ), .Y(n4410) );
  INVx1_ASAP7_75t_R U3762 ( .A(\prod_hi\[11\] ), .Y(n4411) );
  INVx1_ASAP7_75t_R U3763 ( .A(\prod_hi\[10\] ), .Y(n4412) );
  INVx1_ASAP7_75t_R U3764 ( .A(\prod_hi\[9\] ), .Y(n4413) );
  INVx1_ASAP7_75t_R U3765 ( .A(\prod_hi\[8\] ), .Y(n4414) );
  INVx1_ASAP7_75t_R U3766 ( .A(\p3\[27\] ), .Y(n3885) );
  INVx1_ASAP7_75t_R U3767 ( .A(\p3\[26\] ), .Y(n3886) );
  INVx1_ASAP7_75t_R U3768 ( .A(\p3\[25\] ), .Y(n3887) );
  INVx1_ASAP7_75t_R U3769 ( .A(\p3\[24\] ), .Y(n3888) );
  INVx1_ASAP7_75t_R U3770 ( .A(\p3\[23\] ), .Y(n3889) );
  INVx1_ASAP7_75t_R U3771 ( .A(\p3\[22\] ), .Y(n3890) );
  INVx1_ASAP7_75t_R U3772 ( .A(\p3\[21\] ), .Y(n3891) );
  INVx1_ASAP7_75t_R U3773 ( .A(\p3\[20\] ), .Y(n3892) );
  INVx1_ASAP7_75t_R U3774 ( .A(\p3\[19\] ), .Y(n3893) );
  INVx1_ASAP7_75t_R U3775 ( .A(\p3\[18\] ), .Y(n3894) );
  INVx1_ASAP7_75t_R U3776 ( .A(\p3\[17\] ), .Y(n3895) );
  INVx1_ASAP7_75t_R U3777 ( .A(\p3\[16\] ), .Y(n3896) );
  INVx1_ASAP7_75t_R U3778 ( .A(\p3\[15\] ), .Y(n3897) );
  INVx1_ASAP7_75t_R U3779 ( .A(\p3\[14\] ), .Y(n3898) );
  INVx1_ASAP7_75t_R U3780 ( .A(\p3\[13\] ), .Y(n3899) );
  INVx1_ASAP7_75t_R U3781 ( .A(\p3\[12\] ), .Y(n3900) );
  INVx1_ASAP7_75t_R U3782 ( .A(\p3\[11\] ), .Y(n3901) );
  INVx1_ASAP7_75t_R U3783 ( .A(\p3\[10\] ), .Y(n3902) );
  INVx1_ASAP7_75t_R U3784 ( .A(\p3\[9\] ), .Y(n3903) );
  INVx1_ASAP7_75t_R U3785 ( .A(\p3\[8\] ), .Y(n3904) );
  INVx1_ASAP7_75t_R U3786 ( .A(\p3\[7\] ), .Y(n3905) );
  INVx1_ASAP7_75t_R U3787 ( .A(\p3\[6\] ), .Y(n3906) );
  INVx1_ASAP7_75t_R U3788 ( .A(\p3\[5\] ), .Y(n3907) );
  INVx1_ASAP7_75t_R U3789 ( .A(\p3\[4\] ), .Y(n3908) );
  INVx1_ASAP7_75t_R U3790 ( .A(\p3\[3\] ), .Y(n3909) );
  INVx1_ASAP7_75t_R U3791 ( .A(\p3\[2\] ), .Y(n3910) );
  INVx1_ASAP7_75t_R U3792 ( .A(\p3\[1\] ), .Y(n3911) );
  INVx1_ASAP7_75t_R U3793 ( .A(\s1_mag_u\[12\] ), .Y(n4593) );
  INVx1_ASAP7_75t_R U3794 ( .A(\p2\[27\] ), .Y(n3858) );
  INVx1_ASAP7_75t_R U3795 ( .A(\p2\[26\] ), .Y(n3859) );
  INVx1_ASAP7_75t_R U3796 ( .A(\p2\[25\] ), .Y(n3860) );
  INVx1_ASAP7_75t_R U3797 ( .A(\p2\[24\] ), .Y(n3861) );
  INVx1_ASAP7_75t_R U3798 ( .A(\p2\[23\] ), .Y(n3862) );
  INVx1_ASAP7_75t_R U3799 ( .A(\p2\[22\] ), .Y(n3863) );
  INVx1_ASAP7_75t_R U3800 ( .A(\p2\[21\] ), .Y(n3864) );
  INVx1_ASAP7_75t_R U3801 ( .A(\p2\[20\] ), .Y(n3865) );
  INVx1_ASAP7_75t_R U3802 ( .A(\p2\[19\] ), .Y(n3866) );
  INVx1_ASAP7_75t_R U3803 ( .A(\p2\[18\] ), .Y(n3867) );
  INVx1_ASAP7_75t_R U3804 ( .A(\p2\[17\] ), .Y(n3868) );
  INVx1_ASAP7_75t_R U3805 ( .A(\p2\[16\] ), .Y(n3869) );
  INVx1_ASAP7_75t_R U3806 ( .A(\p2\[15\] ), .Y(n3870) );
  INVx1_ASAP7_75t_R U3807 ( .A(\p2\[14\] ), .Y(n3871) );
  INVx1_ASAP7_75t_R U3808 ( .A(\p2\[13\] ), .Y(n3872) );
  INVx1_ASAP7_75t_R U3809 ( .A(\p2\[12\] ), .Y(n3873) );
  INVx1_ASAP7_75t_R U3810 ( .A(\p2\[11\] ), .Y(n3874) );
  INVx1_ASAP7_75t_R U3811 ( .A(\p2\[10\] ), .Y(n3875) );
  INVx1_ASAP7_75t_R U3812 ( .A(\p2\[9\] ), .Y(n3876) );
  INVx1_ASAP7_75t_R U3813 ( .A(\p2\[8\] ), .Y(n3877) );
  INVx1_ASAP7_75t_R U3814 ( .A(\p2\[7\] ), .Y(n3878) );
  INVx1_ASAP7_75t_R U3815 ( .A(\p2\[6\] ), .Y(n3879) );
  INVx1_ASAP7_75t_R U3816 ( .A(\p2\[5\] ), .Y(n3880) );
  INVx1_ASAP7_75t_R U3817 ( .A(\p2\[4\] ), .Y(n3881) );
  INVx1_ASAP7_75t_R U3818 ( .A(\p2\[3\] ), .Y(n3882) );
  INVx1_ASAP7_75t_R U3819 ( .A(\p2\[2\] ), .Y(n3883) );
  INVx1_ASAP7_75t_R U3820 ( .A(\p2\[1\] ), .Y(n3884) );
  INVx1_ASAP7_75t_R U3821 ( .A(\s1_mag_u\[8\] ), .Y(n4594) );
  INVx1_ASAP7_75t_R U3822 ( .A(\prod_lo_hi\[31\] ), .Y(n4247) );
  INVx1_ASAP7_75t_R U3823 ( .A(\prod_lo_hi\[30\] ), .Y(n4248) );
  INVx1_ASAP7_75t_R U3824 ( .A(\prod_lo_hi\[29\] ), .Y(n4249) );
  INVx1_ASAP7_75t_R U3825 ( .A(\prod_lo_hi\[28\] ), .Y(n4250) );
  INVx1_ASAP7_75t_R U3826 ( .A(\prod_lo_hi\[27\] ), .Y(n4251) );
  INVx1_ASAP7_75t_R U3827 ( .A(\prod_lo_hi\[26\] ), .Y(n4252) );
  INVx1_ASAP7_75t_R U3828 ( .A(\prod_lo_hi\[25\] ), .Y(n4253) );
  INVx1_ASAP7_75t_R U3829 ( .A(\prod_lo_hi\[24\] ), .Y(n4254) );
  INVx1_ASAP7_75t_R U3830 ( .A(\prod_lo_hi\[23\] ), .Y(n4255) );
  INVx1_ASAP7_75t_R U3831 ( .A(\prod_lo_hi\[22\] ), .Y(n4256) );
  INVx1_ASAP7_75t_R U3832 ( .A(\prod_lo_hi\[21\] ), .Y(n4257) );
  INVx1_ASAP7_75t_R U3833 ( .A(\prod_lo_hi\[20\] ), .Y(n4258) );
  INVx1_ASAP7_75t_R U3834 ( .A(\prod_lo_hi\[19\] ), .Y(n4259) );
  INVx1_ASAP7_75t_R U3835 ( .A(\prod_lo_hi\[18\] ), .Y(n4260) );
  INVx1_ASAP7_75t_R U3836 ( .A(\prod_lo_hi\[17\] ), .Y(n4261) );
  INVx1_ASAP7_75t_R U3837 ( .A(\prod_lo_hi\[16\] ), .Y(n4262) );
  INVx1_ASAP7_75t_R U3838 ( .A(\prod_lo_hi\[15\] ), .Y(n4263) );
  INVx1_ASAP7_75t_R U3839 ( .A(\prod_lo_hi\[14\] ), .Y(n4264) );
  INVx1_ASAP7_75t_R U3840 ( .A(\prod_lo_hi\[13\] ), .Y(n4265) );
  INVx1_ASAP7_75t_R U3841 ( .A(\prod_lo_hi\[12\] ), .Y(n4266) );
  INVx1_ASAP7_75t_R U3842 ( .A(\prod_lo_hi\[11\] ), .Y(n4267) );
  INVx1_ASAP7_75t_R U3843 ( .A(\prod_lo_hi\[10\] ), .Y(n4268) );
  INVx1_ASAP7_75t_R U3844 ( .A(\prod_lo_hi\[9\] ), .Y(n4269) );
  INVx1_ASAP7_75t_R U3845 ( .A(\prod_lo_hi\[8\] ), .Y(n4270) );
  INVx1_ASAP7_75t_R U3846 ( .A(\prod_lo_hi\[7\] ), .Y(n4271) );
  INVx1_ASAP7_75t_R U3847 ( .A(\prod_lo_hi\[6\] ), .Y(n4272) );
  INVx1_ASAP7_75t_R U3848 ( .A(\prod_lo_hi\[5\] ), .Y(n4273) );
  INVx1_ASAP7_75t_R U3849 ( .A(\prod_lo_hi\[4\] ), .Y(n4274) );
  INVx1_ASAP7_75t_R U3850 ( .A(\p1\[27\] ), .Y(n3831) );
  INVx1_ASAP7_75t_R U3851 ( .A(\p1\[26\] ), .Y(n3832) );
  INVx1_ASAP7_75t_R U3852 ( .A(\p1\[25\] ), .Y(n3833) );
  INVx1_ASAP7_75t_R U3853 ( .A(\p1\[24\] ), .Y(n3834) );
  INVx1_ASAP7_75t_R U3854 ( .A(\p1\[23\] ), .Y(n3835) );
  INVx1_ASAP7_75t_R U3855 ( .A(\p1\[22\] ), .Y(n3836) );
  INVx1_ASAP7_75t_R U3856 ( .A(\p1\[21\] ), .Y(n3837) );
  INVx1_ASAP7_75t_R U3857 ( .A(\p1\[20\] ), .Y(n3838) );
  INVx1_ASAP7_75t_R U3858 ( .A(\p1\[19\] ), .Y(n3839) );
  INVx1_ASAP7_75t_R U3859 ( .A(\p1\[18\] ), .Y(n3840) );
  INVx1_ASAP7_75t_R U3860 ( .A(\p1\[17\] ), .Y(n3841) );
  INVx1_ASAP7_75t_R U3861 ( .A(\p1\[16\] ), .Y(n3842) );
  INVx1_ASAP7_75t_R U3862 ( .A(\p1\[15\] ), .Y(n3843) );
  INVx1_ASAP7_75t_R U3863 ( .A(\p1\[14\] ), .Y(n3844) );
  INVx1_ASAP7_75t_R U3864 ( .A(\p1\[13\] ), .Y(n3845) );
  INVx1_ASAP7_75t_R U3865 ( .A(\p1\[12\] ), .Y(n3846) );
  INVx1_ASAP7_75t_R U3866 ( .A(\p1\[11\] ), .Y(n3847) );
  INVx1_ASAP7_75t_R U3867 ( .A(\p1\[10\] ), .Y(n3848) );
  INVx1_ASAP7_75t_R U3868 ( .A(\p1\[9\] ), .Y(n3849) );
  INVx1_ASAP7_75t_R U3869 ( .A(\p1\[8\] ), .Y(n3850) );
  INVx1_ASAP7_75t_R U3870 ( .A(\p1\[7\] ), .Y(n3851) );
  INVx1_ASAP7_75t_R U3871 ( .A(\p1\[6\] ), .Y(n3852) );
  INVx1_ASAP7_75t_R U3872 ( .A(\p1\[5\] ), .Y(n3853) );
  INVx1_ASAP7_75t_R U3873 ( .A(\p1\[4\] ), .Y(n3854) );
  INVx1_ASAP7_75t_R U3874 ( .A(\p1\[3\] ), .Y(n3855) );
  INVx1_ASAP7_75t_R U3875 ( .A(\p1\[2\] ), .Y(n3856) );
  INVx1_ASAP7_75t_R U3876 ( .A(\p1\[1\] ), .Y(n3857) );
  INVx1_ASAP7_75t_R U3877 ( .A(\s1_mag_u\[4\] ), .Y(n4595) );
  INVx1_ASAP7_75t_R U3878 ( .A(\p0\[27\] ), .Y(n3804) );
  INVx1_ASAP7_75t_R U3879 ( .A(\p0\[26\] ), .Y(n3805) );
  INVx1_ASAP7_75t_R U3880 ( .A(\p0\[25\] ), .Y(n3806) );
  INVx1_ASAP7_75t_R U3881 ( .A(\p0\[24\] ), .Y(n3807) );
  INVx1_ASAP7_75t_R U3882 ( .A(\p0\[23\] ), .Y(n3808) );
  INVx1_ASAP7_75t_R U3883 ( .A(\p0\[22\] ), .Y(n3809) );
  INVx1_ASAP7_75t_R U3884 ( .A(\p0\[21\] ), .Y(n3810) );
  INVx1_ASAP7_75t_R U3885 ( .A(\p0\[20\] ), .Y(n3811) );
  INVx1_ASAP7_75t_R U3886 ( .A(\p0\[19\] ), .Y(n3812) );
  INVx1_ASAP7_75t_R U3887 ( .A(\p0\[18\] ), .Y(n3813) );
  INVx1_ASAP7_75t_R U3888 ( .A(\p0\[17\] ), .Y(n3814) );
  INVx1_ASAP7_75t_R U3889 ( .A(\p0\[16\] ), .Y(n3815) );
  INVx1_ASAP7_75t_R U3890 ( .A(\p0\[15\] ), .Y(n3816) );
  INVx1_ASAP7_75t_R U3891 ( .A(\p0\[14\] ), .Y(n3817) );
  INVx1_ASAP7_75t_R U3892 ( .A(\p0\[13\] ), .Y(n3818) );
  INVx1_ASAP7_75t_R U3893 ( .A(\p0\[12\] ), .Y(n3819) );
  INVx1_ASAP7_75t_R U3894 ( .A(\p0\[11\] ), .Y(n3820) );
  INVx1_ASAP7_75t_R U3895 ( .A(\p0\[10\] ), .Y(n3821) );
  INVx1_ASAP7_75t_R U3896 ( .A(\p0\[9\] ), .Y(n3822) );
  INVx1_ASAP7_75t_R U3897 ( .A(\p0\[8\] ), .Y(n3823) );
  INVx1_ASAP7_75t_R U3898 ( .A(\p0\[7\] ), .Y(n3824) );
  INVx1_ASAP7_75t_R U3899 ( .A(\p0\[6\] ), .Y(n3825) );
  INVx1_ASAP7_75t_R U3900 ( .A(\p0\[5\] ), .Y(n3826) );
  INVx1_ASAP7_75t_R U3901 ( .A(\p0\[4\] ), .Y(n3827) );
  INVx1_ASAP7_75t_R U3902 ( .A(\prod_lo_lo\[31\] ), .Y(n4216) );
  INVx1_ASAP7_75t_R U3903 ( .A(\prod_lo_lo\[30\] ), .Y(n4217) );
  INVx1_ASAP7_75t_R U3904 ( .A(\prod_lo_lo\[29\] ), .Y(n4218) );
  INVx1_ASAP7_75t_R U3905 ( .A(\prod_lo_lo\[28\] ), .Y(n4219) );
  INVx1_ASAP7_75t_R U3906 ( .A(\prod_lo_lo\[27\] ), .Y(n4220) );
  INVx1_ASAP7_75t_R U3907 ( .A(\prod_lo_lo\[26\] ), .Y(n4221) );
  INVx1_ASAP7_75t_R U3908 ( .A(\prod_lo_lo\[25\] ), .Y(n4222) );
  INVx1_ASAP7_75t_R U3909 ( .A(\prod_lo_lo\[24\] ), .Y(n4223) );
  INVx1_ASAP7_75t_R U3910 ( .A(\prod_lo_lo\[23\] ), .Y(n4224) );
  INVx1_ASAP7_75t_R U3911 ( .A(\prod_lo_lo\[22\] ), .Y(n4225) );
  INVx1_ASAP7_75t_R U3912 ( .A(\prod_lo_lo\[21\] ), .Y(n4226) );
  INVx1_ASAP7_75t_R U3913 ( .A(\prod_lo_lo\[20\] ), .Y(n4227) );
  INVx1_ASAP7_75t_R U3914 ( .A(\prod_lo_lo\[19\] ), .Y(n4228) );
  INVx1_ASAP7_75t_R U3915 ( .A(\prod_lo_lo\[18\] ), .Y(n4229) );
  INVx1_ASAP7_75t_R U3916 ( .A(\prod_lo_lo\[17\] ), .Y(n4230) );
  INVx1_ASAP7_75t_R U3917 ( .A(\prod_lo_lo\[16\] ), .Y(n4231) );
  INVx1_ASAP7_75t_R U3918 ( .A(\prod_lo_lo\[15\] ), .Y(n4232) );
  INVx1_ASAP7_75t_R U3919 ( .A(\prod_lo_lo\[14\] ), .Y(n4233) );
  INVx1_ASAP7_75t_R U3920 ( .A(\prod_lo_lo\[13\] ), .Y(n4234) );
  INVx1_ASAP7_75t_R U3921 ( .A(\prod_lo_lo\[12\] ), .Y(n4235) );
  INVx1_ASAP7_75t_R U3922 ( .A(\prod_lo_lo\[11\] ), .Y(n4236) );
  INVx1_ASAP7_75t_R U3923 ( .A(\prod_lo_lo\[10\] ), .Y(n4237) );
  INVx1_ASAP7_75t_R U3924 ( .A(\prod_lo_lo\[9\] ), .Y(n4238) );
  INVx1_ASAP7_75t_R U3925 ( .A(\prod_lo_lo\[8\] ), .Y(n4239) );
  INVx1_ASAP7_75t_R U3926 ( .A(\prod_lo\[39\] ), .Y(n4344) );
  INVx1_ASAP7_75t_R U3927 ( .A(\prod_lo\[38\] ), .Y(n4345) );
  INVx1_ASAP7_75t_R U3928 ( .A(\prod_lo\[37\] ), .Y(n4346) );
  INVx1_ASAP7_75t_R U3929 ( .A(\prod_lo\[36\] ), .Y(n4347) );
  INVx1_ASAP7_75t_R U3930 ( .A(\prod_lo\[35\] ), .Y(n4348) );
  INVx1_ASAP7_75t_R U3931 ( .A(\prod_lo\[34\] ), .Y(n4349) );
  INVx1_ASAP7_75t_R U3932 ( .A(\prod_lo\[33\] ), .Y(n4350) );
  INVx1_ASAP7_75t_R U3933 ( .A(\prod_lo\[32\] ), .Y(n4351) );
  INVx1_ASAP7_75t_R U3934 ( .A(\prod_lo\[31\] ), .Y(n4352) );
  INVx1_ASAP7_75t_R U3935 ( .A(\prod_lo\[30\] ), .Y(n4353) );
  INVx1_ASAP7_75t_R U3936 ( .A(\prod_lo\[29\] ), .Y(n4354) );
  INVx1_ASAP7_75t_R U3937 ( .A(\prod_lo\[28\] ), .Y(n4355) );
  INVx1_ASAP7_75t_R U3938 ( .A(\prod_lo\[27\] ), .Y(n4356) );
  INVx1_ASAP7_75t_R U3939 ( .A(\prod_lo\[26\] ), .Y(n4357) );
  INVx1_ASAP7_75t_R U3940 ( .A(\prod_lo\[25\] ), .Y(n4358) );
  INVx1_ASAP7_75t_R U3941 ( .A(\prod_lo\[24\] ), .Y(n4359) );
  INVx1_ASAP7_75t_R U3942 ( .A(\prod_lo\[23\] ), .Y(n4360) );
  INVx1_ASAP7_75t_R U3943 ( .A(\prod_lo\[22\] ), .Y(n4361) );
  INVx1_ASAP7_75t_R U3944 ( .A(\prod_lo\[21\] ), .Y(n4362) );
  INVx1_ASAP7_75t_R U3945 ( .A(\prod_lo\[20\] ), .Y(n4363) );
  INVx1_ASAP7_75t_R U3946 ( .A(\prod_lo\[19\] ), .Y(n4364) );
  INVx1_ASAP7_75t_R U3947 ( .A(\prod_lo\[18\] ), .Y(n4365) );
  INVx1_ASAP7_75t_R U3948 ( .A(\prod_lo\[17\] ), .Y(n4366) );
  INVx1_ASAP7_75t_R U3949 ( .A(\prod_lo\[16\] ), .Y(n4367) );
  OR3x1_ASAP7_75t_R U3950 ( .A(\prod\[41\] ), .B(\prod\[42\] ), .C(
        \prod\[40\] ), .Y(n3073) );
  OR3x1_ASAP7_75t_R U3951 ( .A(\prod\[44\] ), .B(\prod\[45\] ), .C(
        \prod\[43\] ), .Y(n3072) );
  OR3x1_ASAP7_75t_R U3952 ( .A(\prod\[35\] ), .B(\prod\[36\] ), .C(
        \prod\[34\] ), .Y(n3075) );
  OR3x1_ASAP7_75t_R U3953 ( .A(\prod\[38\] ), .B(\prod\[39\] ), .C(
        \prod\[37\] ), .Y(n3074) );
  OR3x1_ASAP7_75t_R U3954 ( .A(\prod\[29\] ), .B(\prod\[30\] ), .C(
        \prod\[28\] ), .Y(n3077) );
  OR3x1_ASAP7_75t_R U3955 ( .A(\prod\[32\] ), .B(\prod\[33\] ), .C(
        \prod\[31\] ), .Y(n3076) );
  NOR5xp2_ASAP7_75t_R U3956 ( .A(\prod\[23\] ), .B(\prod\[24\] ), .C(
        \prod\[25\] ), .D(\prod\[26\] ), .E(\prod\[27\] ), .Y(n3078) );
  NAND2xp5_ASAP7_75t_R U3957 ( .A(N247), .B(n3029), .Y(n4032) );
  NAND2xp5_ASAP7_75t_R U3958 ( .A(N248), .B(n3029), .Y(n4033) );
  NAND2xp5_ASAP7_75t_R U3959 ( .A(N249), .B(n3030), .Y(n4034) );
  NAND2xp5_ASAP7_75t_R U3960 ( .A(N250), .B(n3029), .Y(n4035) );
  NAND2xp5_ASAP7_75t_R U3961 ( .A(N251), .B(n3029), .Y(n4036) );
  NAND2xp5_ASAP7_75t_R U3962 ( .A(N257), .B(n3029), .Y(n4028) );
  NAND2xp5_ASAP7_75t_R U3963 ( .A(N256), .B(n3029), .Y(n4042) );
  NAND2xp5_ASAP7_75t_R U3964 ( .A(N253), .B(n3029), .Y(n4038) );
  NAND2xp5_ASAP7_75t_R U3965 ( .A(N252), .B(n3029), .Y(n4037) );
  NAND2xp5_ASAP7_75t_R U3966 ( .A(N255), .B(n3029), .Y(n4041) );
  NAND2xp5_ASAP7_75t_R U3967 ( .A(N254), .B(n3029), .Y(n4039) );
  NAND2xp5_ASAP7_75t_R U3968 ( .A(\s2_f_u\[20\] ), .B(\s2_f_u\[19\] ), .Y(
        n3085) );
  NAND2xp5_ASAP7_75t_R U3969 ( .A(n2958), .B(n3125), .Y(n2526) );
  INVx1_ASAP7_75t_R U3970 ( .A(\s2_f_u\[20\] ), .Y(n3082) );
  INVx1_ASAP7_75t_R U3971 ( .A(\s2_f_u\[19\] ), .Y(n3083) );
  NAND2xp5_ASAP7_75t_R U3972 ( .A(n3794), .B(n2963), .Y(n3762) );
  NAND2xp5_ASAP7_75t_R U3973 ( .A(n3788), .B(n3125), .Y(n3738) );
  NAND2xp5_ASAP7_75t_R U3974 ( .A(n3791), .B(n2963), .Y(n3677) );
  INVx1_ASAP7_75t_R U3975 ( .A(n3730), .Y(n3084) );
  OR2x2_ASAP7_75t_R U3976 ( .A(n3085), .B(n3084), .Y(n3678) );
  NAND2xp5_ASAP7_75t_R U3977 ( .A(n3794), .B(n2962), .Y(n3674) );
  INVx1_ASAP7_75t_R U3978 ( .A(\s2_f_u\[17\] ), .Y(n3086) );
  NAND2xp5_ASAP7_75t_R U3979 ( .A(n3125), .B(n3007), .Y(n3746) );
  NAND2xp5_ASAP7_75t_R U3980 ( .A(n3795), .B(n2964), .Y(n3251) );
  INVx1_ASAP7_75t_R U3981 ( .A(n3251), .Y(n3721) );
  NAND2xp5_ASAP7_75t_R U3982 ( .A(n2963), .B(n3007), .Y(n3356) );
  NAND2xp5_ASAP7_75t_R U3983 ( .A(n3702), .B(n3356), .Y(n3262) );
  INVx1_ASAP7_75t_R U3984 ( .A(n3262), .Y(n3093) );
  NAND2xp5_ASAP7_75t_R U3985 ( .A(n3677), .B(n3678), .Y(n3161) );
  INVx1_ASAP7_75t_R U3986 ( .A(n3161), .Y(n3090) );
  INVx1_ASAP7_75t_R U3987 ( .A(\s2_f_u\[21\] ), .Y(n3087) );
  NAND2xp5_ASAP7_75t_R U3988 ( .A(n3011), .B(n3125), .Y(n3250) );
  INVx1_ASAP7_75t_R U3989 ( .A(n3773), .Y(n3518) );
  AND3x1_ASAP7_75t_R U3990 ( .A(n3676), .B(n3792), .C(n3679), .Y(n3088) );
  AND4x1_ASAP7_75t_R U3991 ( .A(n3762), .B(n3518), .C(n3738), .D(n3088), .Y(
        n3089) );
  NAND5xp2_ASAP7_75t_R U3992 ( .A(n3090), .B(n3674), .C(n3673), .D(n3250), .E(
        n3089), .Y(n3287) );
  INVx1_ASAP7_75t_R U3993 ( .A(n3287), .Y(n3092) );
  NAND2xp5_ASAP7_75t_R U3994 ( .A(n3746), .B(n3018), .Y(n3240) );
  INVx1_ASAP7_75t_R U3995 ( .A(n3240), .Y(n3091) );
  NAND3xp33_ASAP7_75t_R U3996 ( .A(n3093), .B(n3092), .C(n3091), .Y(n3189) );
  NAND2xp5_ASAP7_75t_R U3997 ( .A(n3125), .B(n3794), .Y(n3715) );
  NAND2xp5_ASAP7_75t_R U3998 ( .A(n3791), .B(n2962), .Y(n3694) );
  NAND2xp5_ASAP7_75t_R U3999 ( .A(n2958), .B(n2962), .Y(n3197) );
  INVx1_ASAP7_75t_R U4000 ( .A(n3197), .Y(n3498) );
  INVx1_ASAP7_75t_R U4001 ( .A(\s2_f_u\[22\] ), .Y(n3094) );
  NAND2xp5_ASAP7_75t_R U4002 ( .A(n2979), .B(n2964), .Y(n3224) );
  INVx1_ASAP7_75t_R U4003 ( .A(n3224), .Y(n3219) );
  AND3x1_ASAP7_75t_R U4004 ( .A(n3778), .B(n3776), .C(n3746), .Y(n3097) );
  NAND2xp5_ASAP7_75t_R U4005 ( .A(n3004), .B(n2963), .Y(n3223) );
  INVx1_ASAP7_75t_R U4006 ( .A(\s2_f_u\[18\] ), .Y(n3095) );
  NAND2xp5_ASAP7_75t_R U4007 ( .A(n3012), .B(n2964), .Y(n3221) );
  INVx1_ASAP7_75t_R U4008 ( .A(n3221), .Y(n3228) );
  NAND2xp5_ASAP7_75t_R U4009 ( .A(n3011), .B(n2962), .Y(n3761) );
  NAND2xp5_ASAP7_75t_R U4010 ( .A(n2978), .B(n2963), .Y(n3162) );
  NAND3xp33_ASAP7_75t_R U4011 ( .A(n3021), .B(n3356), .C(n3360), .Y(n3275) );
  AND2x2_ASAP7_75t_R U4012 ( .A(n3733), .B(n3683), .Y(n3098) );
  NAND3xp33_ASAP7_75t_R U4013 ( .A(n3783), .B(n3761), .C(n3098), .Y(n3264) );
  INVx1_ASAP7_75t_R U4014 ( .A(n3264), .Y(n3099) );
  NAND2xp5_ASAP7_75t_R U4015 ( .A(n3797), .B(n2962), .Y(n3716) );
  NAND2xp5_ASAP7_75t_R U4016 ( .A(n3730), .B(n2962), .Y(n3669) );
  NAND2xp5_ASAP7_75t_R U4017 ( .A(n3797), .B(n2963), .Y(n3686) );
  NAND2xp5_ASAP7_75t_R U4018 ( .A(n2979), .B(n3125), .Y(n3755) );
  NAND2xp5_ASAP7_75t_R U4019 ( .A(n3009), .B(n2963), .Y(n3257) );
  NAND2xp5_ASAP7_75t_R U4020 ( .A(n2964), .B(n2977), .Y(n3199) );
  NAND3xp33_ASAP7_75t_R U4021 ( .A(n3257), .B(n3674), .C(n3199), .Y(n3236) );
  NAND2xp5_ASAP7_75t_R U4022 ( .A(n2964), .B(n2978), .Y(n3299) );
  NAND3xp33_ASAP7_75t_R U4023 ( .A(n3702), .B(n3299), .C(n2981), .Y(n3101) );
  NAND2xp5_ASAP7_75t_R U4024 ( .A(n2977), .B(n2963), .Y(n3298) );
  AND4x1_ASAP7_75t_R U4025 ( .A(n3716), .B(n3694), .C(n3669), .D(n3298), .Y(
        n3495) );
  INVx1_ASAP7_75t_R U4026 ( .A(n3753), .Y(n3520) );
  NAND2xp5_ASAP7_75t_R U4027 ( .A(n3495), .B(n3520), .Y(n3100) );
  OR2x2_ASAP7_75t_R U4028 ( .A(n3101), .B(n3100), .Y(n3274) );
  NAND2xp5_ASAP7_75t_R U4029 ( .A(n3011), .B(n2964), .Y(n3668) );
  NAND2xp5_ASAP7_75t_R U4030 ( .A(n3797), .B(n3125), .Y(n3741) );
  NAND2xp5_ASAP7_75t_R U4031 ( .A(n3004), .B(n2964), .Y(n3714) );
  NAND5xp2_ASAP7_75t_R U4032 ( .A(n3787), .B(n3761), .C(n3716), .D(n3298), .E(
        n3714), .Y(n3124) );
  AND2x2_ASAP7_75t_R U4033 ( .A(n3706), .B(n3770), .Y(n3102) );
  NAND3xp33_ASAP7_75t_R U4034 ( .A(n3798), .B(n2981), .C(n3102), .Y(n3358) );
  NAND2xp5_ASAP7_75t_R U4035 ( .A(n3004), .B(n2962), .Y(n3278) );
  NOR5xp2_ASAP7_75t_R U4036 ( .A(n3786), .B(n3124), .C(n3358), .D(n3759), .E(
        n3179), .Y(n4645) );
  NAND2xp5_ASAP7_75t_R U4037 ( .A(n3004), .B(n3125), .Y(n3692) );
  NAND2xp5_ASAP7_75t_R U4038 ( .A(n3012), .B(n2962), .Y(n3681) );
  NAND2xp5_ASAP7_75t_R U4039 ( .A(n3795), .B(n3125), .Y(n3701) );
  NAND2xp5_ASAP7_75t_R U4040 ( .A(n3009), .B(n2964), .Y(n3700) );
  NAND2xp5_ASAP7_75t_R U4041 ( .A(n3702), .B(n3677), .Y(n3107) );
  NAND2xp5_ASAP7_75t_R U4042 ( .A(n3221), .B(n3223), .Y(n3106) );
  INVx1_ASAP7_75t_R U4043 ( .A(n3299), .Y(n3183) );
  INVx1_ASAP7_75t_R U4044 ( .A(n3681), .Y(n3490) );
  INVx1_ASAP7_75t_R U4045 ( .A(n3692), .Y(n3206) );
  OR4x1_ASAP7_75t_R U4046 ( .A(n3183), .B(n3020), .C(n3490), .D(n3206), .Y(
        n3289) );
  INVx1_ASAP7_75t_R U4047 ( .A(n3696), .Y(n3103) );
  NAND2xp5_ASAP7_75t_R U4048 ( .A(n3700), .B(n3103), .Y(n3105) );
  NAND2xp5_ASAP7_75t_R U4049 ( .A(n3125), .B(n3791), .Y(n3164) );
  NAND3xp33_ASAP7_75t_R U4050 ( .A(n3164), .B(n3016), .C(n3701), .Y(n3104) );
  NOR5xp2_ASAP7_75t_R U4051 ( .A(n3107), .B(n3106), .C(n3289), .D(n3105), .E(
        n3104), .Y(n4612) );
  NAND2xp5_ASAP7_75t_R U4052 ( .A(n2979), .B(n2962), .Y(n3693) );
  NAND2xp5_ASAP7_75t_R U4053 ( .A(n3797), .B(n2964), .Y(n3695) );
  NAND2xp5_ASAP7_75t_R U4054 ( .A(n3012), .B(n2963), .Y(n3758) );
  NAND2xp5_ASAP7_75t_R U4055 ( .A(n3014), .B(n2963), .Y(n3767) );
  NAND2xp5_ASAP7_75t_R U4056 ( .A(n3011), .B(n2963), .Y(n3196) );
  NAND2xp5_ASAP7_75t_R U4057 ( .A(n3196), .B(n3164), .Y(n3720) );
  NAND2xp5_ASAP7_75t_R U4058 ( .A(n3014), .B(n2962), .Y(n3722) );
  NAND2xp5_ASAP7_75t_R U4059 ( .A(n2979), .B(n2963), .Y(n3671) );
  NAND2xp5_ASAP7_75t_R U4060 ( .A(n2964), .B(n3794), .Y(n3685) );
  NAND2xp5_ASAP7_75t_R U4061 ( .A(n3009), .B(n2962), .Y(n3682) );
  INVx1_ASAP7_75t_R U4062 ( .A(n3685), .Y(n3216) );
  INVx1_ASAP7_75t_R U4063 ( .A(n3682), .Y(n3148) );
  OR4x1_ASAP7_75t_R U4064 ( .A(n3689), .B(n3216), .C(n3688), .D(n3148), .Y(
        n3114) );
  NAND2xp5_ASAP7_75t_R U4065 ( .A(n3673), .B(n3671), .Y(n3113) );
  INVx1_ASAP7_75t_R U4066 ( .A(n3288), .Y(n3111) );
  INVx1_ASAP7_75t_R U4067 ( .A(n3720), .Y(n3108) );
  NAND2xp5_ASAP7_75t_R U4068 ( .A(n3251), .B(n3108), .Y(n3130) );
  INVx1_ASAP7_75t_R U4069 ( .A(n3130), .Y(n3110) );
  INVx1_ASAP7_75t_R U4070 ( .A(n3722), .Y(n3691) );
  INVx1_ASAP7_75t_R U4071 ( .A(n3755), .Y(n3494) );
  INVx1_ASAP7_75t_R U4072 ( .A(n3257), .Y(n3690) );
  NAND3xp33_ASAP7_75t_R U4073 ( .A(n3360), .B(n3694), .C(n3692), .Y(n3140) );
  INVx1_ASAP7_75t_R U4074 ( .A(n3792), .Y(n3516) );
  INVx1_ASAP7_75t_R U4075 ( .A(n3746), .Y(n3500) );
  INVx1_ASAP7_75t_R U4076 ( .A(n3278), .Y(n3493) );
  INVx1_ASAP7_75t_R U4077 ( .A(n3223), .Y(n3703) );
  NAND2xp5_ASAP7_75t_R U4078 ( .A(n3014), .B(n2964), .Y(n3286) );
  INVx1_ASAP7_75t_R U4079 ( .A(n3286), .Y(n3229) );
  INVx1_ASAP7_75t_R U4080 ( .A(n3693), .Y(n3147) );
  NAND3xp33_ASAP7_75t_R U4081 ( .A(n3743), .B(n3005), .C(n3112), .Y(n3357) );
  NOR5xp2_ASAP7_75t_R U4082 ( .A(n3114), .B(n3113), .C(n3186), .D(n3140), .E(
        n3357), .Y(n4609) );
  NAND2xp5_ASAP7_75t_R U4083 ( .A(n2978), .B(n3125), .Y(n3163) );
  NAND2xp5_ASAP7_75t_R U4084 ( .A(n3671), .B(n3163), .Y(n3119) );
  NAND3xp33_ASAP7_75t_R U4085 ( .A(n3673), .B(n3224), .C(n3196), .Y(n3263) );
  INVx1_ASAP7_75t_R U4086 ( .A(n3717), .Y(n3118) );
  NAND3xp33_ASAP7_75t_R U4087 ( .A(n3738), .B(n3716), .C(n3298), .Y(n3116) );
  NAND2xp5_ASAP7_75t_R U4088 ( .A(n3708), .B(n3766), .Y(n3115) );
  NAND2xp5_ASAP7_75t_R U4089 ( .A(n3356), .B(n3758), .Y(n3359) );
  OR3x1_ASAP7_75t_R U4090 ( .A(n3116), .B(n3115), .C(n3359), .Y(n3269) );
  INVx1_ASAP7_75t_R U4091 ( .A(n3269), .Y(n3198) );
  INVx1_ASAP7_75t_R U4092 ( .A(n3695), .Y(n3487) );
  INVx1_ASAP7_75t_R U4093 ( .A(n3199), .Y(n3182) );
  NAND2xp5_ASAP7_75t_R U4094 ( .A(n3730), .B(n2964), .Y(n3710) );
  NAND2xp5_ASAP7_75t_R U4095 ( .A(n3009), .B(n3125), .Y(n3709) );
  INVx1_ASAP7_75t_R U4096 ( .A(n3164), .Y(n3489) );
  INVx1_ASAP7_75t_R U4097 ( .A(n3710), .Y(n3482) );
  INVx1_ASAP7_75t_R U4098 ( .A(n3709), .Y(n3120) );
  OR4x1_ASAP7_75t_R U4099 ( .A(n3489), .B(n3228), .C(n3482), .D(n3120), .Y(
        n3301) );
  INVx1_ASAP7_75t_R U4100 ( .A(n3301), .Y(n3123) );
  AND3x1_ASAP7_75t_R U4101 ( .A(n3708), .B(n3706), .C(n3707), .Y(n3122) );
  INVx1_ASAP7_75t_R U4102 ( .A(n3671), .Y(n3485) );
  INVx1_ASAP7_75t_R U4103 ( .A(n3686), .Y(n3168) );
  INVx1_ASAP7_75t_R U4104 ( .A(n3250), .Y(n3169) );
  NOR5xp2_ASAP7_75t_R U4105 ( .A(n3750), .B(n3485), .C(n3168), .D(n3169), .E(
        n3225), .Y(n3121) );
  AND5x1_ASAP7_75t_R U4106 ( .A(n3687), .B(n3123), .C(n3702), .D(n3122), .E(
        n3121), .Y(n4615) );
  NAND2xp5_ASAP7_75t_R U4107 ( .A(n3014), .B(n3125), .Y(n3672) );
  NAND2xp5_ASAP7_75t_R U4108 ( .A(n2964), .B(n3007), .Y(n3739) );
  NAND2xp5_ASAP7_75t_R U4109 ( .A(n3224), .B(n3251), .Y(n3244) );
  INVx1_ASAP7_75t_R U4110 ( .A(n3244), .Y(n3231) );
  NAND5xp2_ASAP7_75t_R U4111 ( .A(n3726), .B(n3735), .C(n3021), .D(n3231), .E(
        n3672), .Y(n3237) );
  NAND3xp33_ASAP7_75t_R U4112 ( .A(n3221), .B(n3360), .C(n3739), .Y(n3176) );
  NOR5xp2_ASAP7_75t_R U4113 ( .A(n3237), .B(n3124), .C(n3176), .D(n3750), .E(
        n3751), .Y(n4631) );
  NAND2xp5_ASAP7_75t_R U4114 ( .A(n2977), .B(n3125), .Y(n3705) );
  INVx1_ASAP7_75t_R U4115 ( .A(n3705), .Y(n3480) );
  INVx1_ASAP7_75t_R U4116 ( .A(n3714), .Y(n3680) );
  OR4x1_ASAP7_75t_R U4117 ( .A(n3480), .B(n3206), .C(n3719), .D(n3680), .Y(
        n3292) );
  INVx1_ASAP7_75t_R U4118 ( .A(n3678), .Y(n3502) );
  INVx1_ASAP7_75t_R U4119 ( .A(n3672), .Y(n3724) );
  INVx1_ASAP7_75t_R U4120 ( .A(n3162), .Y(n3790) );
  NAND2xp5_ASAP7_75t_R U4121 ( .A(n3127), .B(n3126), .Y(n3215) );
  INVx1_ASAP7_75t_R U4122 ( .A(n3712), .Y(n3514) );
  NAND5xp2_ASAP7_75t_R U4123 ( .A(n3673), .B(n3196), .C(n3514), .D(n3763), .E(
        n3017), .Y(n3295) );
  NAND2xp5_ASAP7_75t_R U4124 ( .A(n3722), .B(n3197), .Y(n3300) );
  NOR5xp2_ASAP7_75t_R U4125 ( .A(n3719), .B(n3295), .C(n3300), .D(n3760), .E(
        n3688), .Y(n4633) );
  NAND5xp2_ASAP7_75t_R U4126 ( .A(n3299), .B(n3695), .C(n3714), .D(n3682), .E(
        n3024), .Y(n3131) );
  INVx1_ASAP7_75t_R U4127 ( .A(n3764), .Y(n3128) );
  INVx1_ASAP7_75t_R U4128 ( .A(n3163), .Y(n3483) );
  NAND5xp2_ASAP7_75t_R U4129 ( .A(n3744), .B(n3706), .C(n3741), .D(n3700), .E(
        n2980), .Y(n3258) );
  NAND2xp5_ASAP7_75t_R U4130 ( .A(n3684), .B(n3683), .Y(n3129) );
  INVx1_ASAP7_75t_R U4131 ( .A(n3719), .Y(n3132) );
  NAND3xp33_ASAP7_75t_R U4132 ( .A(n3360), .B(n3026), .C(n3132), .Y(n3135) );
  NAND2xp5_ASAP7_75t_R U4133 ( .A(n3250), .B(n3678), .Y(n3134) );
  INVx1_ASAP7_75t_R U4134 ( .A(n3706), .Y(n3133) );
  INVx1_ASAP7_75t_R U4135 ( .A(n3700), .Y(n3137) );
  NAND3xp33_ASAP7_75t_R U4136 ( .A(n3766), .B(n3735), .C(n3776), .Y(n3136) );
  OR4x1_ASAP7_75t_R U4137 ( .A(n3229), .B(n3724), .C(n3137), .D(n3136), .Y(
        n3302) );
  INVx1_ASAP7_75t_R U4138 ( .A(n3302), .Y(n3139) );
  AND3x1_ASAP7_75t_R U4139 ( .A(n3704), .B(n3139), .C(n3138), .Y(n4638) );
  NAND2xp5_ASAP7_75t_R U4140 ( .A(n3795), .B(n2963), .Y(n3718) );
  INVx1_ASAP7_75t_R U4141 ( .A(n3140), .Y(n3255) );
  INVx1_ASAP7_75t_R U4142 ( .A(n3759), .Y(n3519) );
  AND2x2_ASAP7_75t_R U4143 ( .A(n3789), .B(n3687), .Y(n3141) );
  NAND3xp33_ASAP7_75t_R U4144 ( .A(n3255), .B(n3519), .C(n3141), .Y(n3270) );
  OR2x2_ASAP7_75t_R U4145 ( .A(n3279), .B(n3270), .Y(n3145) );
  INVx1_ASAP7_75t_R U4146 ( .A(n3179), .Y(n3211) );
  NAND3xp33_ASAP7_75t_R U4147 ( .A(n3717), .B(n3708), .C(n3211), .Y(n3144) );
  NAND2xp5_ASAP7_75t_R U4148 ( .A(n3702), .B(n3286), .Y(n3143) );
  NAND3xp33_ASAP7_75t_R U4149 ( .A(n3682), .B(n3718), .C(n3299), .Y(n3142) );
  NAND2xp5_ASAP7_75t_R U4150 ( .A(n2962), .B(n3007), .Y(n3756) );
  INVx1_ASAP7_75t_R U4151 ( .A(n3186), .Y(n3151) );
  INVx1_ASAP7_75t_R U4152 ( .A(n3669), .Y(n3497) );
  AND4x1_ASAP7_75t_R U4153 ( .A(n3151), .B(n3278), .C(n3150), .D(n3149), .Y(
        n4610) );
  NAND2xp5_ASAP7_75t_R U4154 ( .A(n3781), .B(n3514), .Y(n3155) );
  NAND3xp33_ASAP7_75t_R U4155 ( .A(n3356), .B(n3223), .C(n3250), .Y(n3154) );
  NAND2xp5_ASAP7_75t_R U4156 ( .A(n2958), .B(n2963), .Y(n3203) );
  NAND3xp33_ASAP7_75t_R U4157 ( .A(n3203), .B(n3718), .C(n3672), .Y(n3153) );
  NAND2xp5_ASAP7_75t_R U4158 ( .A(n3298), .B(n3360), .Y(n3152) );
  NOR5xp2_ASAP7_75t_R U4159 ( .A(n3155), .B(n3358), .C(n3154), .D(n3153), .E(
        n3152), .Y(n4648) );
  INVx1_ASAP7_75t_R U4160 ( .A(n3701), .Y(n3242) );
  NAND3xp33_ASAP7_75t_R U4161 ( .A(n3157), .B(n3299), .C(n3156), .Y(n3160) );
  AND2x2_ASAP7_75t_R U4162 ( .A(n3749), .B(n3704), .Y(n3158) );
  NAND3xp33_ASAP7_75t_R U4163 ( .A(n3021), .B(n2981), .C(n3158), .Y(n3159) );
  NOR5xp2_ASAP7_75t_R U4164 ( .A(n3160), .B(n3159), .C(n3720), .D(n3269), .E(
        n3179), .Y(n4630) );
  NAND2xp5_ASAP7_75t_R U4165 ( .A(n3788), .B(n2963), .Y(n3754) );
  INVx1_ASAP7_75t_R U4166 ( .A(n3668), .Y(n3492) );
  INVx1_ASAP7_75t_R U4167 ( .A(n3298), .Y(n3496) );
  OR4x1_ASAP7_75t_R U4168 ( .A(n3721), .B(n3161), .C(n3492), .D(n3496), .Y(
        n3166) );
  NAND3xp33_ASAP7_75t_R U4169 ( .A(n3679), .B(n3676), .C(n3518), .Y(n3165) );
  NAND3xp33_ASAP7_75t_R U4170 ( .A(n3017), .B(n3162), .C(n3754), .Y(n3261) );
  NAND5xp2_ASAP7_75t_R U4171 ( .A(n3164), .B(n3163), .C(n3681), .D(n3758), .E(
        n3757), .Y(n3212) );
  NAND2xp5_ASAP7_75t_R U4172 ( .A(n3788), .B(n2964), .Y(n3711) );
  NAND3xp33_ASAP7_75t_R U4173 ( .A(n3299), .B(n3257), .C(n3701), .Y(n3174) );
  INVx1_ASAP7_75t_R U4174 ( .A(n3718), .Y(n3479) );
  INVx1_ASAP7_75t_R U4175 ( .A(n3203), .Y(n3477) );
  INVx1_ASAP7_75t_R U4176 ( .A(n3245), .Y(n3256) );
  NAND2xp5_ASAP7_75t_R U4177 ( .A(n3256), .B(n3746), .Y(n3173) );
  NAND3xp33_ASAP7_75t_R U4178 ( .A(n3251), .B(n3674), .C(n3711), .Y(n3276) );
  INVx1_ASAP7_75t_R U4179 ( .A(n3270), .Y(n3172) );
  INVx1_ASAP7_75t_R U4180 ( .A(n3196), .Y(n3777) );
  NAND5xp2_ASAP7_75t_R U4181 ( .A(n3172), .B(n3356), .C(n3673), .D(n3171), .E(
        n3170), .Y(n3220) );
  INVx1_ASAP7_75t_R U4182 ( .A(n3689), .Y(n3175) );
  NAND3xp33_ASAP7_75t_R U4183 ( .A(n3714), .B(n3175), .C(n3682), .Y(n3181) );
  INVx1_ASAP7_75t_R U4184 ( .A(n3176), .Y(n3177) );
  NAND2xp5_ASAP7_75t_R U4185 ( .A(n3177), .B(n3223), .Y(n3180) );
  OR2x2_ASAP7_75t_R U4186 ( .A(n3747), .B(n3696), .Y(n3247) );
  OR4x1_ASAP7_75t_R U4187 ( .A(n3182), .B(n3216), .C(n3483), .D(n3247), .Y(
        n3188) );
  NAND3xp33_ASAP7_75t_R U4188 ( .A(n3221), .B(n3356), .C(n3686), .Y(n3187) );
  INVx1_ASAP7_75t_R U4189 ( .A(n3702), .Y(n3184) );
  NAND2xp5_ASAP7_75t_R U4190 ( .A(n3687), .B(n3022), .Y(n3185) );
  INVx1_ASAP7_75t_R U4191 ( .A(n2526), .Y(n3191) );
  NAND3xp33_ASAP7_75t_R U4192 ( .A(n3231), .B(n2526), .C(n3197), .Y(n3194) );
  INVx1_ASAP7_75t_R U4193 ( .A(n3275), .Y(n3193) );
  NAND2xp5_ASAP7_75t_R U4194 ( .A(n3193), .B(n3677), .Y(n3195) );
  NOR5xp2_ASAP7_75t_R U4195 ( .A(n3690), .B(n3195), .C(n3274), .D(n3194), .E(
        n3357), .Y(n4628) );
  NAND2xp5_ASAP7_75t_R U4196 ( .A(n3196), .B(n3026), .Y(n3202) );
  NAND2xp5_ASAP7_75t_R U4197 ( .A(n3198), .B(n3197), .Y(n3201) );
  NAND2xp5_ASAP7_75t_R U4198 ( .A(n3796), .B(n3021), .Y(n3200) );
  NAND5xp2_ASAP7_75t_R U4199 ( .A(n2526), .B(n3360), .C(n3671), .D(n3199), .E(
        n3722), .Y(n3234) );
  INVx1_ASAP7_75t_R U4200 ( .A(n3234), .Y(n3476) );
  NAND3xp33_ASAP7_75t_R U4201 ( .A(n3476), .B(n3695), .C(n3672), .Y(n3233) );
  NOR5xp2_ASAP7_75t_R U4202 ( .A(n3202), .B(n3201), .C(n3200), .D(n3244), .E(
        n3233), .Y(n4647) );
  NAND5xp2_ASAP7_75t_R U4203 ( .A(n3356), .B(n3762), .C(n3738), .D(n3203), .E(
        n3694), .Y(n3294) );
  NOR5xp2_ASAP7_75t_R U4204 ( .A(n3236), .B(n3204), .C(n3237), .D(n3785), .E(
        n3294), .Y(n4644) );
  INVx1_ASAP7_75t_R U4205 ( .A(n3295), .Y(n3210) );
  NAND2xp5_ASAP7_75t_R U4206 ( .A(n3717), .B(n3735), .Y(n3205) );
  INVx1_ASAP7_75t_R U4207 ( .A(n3756), .Y(n3478) );
  NAND2xp5_ASAP7_75t_R U4208 ( .A(n3223), .B(n3360), .Y(n3207) );
  INVx1_ASAP7_75t_R U4209 ( .A(n3711), .Y(n3731) );
  NOR5xp2_ASAP7_75t_R U4210 ( .A(n3478), .B(n3207), .C(n3728), .D(n3731), .E(
        n3206), .Y(n3208) );
  AND5x1_ASAP7_75t_R U4211 ( .A(n3211), .B(n3210), .C(n2526), .D(n3209), .E(
        n3208), .Y(n4622) );
  INVx1_ASAP7_75t_R U4212 ( .A(n3212), .Y(n3214) );
  INVx1_ASAP7_75t_R U4213 ( .A(n3294), .Y(n3213) );
  NAND2xp5_ASAP7_75t_R U4214 ( .A(n3214), .B(n3213), .Y(n3218) );
  OR2x2_ASAP7_75t_R U4215 ( .A(n3759), .B(n3753), .Y(n3217) );
  NOR5xp2_ASAP7_75t_R U4216 ( .A(n3218), .B(n3217), .C(n3479), .D(n3216), .E(
        n3215), .Y(n4632) );
  NOR5xp2_ASAP7_75t_R U4217 ( .A(n3773), .B(n3219), .C(n3680), .D(n3772), .E(
        n3771), .Y(n4637) );
  INVx1_ASAP7_75t_R U4218 ( .A(n3220), .Y(n3222) );
  NAND2xp5_ASAP7_75t_R U4219 ( .A(n3222), .B(n3221), .Y(n3227) );
  NAND2xp5_ASAP7_75t_R U4220 ( .A(n3025), .B(n3514), .Y(n3226) );
  INVx1_ASAP7_75t_R U4221 ( .A(n3716), .Y(n3225) );
  NOR5xp2_ASAP7_75t_R U4222 ( .A(n3227), .B(n3226), .C(n3219), .D(n3713), .E(
        n3225), .Y(n4617) );
  NAND3xp33_ASAP7_75t_R U4223 ( .A(n3707), .B(n3231), .C(n3230), .Y(n3267) );
  INVx1_ASAP7_75t_R U4224 ( .A(n3796), .Y(n3232) );
  NOR5xp2_ASAP7_75t_R U4225 ( .A(n3740), .B(n3274), .C(n3233), .D(n3267), .E(
        n3232), .Y(n4627) );
  NAND2xp5_ASAP7_75t_R U4226 ( .A(n3717), .B(n3726), .Y(n3235) );
  NAND3xp33_ASAP7_75t_R U4227 ( .A(n3693), .B(n3695), .C(n3016), .Y(n3239) );
  NAND2xp5_ASAP7_75t_R U4228 ( .A(n2526), .B(n3694), .Y(n3238) );
  NOR5xp2_ASAP7_75t_R U4229 ( .A(n3721), .B(n3240), .C(n3689), .D(n3732), .E(
        n3480), .Y(n4623) );
  INVx1_ASAP7_75t_R U4230 ( .A(n3739), .Y(n3481) );
  NAND2xp5_ASAP7_75t_R U4231 ( .A(n3673), .B(n3018), .Y(n3241) );
  OR3x1_ASAP7_75t_R U4232 ( .A(n3481), .B(n3242), .C(n3241), .Y(n3246) );
  NAND2xp5_ASAP7_75t_R U4233 ( .A(n3757), .B(n3255), .Y(n3243) );
  NOR5xp2_ASAP7_75t_R U4234 ( .A(n3246), .B(n3288), .C(n3245), .D(n3244), .E(
        n3243), .Y(n4636) );
  INVx1_ASAP7_75t_R U4235 ( .A(n3775), .Y(n3249) );
  INVx1_ASAP7_75t_R U4236 ( .A(n3247), .Y(n3248) );
  NAND3xp33_ASAP7_75t_R U4237 ( .A(n3257), .B(n3249), .C(n3248), .Y(n3254) );
  NAND2xp5_ASAP7_75t_R U4238 ( .A(n3251), .B(n3250), .Y(n3253) );
  INVx1_ASAP7_75t_R U4239 ( .A(n3707), .Y(n3252) );
  NOR5xp2_ASAP7_75t_R U4240 ( .A(n3254), .B(n3253), .C(n3500), .D(n3252), .E(
        n3258), .Y(n4629) );
  NAND2xp5_ASAP7_75t_R U4241 ( .A(n3256), .B(n3255), .Y(n3260) );
  AND3x1_ASAP7_75t_R U4242 ( .A(n3738), .B(n3257), .C(n3714), .Y(n3475) );
  NAND2xp5_ASAP7_75t_R U4243 ( .A(n3704), .B(n3475), .Y(n3259) );
  NOR5xp2_ASAP7_75t_R U4244 ( .A(n3260), .B(n3259), .C(n3703), .D(n3301), .E(
        n3258), .Y(n4613) );
  INVx1_ASAP7_75t_R U4245 ( .A(n3261), .Y(n3266) );
  AND4x1_ASAP7_75t_R U4246 ( .A(n3266), .B(n3360), .C(n3718), .D(n3265), .Y(
        n4643) );
  INVx1_ASAP7_75t_R U4247 ( .A(n3267), .Y(n3268) );
  NAND2xp5_ASAP7_75t_R U4248 ( .A(n3268), .B(n2981), .Y(n3273) );
  NAND3xp33_ASAP7_75t_R U4249 ( .A(n3793), .B(n3005), .C(n3518), .Y(n3272) );
  NAND2xp5_ASAP7_75t_R U4250 ( .A(n3673), .B(n3709), .Y(n3271) );
  NOR5xp2_ASAP7_75t_R U4251 ( .A(n3273), .B(n3272), .C(n3271), .D(n3270), .E(
        n3269), .Y(n4646) );
  OR2x2_ASAP7_75t_R U4252 ( .A(n3275), .B(n3274), .Y(n3283) );
  INVx1_ASAP7_75t_R U4253 ( .A(n3276), .Y(n3277) );
  NAND3xp33_ASAP7_75t_R U4254 ( .A(n3735), .B(n3277), .C(n3025), .Y(n3282) );
  NAND3xp33_ASAP7_75t_R U4255 ( .A(n3278), .B(n3705), .C(n3678), .Y(n3281) );
  OR2x2_ASAP7_75t_R U4256 ( .A(n3279), .B(n3720), .Y(n3280) );
  NAND2xp5_ASAP7_75t_R U4257 ( .A(n2978), .B(n2962), .Y(n3670) );
  NAND2xp5_ASAP7_75t_R U4258 ( .A(n3285), .B(n3284), .Y(n3291) );
  NAND2xp5_ASAP7_75t_R U4259 ( .A(n2526), .B(n3286), .Y(n3290) );
  NOR5xp2_ASAP7_75t_R U4260 ( .A(n3291), .B(n3290), .C(n3289), .D(n3288), .E(
        n3287), .Y(n4605) );
  OR4x1_ASAP7_75t_R U4261 ( .A(n3225), .B(n3496), .C(n3489), .D(n3790), .Y(
        n3297) );
  INVx1_ASAP7_75t_R U4262 ( .A(n3292), .Y(n3293) );
  NAND3xp33_ASAP7_75t_R U4263 ( .A(n3293), .B(n3764), .C(n3022), .Y(n3296) );
  NAND5xp2_ASAP7_75t_R U4264 ( .A(n3299), .B(n3705), .C(n3670), .D(n3023), .E(
        n3298), .Y(n3304) );
  NAND3xp33_ASAP7_75t_R U4265 ( .A(n3677), .B(n3746), .C(n3715), .Y(n3303) );
  NOR5xp2_ASAP7_75t_R U4266 ( .A(n3304), .B(n3303), .C(n3302), .D(n3301), .E(
        n3300), .Y(n4614) );
  INVx1_ASAP7_75t_R U4267 ( .A(\lut_delta\[0\] ), .Y(n4438) );
  INVx1_ASAP7_75t_R U4268 ( .A(\lut_delta\[1\] ), .Y(n4437) );
  INVx1_ASAP7_75t_R U4269 ( .A(\lut_delta\[2\] ), .Y(n4436) );
  INVx1_ASAP7_75t_R U4270 ( .A(\lut_delta\[3\] ), .Y(n4435) );
  INVx1_ASAP7_75t_R U4271 ( .A(\lut_delta\[4\] ), .Y(n4434) );
  INVx1_ASAP7_75t_R U4272 ( .A(\lut_delta\[5\] ), .Y(n4433) );
  INVx1_ASAP7_75t_R U4273 ( .A(\lut_delta\[6\] ), .Y(n4432) );
  INVx1_ASAP7_75t_R U4274 ( .A(\lut_delta\[7\] ), .Y(n4431) );
  INVx1_ASAP7_75t_R U4275 ( .A(\lut_delta\[8\] ), .Y(n4430) );
  INVx1_ASAP7_75t_R U4276 ( .A(\lut_delta\[9\] ), .Y(n4429) );
  INVx1_ASAP7_75t_R U4277 ( .A(\lut_delta\[10\] ), .Y(n4428) );
  INVx1_ASAP7_75t_R U4278 ( .A(\lut_delta\[11\] ), .Y(n4427) );
  INVx1_ASAP7_75t_R U4279 ( .A(\lut_delta\[12\] ), .Y(n4426) );
  INVx1_ASAP7_75t_R U4280 ( .A(\lut_delta\[13\] ), .Y(n4425) );
  INVx1_ASAP7_75t_R U4281 ( .A(\lut_delta\[14\] ), .Y(n4424) );
  INVx1_ASAP7_75t_R U4282 ( .A(\lut_delta\[15\] ), .Y(n4423) );
  INVx1_ASAP7_75t_R U4283 ( .A(\lut_delta\[16\] ), .Y(n4422) );
  INVx1_ASAP7_75t_R U4284 ( .A(\lut_delta\[17\] ), .Y(n4421) );
  INVx1_ASAP7_75t_R U4285 ( .A(\lut_delta\[18\] ), .Y(n4420) );
  INVx1_ASAP7_75t_R U4286 ( .A(\lut_delta\[19\] ), .Y(n4419) );
  INVx1_ASAP7_75t_R U4287 ( .A(\lut_delta\[20\] ), .Y(n4418) );
  INVx1_ASAP7_75t_R U4288 ( .A(\lut_delta\[21\] ), .Y(n4417) );
  INVx1_ASAP7_75t_R U4289 ( .A(\lut_delta\[22\] ), .Y(n4416) );
  INVx1_ASAP7_75t_R U4290 ( .A(\lut_delta\[23\] ), .Y(n4415) );
  INVx1_ASAP7_75t_R U4291 ( .A(n3589), .Y(n3594) );
  INVx1_ASAP7_75t_R U4292 ( .A(n3588), .Y(n3593) );
  INVx1_ASAP7_75t_R U4293 ( .A(n3587), .Y(n3592) );
  AND2x2_ASAP7_75t_R U4294 ( .A(\s5_interp_hi_hi_hi\[2\] ), .B(
        \s5_interp_hi_hi_lo\[8\] ), .Y(n3305) );
  OAI22xp5_ASAP7_75t_R U4295 ( .A1(\s5_interp_hi_hi_hi\[2\] ), .A2(
        \s5_interp_hi_hi_lo\[8\] ), .B1(n2992), .B2(n3305), .Y(n3306) );
  INVx1_ASAP7_75t_R U4296 ( .A(n3306), .Y(n3401) );
  AND2x2_ASAP7_75t_R U4297 ( .A(\s5_interp_hi_hi_hi\[3\] ), .B(
        \s5_interp_hi_hi_lo\[9\] ), .Y(n3307) );
  OAI22xp5_ASAP7_75t_R U4298 ( .A1(\s5_interp_hi_hi_hi\[3\] ), .A2(
        \s5_interp_hi_hi_lo\[9\] ), .B1(n3401), .B2(n3307), .Y(n3308) );
  INVx1_ASAP7_75t_R U4299 ( .A(n3308), .Y(n3400) );
  AND2x2_ASAP7_75t_R U4300 ( .A(\s5_interp_hi_hi_hi\[4\] ), .B(
        \s5_interp_hi_hi_lo\[10\] ), .Y(n3309) );
  OAI22xp5_ASAP7_75t_R U4301 ( .A1(\s5_interp_hi_hi_hi\[4\] ), .A2(
        \s5_interp_hi_hi_lo\[10\] ), .B1(n3400), .B2(n3309), .Y(n3310) );
  INVx1_ASAP7_75t_R U4302 ( .A(n3310), .Y(n3399) );
  AND2x2_ASAP7_75t_R U4303 ( .A(\s5_interp_hi_hi_hi\[5\] ), .B(
        \s5_interp_hi_hi_lo\[11\] ), .Y(n3311) );
  OAI22xp5_ASAP7_75t_R U4304 ( .A1(\s5_interp_hi_hi_hi\[5\] ), .A2(
        \s5_interp_hi_hi_lo\[11\] ), .B1(n3399), .B2(n3311), .Y(n3312) );
  INVx1_ASAP7_75t_R U4305 ( .A(n3312), .Y(n3398) );
  AND2x2_ASAP7_75t_R U4306 ( .A(\s5_interp_hi_hi_hi\[6\] ), .B(
        \s5_interp_hi_hi_lo\[12\] ), .Y(n3313) );
  OAI22xp5_ASAP7_75t_R U4307 ( .A1(\s5_interp_hi_hi_hi\[6\] ), .A2(
        \s5_interp_hi_hi_lo\[12\] ), .B1(n3398), .B2(n3313), .Y(n3314) );
  INVx1_ASAP7_75t_R U4308 ( .A(n3314), .Y(n3397) );
  AND2x2_ASAP7_75t_R U4309 ( .A(\s5_interp_hi_hi_hi\[7\] ), .B(
        \s5_interp_hi_hi_lo\[13\] ), .Y(n3315) );
  OAI22xp5_ASAP7_75t_R U4310 ( .A1(\s5_interp_hi_hi_hi\[7\] ), .A2(
        \s5_interp_hi_hi_lo\[13\] ), .B1(n3397), .B2(n3315), .Y(n3316) );
  INVx1_ASAP7_75t_R U4311 ( .A(n3316), .Y(n3396) );
  NAND2xp5_ASAP7_75t_R U4312 ( .A(\s5_interp_hi_hi_hi\[8\] ), .B(n3396), .Y(
        n3395) );
  INVx1_ASAP7_75t_R U4313 ( .A(n3395), .Y(n3591) );
  INVx1_ASAP7_75t_R U4314 ( .A(n3581), .Y(n3586) );
  INVx1_ASAP7_75t_R U4315 ( .A(n3580), .Y(n3585) );
  INVx1_ASAP7_75t_R U4316 ( .A(n3579), .Y(n3584) );
  INVx1_ASAP7_75t_R U4317 ( .A(\interp_hi_lo_hi\[8\] ), .Y(n4138) );
  INVx1_ASAP7_75t_R U4318 ( .A(\interp_hi_lo_lo\[12\] ), .Y(n4147) );
  INVx1_ASAP7_75t_R U4319 ( .A(\interp_hi_lo_hi\[6\] ), .Y(n4140) );
  INVx1_ASAP7_75t_R U4320 ( .A(\interp_hi_lo_lo\[13\] ), .Y(n4146) );
  INVx1_ASAP7_75t_R U4321 ( .A(\interp_hi_lo_hi\[7\] ), .Y(n4139) );
  AND2x2_ASAP7_75t_R U4322 ( .A(\s5_interp_hi_lo_hi\[2\] ), .B(
        \s5_interp_hi_lo_lo\[8\] ), .Y(n3317) );
  OAI22xp5_ASAP7_75t_R U4323 ( .A1(\s5_interp_hi_lo_hi\[2\] ), .A2(
        \s5_interp_hi_lo_lo\[8\] ), .B1(n2993), .B2(n3317), .Y(n3318) );
  INVx1_ASAP7_75t_R U4324 ( .A(n3318), .Y(n3453) );
  AND2x2_ASAP7_75t_R U4325 ( .A(\s5_interp_hi_lo_hi\[3\] ), .B(
        \s5_interp_hi_lo_lo\[9\] ), .Y(n3319) );
  OAI22xp5_ASAP7_75t_R U4326 ( .A1(\s5_interp_hi_lo_hi\[3\] ), .A2(
        \s5_interp_hi_lo_lo\[9\] ), .B1(n3453), .B2(n3319), .Y(n3320) );
  INVx1_ASAP7_75t_R U4327 ( .A(n3320), .Y(n3452) );
  AND2x2_ASAP7_75t_R U4328 ( .A(\s5_interp_hi_lo_hi\[4\] ), .B(
        \s5_interp_hi_lo_lo\[10\] ), .Y(n3321) );
  OAI22xp5_ASAP7_75t_R U4329 ( .A1(\s5_interp_hi_lo_hi\[4\] ), .A2(
        \s5_interp_hi_lo_lo\[10\] ), .B1(n3452), .B2(n3321), .Y(n3322) );
  INVx1_ASAP7_75t_R U4330 ( .A(n3322), .Y(n3451) );
  AND2x2_ASAP7_75t_R U4331 ( .A(\s5_interp_hi_lo_hi\[5\] ), .B(
        \s5_interp_hi_lo_lo\[11\] ), .Y(n3323) );
  OAI22xp5_ASAP7_75t_R U4332 ( .A1(\s5_interp_hi_lo_hi\[5\] ), .A2(
        \s5_interp_hi_lo_lo\[11\] ), .B1(n3451), .B2(n3323), .Y(n3324) );
  INVx1_ASAP7_75t_R U4333 ( .A(n3324), .Y(n3402) );
  AND2x2_ASAP7_75t_R U4334 ( .A(\s5_interp_hi_lo_hi\[6\] ), .B(
        \s5_interp_hi_lo_lo\[12\] ), .Y(n3325) );
  OAI22xp5_ASAP7_75t_R U4335 ( .A1(\s5_interp_hi_lo_hi\[6\] ), .A2(
        \s5_interp_hi_lo_lo\[12\] ), .B1(n3402), .B2(n3325), .Y(n3326) );
  INVx1_ASAP7_75t_R U4336 ( .A(n3326), .Y(n3403) );
  AND2x2_ASAP7_75t_R U4337 ( .A(\s5_interp_hi_lo_hi\[7\] ), .B(
        \s5_interp_hi_lo_lo\[13\] ), .Y(n3327) );
  OAI22xp5_ASAP7_75t_R U4338 ( .A1(\s5_interp_hi_lo_hi\[7\] ), .A2(
        \s5_interp_hi_lo_lo\[13\] ), .B1(n3403), .B2(n3327), .Y(n3328) );
  INVx1_ASAP7_75t_R U4339 ( .A(n3328), .Y(n3404) );
  NAND2xp5_ASAP7_75t_R U4340 ( .A(\s5_interp_hi_lo_hi\[8\] ), .B(n3404), .Y(
        n3405) );
  INVx1_ASAP7_75t_R U4341 ( .A(n3405), .Y(n3583) );
  INVx1_ASAP7_75t_R U4342 ( .A(n3573), .Y(n3578) );
  INVx1_ASAP7_75t_R U4343 ( .A(n3572), .Y(n3577) );
  INVx1_ASAP7_75t_R U4344 ( .A(n3571), .Y(n3576) );
  AND2x2_ASAP7_75t_R U4345 ( .A(\s5_interp_lo_hi_hi\[2\] ), .B(
        \s5_interp_lo_hi_lo\[8\] ), .Y(n3329) );
  OAI22xp5_ASAP7_75t_R U4346 ( .A1(\s5_interp_lo_hi_hi\[2\] ), .A2(
        \s5_interp_lo_hi_lo\[8\] ), .B1(n2987), .B2(n3329), .Y(n3330) );
  INVx1_ASAP7_75t_R U4347 ( .A(n3330), .Y(n3462) );
  AND2x2_ASAP7_75t_R U4348 ( .A(\s5_interp_lo_hi_hi\[3\] ), .B(
        \s5_interp_lo_hi_lo\[9\] ), .Y(n3331) );
  OAI22xp5_ASAP7_75t_R U4349 ( .A1(\s5_interp_lo_hi_hi\[3\] ), .A2(
        \s5_interp_lo_hi_lo\[9\] ), .B1(n3462), .B2(n3331), .Y(n3332) );
  INVx1_ASAP7_75t_R U4350 ( .A(n3332), .Y(n3461) );
  AND2x2_ASAP7_75t_R U4351 ( .A(\s5_interp_lo_hi_hi\[4\] ), .B(
        \s5_interp_lo_hi_lo\[10\] ), .Y(n3333) );
  OAI22xp5_ASAP7_75t_R U4352 ( .A1(\s5_interp_lo_hi_hi\[4\] ), .A2(
        \s5_interp_lo_hi_lo\[10\] ), .B1(n3461), .B2(n3333), .Y(n3334) );
  INVx1_ASAP7_75t_R U4353 ( .A(n3334), .Y(n3460) );
  AND2x2_ASAP7_75t_R U4354 ( .A(\s5_interp_lo_hi_hi\[5\] ), .B(
        \s5_interp_lo_hi_lo\[11\] ), .Y(n3335) );
  OAI22xp5_ASAP7_75t_R U4355 ( .A1(\s5_interp_lo_hi_hi\[5\] ), .A2(
        \s5_interp_lo_hi_lo\[11\] ), .B1(n3460), .B2(n3335), .Y(n3336) );
  INVx1_ASAP7_75t_R U4356 ( .A(n3336), .Y(n3459) );
  AND2x2_ASAP7_75t_R U4357 ( .A(\s5_interp_lo_hi_hi\[6\] ), .B(
        \s5_interp_lo_hi_lo\[12\] ), .Y(n3337) );
  OAI22xp5_ASAP7_75t_R U4358 ( .A1(\s5_interp_lo_hi_hi\[6\] ), .A2(
        \s5_interp_lo_hi_lo\[12\] ), .B1(n3459), .B2(n3337), .Y(n3338) );
  INVx1_ASAP7_75t_R U4359 ( .A(n3338), .Y(n3458) );
  AND2x2_ASAP7_75t_R U4360 ( .A(\s5_interp_lo_hi_hi\[7\] ), .B(
        \s5_interp_lo_hi_lo\[13\] ), .Y(n3339) );
  OAI22xp5_ASAP7_75t_R U4361 ( .A1(\s5_interp_lo_hi_hi\[7\] ), .A2(
        \s5_interp_lo_hi_lo\[13\] ), .B1(n3458), .B2(n3339), .Y(n3340) );
  INVx1_ASAP7_75t_R U4362 ( .A(n3340), .Y(n3457) );
  AND2x2_ASAP7_75t_R U4363 ( .A(\s5_interp_lo_hi_hi\[8\] ), .B(
        \s5_interp_lo_hi_lo\[14\] ), .Y(n3341) );
  OAI22xp5_ASAP7_75t_R U4364 ( .A1(\s5_interp_lo_hi_hi\[8\] ), .A2(
        \s5_interp_lo_hi_lo\[14\] ), .B1(n3457), .B2(n3341), .Y(n3342) );
  INVx1_ASAP7_75t_R U4365 ( .A(n3342), .Y(n3456) );
  NAND2xp5_ASAP7_75t_R U4366 ( .A(\s5_interp_lo_hi_hi\[9\] ), .B(n3456), .Y(
        n3455) );
  INVx1_ASAP7_75t_R U4367 ( .A(n3455), .Y(n3575) );
  INVx1_ASAP7_75t_R U4368 ( .A(n3565), .Y(n3570) );
  INVx1_ASAP7_75t_R U4369 ( .A(n3564), .Y(n3569) );
  INVx1_ASAP7_75t_R U4370 ( .A(\interp_lo_lo_hi\[10\] ), .Y(n4083) );
  INVx1_ASAP7_75t_R U4371 ( .A(\interp_lo_lo_hi\[9\] ), .Y(n4084) );
  INVx1_ASAP7_75t_R U4372 ( .A(\interp_lo_lo_lo\[12\] ), .Y(n4095) );
  INVx1_ASAP7_75t_R U4373 ( .A(\interp_lo_lo_hi\[6\] ), .Y(n4087) );
  INVx1_ASAP7_75t_R U4374 ( .A(\interp_lo_lo_lo\[13\] ), .Y(n4094) );
  INVx1_ASAP7_75t_R U4375 ( .A(\interp_lo_lo_hi\[7\] ), .Y(n4086) );
  INVx1_ASAP7_75t_R U4376 ( .A(\interp_lo_lo_lo\[14\] ), .Y(n4093) );
  INVx1_ASAP7_75t_R U4377 ( .A(\interp_lo_lo_hi\[8\] ), .Y(n4085) );
  INVx1_ASAP7_75t_R U4378 ( .A(n3563), .Y(n3471) );
  AND2x2_ASAP7_75t_R U4379 ( .A(\s5_interp_lo_lo_hi\[4\] ), .B(
        \s5_interp_lo_lo_lo\[10\] ), .Y(n3343) );
  OAI22xp5_ASAP7_75t_R U4380 ( .A1(\s5_interp_lo_lo_hi\[4\] ), .A2(
        \s5_interp_lo_lo_lo\[10\] ), .B1(n2988), .B2(n3343), .Y(n3344) );
  INVx1_ASAP7_75t_R U4381 ( .A(n3344), .Y(n3470) );
  AND2x2_ASAP7_75t_R U4382 ( .A(\s5_interp_lo_lo_hi\[5\] ), .B(
        \s5_interp_lo_lo_lo\[11\] ), .Y(n3345) );
  OAI22xp5_ASAP7_75t_R U4383 ( .A1(\s5_interp_lo_lo_hi\[5\] ), .A2(
        \s5_interp_lo_lo_lo\[11\] ), .B1(n3470), .B2(n3345), .Y(n3346) );
  INVx1_ASAP7_75t_R U4384 ( .A(n3346), .Y(n3469) );
  AND2x2_ASAP7_75t_R U4385 ( .A(\s5_interp_lo_lo_hi\[6\] ), .B(
        \s5_interp_lo_lo_lo\[12\] ), .Y(n3347) );
  OAI22xp5_ASAP7_75t_R U4386 ( .A1(\s5_interp_lo_lo_hi\[6\] ), .A2(
        \s5_interp_lo_lo_lo\[12\] ), .B1(n3469), .B2(n3347), .Y(n3348) );
  INVx1_ASAP7_75t_R U4387 ( .A(n3348), .Y(n3468) );
  AND2x2_ASAP7_75t_R U4388 ( .A(\s5_interp_lo_lo_hi\[7\] ), .B(
        \s5_interp_lo_lo_lo\[13\] ), .Y(n3349) );
  OAI22xp5_ASAP7_75t_R U4389 ( .A1(\s5_interp_lo_lo_hi\[7\] ), .A2(
        \s5_interp_lo_lo_lo\[13\] ), .B1(n3468), .B2(n3349), .Y(n3350) );
  INVx1_ASAP7_75t_R U4390 ( .A(n3350), .Y(n3467) );
  AND2x2_ASAP7_75t_R U4391 ( .A(\s5_interp_lo_lo_hi\[8\] ), .B(
        \s5_interp_lo_lo_lo\[14\] ), .Y(n3351) );
  OAI22xp5_ASAP7_75t_R U4392 ( .A1(\s5_interp_lo_lo_hi\[8\] ), .A2(
        \s5_interp_lo_lo_lo\[14\] ), .B1(n3467), .B2(n3351), .Y(n3352) );
  INVx1_ASAP7_75t_R U4393 ( .A(n3352), .Y(n3466) );
  NAND2xp5_ASAP7_75t_R U4394 ( .A(\s5_interp_lo_lo_hi\[9\] ), .B(n3466), .Y(
        n3465) );
  INVx1_ASAP7_75t_R U4395 ( .A(n3465), .Y(n3464) );
  NAND2xp5_ASAP7_75t_R U4396 ( .A(\s5_interp_lo_lo_hi\[10\] ), .B(n3464), .Y(
        n3463) );
  INVx1_ASAP7_75t_R U4397 ( .A(n3463), .Y(n3568) );
  INVx1_ASAP7_75t_R U4398 ( .A(\rexp\[9\] ), .Y(n3525) );
  INVx1_ASAP7_75t_R U4399 ( .A(n3528), .Y(n3524) );
  INVx1_ASAP7_75t_R U4400 ( .A(\x\[7\] ), .Y(n3510) );
  INVx1_ASAP7_75t_R U4401 ( .A(\x\[9\] ), .Y(n3508) );
  INVx1_ASAP7_75t_R U4402 ( .A(\x\[8\] ), .Y(n3509) );
  INVx1_ASAP7_75t_R U4403 ( .A(\x\[10\] ), .Y(n3605) );
  INVx1_ASAP7_75t_R U4404 ( .A(\x\[11\] ), .Y(n3607) );
  INVx1_ASAP7_75t_R U4405 ( .A(\x\[13\] ), .Y(n3612) );
  INVx1_ASAP7_75t_R U4406 ( .A(\x\[12\] ), .Y(n3609) );
  INVx1_ASAP7_75t_R U4407 ( .A(\x\[14\] ), .Y(n3615) );
  INVx1_ASAP7_75t_R U4408 ( .A(\x\[15\] ), .Y(n3617) );
  INVx1_ASAP7_75t_R U4409 ( .A(\x\[17\] ), .Y(n3507) );
  INVx1_ASAP7_75t_R U4410 ( .A(\x\[16\] ), .Y(n3619) );
  INVx1_ASAP7_75t_R U4411 ( .A(\x\[18\] ), .Y(n3506) );
  INVx1_ASAP7_75t_R U4412 ( .A(\x\[19\] ), .Y(n3505) );
  INVx1_ASAP7_75t_R U4413 ( .A(n2864), .Y(n3626) );
  INVx1_ASAP7_75t_R U4414 ( .A(n2874), .Y(n3511) );
  INVx1_ASAP7_75t_R U4415 ( .A(\x\[5\] ), .Y(n3637) );
  INVx1_ASAP7_75t_R U4416 ( .A(n2875), .Y(n3512) );
  INVx1_ASAP7_75t_R U4417 ( .A(n2881), .Y(n3635) );
  INVx1_ASAP7_75t_R U4418 ( .A(\x\[4\] ), .Y(n3639) );
  INVx1_ASAP7_75t_R U4419 ( .A(\x\[6\] ), .Y(n3640) );
  OAI21xp5_ASAP7_75t_R U4420 ( .A1(n3800), .A2(n3801), .B(n3556), .Y(n3655) );
  AND2x2_ASAP7_75t_R U4421 ( .A(n3354), .B(n3353), .Y(n3474) );
  INVx1_ASAP7_75t_R U4422 ( .A(n3655), .Y(n3355) );
  INVx1_ASAP7_75t_R U4423 ( .A(n3735), .Y(n3517) );
  INVx1_ASAP7_75t_R U4424 ( .A(n3715), .Y(n3499) );
  INVx1_ASAP7_75t_R U4425 ( .A(n3356), .Y(n3699) );
  INVx1_ASAP7_75t_R U4426 ( .A(n3767), .Y(n3486) );
  INVx1_ASAP7_75t_R U4427 ( .A(n3738), .Y(n3675) );
  INVx1_ASAP7_75t_R U4428 ( .A(n3357), .Y(n3488) );
  INVx1_ASAP7_75t_R U4429 ( .A(n3762), .Y(n3503) );
  INVx1_ASAP7_75t_R U4430 ( .A(n3674), .Y(n3501) );
  INVx1_ASAP7_75t_R U4431 ( .A(n3780), .Y(n3515) );
  INVx1_ASAP7_75t_R U4432 ( .A(n3358), .Y(n3491) );
  INVx1_ASAP7_75t_R U4433 ( .A(n3359), .Y(n3484) );
  INVx1_ASAP7_75t_R U4434 ( .A(n3360), .Y(n3729) );
  INVx1_ASAP7_75t_R U4435 ( .A(n3694), .Y(n3742) );
  INVx1_ASAP7_75t_R U4436 ( .A(n3556), .Y(\exp_field\[8\] ) );
  NAND2xp5_ASAP7_75t_R U4437 ( .A(N235), .B(n3029), .Y(n4029) );
  NAND2xp5_ASAP7_75t_R U4438 ( .A(N236), .B(n3029), .Y(n4040) );
  NAND2xp5_ASAP7_75t_R U4439 ( .A(N237), .B(n3029), .Y(n4043) );
  NAND2xp5_ASAP7_75t_R U4440 ( .A(N238), .B(n3029), .Y(n4044) );
  NAND2xp5_ASAP7_75t_R U4441 ( .A(N239), .B(n3029), .Y(n4045) );
  NAND2xp5_ASAP7_75t_R U4442 ( .A(N240), .B(n3029), .Y(n4046) );
  NAND2xp5_ASAP7_75t_R U4443 ( .A(N241), .B(n3029), .Y(n4047) );
  NAND2xp5_ASAP7_75t_R U4444 ( .A(N242), .B(n3029), .Y(n4048) );
  NAND2xp5_ASAP7_75t_R U4445 ( .A(N243), .B(n3029), .Y(n4049) );
  NAND2xp5_ASAP7_75t_R U4446 ( .A(N244), .B(n3029), .Y(n4050) );
  NAND2xp5_ASAP7_75t_R U4447 ( .A(N245), .B(n3029), .Y(n4030) );
  NAND2xp5_ASAP7_75t_R U4448 ( .A(N246), .B(n3029), .Y(n4031) );
  INVx1_ASAP7_75t_R U4449 ( .A(\s3_lut_base\[9\] ), .Y(n4749) );
  INVx1_ASAP7_75t_R U4450 ( .A(\s3_lut_base\[10\] ), .Y(n4748) );
  INVx1_ASAP7_75t_R U4451 ( .A(\s3_lut_base\[11\] ), .Y(n4747) );
  INVx1_ASAP7_75t_R U4452 ( .A(\s3_lut_base\[12\] ), .Y(n4746) );
  INVx1_ASAP7_75t_R U4453 ( .A(\s3_lut_base\[13\] ), .Y(n4745) );
  INVx1_ASAP7_75t_R U4454 ( .A(\s3_lut_base\[14\] ), .Y(n4744) );
  INVx1_ASAP7_75t_R U4455 ( .A(\s3_lut_base\[15\] ), .Y(n4743) );
  INVx1_ASAP7_75t_R U4456 ( .A(\s3_lut_base\[16\] ), .Y(n4742) );
  INVx1_ASAP7_75t_R U4457 ( .A(\s3_lut_base\[17\] ), .Y(n4741) );
  INVx1_ASAP7_75t_R U4458 ( .A(\s3_lut_base\[18\] ), .Y(n4740) );
  INVx1_ASAP7_75t_R U4459 ( .A(\s3_lut_base\[19\] ), .Y(n4739) );
  INVx1_ASAP7_75t_R U4460 ( .A(\s3_lut_base\[20\] ), .Y(n4738) );
  INVx1_ASAP7_75t_R U4461 ( .A(\s3_lut_base\[21\] ), .Y(n4737) );
  INVx1_ASAP7_75t_R U4462 ( .A(\s3_lut_base\[22\] ), .Y(n4736) );
  INVx1_ASAP7_75t_R U4463 ( .A(N224), .Y(n3362) );
  INVx1_ASAP7_75t_R U4464 ( .A(\prod\[46\] ), .Y(n3361) );
  OAI22xp5_ASAP7_75t_R U4465 ( .A1(n2966), .A2(n3362), .B1(n3030), .B2(n3361), 
        .Y(n3363) );
  INVx1_ASAP7_75t_R U4466 ( .A(n3363), .Y(n4027) );
  INVx1_ASAP7_75t_R U4467 ( .A(N225), .Y(n3365) );
  INVx1_ASAP7_75t_R U4468 ( .A(\prod\[47\] ), .Y(n3364) );
  OAI22xp5_ASAP7_75t_R U4469 ( .A1(n2966), .A2(n3365), .B1(n3030), .B2(n3364), 
        .Y(n3366) );
  INVx1_ASAP7_75t_R U4470 ( .A(n3366), .Y(n4026) );
  INVx1_ASAP7_75t_R U4471 ( .A(N226), .Y(n3368) );
  INVx1_ASAP7_75t_R U4472 ( .A(\prod\[48\] ), .Y(n3367) );
  OAI22xp5_ASAP7_75t_R U4473 ( .A1(n2966), .A2(n3368), .B1(n3030), .B2(n3367), 
        .Y(n3369) );
  INVx1_ASAP7_75t_R U4474 ( .A(n3369), .Y(n4025) );
  INVx1_ASAP7_75t_R U4475 ( .A(N227), .Y(n3371) );
  INVx1_ASAP7_75t_R U4476 ( .A(\prod\[49\] ), .Y(n3370) );
  OAI22xp5_ASAP7_75t_R U4477 ( .A1(n2966), .A2(n3371), .B1(n3030), .B2(n3370), 
        .Y(n3372) );
  INVx1_ASAP7_75t_R U4478 ( .A(n3372), .Y(n4024) );
  INVx1_ASAP7_75t_R U4479 ( .A(N228), .Y(n3374) );
  INVx1_ASAP7_75t_R U4480 ( .A(\prod\[50\] ), .Y(n3373) );
  OAI22xp5_ASAP7_75t_R U4481 ( .A1(n2966), .A2(n3374), .B1(n3030), .B2(n3373), 
        .Y(n3375) );
  INVx1_ASAP7_75t_R U4482 ( .A(n3375), .Y(n4023) );
  INVx1_ASAP7_75t_R U4483 ( .A(N229), .Y(n3377) );
  INVx1_ASAP7_75t_R U4484 ( .A(\prod\[51\] ), .Y(n3376) );
  OAI22xp5_ASAP7_75t_R U4485 ( .A1(n2966), .A2(n3377), .B1(n3030), .B2(n3376), 
        .Y(n3378) );
  INVx1_ASAP7_75t_R U4486 ( .A(n3378), .Y(n4022) );
  INVx1_ASAP7_75t_R U4487 ( .A(N230), .Y(n3380) );
  INVx1_ASAP7_75t_R U4488 ( .A(\prod\[52\] ), .Y(n3379) );
  OAI22xp5_ASAP7_75t_R U4489 ( .A1(n2966), .A2(n3380), .B1(n3030), .B2(n3379), 
        .Y(n3381) );
  INVx1_ASAP7_75t_R U4490 ( .A(n3381), .Y(n4021) );
  INVx1_ASAP7_75t_R U4491 ( .A(N231), .Y(n3383) );
  INVx1_ASAP7_75t_R U4492 ( .A(\prod\[53\] ), .Y(n3382) );
  OAI22xp5_ASAP7_75t_R U4493 ( .A1(n2966), .A2(n3383), .B1(n3030), .B2(n3382), 
        .Y(n3384) );
  INVx1_ASAP7_75t_R U4494 ( .A(n3384), .Y(n3473) );
  INVx1_ASAP7_75t_R U4495 ( .A(N232), .Y(n3386) );
  INVx1_ASAP7_75t_R U4496 ( .A(\prod\[54\] ), .Y(n3385) );
  OAI22xp5_ASAP7_75t_R U4497 ( .A1(n2966), .A2(n3386), .B1(n3030), .B2(n3385), 
        .Y(n3387) );
  INVx1_ASAP7_75t_R U4498 ( .A(n3387), .Y(n3472) );
  NOR5xp2_ASAP7_75t_R U4499 ( .A(n4024), .B(n4023), .C(n4025), .D(n4027), .E(
        n4026), .Y(n3394) );
  INVx1_ASAP7_75t_R U4500 ( .A(s2m_clamp_big), .Y(n3388) );
  OAI21xp5_ASAP7_75t_R U4501 ( .A1(n3390), .A2(n3389), .B(n3388), .Y(n3392) );
  NAND2xp5_ASAP7_75t_R U4502 ( .A(n3472), .B(n3473), .Y(n3391) );
  INVx1_ASAP7_75t_R U4503 ( .A(\prod_lo\[8\] ), .Y(n4375) );
  INVx1_ASAP7_75t_R U4504 ( .A(\prod_lo\[9\] ), .Y(n4374) );
  INVx1_ASAP7_75t_R U4505 ( .A(\prod_lo\[10\] ), .Y(n4373) );
  INVx1_ASAP7_75t_R U4506 ( .A(\prod_lo\[11\] ), .Y(n4372) );
  INVx1_ASAP7_75t_R U4507 ( .A(\prod_lo\[12\] ), .Y(n4371) );
  INVx1_ASAP7_75t_R U4508 ( .A(\prod_lo\[13\] ), .Y(n4370) );
  INVx1_ASAP7_75t_R U4509 ( .A(\prod_lo\[14\] ), .Y(n4369) );
  INVx1_ASAP7_75t_R U4510 ( .A(\prod_lo\[15\] ), .Y(n4368) );
  INVx1_ASAP7_75t_R U4511 ( .A(\prod_lo_lo\[4\] ), .Y(n4243) );
  INVx1_ASAP7_75t_R U4512 ( .A(\prod_lo_lo\[5\] ), .Y(n4242) );
  INVx1_ASAP7_75t_R U4513 ( .A(\prod_lo_lo\[6\] ), .Y(n4241) );
  INVx1_ASAP7_75t_R U4514 ( .A(\prod_lo_lo\[7\] ), .Y(n4240) );
  INVx1_ASAP7_75t_R U4515 ( .A(\s1_mag_u\[0\] ), .Y(n4596) );
  INVx1_ASAP7_75t_R U4516 ( .A(\s3_lut_base\[8\] ), .Y(n4750) );
  INVx1_ASAP7_75t_R U4517 ( .A(\s3_lut_base\[7\] ), .Y(n4751) );
  INVx1_ASAP7_75t_R U4518 ( .A(\s3_lut_base\[6\] ), .Y(n4752) );
  INVx1_ASAP7_75t_R U4519 ( .A(\s3_lut_base\[5\] ), .Y(n4753) );
  INVx1_ASAP7_75t_R U4520 ( .A(\s3_lut_base\[4\] ), .Y(n4754) );
  INVx1_ASAP7_75t_R U4521 ( .A(\s3_lut_base\[3\] ), .Y(n4755) );
  INVx1_ASAP7_75t_R U4522 ( .A(\s3_lut_base\[2\] ), .Y(n4756) );
  INVx1_ASAP7_75t_R U4523 ( .A(\s3_lut_base\[1\] ), .Y(n4757) );
  INVx1_ASAP7_75t_R U4524 ( .A(\s3_lut_base\[0\] ), .Y(n4758) );
  XOR2xp5_ASAP7_75t_R U4525 ( .A(n3590), .B(\s5_interp_hi_hi_hi\[13\] ), .Y(
        n4508) );
  XOR2xp5_ASAP7_75t_R U4526 ( .A(\s5_interp_hi_hi_hi\[12\] ), .B(n3589), .Y(
        n4509) );
  XOR2xp5_ASAP7_75t_R U4527 ( .A(\s5_interp_hi_hi_hi\[11\] ), .B(n3588), .Y(
        n4510) );
  XOR2xp5_ASAP7_75t_R U4528 ( .A(\s5_interp_hi_hi_hi\[10\] ), .B(n3587), .Y(
        n4511) );
  XOR2xp5_ASAP7_75t_R U4529 ( .A(n3395), .B(\s5_interp_hi_hi_hi\[9\] ), .Y(
        n4512) );
  OAI21xp5_ASAP7_75t_R U4530 ( .A1(\s5_interp_hi_hi_hi\[8\] ), .A2(n3396), .B(
        n3395), .Y(n4513) );
  FAx1_ASAP7_75t_R U4531 ( .A(\s5_interp_hi_hi_hi\[7\] ), .B(
        \s5_interp_hi_hi_lo\[13\] ), .CI(n3397), .SN(n4514) );
  FAx1_ASAP7_75t_R U4532 ( .A(\s5_interp_hi_hi_hi\[6\] ), .B(
        \s5_interp_hi_hi_lo\[12\] ), .CI(n3398), .SN(n4515) );
  FAx1_ASAP7_75t_R U4533 ( .A(\s5_interp_hi_hi_hi\[5\] ), .B(
        \s5_interp_hi_hi_lo\[11\] ), .CI(n3399), .SN(n4516) );
  FAx1_ASAP7_75t_R U4534 ( .A(\s5_interp_hi_hi_hi\[4\] ), .B(
        \s5_interp_hi_hi_lo\[10\] ), .CI(n3400), .SN(n4517) );
  FAx1_ASAP7_75t_R U4535 ( .A(\s5_interp_hi_hi_hi\[3\] ), .B(
        \s5_interp_hi_hi_lo\[9\] ), .CI(n3401), .SN(n4518) );
  FAx1_ASAP7_75t_R U4536 ( .A(\s5_interp_hi_hi_hi\[2\] ), .B(
        \s5_interp_hi_hi_lo\[8\] ), .CI(n2992), .SN(n4519) );
  FAx1_ASAP7_75t_R U4537 ( .A(\s5_interp_hi_lo_hi\[6\] ), .B(
        \s5_interp_hi_lo_lo\[12\] ), .CI(n3402), .SN(n4496) );
  INVx1_ASAP7_75t_R U4538 ( .A(\interp_hi_hi_lo\[0\] ), .Y(n4799) );
  FAx1_ASAP7_75t_R U4539 ( .A(\s5_interp_hi_lo_hi\[7\] ), .B(
        \s5_interp_hi_lo_lo\[13\] ), .CI(n3403), .SN(n4495) );
  INVx1_ASAP7_75t_R U4540 ( .A(\interp_hi_hi_lo\[1\] ), .Y(n4132) );
  OAI21xp5_ASAP7_75t_R U4541 ( .A1(\s5_interp_hi_lo_hi\[8\] ), .A2(n3404), .B(
        n3405), .Y(n4494) );
  INVx1_ASAP7_75t_R U4542 ( .A(\interp_hi_hi_lo\[2\] ), .Y(n4131) );
  XOR2xp5_ASAP7_75t_R U4543 ( .A(n3405), .B(\s5_interp_hi_lo_hi\[9\] ), .Y(
        n4493) );
  INVx1_ASAP7_75t_R U4544 ( .A(\interp_hi_hi_lo\[3\] ), .Y(n4130) );
  XOR2xp5_ASAP7_75t_R U4545 ( .A(\s5_interp_hi_lo_hi\[10\] ), .B(n3579), .Y(
        n4492) );
  INVx1_ASAP7_75t_R U4546 ( .A(\interp_hi_hi_lo\[4\] ), .Y(n4129) );
  XOR2xp5_ASAP7_75t_R U4547 ( .A(\s5_interp_hi_lo_hi\[11\] ), .B(n3580), .Y(
        n4491) );
  INVx1_ASAP7_75t_R U4548 ( .A(\interp_hi_hi_lo\[5\] ), .Y(n4128) );
  XOR2xp5_ASAP7_75t_R U4549 ( .A(\s5_interp_hi_lo_hi\[12\] ), .B(n3581), .Y(
        n4490) );
  XNOR2xp5_ASAP7_75t_R U4550 ( .A(\s5_interp_hi_hi_hi\[0\] ), .B(
        \s5_interp_hi_hi_lo\[6\] ), .Y(n4521) );
  INVx1_ASAP7_75t_R U4551 ( .A(\interp_hi_lo_hi\[13\] ), .Y(n4133) );
  XOR2xp5_ASAP7_75t_R U4552 ( .A(n3582), .B(\s5_interp_hi_lo_hi\[13\] ), .Y(
        n4489) );
  FAx1_ASAP7_75t_R U4553 ( .A(\s5_interp_hi_hi_hi\[1\] ), .B(
        \s5_interp_hi_hi_lo\[7\] ), .CI(n2990), .SN(n4520) );
  NAND2xp5_ASAP7_75t_R U4554 ( .A(\s6_interp_hi_hi\[0\] ), .B(
        \s6_interp_hi_lo\[12\] ), .Y(n3450) );
  NAND2xp5_ASAP7_75t_R U4555 ( .A(\s6_interp_hi_hi\[1\] ), .B(
        \s6_interp_hi_lo\[13\] ), .Y(n3407) );
  AND2x2_ASAP7_75t_R U4556 ( .A(\s6_interp_hi_hi\[2\] ), .B(
        \s6_interp_hi_lo\[14\] ), .Y(n3408) );
  OAI22xp5_ASAP7_75t_R U4557 ( .A1(\s6_interp_hi_hi\[2\] ), .A2(
        \s6_interp_hi_lo\[14\] ), .B1(n3448), .B2(n3408), .Y(n3446) );
  NAND2xp5_ASAP7_75t_R U4558 ( .A(\s6_interp_hi_hi\[3\] ), .B(
        \s6_interp_hi_lo\[15\] ), .Y(n3410) );
  AND2x2_ASAP7_75t_R U4559 ( .A(\s6_interp_hi_hi\[4\] ), .B(
        \s6_interp_hi_lo\[16\] ), .Y(n3411) );
  OAI22xp5_ASAP7_75t_R U4560 ( .A1(\s6_interp_hi_hi\[4\] ), .A2(
        \s6_interp_hi_lo\[16\] ), .B1(n3445), .B2(n3411), .Y(n3443) );
  NAND2xp5_ASAP7_75t_R U4561 ( .A(\s6_interp_hi_hi\[5\] ), .B(
        \s6_interp_hi_lo\[17\] ), .Y(n3413) );
  AND2x2_ASAP7_75t_R U4562 ( .A(\s6_interp_hi_hi\[6\] ), .B(
        \s6_interp_hi_lo\[18\] ), .Y(n3414) );
  OAI22xp5_ASAP7_75t_R U4563 ( .A1(\s6_interp_hi_hi\[6\] ), .A2(
        \s6_interp_hi_lo\[18\] ), .B1(n3442), .B2(n3414), .Y(n3440) );
  NAND2xp5_ASAP7_75t_R U4564 ( .A(\s6_interp_hi_hi\[7\] ), .B(
        \s6_interp_hi_lo\[19\] ), .Y(n3416) );
  NAND2xp5_ASAP7_75t_R U4565 ( .A(\s6_interp_hi_hi\[8\] ), .B(n3439), .Y(n3438) );
  INVx1_ASAP7_75t_R U4566 ( .A(n3438), .Y(n3437) );
  NAND2xp5_ASAP7_75t_R U4567 ( .A(\s6_interp_hi_hi\[9\] ), .B(n3437), .Y(n3436) );
  INVx1_ASAP7_75t_R U4568 ( .A(n3436), .Y(n3435) );
  NAND2xp5_ASAP7_75t_R U4569 ( .A(\s6_interp_hi_hi\[10\] ), .B(n3435), .Y(
        n3434) );
  INVx1_ASAP7_75t_R U4570 ( .A(n3434), .Y(n3433) );
  NAND2xp5_ASAP7_75t_R U4571 ( .A(\s6_interp_hi_hi\[11\] ), .B(n3433), .Y(
        n3432) );
  INVx1_ASAP7_75t_R U4572 ( .A(n3432), .Y(n3431) );
  NAND2xp5_ASAP7_75t_R U4573 ( .A(\s6_interp_hi_hi\[12\] ), .B(n3431), .Y(
        n3430) );
  INVx1_ASAP7_75t_R U4574 ( .A(n3430), .Y(n3429) );
  NAND2xp5_ASAP7_75t_R U4575 ( .A(\s6_interp_hi_hi\[13\] ), .B(n3429), .Y(
        n3428) );
  INVx1_ASAP7_75t_R U4576 ( .A(n3428), .Y(n3427) );
  NAND2xp5_ASAP7_75t_R U4577 ( .A(\s6_interp_hi_hi\[14\] ), .B(n3427), .Y(
        n3426) );
  INVx1_ASAP7_75t_R U4578 ( .A(n3426), .Y(n3425) );
  NAND2xp5_ASAP7_75t_R U4579 ( .A(\s6_interp_hi_hi\[15\] ), .B(n3425), .Y(
        n3424) );
  INVx1_ASAP7_75t_R U4580 ( .A(n3424), .Y(n3423) );
  NAND2xp5_ASAP7_75t_R U4581 ( .A(\s6_interp_hi_hi\[16\] ), .B(n3423), .Y(
        n3422) );
  INVx1_ASAP7_75t_R U4582 ( .A(n3422), .Y(n3421) );
  NAND2xp5_ASAP7_75t_R U4583 ( .A(\s6_interp_hi_hi\[17\] ), .B(n3421), .Y(
        n3420) );
  INVx1_ASAP7_75t_R U4584 ( .A(n3420), .Y(n3418) );
  NAND2xp5_ASAP7_75t_R U4585 ( .A(\s6_interp_hi_hi\[18\] ), .B(n3418), .Y(
        n3417) );
  XOR2xp5_ASAP7_75t_R U4586 ( .A(n3417), .B(\s6_interp_hi_hi\[19\] ), .Y(n4565) );
  INVx1_ASAP7_75t_R U4587 ( .A(\s6_interp_hi_hi\[18\] ), .Y(n3419) );
  XOR2xp5_ASAP7_75t_R U4588 ( .A(n3419), .B(n3418), .Y(n4566) );
  OAI21xp5_ASAP7_75t_R U4589 ( .A1(\s6_interp_hi_hi\[17\] ), .A2(n3421), .B(
        n3420), .Y(n4567) );
  OAI21xp5_ASAP7_75t_R U4590 ( .A1(\s6_interp_hi_hi\[16\] ), .A2(n3423), .B(
        n3422), .Y(n4568) );
  OAI21xp5_ASAP7_75t_R U4591 ( .A1(\s6_interp_hi_hi\[15\] ), .A2(n3425), .B(
        n3424), .Y(n4569) );
  OAI21xp5_ASAP7_75t_R U4592 ( .A1(\s6_interp_hi_hi\[14\] ), .A2(n3427), .B(
        n3426), .Y(n4570) );
  OAI21xp5_ASAP7_75t_R U4593 ( .A1(\s6_interp_hi_hi\[13\] ), .A2(n3429), .B(
        n3428), .Y(n4571) );
  OAI21xp5_ASAP7_75t_R U4594 ( .A1(\s6_interp_hi_hi\[12\] ), .A2(n3431), .B(
        n3430), .Y(n4572) );
  OAI21xp5_ASAP7_75t_R U4595 ( .A1(\s6_interp_hi_hi\[11\] ), .A2(n3433), .B(
        n3432), .Y(n4573) );
  OAI21xp5_ASAP7_75t_R U4596 ( .A1(\s6_interp_hi_hi\[10\] ), .A2(n3435), .B(
        n3434), .Y(n4574) );
  OAI21xp5_ASAP7_75t_R U4597 ( .A1(\s6_interp_hi_hi\[9\] ), .A2(n3437), .B(
        n3436), .Y(n4575) );
  OAI21xp5_ASAP7_75t_R U4598 ( .A1(\s6_interp_hi_hi\[8\] ), .A2(n3439), .B(
        n3438), .Y(n4576) );
  FAx1_ASAP7_75t_R U4599 ( .A(\s6_interp_hi_hi\[7\] ), .B(
        \s6_interp_hi_lo\[19\] ), .CI(n3440), .SN(n3441) );
  INVx1_ASAP7_75t_R U4600 ( .A(n3441), .Y(n4577) );
  FAx1_ASAP7_75t_R U4601 ( .A(\s6_interp_hi_hi\[6\] ), .B(
        \s6_interp_hi_lo\[18\] ), .CI(n3442), .SN(n4578) );
  FAx1_ASAP7_75t_R U4602 ( .A(\s6_interp_hi_hi\[5\] ), .B(
        \s6_interp_hi_lo\[17\] ), .CI(n3443), .SN(n3444) );
  INVx1_ASAP7_75t_R U4603 ( .A(n3444), .Y(n4579) );
  FAx1_ASAP7_75t_R U4604 ( .A(\s6_interp_hi_hi\[4\] ), .B(
        \s6_interp_hi_lo\[16\] ), .CI(n3445), .SN(n4580) );
  FAx1_ASAP7_75t_R U4605 ( .A(\s6_interp_hi_hi\[3\] ), .B(
        \s6_interp_hi_lo\[15\] ), .CI(n3446), .SN(n3447) );
  INVx1_ASAP7_75t_R U4606 ( .A(n3447), .Y(n4581) );
  FAx1_ASAP7_75t_R U4607 ( .A(\s6_interp_hi_hi\[2\] ), .B(
        \s6_interp_hi_lo\[14\] ), .CI(n3448), .SN(n4582) );
  FAx1_ASAP7_75t_R U4608 ( .A(\s6_interp_hi_hi\[1\] ), .B(
        \s6_interp_hi_lo\[13\] ), .CI(n3450), .SN(n3449) );
  INVx1_ASAP7_75t_R U4609 ( .A(n3449), .Y(n4583) );
  OAI21xp5_ASAP7_75t_R U4610 ( .A1(\s6_interp_hi_hi\[0\] ), .A2(
        \s6_interp_hi_lo\[12\] ), .B(n3450), .Y(n4584) );
  FAx1_ASAP7_75t_R U4611 ( .A(\s5_interp_hi_lo_hi\[5\] ), .B(
        \s5_interp_hi_lo_lo\[11\] ), .CI(n3451), .SN(n4497) );
  FAx1_ASAP7_75t_R U4612 ( .A(\s5_interp_hi_lo_hi\[4\] ), .B(
        \s5_interp_hi_lo_lo\[10\] ), .CI(n3452), .SN(n4498) );
  FAx1_ASAP7_75t_R U4613 ( .A(\s5_interp_hi_lo_hi\[3\] ), .B(
        \s5_interp_hi_lo_lo\[9\] ), .CI(n3453), .SN(n4499) );
  FAx1_ASAP7_75t_R U4614 ( .A(\s5_interp_hi_lo_hi\[2\] ), .B(
        \s5_interp_hi_lo_lo\[8\] ), .CI(n2993), .SN(n4500) );
  FAx1_ASAP7_75t_R U4615 ( .A(\s5_interp_hi_lo_hi\[1\] ), .B(
        \s5_interp_hi_lo_lo\[7\] ), .CI(n2991), .SN(n4501) );
  XNOR2xp5_ASAP7_75t_R U4616 ( .A(\s5_interp_hi_lo_hi\[0\] ), .B(
        \s5_interp_hi_lo_lo\[6\] ), .Y(n4502) );
  INVx1_ASAP7_75t_R U4617 ( .A(\interp_hi_lo_lo\[5\] ), .Y(n4154) );
  INVx1_ASAP7_75t_R U4618 ( .A(\interp_hi_lo_lo\[4\] ), .Y(n4155) );
  INVx1_ASAP7_75t_R U4619 ( .A(\interp_hi_lo_lo\[3\] ), .Y(n4156) );
  INVx1_ASAP7_75t_R U4620 ( .A(\interp_hi_lo_lo\[2\] ), .Y(n4157) );
  INVx1_ASAP7_75t_R U4621 ( .A(\interp_hi_lo_lo\[1\] ), .Y(n4158) );
  INVx1_ASAP7_75t_R U4622 ( .A(\interp_hi_lo_lo\[0\] ), .Y(n4803) );
  XOR2xp5_ASAP7_75t_R U4623 ( .A(n3574), .B(\s5_interp_lo_hi_hi\[14\] ), .Y(
        n4469) );
  XOR2xp5_ASAP7_75t_R U4624 ( .A(\s5_interp_lo_hi_hi\[13\] ), .B(n3573), .Y(
        n4470) );
  XOR2xp5_ASAP7_75t_R U4625 ( .A(\s5_interp_lo_hi_hi\[12\] ), .B(n3572), .Y(
        n4471) );
  XOR2xp5_ASAP7_75t_R U4626 ( .A(\s5_interp_lo_hi_hi\[11\] ), .B(n3571), .Y(
        n4472) );
  INVx1_ASAP7_75t_R U4627 ( .A(\s5_interp_lo_hi_hi\[10\] ), .Y(n3454) );
  XOR2xp5_ASAP7_75t_R U4628 ( .A(n3454), .B(n3575), .Y(n4473) );
  OAI21xp5_ASAP7_75t_R U4629 ( .A1(\s5_interp_lo_hi_hi\[9\] ), .A2(n3456), .B(
        n3455), .Y(n4474) );
  FAx1_ASAP7_75t_R U4630 ( .A(\s5_interp_lo_hi_hi\[8\] ), .B(
        \s5_interp_lo_hi_lo\[14\] ), .CI(n3457), .SN(n4475) );
  FAx1_ASAP7_75t_R U4631 ( .A(\s5_interp_lo_hi_hi\[7\] ), .B(
        \s5_interp_lo_hi_lo\[13\] ), .CI(n3458), .SN(n4476) );
  FAx1_ASAP7_75t_R U4632 ( .A(\s5_interp_lo_hi_hi\[6\] ), .B(
        \s5_interp_lo_hi_lo\[12\] ), .CI(n3459), .SN(n4477) );
  FAx1_ASAP7_75t_R U4633 ( .A(\s5_interp_lo_hi_hi\[5\] ), .B(
        \s5_interp_lo_hi_lo\[11\] ), .CI(n3460), .SN(n4478) );
  FAx1_ASAP7_75t_R U4634 ( .A(\s5_interp_lo_hi_hi\[4\] ), .B(
        \s5_interp_lo_hi_lo\[10\] ), .CI(n3461), .SN(n4479) );
  FAx1_ASAP7_75t_R U4635 ( .A(\s5_interp_lo_hi_hi\[3\] ), .B(
        \s5_interp_lo_hi_lo\[9\] ), .CI(n3462), .SN(n4480) );
  FAx1_ASAP7_75t_R U4636 ( .A(\s5_interp_lo_hi_hi\[2\] ), .B(
        \s5_interp_lo_hi_lo\[8\] ), .CI(n2987), .SN(n4481) );
  FAx1_ASAP7_75t_R U4637 ( .A(\s5_interp_lo_hi_hi\[1\] ), .B(
        \s5_interp_lo_hi_lo\[7\] ), .CI(n2986), .SN(n4482) );
  XNOR2xp5_ASAP7_75t_R U4638 ( .A(\s5_interp_lo_hi_hi\[0\] ), .B(
        \s5_interp_lo_hi_lo\[6\] ), .Y(n4483) );
  INVx1_ASAP7_75t_R U4639 ( .A(\interp_lo_hi_lo\[5\] ), .Y(n4074) );
  INVx1_ASAP7_75t_R U4640 ( .A(\interp_lo_hi_lo\[4\] ), .Y(n4075) );
  INVx1_ASAP7_75t_R U4641 ( .A(\interp_lo_hi_lo\[3\] ), .Y(n4076) );
  INVx1_ASAP7_75t_R U4642 ( .A(\interp_lo_hi_lo\[2\] ), .Y(n4077) );
  INVx1_ASAP7_75t_R U4643 ( .A(\interp_lo_hi_lo\[1\] ), .Y(n4078) );
  INVx1_ASAP7_75t_R U4644 ( .A(\interp_lo_hi_lo\[0\] ), .Y(n4800) );
  XOR2xp5_ASAP7_75t_R U4645 ( .A(n3566), .B(\s5_interp_lo_lo_hi\[14\] ), .Y(
        n4452) );
  XOR2xp5_ASAP7_75t_R U4646 ( .A(\s5_interp_lo_lo_hi\[13\] ), .B(n3565), .Y(
        n4453) );
  XOR2xp5_ASAP7_75t_R U4647 ( .A(\s5_interp_lo_lo_hi\[12\] ), .B(n3564), .Y(
        n4454) );
  XOR2xp5_ASAP7_75t_R U4648 ( .A(n3463), .B(\s5_interp_lo_lo_hi\[11\] ), .Y(
        n4455) );
  OAI21xp5_ASAP7_75t_R U4649 ( .A1(\s5_interp_lo_lo_hi\[10\] ), .A2(n3464), 
        .B(n3463), .Y(n4456) );
  OAI21xp5_ASAP7_75t_R U4650 ( .A1(\s5_interp_lo_lo_hi\[9\] ), .A2(n3466), .B(
        n3465), .Y(n4457) );
  FAx1_ASAP7_75t_R U4651 ( .A(\s5_interp_lo_lo_hi\[8\] ), .B(
        \s5_interp_lo_lo_lo\[14\] ), .CI(n3467), .SN(n4458) );
  FAx1_ASAP7_75t_R U4652 ( .A(\s5_interp_lo_lo_hi\[7\] ), .B(
        \s5_interp_lo_lo_lo\[13\] ), .CI(n3468), .SN(n4459) );
  FAx1_ASAP7_75t_R U4653 ( .A(\s5_interp_lo_lo_hi\[6\] ), .B(
        \s5_interp_lo_lo_lo\[12\] ), .CI(n3469), .SN(n4460) );
  FAx1_ASAP7_75t_R U4654 ( .A(\s5_interp_lo_lo_hi\[5\] ), .B(
        \s5_interp_lo_lo_lo\[11\] ), .CI(n3470), .SN(n4461) );
  FAx1_ASAP7_75t_R U4655 ( .A(\s5_interp_lo_lo_hi\[4\] ), .B(
        \s5_interp_lo_lo_lo\[10\] ), .CI(n2988), .SN(n4462) );
  FAx1_ASAP7_75t_R U4656 ( .A(\s5_interp_lo_lo_hi\[3\] ), .B(
        \s5_interp_lo_lo_lo\[9\] ), .CI(n3471), .SN(n4463) );
  INVx1_ASAP7_75t_R U4657 ( .A(N1172), .Y(n4533) );
  INVx1_ASAP7_75t_R U4658 ( .A(N1171), .Y(n4534) );
  INVx1_ASAP7_75t_R U4659 ( .A(N1170), .Y(n4535) );
  INVx1_ASAP7_75t_R U4660 ( .A(N1169), .Y(n4536) );
  INVx1_ASAP7_75t_R U4661 ( .A(N1168), .Y(n4537) );
  INVx1_ASAP7_75t_R U4662 ( .A(N1167), .Y(n4538) );
  INVx1_ASAP7_75t_R U4663 ( .A(N1166), .Y(n4539) );
  INVx1_ASAP7_75t_R U4664 ( .A(N1165), .Y(n4540) );
  INVx1_ASAP7_75t_R U4665 ( .A(N1164), .Y(n4541) );
  INVx1_ASAP7_75t_R U4666 ( .A(N1163), .Y(n4542) );
  INVx1_ASAP7_75t_R U4667 ( .A(N1162), .Y(n4543) );
  INVx1_ASAP7_75t_R U4668 ( .A(N1161), .Y(n4544) );
  INVx1_ASAP7_75t_R U4669 ( .A(N1160), .Y(n4545) );
  INVx1_ASAP7_75t_R U4670 ( .A(N1159), .Y(n4546) );
  INVx1_ASAP7_75t_R U4671 ( .A(N1158), .Y(n4547) );
  INVx1_ASAP7_75t_R U4672 ( .A(N1157), .Y(n4548) );
  INVx1_ASAP7_75t_R U4673 ( .A(N1156), .Y(n4549) );
  INVx1_ASAP7_75t_R U4674 ( .A(N1155), .Y(n4550) );
  INVx1_ASAP7_75t_R U4675 ( .A(N1154), .Y(n4551) );
  INVx1_ASAP7_75t_R U4676 ( .A(N1153), .Y(n4552) );
  INVx1_ASAP7_75t_R U4677 ( .A(N1152), .Y(n4553) );
  OAI21xp5_ASAP7_75t_R U4678 ( .A1(\mant_frac\[0\] ), .A2(n3028), .B(n3031), 
        .Y(n4159) );
  OAI21xp5_ASAP7_75t_R U4679 ( .A1(\mant_frac\[1\] ), .A2(n3028), .B(n3031), 
        .Y(n4170) );
  OAI21xp5_ASAP7_75t_R U4680 ( .A1(\mant_frac\[2\] ), .A2(n3028), .B(n3031), 
        .Y(n4173) );
  OAI21xp5_ASAP7_75t_R U4681 ( .A1(\mant_frac\[3\] ), .A2(n3028), .B(n3031), 
        .Y(n4174) );
  OAI21xp5_ASAP7_75t_R U4682 ( .A1(\mant_frac\[4\] ), .A2(n3028), .B(n3031), 
        .Y(n4175) );
  OAI21xp5_ASAP7_75t_R U4683 ( .A1(\mant_frac\[5\] ), .A2(n3028), .B(n3031), 
        .Y(n4176) );
  OAI21xp5_ASAP7_75t_R U4684 ( .A1(\mant_frac\[6\] ), .A2(n3028), .B(n3031), 
        .Y(n4177) );
  OAI21xp5_ASAP7_75t_R U4685 ( .A1(\mant_frac\[7\] ), .A2(n3028), .B(n3031), 
        .Y(n4178) );
  OAI21xp5_ASAP7_75t_R U4686 ( .A1(\mant_frac\[8\] ), .A2(n3028), .B(n3031), 
        .Y(n4179) );
  OAI21xp5_ASAP7_75t_R U4687 ( .A1(\mant_frac\[9\] ), .A2(n3028), .B(n3031), 
        .Y(n4180) );
  OAI21xp5_ASAP7_75t_R U4688 ( .A1(\mant_frac\[10\] ), .A2(n3028), .B(n3031), 
        .Y(n4160) );
  OAI21xp5_ASAP7_75t_R U4689 ( .A1(\mant_frac\[11\] ), .A2(n3028), .B(n3031), 
        .Y(n4161) );
  OAI21xp5_ASAP7_75t_R U4690 ( .A1(\mant_frac\[12\] ), .A2(n3028), .B(n3031), 
        .Y(n4162) );
  OAI21xp5_ASAP7_75t_R U4691 ( .A1(\mant_frac\[13\] ), .A2(n3028), .B(n3031), 
        .Y(n4163) );
  OAI21xp5_ASAP7_75t_R U4692 ( .A1(\mant_frac\[14\] ), .A2(n3028), .B(n3031), 
        .Y(n4164) );
  OAI21xp5_ASAP7_75t_R U4693 ( .A1(\mant_frac\[15\] ), .A2(n3028), .B(n3031), 
        .Y(n4165) );
  OAI21xp5_ASAP7_75t_R U4694 ( .A1(\mant_frac\[16\] ), .A2(n3028), .B(n3032), 
        .Y(n4166) );
  OAI21xp5_ASAP7_75t_R U4695 ( .A1(\mant_frac\[17\] ), .A2(n3028), .B(n3032), 
        .Y(n4167) );
  OAI21xp5_ASAP7_75t_R U4696 ( .A1(\mant_frac\[18\] ), .A2(n3028), .B(n3032), 
        .Y(n4168) );
  OAI21xp5_ASAP7_75t_R U4697 ( .A1(\mant_frac\[19\] ), .A2(n3028), .B(n3032), 
        .Y(n4169) );
  OAI21xp5_ASAP7_75t_R U4698 ( .A1(\mant_frac\[20\] ), .A2(n3028), .B(n3032), 
        .Y(n4171) );
  OAI21xp5_ASAP7_75t_R U4699 ( .A1(\mant_frac\[21\] ), .A2(n3028), .B(n3032), 
        .Y(n4172) );
  NAND2xp33_ASAP7_75t_R U4700 ( .A(n3558), .B(n3557), .Y(\exp_field\[9\] ) );
  XNOR2xp5_ASAP7_75t_R U4701 ( .A(n3558), .B(n3557), .Y(n3556) );
  NAND2xp33_ASAP7_75t_R U4702 ( .A(\s5_interp_hi_hi_hi\[12\] ), .B(n3594), .Y(
        n3590) );
  NAND2xp33_ASAP7_75t_R U4703 ( .A(\s5_interp_hi_hi_hi\[11\] ), .B(n3593), .Y(
        n3589) );
  NAND2xp33_ASAP7_75t_R U4704 ( .A(\s5_interp_hi_hi_hi\[10\] ), .B(n3592), .Y(
        n3588) );
  NAND2xp33_ASAP7_75t_R U4705 ( .A(\s5_interp_hi_hi_hi\[9\] ), .B(n3591), .Y(
        n3587) );
  NAND2xp33_ASAP7_75t_R U4706 ( .A(\s5_interp_hi_lo_hi\[12\] ), .B(n3586), .Y(
        n3582) );
  NAND2xp33_ASAP7_75t_R U4707 ( .A(\s5_interp_hi_lo_hi\[11\] ), .B(n3585), .Y(
        n3581) );
  NAND2xp33_ASAP7_75t_R U4708 ( .A(\s5_interp_hi_lo_hi\[10\] ), .B(n3584), .Y(
        n3580) );
  NAND2xp33_ASAP7_75t_R U4709 ( .A(\s5_interp_hi_lo_hi\[9\] ), .B(n3583), .Y(
        n3579) );
  NAND2xp33_ASAP7_75t_R U4710 ( .A(\s5_interp_lo_hi_hi\[13\] ), .B(n3578), .Y(
        n3574) );
  NAND2xp33_ASAP7_75t_R U4711 ( .A(\s5_interp_lo_hi_hi\[12\] ), .B(n3577), .Y(
        n3573) );
  NAND2xp33_ASAP7_75t_R U4712 ( .A(\s5_interp_lo_hi_hi\[11\] ), .B(n3576), .Y(
        n3572) );
  NAND2xp33_ASAP7_75t_R U4713 ( .A(\s5_interp_lo_hi_hi\[10\] ), .B(n3575), .Y(
        n3571) );
  NAND2xp33_ASAP7_75t_R U4714 ( .A(\s5_interp_lo_lo_hi\[13\] ), .B(n3570), .Y(
        n3566) );
  NAND2xp33_ASAP7_75t_R U4715 ( .A(\s5_interp_lo_lo_hi\[12\] ), .B(n3569), .Y(
        n3565) );
  NAND2xp33_ASAP7_75t_R U4716 ( .A(\s5_interp_lo_lo_hi\[11\] ), .B(n3568), .Y(
        n3564) );
  XNOR2xp5_ASAP7_75t_R U4717 ( .A(\s5_interp_lo_lo_hi\[0\] ), .B(
        \s5_interp_lo_lo_lo\[6\] ), .Y(n3559) );
  NAND2xp33_ASAP7_75t_R U4718 ( .A(n3537), .B(n3554), .Y(n3550) );
  NAND2xp33_ASAP7_75t_R U4719 ( .A(n3535), .B(n2965), .Y(n3549) );
  NAND2xp33_ASAP7_75t_R U4720 ( .A(n3530), .B(n2984), .Y(n3548) );
  NAND2xp33_ASAP7_75t_R U4721 ( .A(n3526), .B(\x\[23\] ), .Y(n3547) );
  NOR2xp33_ASAP7_75t_R U4722 ( .A(n3543), .B(\x\[30\] ), .Y(\rexp\[9\] ) );
  XOR2xp5_ASAP7_75t_R U4723 ( .A(n3543), .B(\x\[30\] ), .Y(n3537) );
  NAND2xp33_ASAP7_75t_R U4724 ( .A(\x\[29\] ), .B(n3542), .Y(n3536) );
  XNOR2xp5_ASAP7_75t_R U4725 ( .A(\x\[29\] ), .B(n3542), .Y(n3535) );
  NAND2xp33_ASAP7_75t_R U4726 ( .A(\x\[28\] ), .B(n3541), .Y(n3534) );
  NAND2xp33_ASAP7_75t_R U4727 ( .A(\x\[27\] ), .B(n3540), .Y(n3533) );
  XNOR2xp5_ASAP7_75t_R U4728 ( .A(\x\[27\] ), .B(n3540), .Y(n3532) );
  NAND2xp33_ASAP7_75t_R U4729 ( .A(\x\[26\] ), .B(n3539), .Y(n3531) );
  XNOR2xp5_ASAP7_75t_R U4730 ( .A(\x\[26\] ), .B(n3539), .Y(n3530) );
  NAND2xp33_ASAP7_75t_R U4731 ( .A(\x\[25\] ), .B(n3538), .Y(n3529) );
  XNOR2xp5_ASAP7_75t_R U4732 ( .A(\x\[25\] ), .B(n3538), .Y(n3528) );
  NAND2xp33_ASAP7_75t_R U4733 ( .A(\x\[24\] ), .B(\x\[23\] ), .Y(n3527) );
  INVx1_ASAP7_75t_R U4734 ( .A(n3527), .Y(n3538) );
  INVx1_ASAP7_75t_R U4735 ( .A(n3529), .Y(n3539) );
  INVx1_ASAP7_75t_R U4736 ( .A(n3531), .Y(n3540) );
  INVx1_ASAP7_75t_R U4737 ( .A(n3533), .Y(n3541) );
  INVx1_ASAP7_75t_R U4738 ( .A(n3534), .Y(n3542) );
  INVx1_ASAP7_75t_R U4739 ( .A(n3536), .Y(n3543) );
  NOR5xp2_ASAP7_75t_R U4740 ( .A(n3523), .B(N135), .C(n3524), .D(\rexp\[4\] ), 
        .E(\rexp\[3\] ), .Y(\sub_82/carry\[5\] ) );
  INVx1_ASAP7_75t_R U4741 ( .A(n2982), .Y(n3544) );
  INVx1_ASAP7_75t_R U4742 ( .A(\rexp\[6\] ), .Y(n3545) );
  INVx1_ASAP7_75t_R U4743 ( .A(\rexp\[7\] ), .Y(n3546) );
  INVx1_ASAP7_75t_R U4744 ( .A(n3547), .Y(n3551) );
  INVx1_ASAP7_75t_R U4745 ( .A(n3548), .Y(n3552) );
  INVx1_ASAP7_75t_R U4746 ( .A(n2982), .Y(n3553) );
  INVx1_ASAP7_75t_R U4747 ( .A(n3549), .Y(n3554) );
  INVx1_ASAP7_75t_R U4748 ( .A(n3550), .Y(n3555) );
  INVx1_ASAP7_75t_R U4749 ( .A(\s7_floor_mag\[0\] ), .Y(\exp_field\[0\] ) );
  INVx1_ASAP7_75t_R U4750 ( .A(\s7_floor_mag\[1\] ), .Y(\exp_field\[1\] ) );
  INVx1_ASAP7_75t_R U4751 ( .A(\s7_floor_mag\[2\] ), .Y(\exp_field\[2\] ) );
  INVx1_ASAP7_75t_R U4752 ( .A(\s7_floor_mag\[3\] ), .Y(\exp_field\[3\] ) );
  INVx1_ASAP7_75t_R U4753 ( .A(\s7_floor_mag\[4\] ), .Y(\exp_field\[4\] ) );
  INVx1_ASAP7_75t_R U4754 ( .A(\s7_floor_mag\[5\] ), .Y(\exp_field\[5\] ) );
  INVx1_ASAP7_75t_R U4755 ( .A(\s7_floor_mag\[6\] ), .Y(\exp_field\[6\] ) );
  INVx1_ASAP7_75t_R U4756 ( .A(\exp_field\[7\] ), .Y(n3557) );
  INVx1_ASAP7_75t_R U4757 ( .A(\s7_floor_mag\[8\] ), .Y(n3558) );
  INVx1_ASAP7_75t_R U4758 ( .A(n3561), .Y(n3567) );
  NOR4xp25_ASAP7_75t_R U4759 ( .A(n2957), .B(n2961), .C(n2976), .D(n3015), .Y(
        n3595) );
  INVx1_ASAP7_75t_R U4760 ( .A(\p0\[3\] ), .Y(n3828) );
  INVx1_ASAP7_75t_R U4761 ( .A(\p0\[2\] ), .Y(n3829) );
  INVx1_ASAP7_75t_R U4762 ( .A(\p0\[1\] ), .Y(n3830) );
  INVx1_ASAP7_75t_R U4763 ( .A(\interp_lo_hi_hi\[14\] ), .Y(n4051) );
  INVx1_ASAP7_75t_R U4764 ( .A(\interp_lo_hi_hi\[13\] ), .Y(n4052) );
  INVx1_ASAP7_75t_R U4765 ( .A(\interp_lo_hi_hi\[12\] ), .Y(n4053) );
  INVx1_ASAP7_75t_R U4766 ( .A(\interp_lo_hi_hi\[11\] ), .Y(n4054) );
  INVx1_ASAP7_75t_R U4767 ( .A(\interp_lo_hi_hi\[10\] ), .Y(n4055) );
  INVx1_ASAP7_75t_R U4768 ( .A(\interp_lo_hi_hi\[9\] ), .Y(n4056) );
  INVx1_ASAP7_75t_R U4769 ( .A(\interp_lo_hi_hi\[8\] ), .Y(n4057) );
  INVx1_ASAP7_75t_R U4770 ( .A(\interp_lo_hi_hi\[7\] ), .Y(n4058) );
  INVx1_ASAP7_75t_R U4771 ( .A(\interp_lo_hi_hi\[6\] ), .Y(n4059) );
  INVx1_ASAP7_75t_R U4772 ( .A(\interp_lo_hi_hi\[5\] ), .Y(n4060) );
  INVx1_ASAP7_75t_R U4773 ( .A(\interp_lo_hi_hi\[4\] ), .Y(n4061) );
  INVx1_ASAP7_75t_R U4774 ( .A(\interp_lo_hi_hi\[3\] ), .Y(n4062) );
  INVx1_ASAP7_75t_R U4775 ( .A(\interp_lo_hi_hi\[2\] ), .Y(n4063) );
  INVx1_ASAP7_75t_R U4776 ( .A(\interp_lo_hi_hi\[1\] ), .Y(n4064) );
  INVx1_ASAP7_75t_R U4777 ( .A(\interp_lo_hi_lo\[14\] ), .Y(n4065) );
  INVx1_ASAP7_75t_R U4778 ( .A(\interp_lo_hi_lo\[13\] ), .Y(n4066) );
  INVx1_ASAP7_75t_R U4779 ( .A(\interp_lo_hi_lo\[12\] ), .Y(n4067) );
  INVx1_ASAP7_75t_R U4780 ( .A(\interp_lo_hi_lo\[11\] ), .Y(n4068) );
  INVx1_ASAP7_75t_R U4781 ( .A(\interp_lo_hi_lo\[10\] ), .Y(n4069) );
  INVx1_ASAP7_75t_R U4782 ( .A(\interp_lo_hi_lo\[9\] ), .Y(n4070) );
  INVx1_ASAP7_75t_R U4783 ( .A(\interp_lo_hi_lo\[8\] ), .Y(n4071) );
  INVx1_ASAP7_75t_R U4784 ( .A(\interp_lo_hi_lo\[7\] ), .Y(n4072) );
  INVx1_ASAP7_75t_R U4785 ( .A(\interp_lo_hi_lo\[6\] ), .Y(n4073) );
  INVx1_ASAP7_75t_R U4786 ( .A(\interp_lo_lo_hi\[14\] ), .Y(n4079) );
  INVx1_ASAP7_75t_R U4787 ( .A(\interp_lo_lo_hi\[13\] ), .Y(n4080) );
  INVx1_ASAP7_75t_R U4788 ( .A(\interp_lo_lo_hi\[12\] ), .Y(n4081) );
  INVx1_ASAP7_75t_R U4789 ( .A(\interp_lo_lo_hi\[11\] ), .Y(n4082) );
  INVx1_ASAP7_75t_R U4790 ( .A(\interp_lo_lo_hi\[5\] ), .Y(n4088) );
  INVx1_ASAP7_75t_R U4791 ( .A(\interp_lo_lo_hi\[4\] ), .Y(n4089) );
  INVx1_ASAP7_75t_R U4792 ( .A(\interp_lo_lo_hi\[3\] ), .Y(n4090) );
  INVx1_ASAP7_75t_R U4793 ( .A(\interp_lo_lo_hi\[2\] ), .Y(n4091) );
  INVx1_ASAP7_75t_R U4794 ( .A(\interp_lo_lo_hi\[1\] ), .Y(n4092) );
  INVx1_ASAP7_75t_R U4795 ( .A(\interp_lo_lo_lo\[11\] ), .Y(n4096) );
  INVx1_ASAP7_75t_R U4796 ( .A(\interp_lo_lo_lo\[10\] ), .Y(n4097) );
  INVx1_ASAP7_75t_R U4797 ( .A(\interp_lo_lo_lo\[9\] ), .Y(n4098) );
  INVx1_ASAP7_75t_R U4798 ( .A(\interp_lo_lo_lo\[8\] ), .Y(n4099) );
  INVx1_ASAP7_75t_R U4799 ( .A(\interp_lo_lo_lo\[7\] ), .Y(n4100) );
  INVx1_ASAP7_75t_R U4800 ( .A(\interp_lo_lo_lo\[6\] ), .Y(n4101) );
  INVx1_ASAP7_75t_R U4801 ( .A(\interp_lo_lo_lo\[5\] ), .Y(n4102) );
  INVx1_ASAP7_75t_R U4802 ( .A(\interp_lo_lo_lo\[4\] ), .Y(n4103) );
  INVx1_ASAP7_75t_R U4803 ( .A(\interp_lo_lo_lo\[3\] ), .Y(n4104) );
  INVx1_ASAP7_75t_R U4804 ( .A(\interp_lo_lo_lo\[2\] ), .Y(n4105) );
  INVx1_ASAP7_75t_R U4805 ( .A(\interp_lo_lo_lo\[1\] ), .Y(n4106) );
  INVx1_ASAP7_75t_R U4806 ( .A(\interp_hi_hi_hi\[12\] ), .Y(n4108) );
  INVx1_ASAP7_75t_R U4807 ( .A(\interp_hi_hi_hi\[11\] ), .Y(n4109) );
  INVx1_ASAP7_75t_R U4808 ( .A(\interp_hi_hi_hi\[10\] ), .Y(n4110) );
  INVx1_ASAP7_75t_R U4809 ( .A(\interp_hi_hi_hi\[9\] ), .Y(n4111) );
  INVx1_ASAP7_75t_R U4810 ( .A(\interp_hi_hi_hi\[8\] ), .Y(n4112) );
  INVx1_ASAP7_75t_R U4811 ( .A(\interp_hi_hi_hi\[7\] ), .Y(n4113) );
  INVx1_ASAP7_75t_R U4812 ( .A(\interp_hi_hi_hi\[6\] ), .Y(n4114) );
  INVx1_ASAP7_75t_R U4813 ( .A(\interp_hi_hi_hi\[5\] ), .Y(n4115) );
  INVx1_ASAP7_75t_R U4814 ( .A(\interp_hi_hi_hi\[4\] ), .Y(n4116) );
  INVx1_ASAP7_75t_R U4815 ( .A(\interp_hi_hi_hi\[3\] ), .Y(n4117) );
  INVx1_ASAP7_75t_R U4816 ( .A(\interp_hi_hi_hi\[2\] ), .Y(n4118) );
  INVx1_ASAP7_75t_R U4817 ( .A(\interp_hi_hi_hi\[1\] ), .Y(n4119) );
  INVx1_ASAP7_75t_R U4818 ( .A(\interp_hi_hi_lo\[12\] ), .Y(n4121) );
  INVx1_ASAP7_75t_R U4819 ( .A(\interp_hi_hi_lo\[11\] ), .Y(n4122) );
  INVx1_ASAP7_75t_R U4820 ( .A(\interp_hi_hi_lo\[10\] ), .Y(n4123) );
  INVx1_ASAP7_75t_R U4821 ( .A(\interp_hi_hi_lo\[9\] ), .Y(n4124) );
  INVx1_ASAP7_75t_R U4822 ( .A(\interp_hi_hi_lo\[8\] ), .Y(n4125) );
  INVx1_ASAP7_75t_R U4823 ( .A(\interp_hi_hi_lo\[7\] ), .Y(n4126) );
  INVx1_ASAP7_75t_R U4824 ( .A(\interp_hi_hi_lo\[6\] ), .Y(n4127) );
  INVx1_ASAP7_75t_R U4825 ( .A(\interp_hi_lo_hi\[12\] ), .Y(n4134) );
  INVx1_ASAP7_75t_R U4826 ( .A(\interp_hi_lo_hi\[11\] ), .Y(n4135) );
  INVx1_ASAP7_75t_R U4827 ( .A(\interp_hi_lo_hi\[10\] ), .Y(n4136) );
  INVx1_ASAP7_75t_R U4828 ( .A(\interp_hi_lo_hi\[9\] ), .Y(n4137) );
  INVx1_ASAP7_75t_R U4829 ( .A(\interp_hi_lo_hi\[5\] ), .Y(n4141) );
  INVx1_ASAP7_75t_R U4830 ( .A(\interp_hi_lo_hi\[4\] ), .Y(n4142) );
  INVx1_ASAP7_75t_R U4831 ( .A(\interp_hi_lo_hi\[3\] ), .Y(n4143) );
  INVx1_ASAP7_75t_R U4832 ( .A(\interp_hi_lo_hi\[2\] ), .Y(n4144) );
  INVx1_ASAP7_75t_R U4833 ( .A(\interp_hi_lo_hi\[1\] ), .Y(n4145) );
  INVx1_ASAP7_75t_R U4834 ( .A(\interp_hi_lo_lo\[11\] ), .Y(n4148) );
  INVx1_ASAP7_75t_R U4835 ( .A(\interp_hi_lo_lo\[10\] ), .Y(n4149) );
  INVx1_ASAP7_75t_R U4836 ( .A(\interp_hi_lo_lo\[9\] ), .Y(n4150) );
  INVx1_ASAP7_75t_R U4837 ( .A(\interp_hi_lo_lo\[8\] ), .Y(n4151) );
  INVx1_ASAP7_75t_R U4838 ( .A(\interp_hi_lo_lo\[7\] ), .Y(n4152) );
  INVx1_ASAP7_75t_R U4839 ( .A(\interp_hi_lo_lo\[6\] ), .Y(n4153) );
  AOI222xp33_ASAP7_75t_R U4840 ( .A1(N202), .A2(n2960), .B1(n3034), .B2(n3596), 
        .C1(n3033), .C2(n3597), .Y(n4183) );
  AOI222xp33_ASAP7_75t_R U4841 ( .A1(N203), .A2(n2960), .B1(n3034), .B2(n3598), 
        .C1(n3033), .C2(n3599), .Y(n4184) );
  AOI222xp33_ASAP7_75t_R U4842 ( .A1(N206), .A2(n2960), .B1(n3034), .B2(n3597), 
        .C1(n3033), .C2(n3600), .Y(n4187) );
  OAI221xp5_ASAP7_75t_R U4843 ( .A1(n3521), .A2(n3510), .B1(n3522), .B2(n3508), 
        .C(n3601), .Y(n3597) );
  AOI22xp33_ASAP7_75t_R U4844 ( .A1(\x\[10\] ), .A2(n3602), .B1(\x\[8\] ), 
        .B2(n3603), .Y(n3601) );
  AOI222xp33_ASAP7_75t_R U4845 ( .A1(N207), .A2(n2960), .B1(n3034), .B2(n3599), 
        .C1(n3033), .C2(n3604), .Y(n4188) );
  OAI221xp5_ASAP7_75t_R U4846 ( .A1(n3521), .A2(n3509), .B1(n3522), .B2(n3605), 
        .C(n3606), .Y(n3599) );
  AOI22xp33_ASAP7_75t_R U4847 ( .A1(\x\[11\] ), .A2(n3602), .B1(\x\[9\] ), 
        .B2(n3603), .Y(n3606) );
  AOI22xp33_ASAP7_75t_R U4848 ( .A1(\x\[12\] ), .A2(n3602), .B1(\x\[10\] ), 
        .B2(n3603), .Y(n3608) );
  AOI22xp33_ASAP7_75t_R U4849 ( .A1(\x\[13\] ), .A2(n3602), .B1(\x\[11\] ), 
        .B2(n3603), .Y(n3610) );
  AOI222xp33_ASAP7_75t_R U4850 ( .A1(N210), .A2(n2960), .B1(n3034), .B2(n3600), 
        .C1(n3033), .C2(n3611), .Y(n4191) );
  OAI221xp5_ASAP7_75t_R U4851 ( .A1(n3521), .A2(n3607), .B1(n3522), .B2(n3612), 
        .C(n3613), .Y(n3600) );
  AOI22xp33_ASAP7_75t_R U4852 ( .A1(\x\[14\] ), .A2(n3602), .B1(\x\[12\] ), 
        .B2(n3603), .Y(n3613) );
  AOI222xp33_ASAP7_75t_R U4853 ( .A1(N211), .A2(n2960), .B1(n3034), .B2(n3604), 
        .C1(n3033), .C2(n3614), .Y(n4192) );
  OAI221xp5_ASAP7_75t_R U4854 ( .A1(n3521), .A2(n3609), .B1(n3522), .B2(n3615), 
        .C(n3616), .Y(n3604) );
  AOI22xp33_ASAP7_75t_R U4855 ( .A1(\x\[15\] ), .A2(n3602), .B1(\x\[13\] ), 
        .B2(n3603), .Y(n3616) );
  AOI22xp33_ASAP7_75t_R U4856 ( .A1(\x\[16\] ), .A2(n3602), .B1(\x\[14\] ), 
        .B2(n3603), .Y(n3618) );
  AOI22xp33_ASAP7_75t_R U4857 ( .A1(\x\[17\] ), .A2(n3602), .B1(\x\[15\] ), 
        .B2(n3603), .Y(n3620) );
  AOI222xp33_ASAP7_75t_R U4858 ( .A1(N214), .A2(n2960), .B1(n3034), .B2(n3611), 
        .C1(n3033), .C2(n3621), .Y(n4196) );
  OAI221xp5_ASAP7_75t_R U4859 ( .A1(n3521), .A2(n3617), .B1(n3522), .B2(n3507), 
        .C(n3622), .Y(n3611) );
  AOI22xp33_ASAP7_75t_R U4860 ( .A1(\x\[18\] ), .A2(n3602), .B1(\x\[16\] ), 
        .B2(n3603), .Y(n3622) );
  AOI222xp33_ASAP7_75t_R U4861 ( .A1(N215), .A2(n2960), .B1(n3034), .B2(n3614), 
        .C1(n3033), .C2(n3623), .Y(n4197) );
  OAI221xp5_ASAP7_75t_R U4862 ( .A1(n3521), .A2(n3619), .B1(n3522), .B2(n3506), 
        .C(n3624), .Y(n3614) );
  AOI22xp33_ASAP7_75t_R U4863 ( .A1(\x\[19\] ), .A2(n3602), .B1(\x\[17\] ), 
        .B2(n3603), .Y(n3624) );
  AOI22xp33_ASAP7_75t_R U4864 ( .A1(n2864), .A2(n3602), .B1(\x\[18\] ), .B2(
        n3603), .Y(n3625) );
  AOI22xp33_ASAP7_75t_R U4865 ( .A1(\x\[21\] ), .A2(n3602), .B1(\x\[19\] ), 
        .B2(n3603), .Y(n3627) );
  AOI22xp33_ASAP7_75t_R U4866 ( .A1(n3034), .A2(n3621), .B1(n3628), .B2(n3033), 
        .Y(n4200) );
  OAI221xp5_ASAP7_75t_R U4867 ( .A1(n3521), .A2(n3505), .B1(n3522), .B2(n3504), 
        .C(n3629), .Y(n3621) );
  AOI22xp33_ASAP7_75t_R U4868 ( .A1(n2866), .A2(n3602), .B1(n2864), .B2(n3603), 
        .Y(n3629) );
  NAND2xp33_ASAP7_75t_R U4869 ( .A(n3034), .B(n3623), .Y(n4201) );
  OAI221xp5_ASAP7_75t_R U4870 ( .A1(n3504), .A2(N135), .B1(n3521), .B2(n3626), 
        .C(n3630), .Y(n3623) );
  AOI21xp33_ASAP7_75t_R U4871 ( .A1(n2866), .A2(n3526), .B(n3602), .Y(n3630)
         );
  AOI22xp33_ASAP7_75t_R U4872 ( .A1(n3033), .A2(n3633), .B1(N194), .B2(n2960), 
        .Y(n4204) );
  NAND2xp33_ASAP7_75t_R U4873 ( .A(n3034), .B(n3628), .Y(n4205) );
  AOI22xp33_ASAP7_75t_R U4874 ( .A1(n3033), .A2(n3634), .B1(N195), .B2(n2960), 
        .Y(n4206) );
  AOI222xp33_ASAP7_75t_R U4875 ( .A1(N198), .A2(n2960), .B1(n3034), .B2(n3633), 
        .C1(n3033), .C2(n3596), .Y(n4209) );
  OAI221xp5_ASAP7_75t_R U4876 ( .A1(n3521), .A2(n3511), .B1(n3522), .B2(n3637), 
        .C(n3638), .Y(n3596) );
  AOI22xp33_ASAP7_75t_R U4877 ( .A1(\x\[6\] ), .A2(n3602), .B1(\x\[4\] ), .B2(
        n3603), .Y(n3638) );
  OAI222xp33_ASAP7_75t_R U4878 ( .A1(n3522), .A2(n3513), .B1(n3636), .B2(n3512), .C1(n3635), .C2(n3631), .Y(n3633) );
  AOI222xp33_ASAP7_75t_R U4879 ( .A1(N199), .A2(n2960), .B1(n3034), .B2(n3634), 
        .C1(n3033), .C2(n3598), .Y(n4210) );
  OAI221xp5_ASAP7_75t_R U4880 ( .A1(n3521), .A2(n3639), .B1(n3522), .B2(n3640), 
        .C(n3641), .Y(n3598) );
  AOI22xp33_ASAP7_75t_R U4881 ( .A1(\x\[7\] ), .A2(n3602), .B1(n3603), .B2(
        \x\[5\] ), .Y(n3641) );
  OAI221xp5_ASAP7_75t_R U4882 ( .A1(n3636), .A2(n3511), .B1(n3631), .B2(n3513), 
        .C(n3642), .Y(n3634) );
  AOI22xp33_ASAP7_75t_R U4883 ( .A1(n3628), .A2(n2881), .B1(n2875), .B2(n3643), 
        .Y(n3642) );
  AOI22xp33_ASAP7_75t_R U4884 ( .A1(\x\[8\] ), .A2(n3602), .B1(n3603), .B2(
        \x\[6\] ), .Y(n3644) );
  AOI22xp33_ASAP7_75t_R U4885 ( .A1(\x\[4\] ), .A2(n3602), .B1(n2875), .B2(
        n3603), .Y(n3645) );
  AOI22xp33_ASAP7_75t_R U4886 ( .A1(\x\[9\] ), .A2(n3602), .B1(\x\[7\] ), .B2(
        n3603), .Y(n3646) );
  AOI22xp33_ASAP7_75t_R U4887 ( .A1(\x\[5\] ), .A2(n3602), .B1(n3603), .B2(
        n2874), .Y(n3648) );
  NAND2xp33_ASAP7_75t_R U4888 ( .A(n3523), .B(\x\[23\] ), .Y(n3631) );
  NOR2xp33_ASAP7_75t_R U4889 ( .A(n3526), .B(\x\[23\] ), .Y(n3628) );
  NAND2xp33_ASAP7_75t_R U4890 ( .A(n4181), .B(n3525), .Y(n3647) );
  OAI31xp33_ASAP7_75t_R U4891 ( .A1(n3649), .A2(\rexp\[4\] ), .A3(\rexp\[3\] ), 
        .B(n3525), .Y(n4181) );
  OR3x1_ASAP7_75t_R U4892 ( .A(\rexp\[7\] ), .B(\rexp\[6\] ), .C(n2982), .Y(
        n3649) );
  OAI21xp33_ASAP7_75t_R U4893 ( .A1(\exp_field\[0\] ), .A2(n3650), .B(n3651), 
        .Y(n4439) );
  OAI21xp33_ASAP7_75t_R U4894 ( .A1(\exp_field\[1\] ), .A2(n3650), .B(n3651), 
        .Y(n4440) );
  OAI21xp33_ASAP7_75t_R U4895 ( .A1(\exp_field\[2\] ), .A2(n3650), .B(n3651), 
        .Y(n4441) );
  OAI21xp33_ASAP7_75t_R U4896 ( .A1(\exp_field\[3\] ), .A2(n3650), .B(n3651), 
        .Y(n4442) );
  OAI21xp33_ASAP7_75t_R U4897 ( .A1(\exp_field\[4\] ), .A2(n3650), .B(n3651), 
        .Y(n4443) );
  OAI21xp33_ASAP7_75t_R U4898 ( .A1(\exp_field\[5\] ), .A2(n3650), .B(n3651), 
        .Y(n4444) );
  OAI21xp33_ASAP7_75t_R U4899 ( .A1(\exp_field\[6\] ), .A2(n3650), .B(n3651), 
        .Y(n4445) );
  OR2x2_ASAP7_75t_R U4900 ( .A(n3650), .B(n3032), .Y(n3651) );
  INVx1_ASAP7_75t_R U4901 ( .A(n3652), .Y(n3650) );
  AOI211xp5_ASAP7_75t_R U4902 ( .A1(n3653), .A2(s7_is_zero_sub), .B(s7_is_pos), 
        .C(n3654), .Y(n3652) );
  INVx1_ASAP7_75t_R U4903 ( .A(s7_is_inf), .Y(n3653) );
  AOI221xp5_ASAP7_75t_R U4904 ( .A1(n3032), .A2(\exp_field\[7\] ), .B1(
        s7_is_pos), .B2(s7_is_inf), .C(n3654), .Y(n4446) );
  AO21x1_ASAP7_75t_R U4905 ( .A1(n3655), .A2(n3474), .B(s7_is_nan), .Y(n3654)
         );
  OR4x1_ASAP7_75t_R U4906 ( .A(\x\[30\] ), .B(\x\[29\] ), .C(\x\[28\] ), .D(
        \x\[27\] ), .Y(n3656) );
  NAND2xp33_ASAP7_75t_R U4907 ( .A(n3657), .B(n3658), .Y(n4587) );
  INVx1_ASAP7_75t_R U4908 ( .A(n3659), .Y(n3657) );
  NAND2xp33_ASAP7_75t_R U4909 ( .A(n3658), .B(n3659), .Y(n4588) );
  NAND4xp25_ASAP7_75t_R U4910 ( .A(n3660), .B(n3661), .C(n3662), .D(n3663), 
        .Y(n3659) );
  NOR4xp25_ASAP7_75t_R U4911 ( .A(n3664), .B(\x\[4\] ), .C(\x\[6\] ), .D(
        \x\[5\] ), .Y(n3663) );
  NAND3xp33_ASAP7_75t_R U4912 ( .A(n3509), .B(n3508), .C(n3510), .Y(n3664) );
  NOR4xp25_ASAP7_75t_R U4913 ( .A(n3665), .B(n2879), .C(\x\[21\] ), .D(n2864), 
        .Y(n3662) );
  NAND3xp33_ASAP7_75t_R U4914 ( .A(n3512), .B(n3511), .C(n3632), .Y(n3665) );
  NOR4xp25_ASAP7_75t_R U4915 ( .A(n3666), .B(\x\[14\] ), .C(\x\[16\] ), .D(
        \x\[15\] ), .Y(n3661) );
  NAND3xp33_ASAP7_75t_R U4916 ( .A(n3506), .B(n3505), .C(n3507), .Y(n3666) );
  NOR5xp2_ASAP7_75t_R U4917 ( .A(\x\[10\] ), .B(n2881), .C(\x\[11\] ), .D(
        \x\[13\] ), .E(\x\[12\] ), .Y(n3660) );
  AND5x1_ASAP7_75t_R U4918 ( .A(\x\[26\] ), .B(\x\[25\] ), .C(\x\[24\] ), .D(
        \x\[23\] ), .E(n3667), .Y(n3658) );
  AND4x1_ASAP7_75t_R U4919 ( .A(\x\[27\] ), .B(\x\[28\] ), .C(\x\[29\] ), .D(
        \x\[30\] ), .Y(n3667) );
  NOR4xp25_ASAP7_75t_R U4920 ( .A(n3517), .B(n3479), .C(n3481), .D(n3498), .Y(
        n3679) );
  NOR3xp33_ASAP7_75t_R U4921 ( .A(n3499), .B(n3477), .C(n3482), .Y(n3676) );
  NOR3xp33_ASAP7_75t_R U4922 ( .A(n3485), .B(n3499), .C(n3699), .Y(n3698) );
  NOR3xp33_ASAP7_75t_R U4923 ( .A(n3486), .B(n3675), .C(n3724), .Y(n3723) );
  NAND5xp2_ASAP7_75t_R U4924 ( .A(n3678), .B(n3668), .C(n3685), .D(n3514), .E(
        n3684), .Y(n3725) );
  NOR2xp33_ASAP7_75t_R U4925 ( .A(n3727), .B(n3482), .Y(n3684) );
  NAND3xp33_ASAP7_75t_R U4926 ( .A(n3710), .B(n3677), .C(n3709), .Y(n3728) );
  NAND3xp33_ASAP7_75t_R U4927 ( .A(n3476), .B(n3495), .C(n3733), .Y(n3732) );
  NAND5xp2_ASAP7_75t_R U4928 ( .A(n3707), .B(n3711), .C(n3702), .D(n3669), .E(
        n3734), .Y(n3713) );
  AND4x1_ASAP7_75t_R U4929 ( .A(n3722), .B(n3678), .C(n3701), .D(n3681), .Y(
        n3734) );
  NAND4xp25_ASAP7_75t_R U4930 ( .A(n3700), .B(n3686), .C(n3709), .D(n3735), 
        .Y(n3689) );
  NAND4xp25_ASAP7_75t_R U4931 ( .A(n3488), .B(n3672), .C(n3738), .D(n3739), 
        .Y(n3736) );
  NAND4xp25_ASAP7_75t_R U4932 ( .A(n3717), .B(n3475), .C(n3741), .D(n3711), 
        .Y(n3740) );
  NOR4xp25_ASAP7_75t_R U4933 ( .A(n3503), .B(n3492), .C(n3490), .D(n3727), .Y(
        n3743) );
  NOR5xp2_ASAP7_75t_R U4934 ( .A(n3501), .B(n3485), .C(n3498), .D(n3745), .E(
        n3496), .Y(n3744) );
  NAND3xp33_ASAP7_75t_R U4935 ( .A(n3748), .B(n3669), .C(n3520), .Y(n3696) );
  NAND4xp25_ASAP7_75t_R U4936 ( .A(n3520), .B(n3682), .C(n3717), .D(n3752), 
        .Y(n3750) );
  NOR4xp25_ASAP7_75t_R U4937 ( .A(n3502), .B(n3703), .C(n3497), .D(n3487), .Y(
        n3752) );
  NOR2xp33_ASAP7_75t_R U4938 ( .A(n3480), .B(n3516), .Y(n3717) );
  NAND4xp25_ASAP7_75t_R U4939 ( .A(n3518), .B(n3693), .C(n3754), .D(n3755), 
        .Y(n3751) );
  NAND2xp33_ASAP7_75t_R U4940 ( .A(n3673), .B(n3756), .Y(n3753) );
  NAND4xp25_ASAP7_75t_R U4941 ( .A(n3518), .B(n3694), .C(n3761), .D(n3762), 
        .Y(n3760) );
  NOR4xp25_ASAP7_75t_R U4942 ( .A(n3745), .B(n3721), .C(n3490), .D(n3485), .Y(
        n3763) );
  NAND2xp33_ASAP7_75t_R U4943 ( .A(n3766), .B(n3711), .Y(n3688) );
  NAND2xp33_ASAP7_75t_R U4944 ( .A(n3757), .B(n3695), .Y(n3719) );
  NAND4xp25_ASAP7_75t_R U4945 ( .A(n2980), .B(n3017), .C(n3715), .D(n3668), 
        .Y(n3765) );
  AND4x1_ASAP7_75t_R U4946 ( .A(n3669), .B(n3709), .C(n3005), .D(n3768), .Y(
        n3757) );
  NOR3xp33_ASAP7_75t_R U4947 ( .A(n3515), .B(n3690), .C(n3769), .Y(n3768) );
  NAND3xp33_ASAP7_75t_R U4948 ( .A(n3669), .B(n3681), .C(n3674), .Y(n3772) );
  NAND5xp2_ASAP7_75t_R U4949 ( .A(n3687), .B(n3748), .C(n3519), .D(n3491), .E(
        n3484), .Y(n3771) );
  NOR2xp33_ASAP7_75t_R U4950 ( .A(n3486), .B(n3490), .Y(n3704) );
  NAND4xp25_ASAP7_75t_R U4951 ( .A(n3697), .B(n3021), .C(n3716), .D(n3678), 
        .Y(n3774) );
  NOR3xp33_ASAP7_75t_R U4952 ( .A(n3745), .B(n3777), .C(n3516), .Y(n3697) );
  AND5x1_ASAP7_75t_R U4953 ( .A(n3741), .B(n3695), .C(n3702), .D(n3754), .E(
        n3686), .Y(n3778) );
  AND4x1_ASAP7_75t_R U4954 ( .A(n3764), .B(n3738), .C(n3749), .D(n3779), .Y(
        n3776) );
  NOR4xp25_ASAP7_75t_R U4955 ( .A(n3494), .B(n3481), .C(n3497), .D(n3731), .Y(
        n3779) );
  NOR5xp2_ASAP7_75t_R U4956 ( .A(n3477), .B(n3503), .C(n3485), .D(n3729), .E(
        n3680), .Y(n3749) );
  AND2x2_ASAP7_75t_R U4957 ( .A(n3761), .B(n3685), .Y(n3764) );
  NAND4xp25_ASAP7_75t_R U4958 ( .A(n3484), .B(n3692), .C(n3780), .D(n3668), 
        .Y(n3775) );
  NOR3xp33_ASAP7_75t_R U4959 ( .A(n3486), .B(n3502), .C(n3489), .Y(n3782) );
  NOR4xp25_ASAP7_75t_R U4960 ( .A(n3499), .B(n3483), .C(n3478), .D(n3501), .Y(
        n3783) );
  AND3x1_ASAP7_75t_R U4961 ( .A(n3692), .B(n3701), .C(n3693), .Y(n3733) );
  AND4x1_ASAP7_75t_R U4962 ( .A(n3672), .B(n3669), .C(n3705), .D(n3784), .Y(
        n3683) );
  NOR4xp25_ASAP7_75t_R U4963 ( .A(n3492), .B(n3477), .C(n3500), .D(n3493), .Y(
        n3784) );
  NOR3xp33_ASAP7_75t_R U4964 ( .A(n3747), .B(n3493), .C(n3737), .Y(n3726) );
  NAND4xp25_ASAP7_75t_R U4965 ( .A(n3780), .B(n3758), .C(n3677), .D(n3718), 
        .Y(n3737) );
  NAND2xp33_ASAP7_75t_R U4966 ( .A(n3711), .B(n3670), .Y(n3747) );
  NAND5xp2_ASAP7_75t_R U4967 ( .A(n3746), .B(n3678), .C(n3686), .D(n3714), .E(
        n3741), .Y(n3785) );
  NOR3xp33_ASAP7_75t_R U4968 ( .A(n3500), .B(n3691), .C(n3477), .Y(n3787) );
  NAND5xp2_ASAP7_75t_R U4969 ( .A(n3715), .B(n3678), .C(n3711), .D(n3700), .E(
        n3695), .Y(n3786) );
  NOR4xp25_ASAP7_75t_R U4970 ( .A(n3489), .B(n3790), .C(n3478), .D(n3487), .Y(
        n3789) );
  NAND2xp33_ASAP7_75t_R U4971 ( .A(n3671), .B(n3677), .Y(n3759) );
  NOR3xp33_ASAP7_75t_R U4972 ( .A(n3498), .B(n3745), .C(n3515), .Y(n3687) );
  AND2x2_ASAP7_75t_R U4973 ( .A(n2977), .B(n2962), .Y(n3745) );
  AND2x2_ASAP7_75t_R U4974 ( .A(n3693), .B(n3767), .Y(n3707) );
  NOR3xp33_ASAP7_75t_R U4975 ( .A(n3483), .B(n3502), .C(n3477), .Y(n3793) );
  NAND2xp33_ASAP7_75t_R U4976 ( .A(n3701), .B(n3685), .Y(n3773) );
  AND2x2_ASAP7_75t_R U4977 ( .A(n2975), .B(n3002), .Y(n3730) );
  AND3x1_ASAP7_75t_R U4978 ( .A(n3754), .B(n3715), .C(n3761), .Y(n3708) );
  NOR2xp33_ASAP7_75t_R U4979 ( .A(n3501), .B(n3479), .Y(n3766) );
  NOR4xp25_ASAP7_75t_R U4980 ( .A(n3481), .B(n3489), .C(n3483), .D(n3515), .Y(
        n3796) );
  NOR4xp25_ASAP7_75t_R U4981 ( .A(n3483), .B(n3769), .C(n3480), .D(n3742), .Y(
        n3798) );
  INVx1_ASAP7_75t_R U4982 ( .A(n3670), .Y(n3769) );
  NOR2xp33_ASAP7_75t_R U4983 ( .A(n3503), .B(n3517), .Y(n3706) );
  NAND2xp33_ASAP7_75t_R U4984 ( .A(n3791), .B(n2964), .Y(n3735) );
  AND2x2_ASAP7_75t_R U4985 ( .A(n3001), .B(n2974), .Y(n3794) );
  NOR3xp33_ASAP7_75t_R U4986 ( .A(n3478), .B(n3727), .C(n3720), .Y(n3770) );
  AND2x2_ASAP7_75t_R U4987 ( .A(n2972), .B(n3002), .Y(n3791) );
  INVx1_ASAP7_75t_R U4988 ( .A(n3754), .Y(n3727) );
  AND5x1_ASAP7_75t_R U4989 ( .A(n3780), .B(n3681), .C(n3792), .D(n3799), .E(
        n3748), .Y(n3781) );
  AND2x2_ASAP7_75t_R U4990 ( .A(n3738), .B(n3709), .Y(n3748) );
  AND2x2_ASAP7_75t_R U4991 ( .A(n3741), .B(n3716), .Y(n3799) );
  AND2x2_ASAP7_75t_R U4992 ( .A(n3003), .B(n2972), .Y(n3797) );
  NAND2xp33_ASAP7_75t_R U4993 ( .A(n3788), .B(n2962), .Y(n3792) );
  AND2x2_ASAP7_75t_R U4994 ( .A(n2973), .B(n3001), .Y(n3788) );
  NAND2xp33_ASAP7_75t_R U4995 ( .A(n2962), .B(n3795), .Y(n3780) );
  AND2x2_ASAP7_75t_R U4996 ( .A(n2973), .B(n3002), .Y(n3795) );
  NAND2xp33_ASAP7_75t_R U4997 ( .A(n3700), .B(n3739), .Y(n3712) );
  INVx1_ASAP7_75t_R U4998 ( .A(\interp_hi_hi_hi\[0\] ), .Y(n4797) );
  INVx1_ASAP7_75t_R U4999 ( .A(\interp_lo_hi_hi\[0\] ), .Y(n4798) );
  INVx1_ASAP7_75t_R U5000 ( .A(\interp_hi_lo_hi\[0\] ), .Y(n4801) );
  INVx1_ASAP7_75t_R U5001 ( .A(\interp_lo_lo_hi\[0\] ), .Y(n4802) );
  INVx1_ASAP7_75t_R U5002 ( .A(\interp_lo_lo_lo\[0\] ), .Y(n4804) );
  NAND4xp25_ASAP7_75t_R U5003 ( .A(\exp_field\[7\] ), .B(\exp_field\[6\] ), 
        .C(\exp_field\[5\] ), .D(\exp_field\[4\] ), .Y(n3801) );
  NAND4xp25_ASAP7_75t_R U5004 ( .A(\exp_field\[3\] ), .B(\exp_field\[2\] ), 
        .C(\exp_field\[1\] ), .D(\exp_field\[0\] ), .Y(n3800) );
  NOR5xp2_ASAP7_75t_R U5005 ( .A(n3803), .B(\exp_field\[3\] ), .C(
        \exp_field\[2\] ), .D(\exp_field\[1\] ), .E(\exp_field\[0\] ), .Y(
        n3802) );
  OR5x1_ASAP7_75t_R U5006 ( .A(\exp_field\[7\] ), .B(\exp_field\[8\] ), .C(
        \exp_field\[6\] ), .D(\exp_field\[4\] ), .E(\exp_field\[5\] ), .Y(
        n3803) );
  fp32_exp_DW_rash_0 srl_85 ( .A({n4889, \x\[22\] , \x\[21\] , \x\[20\] , 
        \x\[19\] , \x\[18\] , \x\[17\] , \x\[16\] , \x\[15\] , \x\[14\] , 
        \x\[13\] , \x\[12\] , \x\[11\] , \x\[10\] , \x\[9\] , \x\[8\] , 
        \x\[7\] , \x\[6\] , \x\[5\] , \x\[4\] , \x\[3\] , n2875, n2879, n2881}), .DATA_TC(n4888), .SH({n2967, n2956, n2959, n2968, n2994, n2995, n3006, n3019, 
        n3010, N135}), .SH_TC(n4888), .B({N215, N214, N213, N212, N211, N210, 
        N209, N208, N207, N206, N205, N204, N203, N202, N201, N200, N199, N198, 
        N197, N196, N195, N194, N193, N192}) );
  fp32_exp_DW02_mult_7 mult_345 ( .A({\s4_delta\[23\] , \s4_delta\[22\] , 
        \s4_delta\[21\] , \s4_delta\[20\] , \s4_delta\[19\] , \s4_delta\[18\] }), .B({\s4_frac_lo\[8\] , \s4_frac_lo\[7\] , \s4_frac_lo\[6\] , 
        \s4_frac_lo\[5\] , \s4_frac_lo\[4\] , \s4_frac_lo\[3\] , 
        \s4_frac_lo\[2\] , \s4_frac_lo\[1\] , \s4_frac_lo\[0\] }), .TC(n4888), 
        .PRODUCT({\interp_lo_hi_hi\[14\] , \interp_lo_hi_hi\[13\] , 
        \interp_lo_hi_hi\[12\] , \interp_lo_hi_hi\[11\] , 
        \interp_lo_hi_hi\[10\] , \interp_lo_hi_hi\[9\] , 
        \interp_lo_hi_hi\[8\] , \interp_lo_hi_hi\[7\] , \interp_lo_hi_hi\[6\] , 
        \interp_lo_hi_hi\[5\] , \interp_lo_hi_hi\[4\] , \interp_lo_hi_hi\[3\] , 
        \interp_lo_hi_hi\[2\] , \interp_lo_hi_hi\[1\] , \interp_lo_hi_hi\[0\] }) );
  fp32_exp_DW02_mult_6 mult_344 ( .A({\s4_delta\[17\] , \s4_delta\[16\] , 
        \s4_delta\[15\] , \s4_delta\[14\] , \s4_delta\[13\] , \s4_delta\[12\] }), .B({\s4_frac_lo\[8\] , \s4_frac_lo\[7\] , \s4_frac_lo\[6\] , 
        \s4_frac_lo\[5\] , \s4_frac_lo\[4\] , \s4_frac_lo\[3\] , 
        \s4_frac_lo\[2\] , \s4_frac_lo\[1\] , \s4_frac_lo\[0\] }), .TC(n4888), 
        .PRODUCT({\interp_lo_hi_lo\[14\] , \interp_lo_hi_lo\[13\] , 
        \interp_lo_hi_lo\[12\] , \interp_lo_hi_lo\[11\] , 
        \interp_lo_hi_lo\[10\] , \interp_lo_hi_lo\[9\] , 
        \interp_lo_hi_lo\[8\] , \interp_lo_hi_lo\[7\] , \interp_lo_hi_lo\[6\] , 
        \interp_lo_hi_lo\[5\] , \interp_lo_hi_lo\[4\] , \interp_lo_hi_lo\[3\] , 
        \interp_lo_hi_lo\[2\] , \interp_lo_hi_lo\[1\] , \interp_lo_hi_lo\[0\] }) );
  fp32_exp_DW02_mult_5 mult_343 ( .A({\s4_delta\[11\] , \s4_delta\[10\] , 
        \s4_delta\[9\] , \s4_delta\[8\] , \s4_delta\[7\] , \s4_delta\[6\] }), 
        .B({\s4_frac_lo\[8\] , \s4_frac_lo\[7\] , \s4_frac_lo\[6\] , 
        \s4_frac_lo\[5\] , \s4_frac_lo\[4\] , \s4_frac_lo\[3\] , 
        \s4_frac_lo\[2\] , \s4_frac_lo\[1\] , \s4_frac_lo\[0\] }), .TC(n4888), 
        .PRODUCT({\interp_lo_lo_hi\[14\] , \interp_lo_lo_hi\[13\] , 
        \interp_lo_lo_hi\[12\] , \interp_lo_lo_hi\[11\] , 
        \interp_lo_lo_hi\[10\] , \interp_lo_lo_hi\[9\] , 
        \interp_lo_lo_hi\[8\] , \interp_lo_lo_hi\[7\] , \interp_lo_lo_hi\[6\] , 
        \interp_lo_lo_hi\[5\] , \interp_lo_lo_hi\[4\] , \interp_lo_lo_hi\[3\] , 
        \interp_lo_lo_hi\[2\] , \interp_lo_lo_hi\[1\] , \interp_lo_lo_hi\[0\] }) );
  fp32_exp_DW02_mult_4 mult_342 ( .A({\s4_delta\[5\] , \s4_delta\[4\] , 
        \s4_delta\[3\] , \s4_delta\[2\] , \s4_delta\[1\] , \s4_delta\[0\] }), 
        .B({\s4_frac_lo\[8\] , \s4_frac_lo\[7\] , \s4_frac_lo\[6\] , 
        \s4_frac_lo\[5\] , \s4_frac_lo\[4\] , \s4_frac_lo\[3\] , 
        \s4_frac_lo\[2\] , \s4_frac_lo\[1\] , \s4_frac_lo\[0\] }), .TC(n4888), 
        .PRODUCT({\interp_lo_lo_lo\[14\] , \interp_lo_lo_lo\[13\] , 
        \interp_lo_lo_lo\[12\] , \interp_lo_lo_lo\[11\] , 
        \interp_lo_lo_lo\[10\] , \interp_lo_lo_lo\[9\] , 
        \interp_lo_lo_lo\[8\] , \interp_lo_lo_lo\[7\] , \interp_lo_lo_lo\[6\] , 
        \interp_lo_lo_lo\[5\] , \interp_lo_lo_lo\[4\] , \interp_lo_lo_lo\[3\] , 
        \interp_lo_lo_lo\[2\] , \interp_lo_lo_lo\[1\] , \interp_lo_lo_lo\[0\] }) );
  fp32_exp_DW02_mult_3 mult_349 ( .A({\s4_delta\[23\] , \s4_delta\[22\] , 
        \s4_delta\[21\] , \s4_delta\[20\] , \s4_delta\[19\] , \s4_delta\[18\] }), .B({\s4_frac_lo\[16\] , n3027, \s4_frac_lo\[14\] , \s4_frac_lo\[13\] , 
        \s4_frac_lo\[12\] , \s4_frac_lo\[11\] , \s4_frac_lo\[10\] , 
        \s4_frac_lo\[9\] }), .TC(n4888), .PRODUCT({\interp_hi_hi_hi\[13\] , 
        \interp_hi_hi_hi\[12\] , \interp_hi_hi_hi\[11\] , 
        \interp_hi_hi_hi\[10\] , \interp_hi_hi_hi\[9\] , 
        \interp_hi_hi_hi\[8\] , \interp_hi_hi_hi\[7\] , \interp_hi_hi_hi\[6\] , 
        \interp_hi_hi_hi\[5\] , \interp_hi_hi_hi\[4\] , \interp_hi_hi_hi\[3\] , 
        \interp_hi_hi_hi\[2\] , \interp_hi_hi_hi\[1\] , \interp_hi_hi_hi\[0\] }) );
  fp32_exp_DW02_mult_2 mult_348 ( .A({\s4_delta\[17\] , \s4_delta\[16\] , 
        \s4_delta\[15\] , \s4_delta\[14\] , \s4_delta\[13\] , \s4_delta\[12\] }), .B({\s4_frac_lo\[16\] , n3027, \s4_frac_lo\[14\] , \s4_frac_lo\[13\] , 
        \s4_frac_lo\[12\] , \s4_frac_lo\[11\] , \s4_frac_lo\[10\] , 
        \s4_frac_lo\[9\] }), .TC(n4888), .PRODUCT({\interp_hi_hi_lo\[13\] , 
        \interp_hi_hi_lo\[12\] , \interp_hi_hi_lo\[11\] , 
        \interp_hi_hi_lo\[10\] , \interp_hi_hi_lo\[9\] , 
        \interp_hi_hi_lo\[8\] , \interp_hi_hi_lo\[7\] , \interp_hi_hi_lo\[6\] , 
        \interp_hi_hi_lo\[5\] , \interp_hi_hi_lo\[4\] , \interp_hi_hi_lo\[3\] , 
        \interp_hi_hi_lo\[2\] , \interp_hi_hi_lo\[1\] , \interp_hi_hi_lo\[0\] }) );
  fp32_exp_DW02_mult_1 mult_347 ( .A({\s4_delta\[11\] , \s4_delta\[10\] , 
        \s4_delta\[9\] , \s4_delta\[8\] , \s4_delta\[7\] , \s4_delta\[6\] }), 
        .B({\s4_frac_lo\[16\] , n3027, \s4_frac_lo\[14\] , \s4_frac_lo\[13\] , 
        \s4_frac_lo\[12\] , \s4_frac_lo\[11\] , \s4_frac_lo\[10\] , 
        \s4_frac_lo\[9\] }), .TC(n4888), .PRODUCT({\interp_hi_lo_hi\[13\] , 
        \interp_hi_lo_hi\[12\] , \interp_hi_lo_hi\[11\] , 
        \interp_hi_lo_hi\[10\] , \interp_hi_lo_hi\[9\] , 
        \interp_hi_lo_hi\[8\] , \interp_hi_lo_hi\[7\] , \interp_hi_lo_hi\[6\] , 
        \interp_hi_lo_hi\[5\] , \interp_hi_lo_hi\[4\] , \interp_hi_lo_hi\[3\] , 
        \interp_hi_lo_hi\[2\] , \interp_hi_lo_hi\[1\] , \interp_hi_lo_hi\[0\] }) );
  fp32_exp_DW02_mult_0 mult_346 ( .A({\s4_delta\[5\] , \s4_delta\[4\] , 
        \s4_delta\[3\] , \s4_delta\[2\] , \s4_delta\[1\] , \s4_delta\[0\] }), 
        .B({\s4_frac_lo\[16\] , n3027, \s4_frac_lo\[14\] , \s4_frac_lo\[13\] , 
        \s4_frac_lo\[12\] , \s4_frac_lo\[11\] , \s4_frac_lo\[10\] , 
        \s4_frac_lo\[9\] }), .TC(n4888), .PRODUCT({\interp_hi_lo_lo\[13\] , 
        \interp_hi_lo_lo\[12\] , \interp_hi_lo_lo\[11\] , 
        \interp_hi_lo_lo\[10\] , \interp_hi_lo_lo\[9\] , 
        \interp_hi_lo_lo\[8\] , \interp_hi_lo_lo\[7\] , \interp_hi_lo_lo\[6\] , 
        \interp_hi_lo_lo\[5\] , \interp_hi_lo_lo\[4\] , \interp_hi_lo_lo\[3\] , 
        \interp_hi_lo_lo\[2\] , \interp_hi_lo_lo\[1\] , \interp_hi_lo_lo\[0\] }) );
  fp32_exp_DW02_mult_15 mult_129 ( .A({\s1_mag_u\[3\] , \s1_mag_u\[2\] , 
        \s1_mag_u\[1\] , \s1_mag_u\[0\] }), .B({n4889, n4888, n4889, n4889, 
        n4889, n4888, n4888, n4888, n4889, n4888, n4889, n4888, n4889, n4888, 
        n4889, n4888, n4888, n4888, n4889, n4889, n4889, n4888, n4889, n4889}), 
        .TC(n4888), .PRODUCT({\p0\[27\] , \p0\[26\] , \p0\[25\] , \p0\[24\] , 
        \p0\[23\] , \p0\[22\] , \p0\[21\] , \p0\[20\] , \p0\[19\] , \p0\[18\] , 
        \p0\[17\] , \p0\[16\] , \p0\[15\] , \p0\[14\] , \p0\[13\] , \p0\[12\] , 
        \p0\[11\] , \p0\[10\] , \p0\[9\] , \p0\[8\] , \p0\[7\] , \p0\[6\] , 
        \p0\[5\] , \p0\[4\] , \p0\[3\] , \p0\[2\] , \p0\[1\] , 
        SYNOPSYS_UNCONNECTED__0}) );
  fp32_exp_DW02_mult_14 mult_129_S2 ( .A({\s1_mag_u\[7\] , \s1_mag_u\[6\] , 
        \s1_mag_u\[5\] , \s1_mag_u\[4\] }), .B({n4889, n4888, n4889, n4889, 
        n4889, n4888, n4888, n4888, n4889, n4888, n4889, n4888, n4889, n4888, 
        n4889, n4888, n4888, n4888, n4889, n4889, n4889, n4888, n4889, n4889}), 
        .TC(n4888), .PRODUCT({\p1\[27\] , \p1\[26\] , \p1\[25\] , \p1\[24\] , 
        \p1\[23\] , \p1\[22\] , \p1\[21\] , \p1\[20\] , \p1\[19\] , \p1\[18\] , 
        \p1\[17\] , \p1\[16\] , \p1\[15\] , \p1\[14\] , \p1\[13\] , \p1\[12\] , 
        \p1\[11\] , \p1\[10\] , \p1\[9\] , \p1\[8\] , \p1\[7\] , \p1\[6\] , 
        \p1\[5\] , \p1\[4\] , \p1\[3\] , \p1\[2\] , \p1\[1\] , 
        SYNOPSYS_UNCONNECTED__1}) );
  fp32_exp_DW02_mult_13 mult_130 ( .A({\s1_mag_u\[11\] , \s1_mag_u\[10\] , 
        \s1_mag_u\[9\] , \s1_mag_u\[8\] }), .B({n4889, n4888, n4889, n4889, 
        n4889, n4888, n4888, n4888, n4889, n4888, n4889, n4888, n4889, n4888, 
        n4889, n4888, n4888, n4888, n4889, n4889, n4889, n4888, n4889, n4889}), 
        .TC(n4888), .PRODUCT({\p2\[27\] , \p2\[26\] , \p2\[25\] , \p2\[24\] , 
        \p2\[23\] , \p2\[22\] , \p2\[21\] , \p2\[20\] , \p2\[19\] , \p2\[18\] , 
        \p2\[17\] , \p2\[16\] , \p2\[15\] , \p2\[14\] , \p2\[13\] , \p2\[12\] , 
        \p2\[11\] , \p2\[10\] , \p2\[9\] , \p2\[8\] , \p2\[7\] , \p2\[6\] , 
        \p2\[5\] , \p2\[4\] , \p2\[3\] , \p2\[2\] , \p2\[1\] , 
        SYNOPSYS_UNCONNECTED__2}) );
  fp32_exp_DW02_mult_12 mult_130_S2 ( .A({\s1_mag_u\[15\] , \s1_mag_u\[14\] , 
        \s1_mag_u\[13\] , \s1_mag_u\[12\] }), .B({n4889, n4888, n4889, n4889, 
        n4889, n4888, n4888, n4888, n4889, n4888, n4889, n4888, n4889, n4888, 
        n4889, n4888, n4888, n4888, n4889, n4889, n4889, n4888, n4889, n4889}), 
        .TC(n4888), .PRODUCT({\p3\[27\] , \p3\[26\] , \p3\[25\] , \p3\[24\] , 
        \p3\[23\] , \p3\[22\] , \p3\[21\] , \p3\[20\] , \p3\[19\] , \p3\[18\] , 
        \p3\[17\] , \p3\[16\] , \p3\[15\] , \p3\[14\] , \p3\[13\] , \p3\[12\] , 
        \p3\[11\] , \p3\[10\] , \p3\[9\] , \p3\[8\] , \p3\[7\] , \p3\[6\] , 
        \p3\[5\] , \p3\[4\] , \p3\[3\] , \p3\[2\] , \p3\[1\] , 
        SYNOPSYS_UNCONNECTED__3}) );
  fp32_exp_DW02_mult_11 mult_131 ( .A({\s1_mag_u\[19\] , \s1_mag_u\[18\] , 
        \s1_mag_u\[17\] , \s1_mag_u\[16\] }), .B({n4889, n4888, n4889, n4889, 
        n4889, n4888, n4888, n4888, n4889, n4888, n4889, n4888, n4889, n4888, 
        n4889, n4888, n4888, n4888, n4889, n4889, n4889, n4888, n4889, n4889}), 
        .TC(n4888), .PRODUCT({\p4\[27\] , \p4\[26\] , \p4\[25\] , \p4\[24\] , 
        \p4\[23\] , \p4\[22\] , \p4\[21\] , \p4\[20\] , \p4\[19\] , \p4\[18\] , 
        \p4\[17\] , \p4\[16\] , \p4\[15\] , \p4\[14\] , \p4\[13\] , \p4\[12\] , 
        \p4\[11\] , \p4\[10\] , \p4\[9\] , \p4\[8\] , \p4\[7\] , \p4\[6\] , 
        \p4\[5\] , \p4\[4\] , \p4\[3\] , \p4\[2\] , \p4\[1\] , 
        SYNOPSYS_UNCONNECTED__4}) );
  fp32_exp_DW02_mult_10 mult_131_S2 ( .A({\s1_mag_u\[23\] , \s1_mag_u\[22\] , 
        \s1_mag_u\[21\] , \s1_mag_u\[20\] }), .B({n4889, n4888, n4889, n4889, 
        n4889, n4888, n4888, n4888, n4889, n4888, n4889, n4888, n4889, n4888, 
        n4889, n4888, n4888, n4888, n4889, n4889, n4889, n4888, n4889, n4889}), 
        .TC(n4888), .PRODUCT({\p5\[27\] , \p5\[26\] , \p5\[25\] , \p5\[24\] , 
        \p5\[23\] , \p5\[22\] , \p5\[21\] , \p5\[20\] , \p5\[19\] , \p5\[18\] , 
        \p5\[17\] , \p5\[16\] , \p5\[15\] , \p5\[14\] , \p5\[13\] , \p5\[12\] , 
        \p5\[11\] , \p5\[10\] , \p5\[9\] , \p5\[8\] , \p5\[7\] , \p5\[6\] , 
        \p5\[5\] , \p5\[4\] , \p5\[3\] , \p5\[2\] , \p5\[1\] , 
        SYNOPSYS_UNCONNECTED__5}) );
  fp32_exp_DW02_mult_9 mult_132 ( .A({\s1_mag_u\[27\] , \s1_mag_u\[26\] , 
        \s1_mag_u\[25\] , \s1_mag_u\[24\] }), .B({n4889, n4888, n4889, n4889, 
        n4889, n4888, n4888, n4888, n4889, n4888, n4889, n4888, n4889, n4888, 
        n4889, n4888, n4888, n4888, n4889, n4889, n4889, n4888, n4889, n4889}), 
        .TC(n4888), .PRODUCT({\p6\[27\] , \p6\[26\] , \p6\[25\] , \p6\[24\] , 
        \p6\[23\] , \p6\[22\] , \p6\[21\] , \p6\[20\] , \p6\[19\] , \p6\[18\] , 
        \p6\[17\] , \p6\[16\] , \p6\[15\] , \p6\[14\] , \p6\[13\] , \p6\[12\] , 
        \p6\[11\] , \p6\[10\] , \p6\[9\] , \p6\[8\] , \p6\[7\] , \p6\[6\] , 
        \p6\[5\] , \p6\[4\] , \p6\[3\] , \p6\[2\] , \p6\[1\] , 
        SYNOPSYS_UNCONNECTED__6}) );
  fp32_exp_DW02_mult_8 mult_132_S2 ( .A({n4888, \s1_mag_u\[30\] , 
        \s1_mag_u\[29\] , \s1_mag_u\[28\] }), .B({n4889, n4888, n4889, n4889, 
        n4889, n4888, n4888, n4888, n4889, n4888, n4889, n4888, n4889, n4888, 
        n4889, n4888, n4888, n4888, n4889, n4889, n4889, n4888, n4889, n4889}), 
        .TC(n4888), .PRODUCT({\p7\[27\] , \p7\[26\] , \p7\[25\] , \p7\[24\] , 
        \p7\[23\] , \p7\[22\] , \p7\[21\] , \p7\[20\] , \p7\[19\] , \p7\[18\] , 
        \p7\[17\] , \p7\[16\] , \p7\[15\] , \p7\[14\] , \p7\[13\] , \p7\[12\] , 
        \p7\[11\] , \p7\[10\] , \p7\[9\] , \p7\[8\] , \p7\[7\] , \p7\[6\] , 
        \p7\[5\] , \p7\[4\] , \p7\[3\] , \p7\[2\] , \p7\[1\] , 
        SYNOPSYS_UNCONNECTED__7}) );
  fp32_exp_DW01_add_32 add_136 ( .A({\s2p_hi_hi\[31\] , \s2p_hi_hi\[30\] , 
        \s2p_hi_hi\[29\] , \s2p_hi_hi\[28\] , \s2p_hi_hi\[27\] , 
        \s2p_hi_hi\[26\] , \s2p_hi_hi\[25\] , \s2p_hi_hi\[24\] , 
        \s2p_hi_hi\[23\] , \s2p_hi_hi\[22\] , \s2p_hi_hi\[21\] , 
        \s2p_hi_hi\[20\] , \s2p_hi_hi\[19\] , \s2p_hi_hi\[18\] , 
        \s2p_hi_hi\[17\] , \s2p_hi_hi\[16\] , \s2p_hi_hi\[15\] , 
        \s2p_hi_hi\[14\] , \s2p_hi_hi\[13\] , \s2p_hi_hi\[12\] , 
        \s2p_hi_hi\[11\] , \s2p_hi_hi\[10\] , \s2p_hi_hi\[9\] , 
        \s2p_hi_hi\[8\] , \s2p_hi_hi\[7\] , \s2p_hi_hi\[6\] , \s2p_hi_hi\[5\] , 
        \s2p_hi_hi\[4\] , \s2p_hi_hi\[3\] , \s2p_hi_hi\[2\] , \s2p_hi_hi\[1\] , 
        \s2p_hi_hi\[0\] , n4888, n4888, n4888, n4888, n4888, n4888, n4888, 
        n4888}), .B({n4888, n4888, n4888, n4888, n4888, n4888, n4888, n4888, 
        \s2p_hi_lo\[31\] , \s2p_hi_lo\[30\] , \s2p_hi_lo\[29\] , 
        \s2p_hi_lo\[28\] , \s2p_hi_lo\[27\] , \s2p_hi_lo\[26\] , 
        \s2p_hi_lo\[25\] , \s2p_hi_lo\[24\] , \s2p_hi_lo\[23\] , 
        \s2p_hi_lo\[22\] , \s2p_hi_lo\[21\] , \s2p_hi_lo\[20\] , 
        \s2p_hi_lo\[19\] , \s2p_hi_lo\[18\] , \s2p_hi_lo\[17\] , 
        \s2p_hi_lo\[16\] , \s2p_hi_lo\[15\] , \s2p_hi_lo\[14\] , 
        \s2p_hi_lo\[13\] , \s2p_hi_lo\[12\] , \s2p_hi_lo\[11\] , 
        \s2p_hi_lo\[10\] , \s2p_hi_lo\[9\] , \s2p_hi_lo\[8\] , 
        \s2p_hi_lo\[7\] , \s2p_hi_lo\[6\] , \s2p_hi_lo\[5\] , \s2p_hi_lo\[4\] , 
        \s2p_hi_lo\[3\] , \s2p_hi_lo\[2\] , \s2p_hi_lo\[1\] , \s2p_hi_lo\[0\] }), .CI(n4888), .SUM({\prod_hi\[39\] , \prod_hi\[38\] , \prod_hi\[37\] , 
        \prod_hi\[36\] , \prod_hi\[35\] , \prod_hi\[34\] , \prod_hi\[33\] , 
        \prod_hi\[32\] , \prod_hi\[31\] , \prod_hi\[30\] , \prod_hi\[29\] , 
        \prod_hi\[28\] , \prod_hi\[27\] , \prod_hi\[26\] , \prod_hi\[25\] , 
        \prod_hi\[24\] , \prod_hi\[23\] , \prod_hi\[22\] , \prod_hi\[21\] , 
        \prod_hi\[20\] , \prod_hi\[19\] , \prod_hi\[18\] , \prod_hi\[17\] , 
        \prod_hi\[16\] , \prod_hi\[15\] , \prod_hi\[14\] , \prod_hi\[13\] , 
        \prod_hi\[12\] , \prod_hi\[11\] , \prod_hi\[10\] , \prod_hi\[9\] , 
        \prod_hi\[8\] , SYNOPSYS_UNCONNECTED__8, SYNOPSYS_UNCONNECTED__9, 
        SYNOPSYS_UNCONNECTED__10, SYNOPSYS_UNCONNECTED__11, 
        SYNOPSYS_UNCONNECTED__12, SYNOPSYS_UNCONNECTED__13, 
        SYNOPSYS_UNCONNECTED__14, SYNOPSYS_UNCONNECTED__15}) );
  fp32_exp_DW01_add_J3_1 add_135 ( .A({\s2p_lo_hi\[31\] , \s2p_lo_hi\[30\] , 
        \s2p_lo_hi\[29\] , \s2p_lo_hi\[28\] , \s2p_lo_hi\[27\] , 
        \s2p_lo_hi\[26\] , \s2p_lo_hi\[25\] , \s2p_lo_hi\[24\] , 
        \s2p_lo_hi\[23\] , \s2p_lo_hi\[22\] , \s2p_lo_hi\[21\] , 
        \s2p_lo_hi\[20\] , \s2p_lo_hi\[19\] , \s2p_lo_hi\[18\] , 
        \s2p_lo_hi\[17\] , \s2p_lo_hi\[16\] , \s2p_lo_hi\[15\] , 
        \s2p_lo_hi\[14\] , \s2p_lo_hi\[13\] , \s2p_lo_hi\[12\] , 
        \s2p_lo_hi\[11\] , \s2p_lo_hi\[10\] , \s2p_lo_hi\[9\] , 
        \s2p_lo_hi\[8\] , \s2p_lo_hi\[7\] , \s2p_lo_hi\[6\] , \s2p_lo_hi\[5\] , 
        \s2p_lo_hi\[4\] , \s2p_lo_hi\[3\] , \s2p_lo_hi\[2\] , \s2p_lo_hi\[1\] , 
        \s2p_lo_hi\[0\] , n4888, n4888, n4888, n4888, n4888, n4888, n4888, 
        n4888}), .B({n4888, n4888, n4888, n4888, n4888, n4888, n4888, n4888, 
        \s2p_lo_lo\[31\] , \s2p_lo_lo\[30\] , \s2p_lo_lo\[29\] , 
        \s2p_lo_lo\[28\] , \s2p_lo_lo\[27\] , \s2p_lo_lo\[26\] , 
        \s2p_lo_lo\[25\] , \s2p_lo_lo\[24\] , \s2p_lo_lo\[23\] , 
        \s2p_lo_lo\[22\] , \s2p_lo_lo\[21\] , \s2p_lo_lo\[20\] , 
        \s2p_lo_lo\[19\] , \s2p_lo_lo\[18\] , \s2p_lo_lo\[17\] , 
        \s2p_lo_lo\[16\] , \s2p_lo_lo\[15\] , \s2p_lo_lo\[14\] , 
        \s2p_lo_lo\[13\] , \s2p_lo_lo\[12\] , \s2p_lo_lo\[11\] , 
        \s2p_lo_lo\[10\] , \s2p_lo_lo\[9\] , \s2p_lo_lo\[8\] , 
        \s2p_lo_lo\[7\] , \s2p_lo_lo\[6\] , \s2p_lo_lo\[5\] , \s2p_lo_lo\[4\] , 
        \s2p_lo_lo\[3\] , \s2p_lo_lo\[2\] , \s2p_lo_lo\[1\] , \s2p_lo_lo\[0\] }), .CI(n4888), .SUM({\prod_lo\[39\] , \prod_lo\[38\] , \prod_lo\[37\] , 
        \prod_lo\[36\] , \prod_lo\[35\] , \prod_lo\[34\] , \prod_lo\[33\] , 
        \prod_lo\[32\] , \prod_lo\[31\] , \prod_lo\[30\] , \prod_lo\[29\] , 
        \prod_lo\[28\] , \prod_lo\[27\] , \prod_lo\[26\] , \prod_lo\[25\] , 
        \prod_lo\[24\] , \prod_lo\[23\] , \prod_lo\[22\] , \prod_lo\[21\] , 
        \prod_lo\[20\] , \prod_lo\[19\] , \prod_lo\[18\] , \prod_lo\[17\] , 
        \prod_lo\[16\] , \prod_lo\[15\] , \prod_lo\[14\] , \prod_lo\[13\] , 
        \prod_lo\[12\] , \prod_lo\[11\] , \prod_lo\[10\] , \prod_lo\[9\] , 
        \prod_lo\[8\] , SYNOPSYS_UNCONNECTED__16, SYNOPSYS_UNCONNECTED__17, 
        SYNOPSYS_UNCONNECTED__18, SYNOPSYS_UNCONNECTED__19, 
        SYNOPSYS_UNCONNECTED__20, SYNOPSYS_UNCONNECTED__21, 
        SYNOPSYS_UNCONNECTED__22, SYNOPSYS_UNCONNECTED__23}) );
  fp32_exp_DW01_sub_6 sub_162 ( .A({n4888, n4888, n4888, n4888, n4888, n4888, 
        n4888, n4888, n4888, n4888, n4888, n4888, n4888, n4888, n4888, n4888, 
        n4888, n4888, n4888, n4888, n4888, n4888, n4888}), .B({\prod\[45\] , 
        \prod\[44\] , \prod\[43\] , \prod\[42\] , \prod\[41\] , \prod\[40\] , 
        \prod\[39\] , \prod\[38\] , \prod\[37\] , \prod\[36\] , \prod\[35\] , 
        \prod\[34\] , \prod\[33\] , \prod\[32\] , \prod\[31\] , \prod\[30\] , 
        \prod\[29\] , \prod\[28\] , \prod\[27\] , \prod\[26\] , \prod\[25\] , 
        \prod\[24\] , \prod\[23\] }), .CI(n4888), .DIFF({N257, N256, N255, 
        N254, N253, N252, N251, N250, N249, N248, N247, N246, N245, N244, N243, 
        N242, N241, N240, N239, N238, N237, N236, N235}) );
  fp32_exp_DW01_sub_7 sub_313 ( .A({\s3_lut_next\[23\] , \s3_lut_next\[22\] , 
        \s3_lut_next\[21\] , \s3_lut_next\[20\] , \s3_lut_next\[19\] , 
        \s3_lut_next\[18\] , \s3_lut_next\[17\] , \s3_lut_next\[16\] , 
        \s3_lut_next\[15\] , \s3_lut_next\[14\] , \s3_lut_next\[13\] , 
        \s3_lut_next\[12\] , \s3_lut_next\[11\] , \s3_lut_next\[10\] , 
        \s3_lut_next\[9\] , \s3_lut_next\[8\] , \s3_lut_next\[7\] , 
        \s3_lut_next\[6\] , \s3_lut_next\[5\] , \s3_lut_next\[4\] , 
        \s3_lut_next\[3\] , \s3_lut_next\[2\] , \s3_lut_next\[1\] , 
        \s3_lut_next\[0\] }), .B({n4888, \s3_lut_base\[22\] , 
        \s3_lut_base\[21\] , \s3_lut_base\[20\] , \s3_lut_base\[19\] , 
        \s3_lut_base\[18\] , \s3_lut_base\[17\] , \s3_lut_base\[16\] , 
        \s3_lut_base\[15\] , \s3_lut_base\[14\] , \s3_lut_base\[13\] , 
        \s3_lut_base\[12\] , \s3_lut_base\[11\] , \s3_lut_base\[10\] , 
        \s3_lut_base\[9\] , \s3_lut_base\[8\] , \s3_lut_base\[7\] , 
        \s3_lut_base\[6\] , \s3_lut_base\[5\] , \s3_lut_base\[4\] , 
        \s3_lut_base\[3\] , \s3_lut_base\[2\] , \s3_lut_base\[1\] , 
        \s3_lut_base\[0\] }), .CI(n4888), .DIFF({\lut_delta\[23\] , 
        \lut_delta\[22\] , \lut_delta\[21\] , \lut_delta\[20\] , 
        \lut_delta\[19\] , \lut_delta\[18\] , \lut_delta\[17\] , 
        \lut_delta\[16\] , \lut_delta\[15\] , \lut_delta\[14\] , 
        \lut_delta\[13\] , \lut_delta\[12\] , \lut_delta\[11\] , 
        \lut_delta\[10\] , \lut_delta\[9\] , \lut_delta\[8\] , 
        \lut_delta\[7\] , \lut_delta\[6\] , \lut_delta\[5\] , \lut_delta\[4\] , 
        \lut_delta\[3\] , \lut_delta\[2\] , \lut_delta\[1\] , \lut_delta\[0\] }) );
  fp32_exp_DW01_add_35 add_449 ( .A({\s6_interp_lo_hi\[20\] , 
        \s6_interp_lo_hi\[19\] , \s6_interp_lo_hi\[18\] , 
        \s6_interp_lo_hi\[17\] , \s6_interp_lo_hi\[16\] , 
        \s6_interp_lo_hi\[15\] , \s6_interp_lo_hi\[14\] , 
        \s6_interp_lo_hi\[13\] , \s6_interp_lo_hi\[12\] , 
        \s6_interp_lo_hi\[11\] , \s6_interp_lo_hi\[10\] , 
        \s6_interp_lo_hi\[9\] , \s6_interp_lo_hi\[8\] , \s6_interp_lo_hi\[7\] , 
        \s6_interp_lo_hi\[6\] , \s6_interp_lo_hi\[5\] , \s6_interp_lo_hi\[4\] , 
        \s6_interp_lo_hi\[3\] , \s6_interp_lo_hi\[2\] , \s6_interp_lo_hi\[1\] , 
        \s6_interp_lo_hi\[0\] , n4888, n4888, n4888, n4888, n4888, n4888, 
        n4888, n4888, n4888, n4888, n4888, n4888}), .B({n4888, n4888, n4888, 
        n4888, n4888, n4888, n4888, n4888, n4888, n4888, n4888, n4888, 
        \s6_interp_lo_lo\[20\] , \s6_interp_lo_lo\[19\] , 
        \s6_interp_lo_lo\[18\] , \s6_interp_lo_lo\[17\] , 
        \s6_interp_lo_lo\[16\] , \s6_interp_lo_lo\[15\] , 
        \s6_interp_lo_lo\[14\] , \s6_interp_lo_lo\[13\] , 
        \s6_interp_lo_lo\[12\] , \s6_interp_lo_lo\[11\] , 
        \s6_interp_lo_lo\[10\] , \s6_interp_lo_lo\[9\] , 
        \s6_interp_lo_lo\[8\] , \s6_interp_lo_lo\[7\] , \s6_interp_lo_lo\[6\] , 
        \s6_interp_lo_lo\[5\] , \s6_interp_lo_lo\[4\] , \s6_interp_lo_lo\[3\] , 
        \s6_interp_lo_lo\[2\] , \s6_interp_lo_lo\[1\] , \s6_interp_lo_lo\[0\] }), .CI(n4888), .SUM({N1172, N1171, N1170, N1169, N1168, N1167, N1166, N1165, 
        N1164, N1163, N1162, N1161, N1160, N1159, N1158, N1157, N1156, N1155, 
        N1154, N1153, N1152, SYNOPSYS_UNCONNECTED__24, 
        SYNOPSYS_UNCONNECTED__25, SYNOPSYS_UNCONNECTED__26, 
        SYNOPSYS_UNCONNECTED__27, SYNOPSYS_UNCONNECTED__28, 
        SYNOPSYS_UNCONNECTED__29, SYNOPSYS_UNCONNECTED__30, 
        SYNOPSYS_UNCONNECTED__31, SYNOPSYS_UNCONNECTED__32, 
        SYNOPSYS_UNCONNECTED__33, SYNOPSYS_UNCONNECTED__34, 
        SYNOPSYS_UNCONNECTED__35}) );
  fp32_exp_DW01_add_36 add_353 ( .A({n4888, \s7_lut_base\[22\] , 
        \s7_lut_base\[21\] , \s7_lut_base\[20\] , \s7_lut_base\[19\] , 
        \s7_lut_base\[18\] , \s7_lut_base\[17\] , \s7_lut_base\[16\] , 
        \s7_lut_base\[15\] , \s7_lut_base\[14\] , \s7_lut_base\[13\] , 
        \s7_lut_base\[12\] , \s7_lut_base\[11\] , \s7_lut_base\[10\] , 
        \s7_lut_base\[9\] , \s7_lut_base\[8\] , \s7_lut_base\[7\] , 
        \s7_lut_base\[6\] , \s7_lut_base\[5\] , \s7_lut_base\[4\] , 
        \s7_lut_base\[3\] , \s7_lut_base\[2\] , \s7_lut_base\[1\] , 
        \s7_lut_base\[0\] }), .B({\interp_sum\[40\] , \interp_sum\[39\] , 
        \interp_sum\[38\] , \interp_sum\[37\] , \interp_sum\[36\] , 
        \interp_sum\[35\] , \interp_sum\[34\] , \interp_sum\[33\] , 
        \interp_sum\[32\] , \interp_sum\[31\] , \interp_sum\[30\] , 
        \interp_sum\[29\] , \interp_sum\[28\] , \interp_sum\[27\] , 
        \interp_sum\[26\] , \interp_sum\[25\] , \interp_sum\[24\] , 
        \interp_sum\[23\] , \interp_sum\[22\] , \interp_sum\[21\] , 
        \interp_sum\[20\] , \interp_sum\[19\] , \interp_sum\[18\] , 
        \interp_sum\[17\] }), .CI(n4888), .SUM({\mant_frac\[23\] , 
        \mant_frac\[22\] , \mant_frac\[21\] , \mant_frac\[20\] , 
        \mant_frac\[19\] , \mant_frac\[18\] , \mant_frac\[17\] , 
        \mant_frac\[16\] , \mant_frac\[15\] , \mant_frac\[14\] , 
        \mant_frac\[13\] , \mant_frac\[12\] , \mant_frac\[11\] , 
        \mant_frac\[10\] , \mant_frac\[9\] , \mant_frac\[8\] , 
        \mant_frac\[7\] , \mant_frac\[6\] , \mant_frac\[5\] , \mant_frac\[4\] , 
        \mant_frac\[3\] , \mant_frac\[2\] , \mant_frac\[1\] , \mant_frac\[0\] }) );
  fp32_exp_DW01_add_J6_0 add_140 ( .A({\s2m_prod_hi\[39\] , 
        \s2m_prod_hi\[38\] , \s2m_prod_hi\[37\] , \s2m_prod_hi\[36\] , 
        \s2m_prod_hi\[35\] , \s2m_prod_hi\[34\] , \s2m_prod_hi\[33\] , 
        \s2m_prod_hi\[32\] , \s2m_prod_hi\[31\] , \s2m_prod_hi\[30\] , 
        \s2m_prod_hi\[29\] , \s2m_prod_hi\[28\] , \s2m_prod_hi\[27\] , 
        \s2m_prod_hi\[26\] , \s2m_prod_hi\[25\] , \s2m_prod_hi\[24\] , 
        \s2m_prod_hi\[23\] , \s2m_prod_hi\[22\] , \s2m_prod_hi\[21\] , 
        \s2m_prod_hi\[20\] , \s2m_prod_hi\[19\] , \s2m_prod_hi\[18\] , 
        \s2m_prod_hi\[17\] , \s2m_prod_hi\[16\] , \s2m_prod_hi\[15\] , 
        \s2m_prod_hi\[14\] , \s2m_prod_hi\[13\] , \s2m_prod_hi\[12\] , 
        \s2m_prod_hi\[11\] , \s2m_prod_hi\[10\] , \s2m_prod_hi\[9\] , 
        \s2m_prod_hi\[8\] , \s2m_prod_hi\[7\] , \s2m_prod_hi\[6\] , 
        \s2m_prod_hi\[5\] , \s2m_prod_hi\[4\] , \s2m_prod_hi\[3\] , 
        \s2m_prod_hi\[2\] , \s2m_prod_hi\[1\] , \s2m_prod_hi\[0\] , n4888, 
        n4888, n4888, n4888, n4888, n4888, n4888, n4888, n4888, n4888, n4888, 
        n4888, n4888, n4888, n4888, n4888}), .B({n4888, n4888, n4888, n4888, 
        n4888, n4888, n4888, n4888, n4888, n4888, n4888, n4888, n4888, n4888, 
        n4888, n4888, \s2m_prod_lo\[39\] , \s2m_prod_lo\[38\] , 
        \s2m_prod_lo\[37\] , \s2m_prod_lo\[36\] , \s2m_prod_lo\[35\] , 
        \s2m_prod_lo\[34\] , \s2m_prod_lo\[33\] , \s2m_prod_lo\[32\] , 
        \s2m_prod_lo\[31\] , \s2m_prod_lo\[30\] , \s2m_prod_lo\[29\] , 
        \s2m_prod_lo\[28\] , \s2m_prod_lo\[27\] , \s2m_prod_lo\[26\] , 
        \s2m_prod_lo\[25\] , \s2m_prod_lo\[24\] , \s2m_prod_lo\[23\] , 
        \s2m_prod_lo\[22\] , \s2m_prod_lo\[21\] , \s2m_prod_lo\[20\] , 
        \s2m_prod_lo\[19\] , \s2m_prod_lo\[18\] , \s2m_prod_lo\[17\] , 
        \s2m_prod_lo\[16\] , \s2m_prod_lo\[15\] , \s2m_prod_lo\[14\] , 
        \s2m_prod_lo\[13\] , \s2m_prod_lo\[12\] , \s2m_prod_lo\[11\] , 
        \s2m_prod_lo\[10\] , \s2m_prod_lo\[9\] , \s2m_prod_lo\[8\] , 
        \s2m_prod_lo\[7\] , \s2m_prod_lo\[6\] , \s2m_prod_lo\[5\] , 
        \s2m_prod_lo\[4\] , \s2m_prod_lo\[3\] , \s2m_prod_lo\[2\] , 
        \s2m_prod_lo\[1\] , \s2m_prod_lo\[0\] }), .CI(n4888), .SUM({
        \prod\[55\] , \prod\[54\] , \prod\[53\] , \prod\[52\] , \prod\[51\] , 
        \prod\[50\] , \prod\[49\] , \prod\[48\] , \prod\[47\] , \prod\[46\] , 
        \prod\[45\] , \prod\[44\] , \prod\[43\] , \prod\[42\] , \prod\[41\] , 
        \prod\[40\] , \prod\[39\] , \prod\[38\] , \prod\[37\] , \prod\[36\] , 
        \prod\[35\] , \prod\[34\] , \prod\[33\] , \prod\[32\] , \prod\[31\] , 
        \prod\[30\] , \prod\[29\] , \prod\[28\] , \prod\[27\] , \prod\[26\] , 
        \prod\[25\] , \prod\[24\] , \prod\[23\] , SYNOPSYS_UNCONNECTED__36, 
        SYNOPSYS_UNCONNECTED__37, SYNOPSYS_UNCONNECTED__38, 
        SYNOPSYS_UNCONNECTED__39, SYNOPSYS_UNCONNECTED__40, 
        SYNOPSYS_UNCONNECTED__41, SYNOPSYS_UNCONNECTED__42, 
        SYNOPSYS_UNCONNECTED__43, SYNOPSYS_UNCONNECTED__44, 
        SYNOPSYS_UNCONNECTED__45, SYNOPSYS_UNCONNECTED__46, 
        SYNOPSYS_UNCONNECTED__47, SYNOPSYS_UNCONNECTED__48, 
        SYNOPSYS_UNCONNECTED__49, SYNOPSYS_UNCONNECTED__50, 
        SYNOPSYS_UNCONNECTED__51, SYNOPSYS_UNCONNECTED__52, 
        SYNOPSYS_UNCONNECTED__53, SYNOPSYS_UNCONNECTED__54, 
        SYNOPSYS_UNCONNECTED__55, SYNOPSYS_UNCONNECTED__56, 
        SYNOPSYS_UNCONNECTED__57, SYNOPSYS_UNCONNECTED__58}) );
  fp32_exp_DW01_add_J7_0 add_351 ( .A({\s7_interp_hi\[31\] , 
        \s7_interp_hi\[30\] , \s7_interp_hi\[29\] , \s7_interp_hi\[28\] , 
        \s7_interp_hi\[27\] , \s7_interp_hi\[26\] , \s7_interp_hi\[25\] , 
        \s7_interp_hi\[24\] , \s7_interp_hi\[23\] , \s7_interp_hi\[22\] , 
        \s7_interp_hi\[21\] , \s7_interp_hi\[20\] , \s7_interp_hi\[19\] , 
        \s7_interp_hi\[18\] , \s7_interp_hi\[17\] , \s7_interp_hi\[16\] , 
        \s7_interp_hi\[15\] , \s7_interp_hi\[14\] , \s7_interp_hi\[13\] , 
        \s7_interp_hi\[12\] , \s7_interp_hi\[11\] , \s7_interp_hi\[10\] , 
        \s7_interp_hi\[9\] , \s7_interp_hi\[8\] , \s7_interp_hi\[7\] , 
        \s7_interp_hi\[6\] , \s7_interp_hi\[5\] , \s7_interp_hi\[4\] , 
        \s7_interp_hi\[3\] , \s7_interp_hi\[2\] , \s7_interp_hi\[1\] , 
        \s7_interp_hi\[0\] , n4888, n4888, n4888, n4888, n4888, n4888, n4888, 
        n4888, n4888}), .B({n4888, n4888, n4888, n4888, n4888, n4888, n4888, 
        n4888, \s7_interp_lo\[32\] , \s7_interp_lo\[31\] , 
        \s7_interp_lo\[30\] , \s7_interp_lo\[29\] , \s7_interp_lo\[28\] , 
        \s7_interp_lo\[27\] , \s7_interp_lo\[26\] , \s7_interp_lo\[25\] , 
        \s7_interp_lo\[24\] , \s7_interp_lo\[23\] , \s7_interp_lo\[22\] , 
        \s7_interp_lo\[21\] , \s7_interp_lo\[20\] , \s7_interp_lo\[19\] , 
        \s7_interp_lo\[18\] , \s7_interp_lo\[17\] , \s7_interp_lo\[16\] , 
        \s7_interp_lo\[15\] , \s7_interp_lo\[14\] , \s7_interp_lo\[13\] , 
        \s7_interp_lo\[12\] , \s7_interp_lo\[11\] , \s7_interp_lo\[10\] , 
        \s7_interp_lo\[9\] , \s7_interp_lo\[8\] , \s7_interp_lo\[7\] , 
        \s7_interp_lo\[6\] , \s7_interp_lo\[5\] , \s7_interp_lo\[4\] , 
        \s7_interp_lo\[3\] , \s7_interp_lo\[2\] , \s7_interp_lo\[1\] , 
        \s7_interp_lo\[0\] }), .CI(n4888), .SUM({\interp_sum\[40\] , 
        \interp_sum\[39\] , \interp_sum\[38\] , \interp_sum\[37\] , 
        \interp_sum\[36\] , \interp_sum\[35\] , \interp_sum\[34\] , 
        \interp_sum\[33\] , \interp_sum\[32\] , \interp_sum\[31\] , 
        \interp_sum\[30\] , \interp_sum\[29\] , \interp_sum\[28\] , 
        \interp_sum\[27\] , \interp_sum\[26\] , \interp_sum\[25\] , 
        \interp_sum\[24\] , \interp_sum\[23\] , \interp_sum\[22\] , 
        \interp_sum\[21\] , \interp_sum\[20\] , \interp_sum\[19\] , 
        \interp_sum\[18\] , \interp_sum\[17\] , SYNOPSYS_UNCONNECTED__59, 
        SYNOPSYS_UNCONNECTED__60, SYNOPSYS_UNCONNECTED__61, 
        SYNOPSYS_UNCONNECTED__62, SYNOPSYS_UNCONNECTED__63, 
        SYNOPSYS_UNCONNECTED__64, SYNOPSYS_UNCONNECTED__65, 
        SYNOPSYS_UNCONNECTED__66, SYNOPSYS_UNCONNECTED__67, 
        SYNOPSYS_UNCONNECTED__68, SYNOPSYS_UNCONNECTED__69, 
        SYNOPSYS_UNCONNECTED__70, SYNOPSYS_UNCONNECTED__71, 
        SYNOPSYS_UNCONNECTED__72, SYNOPSYS_UNCONNECTED__73, 
        SYNOPSYS_UNCONNECTED__74, SYNOPSYS_UNCONNECTED__75}) );
  fp32_exp_DW01_add_44 add_134_S2 ( .A({\s2q_p7\[27\] , \s2q_p7\[26\] , 
        \s2q_p7\[25\] , \s2q_p7\[24\] , \s2q_p7\[23\] , \s2q_p7\[22\] , 
        \s2q_p7\[21\] , \s2q_p7\[20\] , \s2q_p7\[19\] , \s2q_p7\[18\] , 
        \s2q_p7\[17\] , \s2q_p7\[16\] , \s2q_p7\[15\] , \s2q_p7\[14\] , 
        \s2q_p7\[13\] , \s2q_p7\[12\] , \s2q_p7\[11\] , \s2q_p7\[10\] , 
        \s2q_p7\[9\] , \s2q_p7\[8\] , \s2q_p7\[7\] , \s2q_p7\[6\] , 
        \s2q_p7\[5\] , \s2q_p7\[4\] , \s2q_p7\[3\] , \s2q_p7\[2\] , 
        \s2q_p7\[1\] , \s2q_p7\[0\] , n4888, n4888, n4888, n4888}), .B({n4888, 
        n4888, n4888, n4888, \s2q_p6\[27\] , \s2q_p6\[26\] , \s2q_p6\[25\] , 
        \s2q_p6\[24\] , \s2q_p6\[23\] , \s2q_p6\[22\] , \s2q_p6\[21\] , 
        \s2q_p6\[20\] , \s2q_p6\[19\] , \s2q_p6\[18\] , \s2q_p6\[17\] , 
        \s2q_p6\[16\] , \s2q_p6\[15\] , \s2q_p6\[14\] , \s2q_p6\[13\] , 
        \s2q_p6\[12\] , \s2q_p6\[11\] , \s2q_p6\[10\] , \s2q_p6\[9\] , 
        \s2q_p6\[8\] , \s2q_p6\[7\] , \s2q_p6\[6\] , \s2q_p6\[5\] , 
        \s2q_p6\[4\] , \s2q_p6\[3\] , \s2q_p6\[2\] , \s2q_p6\[1\] , 
        \s2q_p6\[0\] }), .CI(n4888), .SUM({\prod_hi_hi\[31\] , 
        \prod_hi_hi\[30\] , \prod_hi_hi\[29\] , \prod_hi_hi\[28\] , 
        \prod_hi_hi\[27\] , \prod_hi_hi\[26\] , \prod_hi_hi\[25\] , 
        \prod_hi_hi\[24\] , \prod_hi_hi\[23\] , \prod_hi_hi\[22\] , 
        \prod_hi_hi\[21\] , \prod_hi_hi\[20\] , \prod_hi_hi\[19\] , 
        \prod_hi_hi\[18\] , \prod_hi_hi\[17\] , \prod_hi_hi\[16\] , 
        \prod_hi_hi\[15\] , \prod_hi_hi\[14\] , \prod_hi_hi\[13\] , 
        \prod_hi_hi\[12\] , \prod_hi_hi\[11\] , \prod_hi_hi\[10\] , 
        \prod_hi_hi\[9\] , \prod_hi_hi\[8\] , \prod_hi_hi\[7\] , 
        \prod_hi_hi\[6\] , \prod_hi_hi\[5\] , \prod_hi_hi\[4\] , 
        SYNOPSYS_UNCONNECTED__76, SYNOPSYS_UNCONNECTED__77, 
        SYNOPSYS_UNCONNECTED__78, SYNOPSYS_UNCONNECTED__79}) );
  fp32_exp_DW01_add_J9_0 add_134 ( .A({\s2q_p5\[27\] , \s2q_p5\[26\] , 
        \s2q_p5\[25\] , \s2q_p5\[24\] , \s2q_p5\[23\] , \s2q_p5\[22\] , 
        \s2q_p5\[21\] , \s2q_p5\[20\] , \s2q_p5\[19\] , \s2q_p5\[18\] , 
        \s2q_p5\[17\] , \s2q_p5\[16\] , \s2q_p5\[15\] , \s2q_p5\[14\] , 
        \s2q_p5\[13\] , \s2q_p5\[12\] , \s2q_p5\[11\] , \s2q_p5\[10\] , 
        \s2q_p5\[9\] , \s2q_p5\[8\] , \s2q_p5\[7\] , \s2q_p5\[6\] , 
        \s2q_p5\[5\] , \s2q_p5\[4\] , \s2q_p5\[3\] , \s2q_p5\[2\] , 
        \s2q_p5\[1\] , \s2q_p5\[0\] , n4888, n4888, n4888, n4888}), .B({n4888, 
        n4888, n4888, n4888, \s2q_p4\[27\] , \s2q_p4\[26\] , \s2q_p4\[25\] , 
        \s2q_p4\[24\] , \s2q_p4\[23\] , \s2q_p4\[22\] , \s2q_p4\[21\] , 
        \s2q_p4\[20\] , \s2q_p4\[19\] , \s2q_p4\[18\] , \s2q_p4\[17\] , 
        \s2q_p4\[16\] , \s2q_p4\[15\] , \s2q_p4\[14\] , \s2q_p4\[13\] , 
        \s2q_p4\[12\] , \s2q_p4\[11\] , \s2q_p4\[10\] , \s2q_p4\[9\] , 
        \s2q_p4\[8\] , \s2q_p4\[7\] , \s2q_p4\[6\] , \s2q_p4\[5\] , 
        \s2q_p4\[4\] , \s2q_p4\[3\] , \s2q_p4\[2\] , \s2q_p4\[1\] , 
        \s2q_p4\[0\] }), .CI(n4888), .SUM({\prod_hi_lo\[31\] , 
        \prod_hi_lo\[30\] , \prod_hi_lo\[29\] , \prod_hi_lo\[28\] , 
        \prod_hi_lo\[27\] , \prod_hi_lo\[26\] , \prod_hi_lo\[25\] , 
        \prod_hi_lo\[24\] , \prod_hi_lo\[23\] , \prod_hi_lo\[22\] , 
        \prod_hi_lo\[21\] , \prod_hi_lo\[20\] , \prod_hi_lo\[19\] , 
        \prod_hi_lo\[18\] , \prod_hi_lo\[17\] , \prod_hi_lo\[16\] , 
        \prod_hi_lo\[15\] , \prod_hi_lo\[14\] , \prod_hi_lo\[13\] , 
        \prod_hi_lo\[12\] , \prod_hi_lo\[11\] , \prod_hi_lo\[10\] , 
        \prod_hi_lo\[9\] , \prod_hi_lo\[8\] , \prod_hi_lo\[7\] , 
        \prod_hi_lo\[6\] , \prod_hi_lo\[5\] , \prod_hi_lo\[4\] , 
        SYNOPSYS_UNCONNECTED__80, SYNOPSYS_UNCONNECTED__81, 
        SYNOPSYS_UNCONNECTED__82, SYNOPSYS_UNCONNECTED__83}) );
  fp32_exp_DW01_add_45 add_133_S2 ( .A({\s2q_p3\[27\] , \s2q_p3\[26\] , 
        \s2q_p3\[25\] , \s2q_p3\[24\] , \s2q_p3\[23\] , \s2q_p3\[22\] , 
        \s2q_p3\[21\] , \s2q_p3\[20\] , \s2q_p3\[19\] , \s2q_p3\[18\] , 
        \s2q_p3\[17\] , \s2q_p3\[16\] , \s2q_p3\[15\] , \s2q_p3\[14\] , 
        \s2q_p3\[13\] , \s2q_p3\[12\] , \s2q_p3\[11\] , \s2q_p3\[10\] , 
        \s2q_p3\[9\] , \s2q_p3\[8\] , \s2q_p3\[7\] , \s2q_p3\[6\] , 
        \s2q_p3\[5\] , \s2q_p3\[4\] , \s2q_p3\[3\] , \s2q_p3\[2\] , 
        \s2q_p3\[1\] , \s2q_p3\[0\] , n4888, n4888, n4888, n4888}), .B({n4888, 
        n4888, n4888, n4888, \s2q_p2\[27\] , \s2q_p2\[26\] , \s2q_p2\[25\] , 
        \s2q_p2\[24\] , \s2q_p2\[23\] , \s2q_p2\[22\] , \s2q_p2\[21\] , 
        \s2q_p2\[20\] , \s2q_p2\[19\] , \s2q_p2\[18\] , \s2q_p2\[17\] , 
        \s2q_p2\[16\] , \s2q_p2\[15\] , \s2q_p2\[14\] , \s2q_p2\[13\] , 
        \s2q_p2\[12\] , \s2q_p2\[11\] , \s2q_p2\[10\] , \s2q_p2\[9\] , 
        \s2q_p2\[8\] , \s2q_p2\[7\] , \s2q_p2\[6\] , \s2q_p2\[5\] , 
        \s2q_p2\[4\] , \s2q_p2\[3\] , \s2q_p2\[2\] , \s2q_p2\[1\] , 
        \s2q_p2\[0\] }), .CI(n4888), .SUM({\prod_lo_hi\[31\] , 
        \prod_lo_hi\[30\] , \prod_lo_hi\[29\] , \prod_lo_hi\[28\] , 
        \prod_lo_hi\[27\] , \prod_lo_hi\[26\] , \prod_lo_hi\[25\] , 
        \prod_lo_hi\[24\] , \prod_lo_hi\[23\] , \prod_lo_hi\[22\] , 
        \prod_lo_hi\[21\] , \prod_lo_hi\[20\] , \prod_lo_hi\[19\] , 
        \prod_lo_hi\[18\] , \prod_lo_hi\[17\] , \prod_lo_hi\[16\] , 
        \prod_lo_hi\[15\] , \prod_lo_hi\[14\] , \prod_lo_hi\[13\] , 
        \prod_lo_hi\[12\] , \prod_lo_hi\[11\] , \prod_lo_hi\[10\] , 
        \prod_lo_hi\[9\] , \prod_lo_hi\[8\] , \prod_lo_hi\[7\] , 
        \prod_lo_hi\[6\] , \prod_lo_hi\[5\] , \prod_lo_hi\[4\] , 
        SYNOPSYS_UNCONNECTED__84, SYNOPSYS_UNCONNECTED__85, 
        SYNOPSYS_UNCONNECTED__86, SYNOPSYS_UNCONNECTED__87}) );
  fp32_exp_DW01_add_J9_1 add_133 ( .A({\s2q_p1\[27\] , \s2q_p1\[26\] , 
        \s2q_p1\[25\] , \s2q_p1\[24\] , \s2q_p1\[23\] , \s2q_p1\[22\] , 
        \s2q_p1\[21\] , \s2q_p1\[20\] , \s2q_p1\[19\] , \s2q_p1\[18\] , 
        \s2q_p1\[17\] , \s2q_p1\[16\] , \s2q_p1\[15\] , \s2q_p1\[14\] , 
        \s2q_p1\[13\] , \s2q_p1\[12\] , \s2q_p1\[11\] , \s2q_p1\[10\] , 
        \s2q_p1\[9\] , \s2q_p1\[8\] , \s2q_p1\[7\] , \s2q_p1\[6\] , 
        \s2q_p1\[5\] , \s2q_p1\[4\] , \s2q_p1\[3\] , \s2q_p1\[2\] , 
        \s2q_p1\[1\] , \s2q_p1\[0\] , n4888, n4888, n4888, n4888}), .B({n4888, 
        n4888, n4888, n4888, \s2q_p0\[27\] , \s2q_p0\[26\] , \s2q_p0\[25\] , 
        \s2q_p0\[24\] , \s2q_p0\[23\] , \s2q_p0\[22\] , \s2q_p0\[21\] , 
        \s2q_p0\[20\] , \s2q_p0\[19\] , \s2q_p0\[18\] , \s2q_p0\[17\] , 
        \s2q_p0\[16\] , \s2q_p0\[15\] , \s2q_p0\[14\] , \s2q_p0\[13\] , 
        \s2q_p0\[12\] , \s2q_p0\[11\] , \s2q_p0\[10\] , \s2q_p0\[9\] , 
        \s2q_p0\[8\] , \s2q_p0\[7\] , \s2q_p0\[6\] , \s2q_p0\[5\] , 
        \s2q_p0\[4\] , \s2q_p0\[3\] , \s2q_p0\[2\] , \s2q_p0\[1\] , 
        \s2q_p0\[0\] }), .CI(n4888), .SUM({\prod_lo_lo\[31\] , 
        \prod_lo_lo\[30\] , \prod_lo_lo\[29\] , \prod_lo_lo\[28\] , 
        \prod_lo_lo\[27\] , \prod_lo_lo\[26\] , \prod_lo_lo\[25\] , 
        \prod_lo_lo\[24\] , \prod_lo_lo\[23\] , \prod_lo_lo\[22\] , 
        \prod_lo_lo\[21\] , \prod_lo_lo\[20\] , \prod_lo_lo\[19\] , 
        \prod_lo_lo\[18\] , \prod_lo_lo\[17\] , \prod_lo_lo\[16\] , 
        \prod_lo_lo\[15\] , \prod_lo_lo\[14\] , \prod_lo_lo\[13\] , 
        \prod_lo_lo\[12\] , \prod_lo_lo\[11\] , \prod_lo_lo\[10\] , 
        \prod_lo_lo\[9\] , \prod_lo_lo\[8\] , \prod_lo_lo\[7\] , 
        \prod_lo_lo\[6\] , \prod_lo_lo\[5\] , \prod_lo_lo\[4\] , 
        SYNOPSYS_UNCONNECTED__88, SYNOPSYS_UNCONNECTED__89, 
        SYNOPSYS_UNCONNECTED__90, SYNOPSYS_UNCONNECTED__91}) );
  INVx1_ASAP7_75t_R \add_161/U27  ( .A(\prod\[46\] ), .Y(N224) );
  INVx1_ASAP7_75t_R \add_161/U26  ( .A(\prod\[51\] ), .Y(\add_161/n16 ) );
  INVx1_ASAP7_75t_R \add_161/U25  ( .A(\prod\[50\] ), .Y(\add_161/n9 ) );
  NAND2xp5_ASAP7_75t_R \add_161/U24  ( .A(\prod\[47\] ), .B(\prod\[46\] ), .Y(
        \add_161/n11 ) );
  NAND2xp5_ASAP7_75t_R \add_161/U23  ( .A(\prod\[49\] ), .B(\prod\[48\] ), .Y(
        \add_161/n15 ) );
  NOR2x1_ASAP7_75t_R \add_161/U22  ( .A(\add_161/n11 ), .B(\add_161/n15 ), .Y(
        \add_161/n8 ) );
  NAND2xp5_ASAP7_75t_R \add_161/U21  ( .A(\add_161/n14 ), .B(\add_161/n8 ), 
        .Y(\add_161/n5 ) );
  INVx1_ASAP7_75t_R \add_161/U20  ( .A(\add_161/n5 ), .Y(\add_161/n13 ) );
  XOR2xp5_ASAP7_75t_R \add_161/U19  ( .A(\prod\[47\] ), .B(\prod\[46\] ), .Y(
        N225) );
  XNOR2xp5_ASAP7_75t_R \add_161/U18  ( .A(\add_161/n11 ), .B(\prod\[48\] ), 
        .Y(N226) );
  INVx1_ASAP7_75t_R \add_161/U17  ( .A(\prod\[48\] ), .Y(\add_161/n12 ) );
  XOR2xp5_ASAP7_75t_R \add_161/U16  ( .A(\prod\[49\] ), .B(\add_161/n10 ), .Y(
        N227) );
  XNOR2xp5_ASAP7_75t_R \add_161/U15  ( .A(\add_161/n9 ), .B(\add_161/n8 ), .Y(
        N228) );
  NAND2xp5_ASAP7_75t_R \add_161/U14  ( .A(\prod\[50\] ), .B(\add_161/n8 ), .Y(
        \add_161/n7 ) );
  XNOR2xp5_ASAP7_75t_R \add_161/U13  ( .A(\add_161/n7 ), .B(\prod\[51\] ), .Y(
        N229) );
  XNOR2xp5_ASAP7_75t_R \add_161/U12  ( .A(\add_161/n5 ), .B(\prod\[52\] ), .Y(
        N230) );
  INVx1_ASAP7_75t_R \add_161/U11  ( .A(\prod\[52\] ), .Y(\add_161/n6 ) );
  XOR2xp5_ASAP7_75t_R \add_161/U10  ( .A(\prod\[53\] ), .B(\add_161/n4 ), .Y(
        N231) );
  XOR2xp5_ASAP7_75t_R \add_161/U9  ( .A(\prod\[54\] ), .B(\add_161/n1 ), .Y(
        N232) );
  NAND2xp5_ASAP7_75t_R \add_161/U8  ( .A(\prod\[54\] ), .B(\add_161/n1 ), .Y(
        \add_161/n3 ) );
  XNOR2xp5_ASAP7_75t_R \add_161/U7  ( .A(\add_161/n3 ), .B(\prod\[55\] ), .Y(
        N233) );
  AND3x1_ASAP7_75t_R \add_161/U6  ( .A(\add_161/n1 ), .B(\prod\[55\] ), .C(
        \prod\[54\] ), .Y(N234) );
  AND3x1_ASAP7_75t_R \add_161/U5  ( .A(\prod\[52\] ), .B(\add_161/n13 ), .C(
        \prod\[53\] ), .Y(\add_161/n1 ) );
  NOR2xp33_ASAP7_75t_R \add_161/U4  ( .A(\add_161/n11 ), .B(\add_161/n12 ), 
        .Y(\add_161/n10 ) );
  NOR2xp33_ASAP7_75t_R \add_161/U3  ( .A(\add_161/n5 ), .B(\add_161/n6 ), .Y(
        \add_161/n4 ) );
  NOR2xp33_ASAP7_75t_R \add_161/U2  ( .A(\add_161/n16 ), .B(\add_161/n9 ), .Y(
        \add_161/n14 ) );
  DFFASRHQNx1_ASAP7_75t_R s1_is_pos_reg ( .D(n5140), .CLK(clk), .RESETN(n4889), 
        .SETN(rst_n), .QN(s1_is_pos) );
  DFFASRHQNx1_ASAP7_75t_R \s4_lut_base_reg\[0\]  ( .D(n4758), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s4_lut_base\[0\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s4_lut_base_reg\[19\]  ( .D(n4739), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s4_lut_base\[19\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s4_lut_base_reg\[18\]  ( .D(n4740), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s4_lut_base\[18\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s4_lut_base_reg\[17\]  ( .D(n4741), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s4_lut_base\[17\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s4_lut_base_reg\[16\]  ( .D(n4742), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s4_lut_base\[16\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s4_lut_base_reg\[15\]  ( .D(n4743), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s4_lut_base\[15\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s4_lut_base_reg\[14\]  ( .D(n4744), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s4_lut_base\[14\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s4_lut_base_reg\[13\]  ( .D(n4745), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s4_lut_base\[13\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s4_lut_base_reg\[12\]  ( .D(n4746), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s4_lut_base\[12\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s4_lut_base_reg\[11\]  ( .D(n4747), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s4_lut_base\[11\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s4_lut_base_reg\[10\]  ( .D(n4748), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s4_lut_base\[10\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s4_lut_base_reg\[9\]  ( .D(n4749), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s4_lut_base\[9\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s4_lut_base_reg\[8\]  ( .D(n4750), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s4_lut_base\[8\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s4_lut_base_reg\[7\]  ( .D(n4751), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s4_lut_base\[7\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s4_lut_base_reg\[6\]  ( .D(n4752), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s4_lut_base\[6\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s4_lut_base_reg\[5\]  ( .D(n4753), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s4_lut_base\[5\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s4_lut_base_reg\[4\]  ( .D(n4754), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s4_lut_base\[4\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s4_lut_base_reg\[3\]  ( .D(n4755), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s4_lut_base\[3\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s4_lut_base_reg\[2\]  ( .D(n4756), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s4_lut_base\[2\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s4_lut_base_reg\[1\]  ( .D(n4757), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s4_lut_base\[1\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s6_interp_lo_lo_reg\[6\]  ( .D(n3559), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s6_interp_lo_lo\[6\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s6_interp_lo_hi_reg\[6\]  ( .D(n4483), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s6_interp_lo_hi\[6\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s6_interp_hi_lo_reg\[6\]  ( .D(n4502), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s6_interp_hi_lo\[6\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s6_interp_hi_hi_reg\[6\]  ( .D(n4521), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s6_interp_hi_hi\[6\] ) );
  DFFASRHQNx1_ASAP7_75t_R s7_valid_reg ( .D(n5142), .CLK(clk), .RESETN(n4889), 
        .SETN(rst_n), .QN(s7_valid) );
  DFFASRHQNx1_ASAP7_75t_R s7_underflow_reg ( .D(n5143), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(s7_underflow) );
  DFFASRHQNx1_ASAP7_75t_R \s7_lut_base_reg\[22\]  ( .D(n5144), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s7_lut_base\[22\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s7_lut_base_reg\[21\]  ( .D(n5145), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s7_lut_base\[21\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s7_lut_base_reg\[20\]  ( .D(n5146), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s7_lut_base\[20\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s7_lut_base_reg\[19\]  ( .D(n5147), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s7_lut_base\[19\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s7_lut_base_reg\[18\]  ( .D(n5148), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s7_lut_base\[18\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s7_lut_base_reg\[17\]  ( .D(n5149), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s7_lut_base\[17\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s7_lut_base_reg\[16\]  ( .D(n5150), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s7_lut_base\[16\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s7_lut_base_reg\[15\]  ( .D(n5151), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s7_lut_base\[15\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s7_lut_base_reg\[14\]  ( .D(n5152), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s7_lut_base\[14\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s7_lut_base_reg\[13\]  ( .D(n5153), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s7_lut_base\[13\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s7_lut_base_reg\[12\]  ( .D(n5154), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s7_lut_base\[12\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s7_lut_base_reg\[11\]  ( .D(n5155), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s7_lut_base\[11\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s7_lut_base_reg\[10\]  ( .D(n5156), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s7_lut_base\[10\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s7_lut_base_reg\[9\]  ( .D(n5157), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s7_lut_base\[9\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s7_lut_base_reg\[8\]  ( .D(n5158), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s7_lut_base\[8\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s7_lut_base_reg\[7\]  ( .D(n5159), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s7_lut_base\[7\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s7_lut_base_reg\[6\]  ( .D(n5160), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s7_lut_base\[6\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s7_lut_base_reg\[5\]  ( .D(n5161), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s7_lut_base\[5\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s7_lut_base_reg\[4\]  ( .D(n5162), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s7_lut_base\[4\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s7_lut_base_reg\[3\]  ( .D(n5163), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s7_lut_base\[3\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s7_lut_base_reg\[2\]  ( .D(n5164), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s7_lut_base\[2\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s7_lut_base_reg\[1\]  ( .D(n5165), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s7_lut_base\[1\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s7_lut_base_reg\[0\]  ( .D(n5166), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s7_lut_base\[0\] ) );
  DFFASRHQNx1_ASAP7_75t_R s7_is_zero_sub_reg ( .D(n5167), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(s7_is_zero_sub) );
  DFFASRHQNx1_ASAP7_75t_R s7_is_pos_reg ( .D(n5168), .CLK(clk), .RESETN(n4889), 
        .SETN(rst_n), .QN(s7_is_pos) );
  DFFASRHQNx1_ASAP7_75t_R s7_is_nan_reg ( .D(n5169), .CLK(clk), .RESETN(n4889), 
        .SETN(rst_n), .QN(s7_is_nan) );
  DFFASRHQNx1_ASAP7_75t_R s7_is_inf_reg ( .D(n5170), .CLK(clk), .RESETN(n4889), 
        .SETN(rst_n), .QN(s7_is_inf) );
  DFFASRHQNx1_ASAP7_75t_R \s7_interp_lo_reg\[11\]  ( .D(n5171), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s7_interp_lo\[11\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s7_interp_lo_reg\[10\]  ( .D(n5172), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s7_interp_lo\[10\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s7_interp_lo_reg\[9\]  ( .D(n5173), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s7_interp_lo\[9\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s7_interp_lo_reg\[8\]  ( .D(n5174), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s7_interp_lo\[8\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s7_interp_lo_reg\[7\]  ( .D(n5175), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s7_interp_lo\[7\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s7_interp_lo_reg\[6\]  ( .D(n5176), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s7_interp_lo\[6\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s7_interp_lo_reg\[5\]  ( .D(n5177), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s7_interp_lo\[5\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s7_interp_lo_reg\[4\]  ( .D(n5178), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s7_interp_lo\[4\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s7_interp_lo_reg\[3\]  ( .D(n5179), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s7_interp_lo\[3\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s7_interp_lo_reg\[2\]  ( .D(n5180), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s7_interp_lo\[2\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s7_interp_lo_reg\[1\]  ( .D(n5181), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s7_interp_lo\[1\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s7_interp_lo_reg\[0\]  ( .D(n4898), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s7_interp_lo\[0\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s7_interp_hi_reg\[11\]  ( .D(n4917), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s7_interp_hi\[11\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s7_interp_hi_reg\[10\]  ( .D(n4916), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s7_interp_hi\[10\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s7_interp_hi_reg\[9\]  ( .D(n4915), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s7_interp_hi\[9\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s7_interp_hi_reg\[8\]  ( .D(n4914), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s7_interp_hi\[8\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s7_interp_hi_reg\[7\]  ( .D(n4913), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s7_interp_hi\[7\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s7_interp_hi_reg\[6\]  ( .D(n4912), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s7_interp_hi\[6\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s7_interp_hi_reg\[5\]  ( .D(n4911), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s7_interp_hi\[5\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s7_interp_hi_reg\[4\]  ( .D(n4910), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s7_interp_hi\[4\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s7_interp_hi_reg\[3\]  ( .D(n4909), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s7_interp_hi\[3\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s7_interp_hi_reg\[2\]  ( .D(n4908), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s7_interp_hi\[2\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s7_interp_hi_reg\[1\]  ( .D(n4907), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s7_interp_hi\[1\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s7_interp_hi_reg\[0\]  ( .D(n4906), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s7_interp_hi\[0\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s7_floor_mag_reg\[8\]  ( .D(n4905), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s7_floor_mag\[8\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s7_floor_mag_reg\[7\]  ( .D(n4904), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\exp_field\[7\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s7_floor_mag_reg\[6\]  ( .D(n4903), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s7_floor_mag\[6\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s7_floor_mag_reg\[5\]  ( .D(n4902), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s7_floor_mag\[5\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s7_floor_mag_reg\[4\]  ( .D(n4901), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s7_floor_mag\[4\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s7_floor_mag_reg\[3\]  ( .D(n4900), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s7_floor_mag\[3\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s7_floor_mag_reg\[2\]  ( .D(n4899), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s7_floor_mag\[2\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s7_floor_mag_reg\[1\]  ( .D(n4892), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s7_floor_mag\[1\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s7_floor_mag_reg\[0\]  ( .D(n4897), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s7_floor_mag\[0\] ) );
  DFFASRHQNx1_ASAP7_75t_R s6_valid_reg ( .D(n4896), .CLK(clk), .RESETN(n4889), 
        .SETN(rst_n), .QN(s6_valid) );
  DFFASRHQNx1_ASAP7_75t_R s6_underflow_reg ( .D(n4895), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(s6_underflow) );
  DFFASRHQNx1_ASAP7_75t_R \s6_lut_base_reg\[22\]  ( .D(n5139), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s6_lut_base\[22\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s6_lut_base_reg\[21\]  ( .D(n5138), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s6_lut_base\[21\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s6_lut_base_reg\[20\]  ( .D(n5137), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s6_lut_base\[20\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s6_lut_base_reg\[19\]  ( .D(n5136), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s6_lut_base\[19\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s6_lut_base_reg\[18\]  ( .D(n5135), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s6_lut_base\[18\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s6_lut_base_reg\[17\]  ( .D(n5134), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s6_lut_base\[17\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s6_lut_base_reg\[16\]  ( .D(n5133), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s6_lut_base\[16\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s6_lut_base_reg\[15\]  ( .D(n5132), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s6_lut_base\[15\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s6_lut_base_reg\[14\]  ( .D(n5131), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s6_lut_base\[14\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s6_lut_base_reg\[13\]  ( .D(n5130), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s6_lut_base\[13\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s6_lut_base_reg\[12\]  ( .D(n5129), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s6_lut_base\[12\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s6_lut_base_reg\[11\]  ( .D(n5128), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s6_lut_base\[11\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s6_lut_base_reg\[10\]  ( .D(n5127), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s6_lut_base\[10\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s6_lut_base_reg\[9\]  ( .D(n5126), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s6_lut_base\[9\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s6_lut_base_reg\[8\]  ( .D(n5125), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s6_lut_base\[8\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s6_lut_base_reg\[7\]  ( .D(n5124), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s6_lut_base\[7\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s6_lut_base_reg\[6\]  ( .D(n5123), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s6_lut_base\[6\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s6_lut_base_reg\[5\]  ( .D(n5122), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s6_lut_base\[5\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s6_lut_base_reg\[4\]  ( .D(n5121), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s6_lut_base\[4\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s6_lut_base_reg\[3\]  ( .D(n5120), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s6_lut_base\[3\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s6_lut_base_reg\[2\]  ( .D(n5119), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s6_lut_base\[2\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s6_lut_base_reg\[1\]  ( .D(n5118), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s6_lut_base\[1\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s6_lut_base_reg\[0\]  ( .D(n5117), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s6_lut_base\[0\] ) );
  DFFASRHQNx1_ASAP7_75t_R s6_is_zero_sub_reg ( .D(n5116), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(s6_is_zero_sub) );
  DFFASRHQNx1_ASAP7_75t_R s6_is_pos_reg ( .D(n5115), .CLK(clk), .RESETN(n4889), 
        .SETN(rst_n), .QN(s6_is_pos) );
  DFFASRHQNx1_ASAP7_75t_R s6_is_nan_reg ( .D(n5114), .CLK(clk), .RESETN(n4889), 
        .SETN(rst_n), .QN(s6_is_nan) );
  DFFASRHQNx1_ASAP7_75t_R s6_is_inf_reg ( .D(n5113), .CLK(clk), .RESETN(n4889), 
        .SETN(rst_n), .QN(s6_is_inf) );
  DFFASRHQNx1_ASAP7_75t_R \s6_interp_lo_lo_reg\[5\]  ( .D(n5112), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s6_interp_lo_lo\[5\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s6_interp_lo_lo_reg\[4\]  ( .D(n5111), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s6_interp_lo_lo\[4\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s6_interp_lo_lo_reg\[3\]  ( .D(n5110), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s6_interp_lo_lo\[3\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s6_interp_lo_lo_reg\[2\]  ( .D(n5109), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s6_interp_lo_lo\[2\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s6_interp_lo_lo_reg\[1\]  ( .D(n5108), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s6_interp_lo_lo\[1\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s6_interp_lo_lo_reg\[0\]  ( .D(n5107), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s6_interp_lo_lo\[0\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s6_interp_lo_hi_reg\[5\]  ( .D(n5106), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s6_interp_lo_hi\[5\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s6_interp_lo_hi_reg\[4\]  ( .D(n5105), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s6_interp_lo_hi\[4\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s6_interp_lo_hi_reg\[3\]  ( .D(n5104), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s6_interp_lo_hi\[3\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s6_interp_lo_hi_reg\[2\]  ( .D(n5103), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s6_interp_lo_hi\[2\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s6_interp_lo_hi_reg\[1\]  ( .D(n5102), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s6_interp_lo_hi\[1\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s6_interp_lo_hi_reg\[0\]  ( .D(n5101), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s6_interp_lo_hi\[0\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s6_interp_hi_lo_reg\[5\]  ( .D(n5100), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s6_interp_hi_lo\[5\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s6_interp_hi_lo_reg\[4\]  ( .D(n5099), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s6_interp_hi_lo\[4\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s6_interp_hi_lo_reg\[3\]  ( .D(n5098), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s6_interp_hi_lo\[3\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s6_interp_hi_lo_reg\[2\]  ( .D(n5097), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s6_interp_hi_lo\[2\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s6_interp_hi_lo_reg\[1\]  ( .D(n5096), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s6_interp_hi_lo\[1\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s6_interp_hi_lo_reg\[0\]  ( .D(n5095), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s6_interp_hi_lo\[0\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s6_interp_hi_hi_reg\[5\]  ( .D(n5094), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s6_interp_hi_hi\[5\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s6_interp_hi_hi_reg\[4\]  ( .D(n5093), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s6_interp_hi_hi\[4\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s6_interp_hi_hi_reg\[3\]  ( .D(n5092), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s6_interp_hi_hi\[3\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s6_interp_hi_hi_reg\[2\]  ( .D(n5091), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s6_interp_hi_hi\[2\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s6_interp_hi_hi_reg\[1\]  ( .D(n5090), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s6_interp_hi_hi\[1\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s6_interp_hi_hi_reg\[0\]  ( .D(n5089), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s6_interp_hi_hi\[0\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s6_floor_mag_reg\[8\]  ( .D(n5088), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s6_floor_mag\[8\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s6_floor_mag_reg\[7\]  ( .D(n5087), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s6_floor_mag\[7\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s6_floor_mag_reg\[6\]  ( .D(n5086), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s6_floor_mag\[6\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s6_floor_mag_reg\[5\]  ( .D(n5085), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s6_floor_mag\[5\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s6_floor_mag_reg\[4\]  ( .D(n5084), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s6_floor_mag\[4\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s6_floor_mag_reg\[3\]  ( .D(n5083), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s6_floor_mag\[3\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s6_floor_mag_reg\[2\]  ( .D(n5082), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s6_floor_mag\[2\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s6_floor_mag_reg\[1\]  ( .D(n5081), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s6_floor_mag\[1\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s6_floor_mag_reg\[0\]  ( .D(n5080), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s6_floor_mag\[0\] ) );
  DFFASRHQNx1_ASAP7_75t_R s5_valid_reg ( .D(n5079), .CLK(clk), .RESETN(n4889), 
        .SETN(rst_n), .QN(s5_valid) );
  DFFASRHQNx1_ASAP7_75t_R s5_underflow_reg ( .D(n5078), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(s5_underflow) );
  DFFASRHQNx1_ASAP7_75t_R \s5_lut_base_reg\[22\]  ( .D(n5077), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s5_lut_base\[22\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s5_lut_base_reg\[21\]  ( .D(n5076), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s5_lut_base\[21\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s5_lut_base_reg\[20\]  ( .D(n5075), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s5_lut_base\[20\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s5_lut_base_reg\[19\]  ( .D(n5074), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s5_lut_base\[19\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s5_lut_base_reg\[18\]  ( .D(n5073), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s5_lut_base\[18\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s5_lut_base_reg\[17\]  ( .D(n5072), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s5_lut_base\[17\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s5_lut_base_reg\[16\]  ( .D(n5071), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s5_lut_base\[16\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s5_lut_base_reg\[15\]  ( .D(n5070), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s5_lut_base\[15\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s5_lut_base_reg\[14\]  ( .D(n5069), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s5_lut_base\[14\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s5_lut_base_reg\[13\]  ( .D(n5068), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s5_lut_base\[13\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s5_lut_base_reg\[12\]  ( .D(n5067), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s5_lut_base\[12\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s5_lut_base_reg\[11\]  ( .D(n5066), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s5_lut_base\[11\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s5_lut_base_reg\[10\]  ( .D(n5065), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s5_lut_base\[10\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s5_lut_base_reg\[9\]  ( .D(n5064), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s5_lut_base\[9\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s5_lut_base_reg\[8\]  ( .D(n5063), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s5_lut_base\[8\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s5_lut_base_reg\[7\]  ( .D(n5062), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s5_lut_base\[7\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s5_lut_base_reg\[6\]  ( .D(n5061), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s5_lut_base\[6\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s5_lut_base_reg\[5\]  ( .D(n5060), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s5_lut_base\[5\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s5_lut_base_reg\[4\]  ( .D(n5059), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s5_lut_base\[4\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s5_lut_base_reg\[3\]  ( .D(n5058), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s5_lut_base\[3\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s5_lut_base_reg\[2\]  ( .D(n5057), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s5_lut_base\[2\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s5_lut_base_reg\[1\]  ( .D(n5056), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s5_lut_base\[1\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s5_lut_base_reg\[0\]  ( .D(n5055), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s5_lut_base\[0\] ) );
  DFFASRHQNx1_ASAP7_75t_R s5_is_zero_sub_reg ( .D(n5054), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(s5_is_zero_sub) );
  DFFASRHQNx1_ASAP7_75t_R s5_is_pos_reg ( .D(n5053), .CLK(clk), .RESETN(n4889), 
        .SETN(rst_n), .QN(s5_is_pos) );
  DFFASRHQNx1_ASAP7_75t_R s5_is_nan_reg ( .D(n5052), .CLK(clk), .RESETN(n4889), 
        .SETN(rst_n), .QN(s5_is_nan) );
  DFFASRHQNx1_ASAP7_75t_R s5_is_inf_reg ( .D(n5051), .CLK(clk), .RESETN(n4889), 
        .SETN(rst_n), .QN(s5_is_inf) );
  DFFASRHQNx1_ASAP7_75t_R \s5_floor_mag_reg\[8\]  ( .D(n5050), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s5_floor_mag\[8\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s5_floor_mag_reg\[7\]  ( .D(n5049), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s5_floor_mag\[7\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s5_floor_mag_reg\[6\]  ( .D(n5048), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s5_floor_mag\[6\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s5_floor_mag_reg\[5\]  ( .D(n5047), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s5_floor_mag\[5\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s5_floor_mag_reg\[4\]  ( .D(n5046), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s5_floor_mag\[4\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s5_floor_mag_reg\[3\]  ( .D(n5045), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s5_floor_mag\[3\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s5_floor_mag_reg\[2\]  ( .D(n5044), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s5_floor_mag\[2\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s5_floor_mag_reg\[1\]  ( .D(n5043), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s5_floor_mag\[1\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s5_floor_mag_reg\[0\]  ( .D(n5042), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s5_floor_mag\[0\] ) );
  DFFASRHQNx1_ASAP7_75t_R s4_valid_reg ( .D(n5041), .CLK(clk), .RESETN(n4889), 
        .SETN(rst_n), .QN(s4_valid) );
  DFFASRHQNx1_ASAP7_75t_R s4_underflow_reg ( .D(n5040), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(s4_underflow) );
  DFFASRHQNx1_ASAP7_75t_R s4_is_zero_sub_reg ( .D(n5039), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(s4_is_zero_sub) );
  DFFASRHQNx1_ASAP7_75t_R s4_is_pos_reg ( .D(n5038), .CLK(clk), .RESETN(n4889), 
        .SETN(rst_n), .QN(s4_is_pos) );
  DFFASRHQNx1_ASAP7_75t_R s4_is_nan_reg ( .D(n5037), .CLK(clk), .RESETN(n4889), 
        .SETN(rst_n), .QN(s4_is_nan) );
  DFFASRHQNx1_ASAP7_75t_R s4_is_inf_reg ( .D(n5036), .CLK(clk), .RESETN(n4889), 
        .SETN(rst_n), .QN(s4_is_inf) );
  DFFASRHQNx1_ASAP7_75t_R \s4_frac_lo_reg\[16\]  ( .D(n5035), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s4_frac_lo\[16\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s4_frac_lo_reg\[15\]  ( .D(n5034), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s4_frac_lo\[15\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s4_frac_lo_reg\[14\]  ( .D(n5033), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s4_frac_lo\[14\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s4_frac_lo_reg\[13\]  ( .D(n5032), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s4_frac_lo\[13\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s4_frac_lo_reg\[12\]  ( .D(n5031), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s4_frac_lo\[12\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s4_frac_lo_reg\[11\]  ( .D(n5030), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s4_frac_lo\[11\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s4_frac_lo_reg\[10\]  ( .D(n5029), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s4_frac_lo\[10\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s4_frac_lo_reg\[9\]  ( .D(n5028), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s4_frac_lo\[9\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s4_frac_lo_reg\[8\]  ( .D(n5027), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s4_frac_lo\[8\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s4_frac_lo_reg\[7\]  ( .D(n5026), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s4_frac_lo\[7\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s4_frac_lo_reg\[6\]  ( .D(n5025), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s4_frac_lo\[6\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s4_frac_lo_reg\[5\]  ( .D(n5024), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s4_frac_lo\[5\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s4_frac_lo_reg\[4\]  ( .D(n5023), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s4_frac_lo\[4\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s4_frac_lo_reg\[3\]  ( .D(n5022), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s4_frac_lo\[3\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s4_frac_lo_reg\[2\]  ( .D(n5021), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s4_frac_lo\[2\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s4_frac_lo_reg\[1\]  ( .D(n5020), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s4_frac_lo\[1\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s4_frac_lo_reg\[0\]  ( .D(n5019), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s4_frac_lo\[0\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s4_floor_mag_reg\[8\]  ( .D(n5018), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s4_floor_mag\[8\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s4_floor_mag_reg\[7\]  ( .D(n5017), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s4_floor_mag\[7\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s4_floor_mag_reg\[6\]  ( .D(n5016), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s4_floor_mag\[6\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s4_floor_mag_reg\[5\]  ( .D(n5015), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s4_floor_mag\[5\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s4_floor_mag_reg\[4\]  ( .D(n5014), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s4_floor_mag\[4\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s4_floor_mag_reg\[3\]  ( .D(n5013), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s4_floor_mag\[3\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s4_floor_mag_reg\[2\]  ( .D(n5012), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s4_floor_mag\[2\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s4_floor_mag_reg\[1\]  ( .D(n5011), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s4_floor_mag\[1\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s4_floor_mag_reg\[0\]  ( .D(n5010), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s4_floor_mag\[0\] ) );
  DFFASRHQNx1_ASAP7_75t_R s3_valid_reg ( .D(n5009), .CLK(clk), .RESETN(n4889), 
        .SETN(rst_n), .QN(s3_valid) );
  DFFASRHQNx1_ASAP7_75t_R s3_underflow_reg ( .D(n5008), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(s3_underflow) );
  DFFASRHQNx1_ASAP7_75t_R s3_is_zero_sub_reg ( .D(n5007), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(s3_is_zero_sub) );
  DFFASRHQNx1_ASAP7_75t_R s3_is_pos_reg ( .D(n5006), .CLK(clk), .RESETN(n4889), 
        .SETN(rst_n), .QN(s3_is_pos) );
  DFFASRHQNx1_ASAP7_75t_R s3_is_nan_reg ( .D(n5005), .CLK(clk), .RESETN(n4889), 
        .SETN(rst_n), .QN(s3_is_nan) );
  DFFASRHQNx1_ASAP7_75t_R s3_is_inf_reg ( .D(n5004), .CLK(clk), .RESETN(n4889), 
        .SETN(rst_n), .QN(s3_is_inf) );
  DFFASRHQNx1_ASAP7_75t_R \s3_frac_lo_reg\[16\]  ( .D(n5003), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s3_frac_lo\[16\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s3_frac_lo_reg\[15\]  ( .D(n5002), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s3_frac_lo\[15\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s3_frac_lo_reg\[14\]  ( .D(n5001), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s3_frac_lo\[14\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s3_frac_lo_reg\[13\]  ( .D(n5000), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s3_frac_lo\[13\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s3_frac_lo_reg\[12\]  ( .D(n4999), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s3_frac_lo\[12\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s3_frac_lo_reg\[11\]  ( .D(n4998), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s3_frac_lo\[11\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s3_frac_lo_reg\[10\]  ( .D(n4997), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s3_frac_lo\[10\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s3_frac_lo_reg\[9\]  ( .D(n4996), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s3_frac_lo\[9\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s3_frac_lo_reg\[8\]  ( .D(n4995), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s3_frac_lo\[8\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s3_frac_lo_reg\[7\]  ( .D(n4994), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s3_frac_lo\[7\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s3_frac_lo_reg\[6\]  ( .D(n4993), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s3_frac_lo\[6\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s3_frac_lo_reg\[5\]  ( .D(n4992), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s3_frac_lo\[5\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s3_frac_lo_reg\[4\]  ( .D(n4991), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s3_frac_lo\[4\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s3_frac_lo_reg\[3\]  ( .D(n4990), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s3_frac_lo\[3\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s3_frac_lo_reg\[2\]  ( .D(n4989), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s3_frac_lo\[2\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s3_frac_lo_reg\[1\]  ( .D(n4988), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s3_frac_lo\[1\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s3_frac_lo_reg\[0\]  ( .D(n4987), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s3_frac_lo\[0\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s3_floor_mag_reg\[8\]  ( .D(n4986), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s3_floor_mag\[8\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s3_floor_mag_reg\[7\]  ( .D(n4985), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s3_floor_mag\[7\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s3_floor_mag_reg\[6\]  ( .D(n4984), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s3_floor_mag\[6\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s3_floor_mag_reg\[5\]  ( .D(n4983), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s3_floor_mag\[5\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s3_floor_mag_reg\[4\]  ( .D(n4982), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s3_floor_mag\[4\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s3_floor_mag_reg\[3\]  ( .D(n4981), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s3_floor_mag\[3\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s3_floor_mag_reg\[2\]  ( .D(n4980), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s3_floor_mag\[2\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s3_floor_mag_reg\[1\]  ( .D(n4979), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s3_floor_mag\[1\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s3_floor_mag_reg\[0\]  ( .D(n4978), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s3_floor_mag\[0\] ) );
  DFFASRHQNx1_ASAP7_75t_R s2q_valid_reg ( .D(n4977), .CLK(clk), .RESETN(n4889), 
        .SETN(rst_n), .QN(s2q_valid) );
  DFFASRHQNx1_ASAP7_75t_R s2q_is_zero_sub_reg ( .D(n4976), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(s2q_is_zero_sub) );
  DFFASRHQNx1_ASAP7_75t_R s2q_is_pos_reg ( .D(n4975), .CLK(clk), .RESETN(n4889), .SETN(rst_n), .QN(s2q_is_pos) );
  DFFASRHQNx1_ASAP7_75t_R s2q_is_nan_reg ( .D(n4974), .CLK(clk), .RESETN(n4889), .SETN(rst_n), .QN(s2q_is_nan) );
  DFFASRHQNx1_ASAP7_75t_R s2q_is_inf_reg ( .D(n4973), .CLK(clk), .RESETN(n4889), .SETN(rst_n), .QN(s2q_is_inf) );
  DFFASRHQNx1_ASAP7_75t_R s2q_clamp_big_reg ( .D(n4972), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(s2q_clamp_big) );
  DFFASRHQNx1_ASAP7_75t_R s2p_valid_reg ( .D(n4971), .CLK(clk), .RESETN(n4889), 
        .SETN(rst_n), .QN(s2p_valid) );
  DFFASRHQNx1_ASAP7_75t_R \s2p_lo_lo_reg\[3\]  ( .D(n4970), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2p_lo_lo\[3\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2p_lo_lo_reg\[2\]  ( .D(n4969), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2p_lo_lo\[2\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2p_lo_lo_reg\[1\]  ( .D(n4968), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2p_lo_lo\[1\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2p_lo_lo_reg\[0\]  ( .D(n4967), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2p_lo_lo\[0\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2p_lo_hi_reg\[3\]  ( .D(n4966), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2p_lo_hi\[3\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2p_lo_hi_reg\[2\]  ( .D(n4965), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2p_lo_hi\[2\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2p_lo_hi_reg\[1\]  ( .D(n4964), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2p_lo_hi\[1\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2p_lo_hi_reg\[0\]  ( .D(n4963), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2p_lo_hi\[0\] ) );
  DFFASRHQNx1_ASAP7_75t_R s2p_is_zero_sub_reg ( .D(n4962), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(s2p_is_zero_sub) );
  DFFASRHQNx1_ASAP7_75t_R s2p_is_pos_reg ( .D(n4961), .CLK(clk), .RESETN(n4889), .SETN(rst_n), .QN(s2p_is_pos) );
  DFFASRHQNx1_ASAP7_75t_R s2p_is_nan_reg ( .D(n4960), .CLK(clk), .RESETN(n4889), .SETN(rst_n), .QN(s2p_is_nan) );
  DFFASRHQNx1_ASAP7_75t_R s2p_is_inf_reg ( .D(n4959), .CLK(clk), .RESETN(n4889), .SETN(rst_n), .QN(s2p_is_inf) );
  DFFASRHQNx1_ASAP7_75t_R \s2p_hi_lo_reg\[3\]  ( .D(n4958), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2p_hi_lo\[3\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2p_hi_lo_reg\[2\]  ( .D(n4957), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2p_hi_lo\[2\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2p_hi_lo_reg\[1\]  ( .D(n4956), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2p_hi_lo\[1\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2p_hi_lo_reg\[0\]  ( .D(n4955), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2p_hi_lo\[0\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2p_hi_hi_reg\[3\]  ( .D(n4954), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2p_hi_hi\[3\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2p_hi_hi_reg\[2\]  ( .D(n4953), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2p_hi_hi\[2\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2p_hi_hi_reg\[1\]  ( .D(n4952), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2p_hi_hi\[1\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2p_hi_hi_reg\[0\]  ( .D(n4951), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2p_hi_hi\[0\] ) );
  DFFASRHQNx1_ASAP7_75t_R s2p_clamp_big_reg ( .D(n4950), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(s2p_clamp_big) );
  DFFASRHQNx1_ASAP7_75t_R s2m_valid_reg ( .D(n4949), .CLK(clk), .RESETN(n4889), 
        .SETN(rst_n), .QN(s2m_valid) );
  DFFASRHQNx1_ASAP7_75t_R \s2m_prod_lo_reg\[7\]  ( .D(n4948), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2m_prod_lo\[7\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2m_prod_lo_reg\[6\]  ( .D(n4947), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2m_prod_lo\[6\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2m_prod_lo_reg\[5\]  ( .D(n4946), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2m_prod_lo\[5\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2m_prod_lo_reg\[4\]  ( .D(n4945), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2m_prod_lo\[4\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2m_prod_lo_reg\[3\]  ( .D(n4944), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2m_prod_lo\[3\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2m_prod_lo_reg\[2\]  ( .D(n4943), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2m_prod_lo\[2\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2m_prod_lo_reg\[1\]  ( .D(n4942), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2m_prod_lo\[1\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2m_prod_lo_reg\[0\]  ( .D(n4941), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2m_prod_lo\[0\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2m_prod_hi_reg\[7\]  ( .D(n4940), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2m_prod_hi\[7\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2m_prod_hi_reg\[6\]  ( .D(n4939), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2m_prod_hi\[6\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2m_prod_hi_reg\[5\]  ( .D(n4938), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2m_prod_hi\[5\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2m_prod_hi_reg\[4\]  ( .D(n4937), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2m_prod_hi\[4\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2m_prod_hi_reg\[3\]  ( .D(n4936), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2m_prod_hi\[3\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2m_prod_hi_reg\[2\]  ( .D(n4935), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2m_prod_hi\[2\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2m_prod_hi_reg\[1\]  ( .D(n4934), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2m_prod_hi\[1\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2m_prod_hi_reg\[0\]  ( .D(n4933), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2m_prod_hi\[0\] ) );
  DFFASRHQNx1_ASAP7_75t_R s2m_is_zero_sub_reg ( .D(n4932), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(s2m_is_zero_sub) );
  DFFASRHQNx1_ASAP7_75t_R s2m_is_pos_reg ( .D(n4931), .CLK(clk), .RESETN(n4889), .SETN(rst_n), .QN(s2m_is_pos) );
  DFFASRHQNx1_ASAP7_75t_R s2m_is_nan_reg ( .D(n4930), .CLK(clk), .RESETN(n4889), .SETN(rst_n), .QN(s2m_is_nan) );
  DFFASRHQNx1_ASAP7_75t_R s2m_is_inf_reg ( .D(n4929), .CLK(clk), .RESETN(n4889), .SETN(rst_n), .QN(s2m_is_inf) );
  DFFASRHQNx1_ASAP7_75t_R s2m_clamp_big_reg ( .D(n4928), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(s2m_clamp_big) );
  DFFASRHQNx1_ASAP7_75t_R s2_valid_reg ( .D(n4927), .CLK(clk), .RESETN(n4889), 
        .SETN(rst_n), .QN(s2_valid) );
  DFFASRHQNx1_ASAP7_75t_R s2_is_zero_sub_reg ( .D(n4926), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(s2_is_zero_sub) );
  DFFASRHQNx1_ASAP7_75t_R s2_is_pos_reg ( .D(n4925), .CLK(clk), .RESETN(n4889), 
        .SETN(rst_n), .QN(s2_is_pos) );
  DFFASRHQNx1_ASAP7_75t_R s2_is_nan_reg ( .D(n4924), .CLK(clk), .RESETN(n4889), 
        .SETN(rst_n), .QN(s2_is_nan) );
  DFFASRHQNx1_ASAP7_75t_R s2_is_inf_reg ( .D(n4923), .CLK(clk), .RESETN(n4889), 
        .SETN(rst_n), .QN(s2_is_inf) );
  DFFASRHQNx1_ASAP7_75t_R out_valid_reg ( .D(n4922), .CLK(clk), .RESETN(n4889), 
        .SETN(rst_n), .QN(out_valid) );
  DFFASRHQNx1_ASAP7_75t_R \s4_lut_base_reg\[21\]  ( .D(n4737), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s4_lut_base\[21\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s4_lut_base_reg\[20\]  ( .D(n4738), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s4_lut_base\[20\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s4_lut_base_reg\[22\]  ( .D(n4736), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s4_lut_base\[22\] ) );
  DFFASRHQNx1_ASAP7_75t_R s1_valid_reg ( .D(n4920), .CLK(clk), .RESETN(n4889), 
        .SETN(rst_n), .QN(s1_valid) );
  DFFASRHQNx1_ASAP7_75t_R \s7_interp_hi_reg\[12\]  ( .D(n4584), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s7_interp_hi\[12\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s7_interp_lo_reg\[12\]  ( .D(n4553), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s7_interp_lo\[12\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2m_prod_lo_reg\[8\]  ( .D(n4375), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2m_prod_lo\[8\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2m_prod_hi_reg\[8\]  ( .D(n4414), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2m_prod_hi\[8\] ) );
  DFFASRHQNx1_ASAP7_75t_R s1_is_zero_sub_reg ( .D(n4919), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(s1_is_zero_sub) );
  DFFASRHQNx1_ASAP7_75t_R \s2p_lo_lo_reg\[4\]  ( .D(n4243), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2p_lo_lo\[4\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2p_lo_hi_reg\[4\]  ( .D(n4274), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2p_lo_hi\[4\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2p_hi_lo_reg\[4\]  ( .D(n4305), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2p_hi_lo\[4\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2p_hi_hi_reg\[4\]  ( .D(n4336), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2p_hi_hi\[4\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s5_interp_hi_hi_lo_reg\[0\]  ( .D(n4799), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s5_interp_hi_hi_lo\[0\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p6_reg\[0\]  ( .D(n4590), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p6\[0\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p5_reg\[0\]  ( .D(n4591), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p5\[0\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p4_reg\[0\]  ( .D(n4592), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p4\[0\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p3_reg\[0\]  ( .D(n4593), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p3\[0\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p2_reg\[0\]  ( .D(n4594), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p2\[0\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p1_reg\[0\]  ( .D(n4595), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p1\[0\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p0_reg\[0\]  ( .D(n4596), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p0\[0\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2q_p7_reg\[0\]  ( .D(n4589), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s2q_p7\[0\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s5_interp_hi_lo_lo_reg\[0\]  ( .D(n4803), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s5_interp_hi_lo_lo\[0\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s6_interp_lo_lo_reg\[7\]  ( .D(n3560), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s6_interp_lo_lo\[7\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s5_interp_lo_lo_hi_reg\[0\]  ( .D(n4802), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s5_interp_lo_lo_hi\[0\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s7_interp_lo_reg\[13\]  ( .D(n4552), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s7_interp_lo\[13\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s4_delta_reg\[0\]  ( .D(n4438), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s4_delta\[0\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s6_interp_lo_hi_reg\[7\]  ( .D(n4482), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s6_interp_lo_hi\[7\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s6_interp_hi_lo_reg\[7\]  ( .D(n4501), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s6_interp_hi_lo\[7\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s6_interp_hi_hi_reg\[7\]  ( .D(n4520), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s6_interp_hi_hi\[7\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2m_prod_lo_reg\[9\]  ( .D(n4374), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2m_prod_lo\[9\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2m_prod_hi_reg\[9\]  ( .D(n4413), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2m_prod_hi\[9\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2p_lo_lo_reg\[5\]  ( .D(n4242), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2p_lo_lo\[5\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2p_lo_hi_reg\[5\]  ( .D(n4273), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2p_lo_hi\[5\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2p_hi_lo_reg\[5\]  ( .D(n4304), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2p_hi_lo\[5\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2p_hi_hi_reg\[5\]  ( .D(n4335), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2p_hi_hi\[5\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s5_interp_lo_lo_lo_reg\[0\]  ( .D(n4804), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s5_interp_lo_lo_lo\[0\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s5_interp_lo_hi_hi_reg\[0\]  ( .D(n4798), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s5_interp_lo_hi_hi\[0\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s5_interp_lo_hi_lo_reg\[0\]  ( .D(n4800), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s5_interp_lo_hi_lo\[0\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s5_interp_hi_hi_hi_reg\[0\]  ( .D(n4797), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s5_interp_hi_hi_hi\[0\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s5_interp_hi_lo_hi_reg\[0\]  ( .D(n4801), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s5_interp_hi_lo_hi\[0\] ) );
  DFFASRHQNx1_ASAP7_75t_R s1_is_inf_reg ( .D(n4918), .CLK(clk), .RESETN(n4889), 
        .SETN(rst_n), .QN(s1_is_inf) );
  DFFASRHQNx1_ASAP7_75t_R \s7_interp_lo_reg\[14\]  ( .D(n4551), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s7_interp_lo\[14\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2p_lo_lo_reg\[6\]  ( .D(n4241), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2p_lo_lo\[6\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2p_lo_hi_reg\[6\]  ( .D(n4272), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2p_lo_hi\[6\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2p_hi_lo_reg\[6\]  ( .D(n4303), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2p_hi_lo\[6\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2p_hi_hi_reg\[6\]  ( .D(n4334), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2p_hi_hi\[6\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s7_interp_hi_reg\[13\]  ( .D(n4583), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s7_interp_hi\[13\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2m_prod_lo_reg\[10\]  ( .D(n4373), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2m_prod_lo\[10\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2m_prod_hi_reg\[10\]  ( .D(n4412), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2m_prod_hi\[10\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s5_interp_hi_hi_lo_reg\[1\]  ( .D(n4132), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s5_interp_hi_hi_lo\[1\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s4_delta_reg\[1\]  ( .D(n4437), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s4_delta\[1\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s5_interp_hi_lo_lo_reg\[1\]  ( .D(n4158), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s5_interp_hi_lo_lo\[1\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s6_interp_lo_hi_reg\[8\]  ( .D(n4481), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s6_interp_lo_hi\[8\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s6_interp_hi_lo_reg\[8\]  ( .D(n4500), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s6_interp_hi_lo\[8\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s6_interp_hi_hi_reg\[8\]  ( .D(n4519), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s6_interp_hi_hi\[8\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s7_interp_hi_reg\[14\]  ( .D(n4582), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s7_interp_hi\[14\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s5_interp_lo_lo_hi_reg\[1\]  ( .D(n4092), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s5_interp_lo_lo_hi\[1\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s6_interp_lo_lo_reg\[8\]  ( .D(n3562), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s6_interp_lo_lo\[8\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2p_lo_lo_reg\[7\]  ( .D(n4240), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2p_lo_lo\[7\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2p_lo_hi_reg\[7\]  ( .D(n4271), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2p_lo_hi\[7\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2p_hi_lo_reg\[7\]  ( .D(n4302), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2p_hi_lo\[7\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2p_hi_hi_reg\[7\]  ( .D(n4333), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2p_hi_hi\[7\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s4_delta_reg\[2\]  ( .D(n4436), .CLK(clk), .RESETN(
        n4889), .SETN(rst_n), .QN(\s4_delta\[2\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2m_prod_lo_reg\[11\]  ( .D(n4372), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2m_prod_lo\[11\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2m_prod_hi_reg\[11\]  ( .D(n4411), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2m_prod_hi\[11\] ) );
  DFFASRHQNx1_ASAP7_75t_R s1_is_nan_reg ( .D(n4893), .CLK(clk), .RESETN(n4889), 
        .SETN(rst_n), .QN(s1_is_nan) );
  DFFASRHQNx1_ASAP7_75t_R \s5_interp_lo_lo_lo_reg\[1\]  ( .D(n4106), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s5_interp_lo_lo_lo\[1\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2p_lo_lo_reg\[8\]  ( .D(n4239), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2p_lo_lo\[8\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2p_hi_lo_reg\[8\]  ( .D(n4301), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2p_hi_lo\[8\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s5_interp_lo_hi_hi_reg\[1\]  ( .D(n4064), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s5_interp_lo_hi_hi\[1\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s5_interp_lo_hi_lo_reg\[1\]  ( .D(n4078), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s5_interp_lo_hi_lo\[1\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s5_interp_hi_hi_hi_reg\[1\]  ( .D(n4119), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s5_interp_hi_hi_hi\[1\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s7_interp_lo_reg\[15\]  ( .D(n4550), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s7_interp_lo\[15\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s5_interp_hi_lo_hi_reg\[1\]  ( .D(n4145), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s5_interp_hi_lo_hi\[1\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2p_lo_hi_reg\[8\]  ( .D(n4270), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2p_lo_hi\[8\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s2p_hi_hi_reg\[8\]  ( .D(n4332), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s2p_hi_hi\[8\] ) );
  DFFASRHQNx1_ASAP7_75t_R \s3_lut_next_reg\[23\]  ( .D(n2526), .CLK(clk), 
        .RESETN(n4889), .SETN(rst_n), .QN(\s3_lut_next\[23\] ) );
  TIEHIx1_ASAP7_75t_R U2725 ( .H(n4889) );
  HB1xp67_ASAP7_75t_R U2726 ( .A(n2826), .Y(n4890) );
  HB1xp67_ASAP7_75t_R U2728 ( .A(n4203), .Y(n4891) );
  HB1xp67_ASAP7_75t_R U2730 ( .A(n4860), .Y(n4892) );
  HB1xp67_ASAP7_75t_R U2732 ( .A(n4894), .Y(n4893) );
  HB1xp67_ASAP7_75t_R U2734 ( .A(n4588), .Y(n4894) );
  HB1xp67_ASAP7_75t_R U2736 ( .A(n4810), .Y(n4895) );
  HB1xp67_ASAP7_75t_R U2738 ( .A(n4805), .Y(n4896) );
  HB1xp67_ASAP7_75t_R U2740 ( .A(n4861), .Y(n4897) );
  HB1xp67_ASAP7_75t_R U2742 ( .A(n4885), .Y(n4898) );
  HB1xp67_ASAP7_75t_R U2744 ( .A(n4859), .Y(n4899) );
  HB1xp67_ASAP7_75t_R U2746 ( .A(n4858), .Y(n4900) );
  HB1xp67_ASAP7_75t_R U2748 ( .A(n4857), .Y(n4901) );
  HB1xp67_ASAP7_75t_R U2753 ( .A(n4856), .Y(n4902) );
  HB1xp67_ASAP7_75t_R U2755 ( .A(n4855), .Y(n4903) );
  HB1xp67_ASAP7_75t_R U2757 ( .A(n4854), .Y(n4904) );
  HB1xp67_ASAP7_75t_R U2759 ( .A(n4853), .Y(n4905) );
  HB1xp67_ASAP7_75t_R U2761 ( .A(n4886), .Y(n4906) );
  HB1xp67_ASAP7_75t_R U2763 ( .A(n4564), .Y(n4907) );
  HB1xp67_ASAP7_75t_R U2765 ( .A(n4563), .Y(n4908) );
  HB1xp67_ASAP7_75t_R U2767 ( .A(n4562), .Y(n4909) );
  HB1xp67_ASAP7_75t_R U2769 ( .A(n4561), .Y(n4910) );
  HB1xp67_ASAP7_75t_R U2771 ( .A(n4560), .Y(n4911) );
  HB1xp67_ASAP7_75t_R U2773 ( .A(n4559), .Y(n4912) );
  HB1xp67_ASAP7_75t_R U2775 ( .A(n4558), .Y(n4913) );
  HB1xp67_ASAP7_75t_R U2777 ( .A(n4557), .Y(n4914) );
  HB1xp67_ASAP7_75t_R U2779 ( .A(n4556), .Y(n4915) );
  HB1xp67_ASAP7_75t_R U2781 ( .A(n4555), .Y(n4916) );
  HB1xp67_ASAP7_75t_R U2783 ( .A(n4554), .Y(n4917) );
  HB1xp67_ASAP7_75t_R U2785 ( .A(n4587), .Y(n4918) );
  HB2xp67_ASAP7_75t_R U2787 ( .A(n4586), .Y(n4919) );
  HB1xp67_ASAP7_75t_R U2789 ( .A(n5182), .Y(n4920) );
  INVx3_ASAP7_75t_R U2791 ( .A(n4921), .Y(n5182) );
  HB4xp67_ASAP7_75t_R U2793 ( .A(in_valid), .Y(n4921) );
  HB1xp67_ASAP7_75t_R U2795 ( .A(n4887), .Y(n4922) );
  HB1xp67_ASAP7_75t_R U2797 ( .A(n4686), .Y(n4923) );
  HB1xp67_ASAP7_75t_R U2799 ( .A(n4685), .Y(n4924) );
  HB1xp67_ASAP7_75t_R U2801 ( .A(n4688), .Y(n4925) );
  HB1xp67_ASAP7_75t_R U2803 ( .A(n4687), .Y(n4926) );
  HB1xp67_ASAP7_75t_R U2805 ( .A(n4684), .Y(n4927) );
  HB1xp67_ASAP7_75t_R U2807 ( .A(n4681), .Y(n4928) );
  HB1xp67_ASAP7_75t_R U2809 ( .A(n4678), .Y(n4929) );
  HB1xp67_ASAP7_75t_R U2811 ( .A(n4677), .Y(n4930) );
  HB1xp67_ASAP7_75t_R U2813 ( .A(n4680), .Y(n4931) );
  HB1xp67_ASAP7_75t_R U2815 ( .A(n4679), .Y(n4932) );
  HB1xp67_ASAP7_75t_R U2817 ( .A(n4683), .Y(n4933) );
  HB1xp67_ASAP7_75t_R U2819 ( .A(n4382), .Y(n4934) );
  HB1xp67_ASAP7_75t_R U2821 ( .A(n4381), .Y(n4935) );
  HB1xp67_ASAP7_75t_R U2823 ( .A(n4380), .Y(n4936) );
  HB1xp67_ASAP7_75t_R U2825 ( .A(n4379), .Y(n4937) );
  HB1xp67_ASAP7_75t_R U2827 ( .A(n4378), .Y(n4938) );
  HB1xp67_ASAP7_75t_R U2829 ( .A(n4377), .Y(n4939) );
  HB1xp67_ASAP7_75t_R U2831 ( .A(n4376), .Y(n4940) );
  HB1xp67_ASAP7_75t_R U2833 ( .A(n4682), .Y(n4941) );
  HB1xp67_ASAP7_75t_R U2835 ( .A(n4343), .Y(n4942) );
  HB1xp67_ASAP7_75t_R U2837 ( .A(n4342), .Y(n4943) );
  HB1xp67_ASAP7_75t_R U2839 ( .A(n4341), .Y(n4944) );
  HB1xp67_ASAP7_75t_R U2841 ( .A(n4340), .Y(n4945) );
  HB1xp67_ASAP7_75t_R U2843 ( .A(n4339), .Y(n4946) );
  HB1xp67_ASAP7_75t_R U2845 ( .A(n4338), .Y(n4947) );
  HB1xp67_ASAP7_75t_R U2847 ( .A(n4337), .Y(n4948) );
  HB1xp67_ASAP7_75t_R U2849 ( .A(n4676), .Y(n4949) );
  HB1xp67_ASAP7_75t_R U2851 ( .A(n4671), .Y(n4950) );
  HB1xp67_ASAP7_75t_R U2853 ( .A(n4675), .Y(n4951) );
  HB1xp67_ASAP7_75t_R U2855 ( .A(n4308), .Y(n4952) );
  HB1xp67_ASAP7_75t_R U2857 ( .A(n4307), .Y(n4953) );
  HB1xp67_ASAP7_75t_R U2859 ( .A(n4306), .Y(n4954) );
  HB1xp67_ASAP7_75t_R U2861 ( .A(n4674), .Y(n4955) );
  HB1xp67_ASAP7_75t_R U2863 ( .A(n4277), .Y(n4956) );
  HB1xp67_ASAP7_75t_R U2865 ( .A(n4276), .Y(n4957) );
  HB1xp67_ASAP7_75t_R U2867 ( .A(n4275), .Y(n4958) );
  HB1xp67_ASAP7_75t_R U2869 ( .A(n4668), .Y(n4959) );
  HB1xp67_ASAP7_75t_R U2871 ( .A(n4667), .Y(n4960) );
  HB1xp67_ASAP7_75t_R U2873 ( .A(n4670), .Y(n4961) );
  HB1xp67_ASAP7_75t_R U2875 ( .A(n4669), .Y(n4962) );
  HB1xp67_ASAP7_75t_R U2877 ( .A(n4673), .Y(n4963) );
  HB1xp67_ASAP7_75t_R U2879 ( .A(n4246), .Y(n4964) );
  HB1xp67_ASAP7_75t_R U2881 ( .A(n4245), .Y(n4965) );
  HB1xp67_ASAP7_75t_R U2883 ( .A(n4244), .Y(n4966) );
  HB1xp67_ASAP7_75t_R U2885 ( .A(n4672), .Y(n4967) );
  HB1xp67_ASAP7_75t_R U2887 ( .A(n4215), .Y(n4968) );
  HB1xp67_ASAP7_75t_R U2892 ( .A(n4214), .Y(n4969) );
  HB1xp67_ASAP7_75t_R U2894 ( .A(n4213), .Y(n4970) );
  HB1xp67_ASAP7_75t_R U2896 ( .A(n4666), .Y(n4971) );
  HB1xp67_ASAP7_75t_R U2898 ( .A(n4602), .Y(n4972) );
  HB1xp67_ASAP7_75t_R U2900 ( .A(n4599), .Y(n4973) );
  HB1xp67_ASAP7_75t_R U2902 ( .A(n4598), .Y(n4974) );
  HB1xp67_ASAP7_75t_R U2905 ( .A(n4601), .Y(n4975) );
  HB1xp67_ASAP7_75t_R U2907 ( .A(n4600), .Y(n4976) );
  HB1xp67_ASAP7_75t_R U2909 ( .A(n4597), .Y(n4977) );
  HB1xp67_ASAP7_75t_R U2911 ( .A(n4703), .Y(n4978) );
  HB1xp67_ASAP7_75t_R U2913 ( .A(n4702), .Y(n4979) );
  HB1xp67_ASAP7_75t_R U2915 ( .A(n4701), .Y(n4980) );
  HB1xp67_ASAP7_75t_R U2917 ( .A(n4700), .Y(n4981) );
  HB1xp67_ASAP7_75t_R U2919 ( .A(n4699), .Y(n4982) );
  HB1xp67_ASAP7_75t_R U2921 ( .A(n4698), .Y(n4983) );
  HB1xp67_ASAP7_75t_R U2923 ( .A(n4697), .Y(n4984) );
  HB1xp67_ASAP7_75t_R U2925 ( .A(n4696), .Y(n4985) );
  HB1xp67_ASAP7_75t_R U2927 ( .A(n4695), .Y(n4986) );
  HB1xp67_ASAP7_75t_R U2929 ( .A(n4665), .Y(n4987) );
  HB1xp67_ASAP7_75t_R U2931 ( .A(n4664), .Y(n4988) );
  HB1xp67_ASAP7_75t_R U2933 ( .A(n4663), .Y(n4989) );
  HB1xp67_ASAP7_75t_R U2935 ( .A(n4662), .Y(n4990) );
  HB1xp67_ASAP7_75t_R U2937 ( .A(n4661), .Y(n4991) );
  HB1xp67_ASAP7_75t_R U2939 ( .A(n4660), .Y(n4992) );
  HB1xp67_ASAP7_75t_R U2941 ( .A(n4659), .Y(n4993) );
  HB1xp67_ASAP7_75t_R U2943 ( .A(n4658), .Y(n4994) );
  HB1xp67_ASAP7_75t_R U2945 ( .A(n4657), .Y(n4995) );
  HB1xp67_ASAP7_75t_R U2947 ( .A(n4656), .Y(n4996) );
  HB1xp67_ASAP7_75t_R U2949 ( .A(n4655), .Y(n4997) );
  HB1xp67_ASAP7_75t_R U2951 ( .A(n4654), .Y(n4998) );
  HB1xp67_ASAP7_75t_R U2953 ( .A(n4653), .Y(n4999) );
  HB1xp67_ASAP7_75t_R U2955 ( .A(n4652), .Y(n5000) );
  HB1xp67_ASAP7_75t_R U2957 ( .A(n4651), .Y(n5001) );
  HB1xp67_ASAP7_75t_R U2959 ( .A(n4650), .Y(n5002) );
  HB1xp67_ASAP7_75t_R U2961 ( .A(n4649), .Y(n5003) );
  HB1xp67_ASAP7_75t_R U2963 ( .A(n4691), .Y(n5004) );
  HB1xp67_ASAP7_75t_R U2965 ( .A(n4690), .Y(n5005) );
  HB1xp67_ASAP7_75t_R U2967 ( .A(n4693), .Y(n5006) );
  HB1xp67_ASAP7_75t_R U2969 ( .A(n4692), .Y(n5007) );
  HB1xp67_ASAP7_75t_R U2971 ( .A(n4694), .Y(n5008) );
  HB1xp67_ASAP7_75t_R U2973 ( .A(n4689), .Y(n5009) );
  HB1xp67_ASAP7_75t_R U2975 ( .A(n4718), .Y(n5010) );
  HB1xp67_ASAP7_75t_R U2977 ( .A(n4717), .Y(n5011) );
  HB1xp67_ASAP7_75t_R U2979 ( .A(n4716), .Y(n5012) );
  HB1xp67_ASAP7_75t_R U2987 ( .A(n4715), .Y(n5013) );
  HB1xp67_ASAP7_75t_R U2989 ( .A(n4714), .Y(n5014) );
  HB1xp67_ASAP7_75t_R U2991 ( .A(n4713), .Y(n5015) );
  HB1xp67_ASAP7_75t_R U2993 ( .A(n4712), .Y(n5016) );
  HB1xp67_ASAP7_75t_R U2995 ( .A(n4711), .Y(n5017) );
  HB1xp67_ASAP7_75t_R U2997 ( .A(n4710), .Y(n5018) );
  HB1xp67_ASAP7_75t_R U2999 ( .A(n4735), .Y(n5019) );
  HB1xp67_ASAP7_75t_R U3001 ( .A(n4734), .Y(n5020) );
  HB1xp67_ASAP7_75t_R U3003 ( .A(n4733), .Y(n5021) );
  HB1xp67_ASAP7_75t_R U3005 ( .A(n4732), .Y(n5022) );
  HB1xp67_ASAP7_75t_R U3007 ( .A(n4731), .Y(n5023) );
  HB1xp67_ASAP7_75t_R U3009 ( .A(n4730), .Y(n5024) );
  HB1xp67_ASAP7_75t_R U3011 ( .A(n4729), .Y(n5025) );
  HB1xp67_ASAP7_75t_R U3013 ( .A(n4728), .Y(n5026) );
  HB1xp67_ASAP7_75t_R U3015 ( .A(n4727), .Y(n5027) );
  HB1xp67_ASAP7_75t_R U3017 ( .A(n4726), .Y(n5028) );
  HB1xp67_ASAP7_75t_R U3019 ( .A(n4725), .Y(n5029) );
  HB1xp67_ASAP7_75t_R U3021 ( .A(n4724), .Y(n5030) );
  HB1xp67_ASAP7_75t_R U3023 ( .A(n4723), .Y(n5031) );
  HB1xp67_ASAP7_75t_R U3025 ( .A(n4722), .Y(n5032) );
  HB1xp67_ASAP7_75t_R U3027 ( .A(n4721), .Y(n5033) );
  HB1xp67_ASAP7_75t_R U3029 ( .A(n4720), .Y(n5034) );
  HB1xp67_ASAP7_75t_R U3031 ( .A(n4719), .Y(n5035) );
  HB1xp67_ASAP7_75t_R U3033 ( .A(n4706), .Y(n5036) );
  HB1xp67_ASAP7_75t_R U3035 ( .A(n4705), .Y(n5037) );
  HB1xp67_ASAP7_75t_R U3037 ( .A(n4708), .Y(n5038) );
  HB1xp67_ASAP7_75t_R U3039 ( .A(n4707), .Y(n5039) );
  HB1xp67_ASAP7_75t_R U3041 ( .A(n4709), .Y(n5040) );
  HB1xp67_ASAP7_75t_R U3043 ( .A(n4704), .Y(n5041) );
  HB1xp67_ASAP7_75t_R U3045 ( .A(n4773), .Y(n5042) );
  HB1xp67_ASAP7_75t_R U3047 ( .A(n4772), .Y(n5043) );
  HB1xp67_ASAP7_75t_R U3049 ( .A(n4771), .Y(n5044) );
  HB1xp67_ASAP7_75t_R U3051 ( .A(n4770), .Y(n5045) );
  HB1xp67_ASAP7_75t_R U3053 ( .A(n4769), .Y(n5046) );
  HB1xp67_ASAP7_75t_R U3055 ( .A(n4768), .Y(n5047) );
  HB1xp67_ASAP7_75t_R U3057 ( .A(n4767), .Y(n5048) );
  HB1xp67_ASAP7_75t_R U3059 ( .A(n4766), .Y(n5049) );
  HB1xp67_ASAP7_75t_R U3061 ( .A(n4765), .Y(n5050) );
  HB1xp67_ASAP7_75t_R U3063 ( .A(n4761), .Y(n5051) );
  HB1xp67_ASAP7_75t_R U3065 ( .A(n4760), .Y(n5052) );
  HB1xp67_ASAP7_75t_R U3067 ( .A(n4763), .Y(n5053) );
  HB1xp67_ASAP7_75t_R U3069 ( .A(n4762), .Y(n5054) );
  HB1xp67_ASAP7_75t_R U3071 ( .A(n4796), .Y(n5055) );
  HB1xp67_ASAP7_75t_R U3073 ( .A(n4795), .Y(n5056) );
  HB1xp67_ASAP7_75t_R U3075 ( .A(n4794), .Y(n5057) );
  HB1xp67_ASAP7_75t_R U3077 ( .A(n4793), .Y(n5058) );
  HB1xp67_ASAP7_75t_R U3079 ( .A(n4792), .Y(n5059) );
  HB1xp67_ASAP7_75t_R U3081 ( .A(n4791), .Y(n5060) );
  HB1xp67_ASAP7_75t_R U3083 ( .A(n4790), .Y(n5061) );
  HB1xp67_ASAP7_75t_R U3085 ( .A(n4789), .Y(n5062) );
  HB1xp67_ASAP7_75t_R U3087 ( .A(n4788), .Y(n5063) );
  HB1xp67_ASAP7_75t_R U3089 ( .A(n4787), .Y(n5064) );
  HB1xp67_ASAP7_75t_R U3091 ( .A(n4786), .Y(n5065) );
  HB1xp67_ASAP7_75t_R U3093 ( .A(n4785), .Y(n5066) );
  HB1xp67_ASAP7_75t_R U3095 ( .A(n4784), .Y(n5067) );
  HB1xp67_ASAP7_75t_R U3098 ( .A(n4783), .Y(n5068) );
  HB1xp67_ASAP7_75t_R U3100 ( .A(n4782), .Y(n5069) );
  HB1xp67_ASAP7_75t_R U3102 ( .A(n4781), .Y(n5070) );
  HB1xp67_ASAP7_75t_R U3104 ( .A(n4780), .Y(n5071) );
  HB1xp67_ASAP7_75t_R U3106 ( .A(n4779), .Y(n5072) );
  HB1xp67_ASAP7_75t_R U3108 ( .A(n4778), .Y(n5073) );
  HB1xp67_ASAP7_75t_R U3110 ( .A(n4777), .Y(n5074) );
  HB1xp67_ASAP7_75t_R U3112 ( .A(n4776), .Y(n5075) );
  HB1xp67_ASAP7_75t_R U3114 ( .A(n4775), .Y(n5076) );
  HB1xp67_ASAP7_75t_R U3116 ( .A(n4774), .Y(n5077) );
  HB1xp67_ASAP7_75t_R U3118 ( .A(n4764), .Y(n5078) );
  HB1xp67_ASAP7_75t_R U3120 ( .A(n4759), .Y(n5079) );
  HB1xp67_ASAP7_75t_R U3122 ( .A(n4819), .Y(n5080) );
  HB1xp67_ASAP7_75t_R U3124 ( .A(n4818), .Y(n5081) );
  HB1xp67_ASAP7_75t_R U3126 ( .A(n4817), .Y(n5082) );
  HB1xp67_ASAP7_75t_R U3130 ( .A(n4816), .Y(n5083) );
  HB1xp67_ASAP7_75t_R U3132 ( .A(n4815), .Y(n5084) );
  HB1xp67_ASAP7_75t_R U3134 ( .A(n4814), .Y(n5085) );
  HB1xp67_ASAP7_75t_R U3136 ( .A(n4813), .Y(n5086) );
  HB1xp67_ASAP7_75t_R U3138 ( .A(n4812), .Y(n5087) );
  HB1xp67_ASAP7_75t_R U3140 ( .A(n4811), .Y(n5088) );
  HB1xp67_ASAP7_75t_R U3142 ( .A(n4846), .Y(n5089) );
  HB1xp67_ASAP7_75t_R U3144 ( .A(n4507), .Y(n5090) );
  HB1xp67_ASAP7_75t_R U3146 ( .A(n4506), .Y(n5091) );
  HB1xp67_ASAP7_75t_R U3148 ( .A(n4505), .Y(n5092) );
  HB1xp67_ASAP7_75t_R U3150 ( .A(n4504), .Y(n5093) );
  HB1xp67_ASAP7_75t_R U3152 ( .A(n4503), .Y(n5094) );
  HB1xp67_ASAP7_75t_R U3154 ( .A(n4845), .Y(n5095) );
  HB1xp67_ASAP7_75t_R U3156 ( .A(n4488), .Y(n5096) );
  HB1xp67_ASAP7_75t_R U3158 ( .A(n4487), .Y(n5097) );
  HB1xp67_ASAP7_75t_R U3160 ( .A(n4486), .Y(n5098) );
  HB1xp67_ASAP7_75t_R U3162 ( .A(n4485), .Y(n5099) );
  HB1xp67_ASAP7_75t_R U3164 ( .A(n4484), .Y(n5100) );
  HB1xp67_ASAP7_75t_R U3166 ( .A(n4844), .Y(n5101) );
  HB1xp67_ASAP7_75t_R U3168 ( .A(n4468), .Y(n5102) );
  HB1xp67_ASAP7_75t_R U3170 ( .A(n4467), .Y(n5103) );
  HB1xp67_ASAP7_75t_R U3172 ( .A(n4466), .Y(n5104) );
  HB1xp67_ASAP7_75t_R U3174 ( .A(n4465), .Y(n5105) );
  HB1xp67_ASAP7_75t_R U3176 ( .A(n4464), .Y(n5106) );
  HB1xp67_ASAP7_75t_R U3178 ( .A(n4843), .Y(n5107) );
  HB1xp67_ASAP7_75t_R U3184 ( .A(n4451), .Y(n5108) );
  HB1xp67_ASAP7_75t_R U3185 ( .A(n4450), .Y(n5109) );
  HB1xp67_ASAP7_75t_R U3191 ( .A(n4449), .Y(n5110) );
  HB1xp67_ASAP7_75t_R U3217 ( .A(n4448), .Y(n5111) );
  HB1xp67_ASAP7_75t_R U3218 ( .A(n4447), .Y(n5112) );
  HB1xp67_ASAP7_75t_R U3219 ( .A(n4807), .Y(n5113) );
  HB1xp67_ASAP7_75t_R U3220 ( .A(n4806), .Y(n5114) );
  HB1xp67_ASAP7_75t_R U3222 ( .A(n4809), .Y(n5115) );
  HB1xp67_ASAP7_75t_R U3223 ( .A(n4808), .Y(n5116) );
  HB1xp67_ASAP7_75t_R U3224 ( .A(n4842), .Y(n5117) );
  HB1xp67_ASAP7_75t_R U3226 ( .A(n4841), .Y(n5118) );
  HB1xp67_ASAP7_75t_R U3228 ( .A(n4840), .Y(n5119) );
  HB1xp67_ASAP7_75t_R U3230 ( .A(n4839), .Y(n5120) );
  HB1xp67_ASAP7_75t_R U3232 ( .A(n4838), .Y(n5121) );
  HB1xp67_ASAP7_75t_R U3234 ( .A(n4837), .Y(n5122) );
  HB1xp67_ASAP7_75t_R U3236 ( .A(n4836), .Y(n5123) );
  HB1xp67_ASAP7_75t_R U3238 ( .A(n4835), .Y(n5124) );
  HB1xp67_ASAP7_75t_R U3240 ( .A(n4834), .Y(n5125) );
  HB1xp67_ASAP7_75t_R U3242 ( .A(n4833), .Y(n5126) );
  HB1xp67_ASAP7_75t_R U3244 ( .A(n4832), .Y(n5127) );
  HB1xp67_ASAP7_75t_R U3246 ( .A(n4831), .Y(n5128) );
  HB1xp67_ASAP7_75t_R U3248 ( .A(n4830), .Y(n5129) );
  HB1xp67_ASAP7_75t_R U3250 ( .A(n4829), .Y(n5130) );
  HB1xp67_ASAP7_75t_R U3252 ( .A(n4828), .Y(n5131) );
  HB1xp67_ASAP7_75t_R U3254 ( .A(n4827), .Y(n5132) );
  HB1xp67_ASAP7_75t_R U3256 ( .A(n4826), .Y(n5133) );
  HB1xp67_ASAP7_75t_R U3258 ( .A(n4825), .Y(n5134) );
  HB1xp67_ASAP7_75t_R U3260 ( .A(n4824), .Y(n5135) );
  HB1xp67_ASAP7_75t_R U3262 ( .A(n4823), .Y(n5136) );
  HB1xp67_ASAP7_75t_R U3264 ( .A(n4822), .Y(n5137) );
  HB1xp67_ASAP7_75t_R U3266 ( .A(n4821), .Y(n5138) );
  HB1xp67_ASAP7_75t_R U3268 ( .A(n4820), .Y(n5139) );
  HB1xp67_ASAP7_75t_R U3270 ( .A(n5141), .Y(n5140) );
  HB4xp67_ASAP7_75t_R U3272 ( .A(\x\[31\] ), .Y(n5141) );
  HB1xp67_ASAP7_75t_R U3274 ( .A(n4847), .Y(n5142) );
  HB1xp67_ASAP7_75t_R U3276 ( .A(n4852), .Y(n5143) );
  HB1xp67_ASAP7_75t_R U3278 ( .A(n4862), .Y(n5144) );
  HB1xp67_ASAP7_75t_R U3280 ( .A(n4863), .Y(n5145) );
  HB1xp67_ASAP7_75t_R U3282 ( .A(n4864), .Y(n5146) );
  HB1xp67_ASAP7_75t_R U3284 ( .A(n4865), .Y(n5147) );
  HB1xp67_ASAP7_75t_R U3286 ( .A(n4866), .Y(n5148) );
  HB1xp67_ASAP7_75t_R U3288 ( .A(n4867), .Y(n5149) );
  HB1xp67_ASAP7_75t_R U3290 ( .A(n4868), .Y(n5150) );
  HB1xp67_ASAP7_75t_R U3292 ( .A(n4869), .Y(n5151) );
  HB1xp67_ASAP7_75t_R U3294 ( .A(n4870), .Y(n5152) );
  HB1xp67_ASAP7_75t_R U3296 ( .A(n4871), .Y(n5153) );
  HB1xp67_ASAP7_75t_R U3298 ( .A(n4872), .Y(n5154) );
  HB1xp67_ASAP7_75t_R U3300 ( .A(n4873), .Y(n5155) );
  HB1xp67_ASAP7_75t_R U3302 ( .A(n4874), .Y(n5156) );
  HB1xp67_ASAP7_75t_R U3304 ( .A(n4875), .Y(n5157) );
  HB1xp67_ASAP7_75t_R U3306 ( .A(n4876), .Y(n5158) );
  HB1xp67_ASAP7_75t_R U3308 ( .A(n4877), .Y(n5159) );
  HB1xp67_ASAP7_75t_R U3310 ( .A(n4878), .Y(n5160) );
  HB1xp67_ASAP7_75t_R U3312 ( .A(n4879), .Y(n5161) );
  HB1xp67_ASAP7_75t_R U3314 ( .A(n4880), .Y(n5162) );
  HB1xp67_ASAP7_75t_R U3316 ( .A(n4881), .Y(n5163) );
  HB1xp67_ASAP7_75t_R U3318 ( .A(n4882), .Y(n5164) );
  HB1xp67_ASAP7_75t_R U3320 ( .A(n4883), .Y(n5165) );
  HB1xp67_ASAP7_75t_R U3322 ( .A(n4884), .Y(n5166) );
  HB1xp67_ASAP7_75t_R U3324 ( .A(n4850), .Y(n5167) );
  HB1xp67_ASAP7_75t_R U3326 ( .A(n4851), .Y(n5168) );
  HB1xp67_ASAP7_75t_R U3328 ( .A(n4848), .Y(n5169) );
  HB1xp67_ASAP7_75t_R U3330 ( .A(n4849), .Y(n5170) );
  HB1xp67_ASAP7_75t_R U3332 ( .A(n4522), .Y(n5171) );
  HB1xp67_ASAP7_75t_R U3334 ( .A(n4523), .Y(n5172) );
  HB1xp67_ASAP7_75t_R U3336 ( .A(n4524), .Y(n5173) );
  HB1xp67_ASAP7_75t_R U3338 ( .A(n4525), .Y(n5174) );
  HB1xp67_ASAP7_75t_R U3340 ( .A(n4526), .Y(n5175) );
  HB1xp67_ASAP7_75t_R U3342 ( .A(n4527), .Y(n5176) );
  HB1xp67_ASAP7_75t_R U3344 ( .A(n4528), .Y(n5177) );
  HB1xp67_ASAP7_75t_R U3346 ( .A(n4529), .Y(n5178) );
  HB1xp67_ASAP7_75t_R U3348 ( .A(n4530), .Y(n5179) );
  HB1xp67_ASAP7_75t_R U5007 ( .A(n4531), .Y(n5180) );
  HB1xp67_ASAP7_75t_R U5008 ( .A(n4532), .Y(n5181) );
endmodule

