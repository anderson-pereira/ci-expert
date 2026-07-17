/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : X-2025.06-SP2
// Date      : Fri Jul 17 20:16:31 2026
/////////////////////////////////////////////////////////////


module credit_reg_test_1 ( clk, rst, cancel, credit_load, coin_in, credit, 
        test_si2, test_si1, test_se );
  input [1:0] coin_in;
  output [7:0] credit;
  input clk, rst, cancel, credit_load, test_si2, test_si1, test_se;
  wire   n5, n6, n7, n8, n9, n10, n11, n12, n1, n2, n3, n4, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54;

  AND2X1_RVT U3 ( .A1(n1), .A2(n2), .Y(n45) );
  AND2X1_RVT U4 ( .A1(credit_load), .A2(n44), .Y(n1) );
  NAND2X0_RVT U5 ( .A1(n43), .A2(n54), .Y(n2) );
  INVX0_RVT U6 ( .A(coin_in[1]), .Y(n39) );
  NAND2X0_RVT U7 ( .A1(coin_in[0]), .A2(n39), .Y(n21) );
  INVX0_RVT U8 ( .A(n21), .Y(n13) );
  NAND2X0_RVT U9 ( .A1(n13), .A2(credit_load), .Y(n3) );
  INVX0_RVT U10 ( .A(n3), .Y(n4) );
  NOR2X0_RVT U11 ( .A1(rst), .A2(cancel), .Y(n47) );
  OA221X1_RVT U12 ( .A1(credit[0]), .A2(n4), .A3(n49), .A4(n3), .A5(n47), .Y(
        n12) );
  INVX0_RVT U13 ( .A(coin_in[0]), .Y(n40) );
  AO22X1_RVT U14 ( .A1(coin_in[1]), .A2(n40), .A3(n13), .A4(credit[0]), .Y(n16) );
  NAND2X0_RVT U15 ( .A1(n16), .A2(credit_load), .Y(n14) );
  INVX0_RVT U16 ( .A(n14), .Y(n15) );
  OA221X1_RVT U17 ( .A1(credit[1]), .A2(n15), .A3(n50), .A4(n14), .A5(n47), 
        .Y(n11) );
  AO22X1_RVT U18 ( .A1(coin_in[1]), .A2(coin_in[0]), .A3(n16), .A4(credit[1]), 
        .Y(n19) );
  NAND2X0_RVT U19 ( .A1(credit_load), .A2(n19), .Y(n17) );
  INVX0_RVT U20 ( .A(n17), .Y(n18) );
  OA221X1_RVT U21 ( .A1(credit[2]), .A2(n18), .A3(n52), .A4(n17), .A5(n47), 
        .Y(n10) );
  NAND2X0_RVT U22 ( .A1(credit[2]), .A2(n19), .Y(n20) );
  OR2X1_RVT U23 ( .A1(coin_in[1]), .A2(n20), .Y(n25) );
  NAND2X0_RVT U24 ( .A1(n21), .A2(n20), .Y(n24) );
  NAND3X0_RVT U25 ( .A1(credit_load), .A2(n25), .A3(n24), .Y(n22) );
  INVX0_RVT U26 ( .A(n22), .Y(n23) );
  OA221X1_RVT U27 ( .A1(credit[3]), .A2(n23), .A3(n53), .A4(n22), .A5(n47), 
        .Y(n9) );
  NAND2X0_RVT U28 ( .A1(credit[3]), .A2(n24), .Y(n26) );
  AO22X1_RVT U29 ( .A1(coin_in[1]), .A2(coin_in[0]), .A3(n39), .A4(n40), .Y(
        n27) );
  AO21X1_RVT U30 ( .A1(n25), .A2(n26), .A3(n27), .Y(n30) );
  NAND2X0_RVT U31 ( .A1(n27), .A2(n26), .Y(n32) );
  NAND3X0_RVT U32 ( .A1(credit_load), .A2(n30), .A3(n32), .Y(n28) );
  INVX0_RVT U33 ( .A(n28), .Y(n29) );
  OA221X1_RVT U34 ( .A1(credit[4]), .A2(n29), .A3(n51), .A4(n28), .A5(n47), 
        .Y(n8) );
  INVX0_RVT U35 ( .A(n30), .Y(n31) );
  AO21X1_RVT U36 ( .A1(credit[4]), .A2(n32), .A3(n31), .Y(n33) );
  INVX0_RVT U37 ( .A(n33), .Y(n36) );
  OA221X1_RVT U38 ( .A1(coin_in[1]), .A2(n33), .A3(n39), .A4(n36), .A5(
        credit_load), .Y(n35) );
  INVX0_RVT U39 ( .A(n35), .Y(n34) );
  OA221X1_RVT U40 ( .A1(credit[5]), .A2(n35), .A3(n48), .A4(n34), .A5(n47), 
        .Y(n7) );
  OA222X1_RVT U41 ( .A1(n39), .A2(n48), .A3(n39), .A4(n36), .A5(n48), .A6(n36), 
        .Y(n38) );
  NAND2X0_RVT U42 ( .A1(coin_in[1]), .A2(coin_in[0]), .Y(n37) );
  NAND2X0_RVT U43 ( .A1(n38), .A2(n37), .Y(n44) );
  OR3X1_RVT U44 ( .A1(n40), .A2(n39), .A3(n38), .Y(n43) );
  NAND3X0_RVT U45 ( .A1(credit_load), .A2(n44), .A3(n43), .Y(n41) );
  INVX0_RVT U46 ( .A(n41), .Y(n42) );
  OA221X1_RVT U47 ( .A1(credit[6]), .A2(n42), .A3(n54), .A4(n41), .A5(n47), 
        .Y(n6) );
  HADDX1_RVT U48 ( .A0(credit[7]), .B0(n45), .SO(n46) );
  AND2X1_RVT U49 ( .A1(n47), .A2(n46), .Y(n5) );
  SDFFX1_RVT \credit_reg[7]  ( .D(n5), .SI(test_si2), .SE(test_se), .CLK(clk), 
        .Q(credit[7]) );
  SDFFX1_RVT \credit_reg[6]  ( .D(n6), .SI(credit[5]), .SE(test_se), .CLK(clk), 
        .Q(credit[6]), .QN(n54) );
  SDFFX1_RVT \credit_reg[5]  ( .D(n7), .SI(credit[4]), .SE(test_se), .CLK(clk), 
        .Q(credit[5]), .QN(n48) );
  SDFFX1_RVT \credit_reg[4]  ( .D(n8), .SI(credit[3]), .SE(test_se), .CLK(clk), 
        .Q(credit[4]), .QN(n51) );
  SDFFX1_RVT \credit_reg[3]  ( .D(n9), .SI(credit[2]), .SE(test_se), .CLK(clk), 
        .Q(credit[3]), .QN(n53) );
  SDFFX1_RVT \credit_reg[2]  ( .D(n10), .SI(credit[1]), .SE(test_se), .CLK(clk), .Q(credit[2]), .QN(n52) );
  SDFFX1_RVT \credit_reg[1]  ( .D(n11), .SI(credit[0]), .SE(test_se), .CLK(clk), .Q(credit[1]), .QN(n50) );
  SDFFX1_RVT \credit_reg[0]  ( .D(n12), .SI(test_si1), .SE(test_se), .CLK(clk), 
        .Q(credit[0]), .QN(n49) );
endmodule


module memory_test_1 ( clk, rst, mem_read, mem_write, sel_item, item_info, 
        test_si, test_so, test_se );
  input [1:0] sel_item;
  output [15:0] item_info;
  input clk, rst, mem_read, mem_write, test_si, test_se;
  output test_so;
  wire   \item_info[price][6] , \item_info[price][5] , \item_info[price][4] ,
         \item_info[price][3] , \item_info[price][2] , \item_info[price][1] ,
         \item_info[price][0] , \item_info[stock][7] , \item_info[stock][6] ,
         \item_info[stock][5] , \item_info[stock][4] , \item_info[stock][3] ,
         \item_info[stock][2] , \item_info[stock][1] , \item_info[stock][0] ,
         \mem_array[0][stock][7] , \mem_array[0][stock][6] ,
         \mem_array[0][stock][5] , \mem_array[0][stock][4] ,
         \mem_array[0][stock][3] , \mem_array[0][stock][2] ,
         \mem_array[0][stock][1] , \mem_array[0][stock][0] ,
         \mem_array[1][stock][7] , \mem_array[1][stock][6] ,
         \mem_array[1][stock][5] , \mem_array[1][stock][4] ,
         \mem_array[1][stock][3] , \mem_array[1][stock][2] ,
         \mem_array[1][stock][1] , \mem_array[1][stock][0] ,
         \mem_array[2][stock][7] , \mem_array[2][stock][6] ,
         \mem_array[2][stock][5] , \mem_array[2][stock][4] ,
         \mem_array[2][stock][3] , \mem_array[2][stock][2] ,
         \mem_array[2][stock][1] , \mem_array[2][stock][0] ,
         \mem_array[3][stock][7] , \mem_array[3][stock][6] ,
         \mem_array[3][stock][5] , \mem_array[3][stock][4] ,
         \mem_array[3][stock][3] , \mem_array[3][stock][2] ,
         \mem_array[3][stock][1] , \mem_array[3][stock][0] , n26, n27, n28,
         n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42,
         n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56,
         n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70,
         n71, n72, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14,
         n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n73, n74, n75,
         n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89,
         n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101;
  assign item_info[14] = \item_info[price][6] ;
  assign item_info[13] = \item_info[price][5] ;
  assign item_info[12] = \item_info[price][4] ;
  assign item_info[11] = \item_info[price][3] ;
  assign item_info[10] = \item_info[price][2] ;
  assign item_info[9] = \item_info[price][1] ;
  assign item_info[8] = \item_info[price][0] ;
  assign item_info[7] = \item_info[stock][7] ;
  assign item_info[6] = \item_info[stock][6] ;
  assign item_info[5] = \item_info[stock][5] ;
  assign item_info[4] = \item_info[stock][4] ;
  assign item_info[3] = \item_info[stock][3] ;
  assign item_info[2] = \item_info[stock][2] ;
  assign item_info[1] = \item_info[stock][1] ;
  assign item_info[0] = \item_info[stock][0] ;
  assign test_so = \mem_array[3][stock][7] ;

  INVX0_RVT U3 ( .A(rst), .Y(n91) );
  AND2X1_RVT U4 ( .A1(sel_item[1]), .A2(sel_item[0]), .Y(n2) );
  AO21X1_RVT U5 ( .A1(n2), .A2(mem_write), .A3(rst), .Y(n8) );
  INVX0_RVT U6 ( .A(n8), .Y(n25) );
  MUX41X1_RVT U7 ( .A1(\mem_array[0][stock][0] ), .A3(\mem_array[2][stock][0] ), .A2(\mem_array[1][stock][0] ), .A4(\mem_array[3][stock][0] ), .S0(
        sel_item[1]), .S1(sel_item[0]), .Y(n74) );
  INVX0_RVT U8 ( .A(n74), .Y(n6) );
  AND2X1_RVT U9 ( .A1(n91), .A2(n8), .Y(n24) );
  AO22X1_RVT U10 ( .A1(\mem_array[3][stock][0] ), .A2(n25), .A3(n6), .A4(n24), 
        .Y(n72) );
  NOR2X0_RVT U11 ( .A1(rst), .A2(mem_read), .Y(n3) );
  AND2X1_RVT U12 ( .A1(mem_read), .A2(n91), .Y(n4) );
  AO22X1_RVT U13 ( .A1(\item_info[stock][0] ), .A2(n3), .A3(n4), .A4(n74), .Y(
        n71) );
  MUX41X1_RVT U14 ( .A1(\mem_array[0][stock][1] ), .A3(
        \mem_array[2][stock][1] ), .A2(\mem_array[1][stock][1] ), .A4(
        \mem_array[3][stock][1] ), .S0(sel_item[1]), .S1(sel_item[0]), .Y(n5)
         );
  AO22X1_RVT U15 ( .A1(\item_info[stock][1] ), .A2(n3), .A3(n4), .A4(n5), .Y(
        n70) );
  MUX41X1_RVT U16 ( .A1(\mem_array[0][stock][2] ), .A3(
        \mem_array[2][stock][2] ), .A2(\mem_array[1][stock][2] ), .A4(
        \mem_array[3][stock][2] ), .S0(sel_item[1]), .S1(sel_item[0]), .Y(n9)
         );
  AO22X1_RVT U17 ( .A1(\item_info[stock][2] ), .A2(n3), .A3(n4), .A4(n9), .Y(
        n69) );
  MUX41X1_RVT U18 ( .A1(\mem_array[0][stock][3] ), .A3(
        \mem_array[2][stock][3] ), .A2(\mem_array[1][stock][3] ), .A4(
        \mem_array[3][stock][3] ), .S0(sel_item[1]), .S1(sel_item[0]), .Y(n12)
         );
  AO22X1_RVT U19 ( .A1(\item_info[stock][3] ), .A2(n3), .A3(n4), .A4(n12), .Y(
        n68) );
  MUX41X1_RVT U20 ( .A1(\mem_array[0][stock][4] ), .A3(
        \mem_array[2][stock][4] ), .A2(\mem_array[1][stock][4] ), .A4(
        \mem_array[3][stock][4] ), .S0(sel_item[1]), .S1(sel_item[0]), .Y(n15)
         );
  AO22X1_RVT U21 ( .A1(\item_info[stock][4] ), .A2(n3), .A3(n4), .A4(n15), .Y(
        n67) );
  MUX41X1_RVT U22 ( .A1(\mem_array[0][stock][5] ), .A3(
        \mem_array[2][stock][5] ), .A2(\mem_array[1][stock][5] ), .A4(
        \mem_array[3][stock][5] ), .S0(sel_item[1]), .S1(sel_item[0]), .Y(n18)
         );
  AO22X1_RVT U23 ( .A1(\item_info[stock][5] ), .A2(n3), .A3(n4), .A4(n18), .Y(
        n66) );
  MUX41X1_RVT U24 ( .A1(\mem_array[0][stock][6] ), .A3(
        \mem_array[2][stock][6] ), .A2(\mem_array[1][stock][6] ), .A4(
        \mem_array[3][stock][6] ), .S0(sel_item[1]), .S1(sel_item[0]), .Y(n20)
         );
  AO22X1_RVT U25 ( .A1(\item_info[stock][6] ), .A2(n3), .A3(n4), .A4(n20), .Y(
        n65) );
  MUX41X1_RVT U26 ( .A1(\mem_array[0][stock][7] ), .A3(
        \mem_array[2][stock][7] ), .A2(\mem_array[1][stock][7] ), .A4(
        \mem_array[3][stock][7] ), .S0(sel_item[1]), .S1(sel_item[0]), .Y(n22)
         );
  AO22X1_RVT U27 ( .A1(\item_info[stock][7] ), .A2(n3), .A3(n4), .A4(n22), .Y(
        n64) );
  INVX0_RVT U28 ( .A(sel_item[0]), .Y(n86) );
  AO22X1_RVT U29 ( .A1(\item_info[price][0] ), .A2(n3), .A3(n4), .A4(n86), .Y(
        n63) );
  INVX0_RVT U30 ( .A(sel_item[1]), .Y(n87) );
  NAND2X0_RVT U31 ( .A1(sel_item[0]), .A2(n87), .Y(n80) );
  NAND2X0_RVT U32 ( .A1(sel_item[1]), .A2(n86), .Y(n73) );
  NAND2X0_RVT U33 ( .A1(n80), .A2(n73), .Y(n1) );
  AO22X1_RVT U34 ( .A1(n4), .A2(n1), .A3(n3), .A4(\item_info[price][1] ), .Y(
        n62) );
  AO22X1_RVT U35 ( .A1(n2), .A2(n4), .A3(n3), .A4(\item_info[price][2] ), .Y(
        n61) );
  AO22X1_RVT U36 ( .A1(\item_info[price][3] ), .A2(n3), .A3(n4), .A4(n86), .Y(
        n60) );
  AO22X1_RVT U37 ( .A1(\item_info[price][4] ), .A2(n3), .A3(n4), .A4(n87), .Y(
        n59) );
  AO22X1_RVT U38 ( .A1(sel_item[0]), .A2(n4), .A3(n3), .A4(
        \item_info[price][5] ), .Y(n58) );
  AO22X1_RVT U39 ( .A1(sel_item[1]), .A2(n4), .A3(n3), .A4(
        \item_info[price][6] ), .Y(n57) );
  INVX0_RVT U40 ( .A(n5), .Y(n7) );
  NAND2X0_RVT U41 ( .A1(n7), .A2(n6), .Y(n10) );
  OA21X1_RVT U42 ( .A1(n7), .A2(n6), .A3(n10), .Y(n81) );
  NAND2X0_RVT U43 ( .A1(n81), .A2(n91), .Y(n75) );
  AO22X1_RVT U44 ( .A1(n25), .A2(\mem_array[3][stock][1] ), .A3(n8), .A4(n75), 
        .Y(n56) );
  HADDX1_RVT U45 ( .A0(n10), .B0(n9), .SO(n82) );
  INVX0_RVT U46 ( .A(n82), .Y(n77) );
  AO22X1_RVT U47 ( .A1(\mem_array[3][stock][2] ), .A2(n25), .A3(n24), .A4(n77), 
        .Y(n55) );
  OR2X1_RVT U48 ( .A1(n10), .A2(n9), .Y(n13) );
  OR2X1_RVT U49 ( .A1(n13), .A2(n12), .Y(n16) );
  INVX0_RVT U50 ( .A(n16), .Y(n11) );
  AO21X1_RVT U51 ( .A1(n13), .A2(n12), .A3(n11), .Y(n95) );
  AO22X1_RVT U52 ( .A1(\mem_array[3][stock][3] ), .A2(n25), .A3(n24), .A4(n95), 
        .Y(n54) );
  OR2X1_RVT U53 ( .A1(n16), .A2(n15), .Y(n19) );
  INVX0_RVT U54 ( .A(n19), .Y(n14) );
  AO21X1_RVT U55 ( .A1(n16), .A2(n15), .A3(n14), .Y(n96) );
  AO22X1_RVT U56 ( .A1(\mem_array[3][stock][4] ), .A2(n25), .A3(n24), .A4(n96), 
        .Y(n53) );
  OR2X1_RVT U57 ( .A1(n19), .A2(n18), .Y(n21) );
  INVX0_RVT U58 ( .A(n21), .Y(n17) );
  AO21X1_RVT U59 ( .A1(n19), .A2(n18), .A3(n17), .Y(n97) );
  AO22X1_RVT U60 ( .A1(\mem_array[3][stock][5] ), .A2(n25), .A3(n24), .A4(n97), 
        .Y(n52) );
  NOR2X0_RVT U61 ( .A1(n21), .A2(n20), .Y(n23) );
  AO21X1_RVT U62 ( .A1(n21), .A2(n20), .A3(n23), .Y(n98) );
  AO22X1_RVT U63 ( .A1(\mem_array[3][stock][6] ), .A2(n25), .A3(n24), .A4(n98), 
        .Y(n51) );
  HADDX1_RVT U64 ( .A0(n23), .B0(n22), .SO(n99) );
  AO22X1_RVT U65 ( .A1(\mem_array[3][stock][7] ), .A2(n25), .A3(n24), .A4(n99), 
        .Y(n50) );
  INVX0_RVT U66 ( .A(mem_write), .Y(n88) );
  OA21X1_RVT U67 ( .A1(n73), .A2(n88), .A3(n91), .Y(n79) );
  INVX0_RVT U68 ( .A(n79), .Y(n76) );
  NAND2X0_RVT U69 ( .A1(n74), .A2(n91), .Y(n90) );
  AO22X1_RVT U70 ( .A1(n79), .A2(\mem_array[2][stock][0] ), .A3(n76), .A4(n90), 
        .Y(n49) );
  AO22X1_RVT U71 ( .A1(n79), .A2(\mem_array[2][stock][1] ), .A3(n76), .A4(n75), 
        .Y(n48) );
  AND2X1_RVT U72 ( .A1(n91), .A2(n76), .Y(n78) );
  AO22X1_RVT U73 ( .A1(\mem_array[2][stock][2] ), .A2(n79), .A3(n78), .A4(n77), 
        .Y(n47) );
  AO22X1_RVT U74 ( .A1(\mem_array[2][stock][3] ), .A2(n79), .A3(n78), .A4(n95), 
        .Y(n46) );
  AO22X1_RVT U75 ( .A1(\mem_array[2][stock][4] ), .A2(n79), .A3(n78), .A4(n96), 
        .Y(n45) );
  AO22X1_RVT U76 ( .A1(\mem_array[2][stock][5] ), .A2(n79), .A3(n78), .A4(n97), 
        .Y(n44) );
  AO22X1_RVT U77 ( .A1(\mem_array[2][stock][6] ), .A2(n79), .A3(n78), .A4(n98), 
        .Y(n43) );
  AO22X1_RVT U78 ( .A1(\mem_array[2][stock][7] ), .A2(n79), .A3(n78), .A4(n99), 
        .Y(n42) );
  OA21X1_RVT U79 ( .A1(n80), .A2(n88), .A3(n91), .Y(n85) );
  INVX0_RVT U80 ( .A(n85), .Y(n83) );
  AO22X1_RVT U81 ( .A1(n85), .A2(\mem_array[1][stock][0] ), .A3(n83), .A4(n90), 
        .Y(n41) );
  AND2X1_RVT U82 ( .A1(n91), .A2(n83), .Y(n84) );
  INVX0_RVT U83 ( .A(n81), .Y(n92) );
  AO22X1_RVT U84 ( .A1(\mem_array[1][stock][1] ), .A2(n85), .A3(n84), .A4(n92), 
        .Y(n40) );
  NAND2X0_RVT U85 ( .A1(n82), .A2(n91), .Y(n93) );
  AO22X1_RVT U86 ( .A1(n85), .A2(\mem_array[1][stock][2] ), .A3(n83), .A4(n93), 
        .Y(n39) );
  AO22X1_RVT U87 ( .A1(\mem_array[1][stock][3] ), .A2(n85), .A3(n84), .A4(n95), 
        .Y(n38) );
  AO22X1_RVT U88 ( .A1(\mem_array[1][stock][4] ), .A2(n85), .A3(n84), .A4(n96), 
        .Y(n37) );
  AO22X1_RVT U89 ( .A1(\mem_array[1][stock][5] ), .A2(n85), .A3(n84), .A4(n97), 
        .Y(n36) );
  AO22X1_RVT U90 ( .A1(\mem_array[1][stock][6] ), .A2(n85), .A3(n84), .A4(n98), 
        .Y(n35) );
  AO22X1_RVT U91 ( .A1(\mem_array[1][stock][7] ), .A2(n85), .A3(n84), .A4(n99), 
        .Y(n34) );
  NAND2X0_RVT U92 ( .A1(n87), .A2(n86), .Y(n89) );
  OA21X1_RVT U93 ( .A1(n89), .A2(n88), .A3(n91), .Y(n101) );
  INVX0_RVT U94 ( .A(n101), .Y(n94) );
  AO22X1_RVT U95 ( .A1(n101), .A2(\mem_array[0][stock][0] ), .A3(n94), .A4(n90), .Y(n33) );
  AND2X1_RVT U96 ( .A1(n91), .A2(n94), .Y(n100) );
  AO22X1_RVT U97 ( .A1(\mem_array[0][stock][1] ), .A2(n101), .A3(n100), .A4(
        n92), .Y(n32) );
  AO22X1_RVT U98 ( .A1(n101), .A2(\mem_array[0][stock][2] ), .A3(n94), .A4(n93), .Y(n31) );
  AO22X1_RVT U99 ( .A1(\mem_array[0][stock][3] ), .A2(n101), .A3(n100), .A4(
        n95), .Y(n30) );
  AO22X1_RVT U100 ( .A1(\mem_array[0][stock][4] ), .A2(n101), .A3(n100), .A4(
        n96), .Y(n29) );
  AO22X1_RVT U101 ( .A1(\mem_array[0][stock][5] ), .A2(n101), .A3(n100), .A4(
        n97), .Y(n28) );
  AO22X1_RVT U102 ( .A1(\mem_array[0][stock][6] ), .A2(n101), .A3(n100), .A4(
        n98), .Y(n27) );
  AO22X1_RVT U103 ( .A1(\mem_array[0][stock][7] ), .A2(n101), .A3(n100), .A4(
        n99), .Y(n26) );
  SDFFX1_RVT \item_info_reg[price][6]  ( .D(n57), .SI(\item_info[price][5] ), 
        .SE(test_se), .CLK(clk), .Q(\item_info[price][6] ) );
  SDFFX1_RVT \item_info_reg[price][5]  ( .D(n58), .SI(\item_info[price][4] ), 
        .SE(test_se), .CLK(clk), .Q(\item_info[price][5] ) );
  SDFFX1_RVT \item_info_reg[price][4]  ( .D(n59), .SI(\item_info[price][3] ), 
        .SE(test_se), .CLK(clk), .Q(\item_info[price][4] ) );
  SDFFX1_RVT \item_info_reg[price][3]  ( .D(n60), .SI(\item_info[price][2] ), 
        .SE(test_se), .CLK(clk), .Q(\item_info[price][3] ) );
  SDFFX1_RVT \item_info_reg[price][2]  ( .D(n61), .SI(\item_info[price][1] ), 
        .SE(test_se), .CLK(clk), .Q(\item_info[price][2] ) );
  SDFFX1_RVT \item_info_reg[price][1]  ( .D(n62), .SI(\item_info[price][0] ), 
        .SE(test_se), .CLK(clk), .Q(\item_info[price][1] ) );
  SDFFX1_RVT \item_info_reg[price][0]  ( .D(n63), .SI(test_si), .SE(test_se), 
        .CLK(clk), .Q(\item_info[price][0] ) );
  SDFFX1_RVT \mem_array_reg[0][stock][7]  ( .D(n26), .SI(
        \mem_array[0][stock][6] ), .SE(test_se), .CLK(clk), .Q(
        \mem_array[0][stock][7] ) );
  SDFFX1_RVT \mem_array_reg[0][stock][6]  ( .D(n27), .SI(
        \mem_array[0][stock][5] ), .SE(test_se), .CLK(clk), .Q(
        \mem_array[0][stock][6] ) );
  SDFFX1_RVT \mem_array_reg[0][stock][5]  ( .D(n28), .SI(
        \mem_array[0][stock][4] ), .SE(test_se), .CLK(clk), .Q(
        \mem_array[0][stock][5] ) );
  SDFFX1_RVT \mem_array_reg[0][stock][4]  ( .D(n29), .SI(
        \mem_array[0][stock][3] ), .SE(test_se), .CLK(clk), .Q(
        \mem_array[0][stock][4] ) );
  SDFFX1_RVT \mem_array_reg[0][stock][3]  ( .D(n30), .SI(
        \mem_array[0][stock][2] ), .SE(test_se), .CLK(clk), .Q(
        \mem_array[0][stock][3] ) );
  SDFFX1_RVT \mem_array_reg[0][stock][2]  ( .D(n31), .SI(
        \mem_array[0][stock][1] ), .SE(test_se), .CLK(clk), .Q(
        \mem_array[0][stock][2] ) );
  SDFFX1_RVT \mem_array_reg[0][stock][1]  ( .D(n32), .SI(
        \mem_array[0][stock][0] ), .SE(test_se), .CLK(clk), .Q(
        \mem_array[0][stock][1] ) );
  SDFFX1_RVT \mem_array_reg[0][stock][0]  ( .D(n33), .SI(\item_info[stock][7] ), .SE(test_se), .CLK(clk), .Q(\mem_array[0][stock][0] ) );
  SDFFX1_RVT \mem_array_reg[1][stock][7]  ( .D(n34), .SI(
        \mem_array[1][stock][6] ), .SE(test_se), .CLK(clk), .Q(
        \mem_array[1][stock][7] ) );
  SDFFX1_RVT \mem_array_reg[1][stock][6]  ( .D(n35), .SI(
        \mem_array[1][stock][5] ), .SE(test_se), .CLK(clk), .Q(
        \mem_array[1][stock][6] ) );
  SDFFX1_RVT \mem_array_reg[1][stock][5]  ( .D(n36), .SI(
        \mem_array[1][stock][4] ), .SE(test_se), .CLK(clk), .Q(
        \mem_array[1][stock][5] ) );
  SDFFX1_RVT \mem_array_reg[1][stock][4]  ( .D(n37), .SI(
        \mem_array[1][stock][3] ), .SE(test_se), .CLK(clk), .Q(
        \mem_array[1][stock][4] ) );
  SDFFX1_RVT \mem_array_reg[1][stock][3]  ( .D(n38), .SI(
        \mem_array[1][stock][2] ), .SE(test_se), .CLK(clk), .Q(
        \mem_array[1][stock][3] ) );
  SDFFX1_RVT \mem_array_reg[1][stock][2]  ( .D(n39), .SI(
        \mem_array[1][stock][1] ), .SE(test_se), .CLK(clk), .Q(
        \mem_array[1][stock][2] ) );
  SDFFX1_RVT \mem_array_reg[1][stock][1]  ( .D(n40), .SI(
        \mem_array[1][stock][0] ), .SE(test_se), .CLK(clk), .Q(
        \mem_array[1][stock][1] ) );
  SDFFX1_RVT \mem_array_reg[1][stock][0]  ( .D(n41), .SI(
        \mem_array[0][stock][7] ), .SE(test_se), .CLK(clk), .Q(
        \mem_array[1][stock][0] ) );
  SDFFX1_RVT \mem_array_reg[2][stock][7]  ( .D(n42), .SI(
        \mem_array[2][stock][6] ), .SE(test_se), .CLK(clk), .Q(
        \mem_array[2][stock][7] ) );
  SDFFX1_RVT \mem_array_reg[2][stock][6]  ( .D(n43), .SI(
        \mem_array[2][stock][5] ), .SE(test_se), .CLK(clk), .Q(
        \mem_array[2][stock][6] ) );
  SDFFX1_RVT \mem_array_reg[2][stock][5]  ( .D(n44), .SI(
        \mem_array[2][stock][4] ), .SE(test_se), .CLK(clk), .Q(
        \mem_array[2][stock][5] ) );
  SDFFX1_RVT \mem_array_reg[2][stock][4]  ( .D(n45), .SI(
        \mem_array[2][stock][3] ), .SE(test_se), .CLK(clk), .Q(
        \mem_array[2][stock][4] ) );
  SDFFX1_RVT \mem_array_reg[2][stock][3]  ( .D(n46), .SI(
        \mem_array[2][stock][2] ), .SE(test_se), .CLK(clk), .Q(
        \mem_array[2][stock][3] ) );
  SDFFX1_RVT \mem_array_reg[2][stock][2]  ( .D(n47), .SI(
        \mem_array[2][stock][1] ), .SE(test_se), .CLK(clk), .Q(
        \mem_array[2][stock][2] ) );
  SDFFX1_RVT \mem_array_reg[2][stock][1]  ( .D(n48), .SI(
        \mem_array[2][stock][0] ), .SE(test_se), .CLK(clk), .Q(
        \mem_array[2][stock][1] ) );
  SDFFX1_RVT \mem_array_reg[2][stock][0]  ( .D(n49), .SI(
        \mem_array[1][stock][7] ), .SE(test_se), .CLK(clk), .Q(
        \mem_array[2][stock][0] ) );
  SDFFX1_RVT \mem_array_reg[3][stock][7]  ( .D(n50), .SI(
        \mem_array[3][stock][6] ), .SE(test_se), .CLK(clk), .Q(
        \mem_array[3][stock][7] ) );
  SDFFX1_RVT \item_info_reg[stock][7]  ( .D(n64), .SI(\item_info[stock][6] ), 
        .SE(test_se), .CLK(clk), .Q(\item_info[stock][7] ) );
  SDFFX1_RVT \mem_array_reg[3][stock][6]  ( .D(n51), .SI(
        \mem_array[3][stock][5] ), .SE(test_se), .CLK(clk), .Q(
        \mem_array[3][stock][6] ) );
  SDFFX1_RVT \item_info_reg[stock][6]  ( .D(n65), .SI(\item_info[stock][5] ), 
        .SE(test_se), .CLK(clk), .Q(\item_info[stock][6] ) );
  SDFFX1_RVT \mem_array_reg[3][stock][5]  ( .D(n52), .SI(
        \mem_array[3][stock][4] ), .SE(test_se), .CLK(clk), .Q(
        \mem_array[3][stock][5] ) );
  SDFFX1_RVT \item_info_reg[stock][5]  ( .D(n66), .SI(\item_info[stock][4] ), 
        .SE(test_se), .CLK(clk), .Q(\item_info[stock][5] ) );
  SDFFX1_RVT \mem_array_reg[3][stock][4]  ( .D(n53), .SI(
        \mem_array[3][stock][3] ), .SE(test_se), .CLK(clk), .Q(
        \mem_array[3][stock][4] ) );
  SDFFX1_RVT \item_info_reg[stock][4]  ( .D(n67), .SI(\item_info[stock][3] ), 
        .SE(test_se), .CLK(clk), .Q(\item_info[stock][4] ) );
  SDFFX1_RVT \mem_array_reg[3][stock][3]  ( .D(n54), .SI(
        \mem_array[3][stock][2] ), .SE(test_se), .CLK(clk), .Q(
        \mem_array[3][stock][3] ) );
  SDFFX1_RVT \item_info_reg[stock][3]  ( .D(n68), .SI(\item_info[stock][2] ), 
        .SE(test_se), .CLK(clk), .Q(\item_info[stock][3] ) );
  SDFFX1_RVT \mem_array_reg[3][stock][2]  ( .D(n55), .SI(
        \mem_array[3][stock][1] ), .SE(test_se), .CLK(clk), .Q(
        \mem_array[3][stock][2] ) );
  SDFFX1_RVT \item_info_reg[stock][2]  ( .D(n69), .SI(\item_info[stock][1] ), 
        .SE(test_se), .CLK(clk), .Q(\item_info[stock][2] ) );
  SDFFX1_RVT \mem_array_reg[3][stock][1]  ( .D(n56), .SI(
        \mem_array[3][stock][0] ), .SE(test_se), .CLK(clk), .Q(
        \mem_array[3][stock][1] ) );
  SDFFX1_RVT \item_info_reg[stock][1]  ( .D(n70), .SI(\item_info[stock][0] ), 
        .SE(test_se), .CLK(clk), .Q(\item_info[stock][1] ) );
  SDFFX1_RVT \mem_array_reg[3][stock][0]  ( .D(n72), .SI(
        \mem_array[2][stock][7] ), .SE(test_se), .CLK(clk), .Q(
        \mem_array[3][stock][0] ) );
  SDFFX1_RVT \item_info_reg[stock][0]  ( .D(n71), .SI(\item_info[price][6] ), 
        .SE(test_se), .CLK(clk), .Q(\item_info[stock][0] ) );
endmodule


module comparator ( credit, item_info, can_sell );
  input [7:0] credit;
  input [15:0] item_info;
  output can_sell;
  wire   \item_info[price][6] , \item_info[price][5] , \item_info[price][4] ,
         \item_info[price][3] , \item_info[price][2] , \item_info[price][1] ,
         \item_info[price][0] , \item_info[stock][7] , \item_info[stock][6] ,
         \item_info[stock][5] , \item_info[stock][4] , \item_info[stock][3] ,
         \item_info[stock][2] , \item_info[stock][1] , \item_info[stock][0] ,
         n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16
;
  assign \item_info[price][6]  = item_info[14];
  assign \item_info[price][5]  = item_info[13];
  assign \item_info[price][4]  = item_info[12];
  assign \item_info[price][3]  = item_info[11];
  assign \item_info[price][2]  = item_info[10];
  assign \item_info[price][1]  = item_info[9];
  assign \item_info[price][0]  = item_info[8];
  assign \item_info[stock][7]  = item_info[7];
  assign \item_info[stock][6]  = item_info[6];
  assign \item_info[stock][5]  = item_info[5];
  assign \item_info[stock][4]  = item_info[4];
  assign \item_info[stock][3]  = item_info[3];
  assign \item_info[stock][2]  = item_info[2];
  assign \item_info[stock][1]  = item_info[1];
  assign \item_info[stock][0]  = item_info[0];

  INVX0_RVT U2 ( .A(\item_info[price][1] ), .Y(n3) );
  INVX0_RVT U3 ( .A(credit[0]), .Y(n1) );
  NAND2X0_RVT U4 ( .A1(\item_info[price][0] ), .A2(n1), .Y(n2) );
  AO222X1_RVT U5 ( .A1(credit[1]), .A2(n3), .A3(credit[1]), .A4(n2), .A5(n3), 
        .A6(n2), .Y(n5) );
  INVX0_RVT U6 ( .A(\item_info[price][2] ), .Y(n4) );
  AO222X1_RVT U7 ( .A1(credit[2]), .A2(n5), .A3(credit[2]), .A4(n4), .A5(n5), 
        .A6(n4), .Y(n7) );
  INVX0_RVT U8 ( .A(\item_info[price][3] ), .Y(n6) );
  AO222X1_RVT U9 ( .A1(credit[3]), .A2(n7), .A3(credit[3]), .A4(n6), .A5(n7), 
        .A6(n6), .Y(n9) );
  INVX0_RVT U10 ( .A(\item_info[price][4] ), .Y(n8) );
  AO222X1_RVT U11 ( .A1(credit[4]), .A2(n9), .A3(credit[4]), .A4(n8), .A5(n9), 
        .A6(n8), .Y(n11) );
  INVX0_RVT U12 ( .A(\item_info[price][5] ), .Y(n10) );
  AO222X1_RVT U13 ( .A1(credit[5]), .A2(n11), .A3(credit[5]), .A4(n10), .A5(
        n11), .A6(n10), .Y(n13) );
  INVX0_RVT U14 ( .A(\item_info[price][6] ), .Y(n12) );
  AO222X1_RVT U15 ( .A1(credit[6]), .A2(n13), .A3(credit[6]), .A4(n12), .A5(
        n13), .A6(n12), .Y(n16) );
  OR4X1_RVT U16 ( .A1(\item_info[stock][7] ), .A2(\item_info[stock][6] ), .A3(
        \item_info[stock][5] ), .A4(\item_info[stock][4] ), .Y(n15) );
  OR4X1_RVT U17 ( .A1(\item_info[stock][3] ), .A2(\item_info[stock][2] ), .A3(
        \item_info[stock][1] ), .A4(\item_info[stock][0] ), .Y(n14) );
  OA22X1_RVT U18 ( .A1(credit[7]), .A2(n16), .A3(n15), .A4(n14), .Y(can_sell)
         );
endmodule


module subtractor ( credit, item_info, change );
  input [7:0] credit;
  input [15:0] item_info;
  output [7:0] change;
  wire   \item_info[price][6] , \item_info[price][5] , \item_info[price][4] ,
         \item_info[price][3] , \item_info[price][2] , \item_info[price][1] ,
         \item_info[price][0] , \intadd_0/B[5] , \intadd_0/B[4] ,
         \intadd_0/B[3] , \intadd_0/B[2] , \intadd_0/B[1] , \intadd_0/B[0] ,
         \intadd_0/CI , \intadd_0/SUM[5] , \intadd_0/SUM[4] ,
         \intadd_0/SUM[3] , \intadd_0/SUM[2] , \intadd_0/SUM[1] ,
         \intadd_0/SUM[0] , \intadd_0/n6 , \intadd_0/n5 , \intadd_0/n4 ,
         \intadd_0/n3 , \intadd_0/n2 , \intadd_0/n1 , n1;
  assign \item_info[price][6]  = item_info[14];
  assign \item_info[price][5]  = item_info[13];
  assign \item_info[price][4]  = item_info[12];
  assign \item_info[price][3]  = item_info[11];
  assign \item_info[price][2]  = item_info[10];
  assign \item_info[price][1]  = item_info[9];
  assign \item_info[price][0]  = item_info[8];

  FADDX1_RVT \intadd_0/U7  ( .A(\intadd_0/B[0] ), .B(\item_info[price][1] ), 
        .CI(\intadd_0/CI ), .CO(\intadd_0/n6 ), .S(\intadd_0/SUM[0] ) );
  FADDX1_RVT \intadd_0/U6  ( .A(\intadd_0/B[1] ), .B(\item_info[price][2] ), 
        .CI(\intadd_0/n6 ), .CO(\intadd_0/n5 ), .S(\intadd_0/SUM[1] ) );
  FADDX1_RVT \intadd_0/U5  ( .A(\intadd_0/B[2] ), .B(\item_info[price][3] ), 
        .CI(\intadd_0/n5 ), .CO(\intadd_0/n4 ), .S(\intadd_0/SUM[2] ) );
  FADDX1_RVT \intadd_0/U4  ( .A(\intadd_0/B[3] ), .B(\item_info[price][4] ), 
        .CI(\intadd_0/n4 ), .CO(\intadd_0/n3 ), .S(\intadd_0/SUM[3] ) );
  FADDX1_RVT \intadd_0/U3  ( .A(\intadd_0/B[4] ), .B(\item_info[price][5] ), 
        .CI(\intadd_0/n3 ), .CO(\intadd_0/n2 ), .S(\intadd_0/SUM[4] ) );
  FADDX1_RVT \intadd_0/U2  ( .A(\intadd_0/B[5] ), .B(\item_info[price][6] ), 
        .CI(\intadd_0/n2 ), .CO(\intadd_0/n1 ), .S(\intadd_0/SUM[5] ) );
  INVX0_RVT U1 ( .A(\intadd_0/SUM[2] ), .Y(change[3]) );
  INVX0_RVT U2 ( .A(\intadd_0/SUM[4] ), .Y(change[5]) );
  INVX0_RVT U3 ( .A(\intadd_0/SUM[0] ), .Y(change[1]) );
  INVX0_RVT U4 ( .A(\intadd_0/SUM[1] ), .Y(change[2]) );
  INVX0_RVT U5 ( .A(\intadd_0/SUM[3] ), .Y(change[4]) );
  INVX0_RVT U6 ( .A(\intadd_0/SUM[5] ), .Y(change[6]) );
  INVX0_RVT U7 ( .A(\item_info[price][0] ), .Y(n1) );
  NOR2X0_RVT U8 ( .A1(n1), .A2(credit[0]), .Y(\intadd_0/CI ) );
  XOR2X1_RVT U9 ( .A1(\intadd_0/n1 ), .A2(credit[7]), .Y(change[7]) );
  INVX0_RVT U10 ( .A(credit[5]), .Y(\intadd_0/B[4] ) );
  INVX0_RVT U11 ( .A(credit[6]), .Y(\intadd_0/B[5] ) );
  INVX0_RVT U12 ( .A(credit[1]), .Y(\intadd_0/B[0] ) );
  INVX0_RVT U13 ( .A(credit[2]), .Y(\intadd_0/B[1] ) );
  INVX0_RVT U14 ( .A(credit[3]), .Y(\intadd_0/B[2] ) );
  INVX0_RVT U15 ( .A(credit[4]), .Y(\intadd_0/B[3] ) );
  AO21X1_RVT U16 ( .A1(credit[0]), .A2(n1), .A3(\intadd_0/CI ), .Y(change[0])
         );
endmodule


module control_unit_test_1 ( clk, rst, cancel, confirm, can_sell, coin_in, 
        credit_load, credit_cancel, mem_read, mem_write, dispense, error, 
        current_state, test_si, test_se );
  input [1:0] coin_in;
  output [2:0] current_state;
  input clk, rst, cancel, confirm, can_sell, test_si, test_se;
  output credit_load, credit_cancel, mem_read, mem_write, dispense, error;
  wire   mem_write, N18, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n13, n14,
         n15, n16;
  assign dispense = mem_write;

  OAI222X1_RVT U3 ( .A1(n9), .A2(n8), .A3(n9), .A4(n4), .A5(n3), .A6(
        current_state[0]), .Y(n1) );
  AO21X1_RVT U4 ( .A1(can_sell), .A2(n9), .A3(n5), .Y(n2) );
  AND3X1_RVT U5 ( .A1(current_state[0]), .A2(current_state[1]), .A3(n7), .Y(
        mem_write) );
  INVX0_RVT U6 ( .A(confirm), .Y(n4) );
  AO222X1_RVT U7 ( .A1(n7), .A2(current_state[1]), .A3(n7), .A4(coin_in[0]), 
        .A5(n7), .A6(coin_in[1]), .Y(n3) );
  NAND2X0_RVT U8 ( .A1(current_state[1]), .A2(n7), .Y(n5) );
  AND2X1_RVT U9 ( .A1(n7), .A2(n8), .Y(credit_load) );
  OA222X1_RVT U10 ( .A1(cancel), .A2(current_state[2]), .A3(cancel), .A4(n9), 
        .A5(cancel), .A6(n8), .Y(credit_cancel) );
  AND3X1_RVT U11 ( .A1(current_state[2]), .A2(current_state[0]), .A3(n8), .Y(
        error) );
  NOR2X0_RVT U12 ( .A1(rst), .A2(cancel), .Y(n10) );
  AND2X1_RVT U13 ( .A1(current_state[0]), .A2(credit_load), .Y(mem_read) );
  AND4X1_RVT U14 ( .A1(current_state[1]), .A2(can_sell), .A3(n9), .A4(n7), .Y(
        n6) );
  OA221X1_RVT U15 ( .A1(n6), .A2(mem_read), .A3(n6), .A4(confirm), .A5(n10), 
        .Y(N18) );
  SDFFX1_RVT \current_state_reg[1]  ( .D(N18), .SI(current_state[0]), .SE(
        test_se), .CLK(clk), .Q(current_state[1]), .QN(n8) );
  SDFFX1_RVT \current_state_reg[2]  ( .D(n15), .SI(current_state[1]), .SE(
        test_se), .CLK(clk), .Q(current_state[2]), .QN(n7) );
  SDFFX1_RVT \current_state_reg[0]  ( .D(n13), .SI(test_si), .SE(test_se), 
        .CLK(clk), .Q(current_state[0]), .QN(n9) );
  OA21X1_RVT \*cell*314  ( .A1(n14), .A2(error), .A3(n10), .Y(n13) );
  INVX0_RVT \current_state_reg[0]/U4  ( .A(n1), .Y(n14) );
  OA21X1_RVT U1 ( .A1(n16), .A2(error), .A3(n10), .Y(n15) );
  INVX0_RVT U2 ( .A(n2), .Y(n16) );
endmodule


module vending_top ( clk, rst, confirm, cancel, coin_in, sel_item, dispense, 
        error, change_out, display, state_out, scan_enable, scan_in, scan_out
 );
  input [1:0] coin_in;
  input [1:0] sel_item;
  output [7:0] change_out;
  output [7:0] display;
  output [2:0] state_out;
  input clk, rst, confirm, cancel, scan_enable, scan_in;
  output dispense, error, scan_out;
  wire   N6, N7, N8, N9, N10, N11, N12, N13, credit_cancel, credit_load,
         mem_read, mem_write, \item_info[price][6] , \item_info[price][5] ,
         \item_info[price][4] , \item_info[price][3] , \item_info[price][2] ,
         \item_info[price][1] , \item_info[price][0] , \item_info[stock][7] ,
         \item_info[stock][6] , \item_info[stock][5] , \item_info[stock][4] ,
         \item_info[stock][3] , \item_info[stock][2] , \item_info[stock][1] ,
         \item_info[stock][0] , can_sell, n13, n14, n15, n16,
         SYNOPSYS_UNCONNECTED__0, n2;
  wire   [7:0] sub_change_out;
  assign scan_out = display[7];

  INVX0_RVT U16 ( .A(rst), .Y(n13) );
  AND2X1_RVT U17 ( .A1(cancel), .A2(n13), .Y(n16) );
  NAND2X0_RVT U18 ( .A1(state_out[1]), .A2(state_out[0]), .Y(n14) );
  NOR4X1_RVT U19 ( .A1(rst), .A2(cancel), .A3(state_out[2]), .A4(n14), .Y(n15)
         );
  AO22X1_RVT U20 ( .A1(n16), .A2(display[0]), .A3(n15), .A4(sub_change_out[0]), 
        .Y(N6) );
  AO22X1_RVT U21 ( .A1(n16), .A2(display[1]), .A3(n15), .A4(sub_change_out[1]), 
        .Y(N7) );
  AO22X1_RVT U22 ( .A1(n16), .A2(display[2]), .A3(n15), .A4(sub_change_out[2]), 
        .Y(N8) );
  AO22X1_RVT U23 ( .A1(n16), .A2(display[3]), .A3(n15), .A4(sub_change_out[3]), 
        .Y(N9) );
  AO22X1_RVT U24 ( .A1(n16), .A2(display[4]), .A3(n15), .A4(sub_change_out[4]), 
        .Y(N10) );
  AO22X1_RVT U25 ( .A1(n16), .A2(display[5]), .A3(n15), .A4(sub_change_out[5]), 
        .Y(N11) );
  AO22X1_RVT U26 ( .A1(n16), .A2(display[6]), .A3(n15), .A4(sub_change_out[6]), 
        .Y(N12) );
  AO22X1_RVT U27 ( .A1(n16), .A2(display[7]), .A3(n15), .A4(sub_change_out[7]), 
        .Y(N13) );
  SDFFX1_RVT \change_out_reg[7]  ( .D(N13), .SI(change_out[6]), .SE(
        scan_enable), .CLK(clk), .Q(change_out[7]) );
  SDFFX1_RVT \change_out_reg[6]  ( .D(N12), .SI(change_out[5]), .SE(
        scan_enable), .CLK(clk), .Q(change_out[6]) );
  SDFFX1_RVT \change_out_reg[5]  ( .D(N11), .SI(change_out[4]), .SE(
        scan_enable), .CLK(clk), .Q(change_out[5]) );
  SDFFX1_RVT \change_out_reg[4]  ( .D(N10), .SI(change_out[3]), .SE(
        scan_enable), .CLK(clk), .Q(change_out[4]) );
  SDFFX1_RVT \change_out_reg[3]  ( .D(N9), .SI(change_out[2]), .SE(scan_enable), .CLK(clk), .Q(change_out[3]) );
  SDFFX1_RVT \change_out_reg[2]  ( .D(N8), .SI(change_out[1]), .SE(scan_enable), .CLK(clk), .Q(change_out[2]) );
  SDFFX1_RVT \change_out_reg[1]  ( .D(N7), .SI(change_out[0]), .SE(scan_enable), .CLK(clk), .Q(change_out[1]) );
  SDFFX1_RVT \change_out_reg[0]  ( .D(N6), .SI(scan_in), .SE(scan_enable), 
        .CLK(clk), .Q(change_out[0]) );
  credit_reg_test_1 u_credit_reg ( .clk(clk), .rst(rst), .cancel(credit_cancel), .credit_load(credit_load), .coin_in(coin_in), .credit(display), .test_si2(n2), .test_si1(state_out[2]), .test_se(scan_enable) );
  memory_test_1 u_memory ( .clk(clk), .rst(rst), .mem_read(mem_read), 
        .mem_write(mem_write), .sel_item(sel_item), .item_info({
        SYNOPSYS_UNCONNECTED__0, \item_info[price][6] , \item_info[price][5] , 
        \item_info[price][4] , \item_info[price][3] , \item_info[price][2] , 
        \item_info[price][1] , \item_info[price][0] , \item_info[stock][7] , 
        \item_info[stock][6] , \item_info[stock][5] , \item_info[stock][4] , 
        \item_info[stock][3] , \item_info[stock][2] , \item_info[stock][1] , 
        \item_info[stock][0] }), .test_si(display[6]), .test_so(n2), .test_se(
        scan_enable) );
  comparator u_comparator ( .credit(display), .item_info({1'b0, 
        \item_info[price][6] , \item_info[price][5] , \item_info[price][4] , 
        \item_info[price][3] , \item_info[price][2] , \item_info[price][1] , 
        \item_info[price][0] , \item_info[stock][7] , \item_info[stock][6] , 
        \item_info[stock][5] , \item_info[stock][4] , \item_info[stock][3] , 
        \item_info[stock][2] , \item_info[stock][1] , \item_info[stock][0] }), 
        .can_sell(can_sell) );
  subtractor u_subtractor ( .credit(display), .item_info({1'b0, 
        \item_info[price][6] , \item_info[price][5] , \item_info[price][4] , 
        \item_info[price][3] , \item_info[price][2] , \item_info[price][1] , 
        \item_info[price][0] , 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .change(sub_change_out) );
  control_unit_test_1 u_control_unit ( .clk(clk), .rst(rst), .cancel(cancel), 
        .confirm(confirm), .can_sell(can_sell), .coin_in(coin_in), 
        .credit_load(credit_load), .credit_cancel(credit_cancel), .mem_read(
        mem_read), .mem_write(mem_write), .dispense(dispense), .error(error), 
        .current_state(state_out), .test_si(change_out[7]), .test_se(
        scan_enable) );
endmodule

