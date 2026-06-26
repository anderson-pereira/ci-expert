/////////////////////////////////////////////////////////////
// Created by: Synopsys Design Compiler(R)
// Version   : X-2025.06-SP2
// Date      : Fri May 29 20:00:43 2026
/////////////////////////////////////////////////////////////


module ula ( a, b, op, result );
  input [7:0] a;
  input [7:0] b;
  input [2:0] op;
  output [7:0] result;
  wire   N0, N1, N2, N3, N4, N5, N6, N7, N8, N9, N10, N11, N12, N13, N14, N15,
         N16, N17, N18, N19, N20, N21, N22, N23, N24, N25, N26, N27, N28, N29,
         N30, N31, N32, N33, N34, N35, N36, N37, N38, N39, N40, N41, N42, N43,
         N44, N45, N46, N47, N48, N49, N50, N51, N52, N53, N54, N55, N56, N57,
         N58, N59, N60, N61, N62, N63, N64, N65;

  GTECH_AND2 C7 ( .A(N7), .B(N8), .Z(N10) );
  GTECH_AND2 C8 ( .A(N10), .B(N9), .Z(N11) );
  GTECH_OR2 C10 ( .A(op[2]), .B(op[1]), .Z(N12) );
  GTECH_OR2 C11 ( .A(N12), .B(N9), .Z(N13) );
  GTECH_OR2 C14 ( .A(op[2]), .B(N8), .Z(N15) );
  GTECH_OR2 C15 ( .A(N15), .B(op[0]), .Z(N16) );
  GTECH_OR2 C20 ( .A(N15), .B(N9), .Z(N18) );
  GTECH_OR2 C23 ( .A(N7), .B(op[1]), .Z(N20) );
  GTECH_OR2 C24 ( .A(N20), .B(op[0]), .Z(N21) );
  GTECH_OR2 C29 ( .A(N20), .B(N9), .Z(N23) );
  GTECH_AND2 C31 ( .A(op[2]), .B(op[1]), .Z(N25) );
  ASH_UNS_UNS_OP sll_34 ( .A(a), .SH(b), .Z({N57, N56, N55, N54, N53, N52, N51, 
        N50}) );
  ASHR_UNS_UNS_OP srl_35 ( .A(a), .SH(b), .Z({N65, N64, N63, N62, N61, N60, 
        N59, N58}) );
  ADD_UNS_OP add_31 ( .A(a), .B(b), .Z({N33, N32, N31, N30, N29, N28, N27, N26}) );
  SUB_UNS_OP sub_32 ( .A(a), .B(b), .Z({N41, N40, N39, N38, N37, N36, N35, N34}) );
  MULT_UNS_OP mult_33 ( .A(a), .B(b), .Z({N49, N48, N47, N46, N45, N44, N43, 
        N42}) );
  SELECT_OP C55 ( .DATA1(a), .DATA2({N33, N32, N31, N30, N29, N28, N27, N26}), 
        .DATA3({N41, N40, N39, N38, N37, N36, N35, N34}), .DATA4({N49, N48, 
        N47, N46, N45, N44, N43, N42}), .DATA5({N57, N56, N55, N54, N53, N52, 
        N51, N50}), .DATA6({N65, N64, N63, N62, N61, N60, N59, N58}), .DATA7({
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .CONTROL1(N0), 
        .CONTROL2(N1), .CONTROL3(N2), .CONTROL4(N3), .CONTROL5(N4), .CONTROL6(
        N5), .CONTROL7(N6), .Z(result) );
  GTECH_BUF B_0 ( .A(N11), .Z(N0) );
  GTECH_BUF B_1 ( .A(N14), .Z(N1) );
  GTECH_BUF B_2 ( .A(N17), .Z(N2) );
  GTECH_BUF B_3 ( .A(N19), .Z(N3) );
  GTECH_BUF B_4 ( .A(N22), .Z(N4) );
  GTECH_BUF B_5 ( .A(N24), .Z(N5) );
  GTECH_BUF B_6 ( .A(N25), .Z(N6) );
  GTECH_NOT I_0 ( .A(op[2]), .Z(N7) );
  GTECH_NOT I_1 ( .A(op[1]), .Z(N8) );
  GTECH_NOT I_2 ( .A(op[0]), .Z(N9) );
  GTECH_NOT I_3 ( .A(N13), .Z(N14) );
  GTECH_NOT I_4 ( .A(N16), .Z(N17) );
  GTECH_NOT I_5 ( .A(N18), .Z(N19) );
  GTECH_NOT I_6 ( .A(N21), .Z(N22) );
  GTECH_NOT I_7 ( .A(N23), .Z(N24) );
  GTECH_BUF B_7 ( .A(N14) );
  GTECH_BUF B_8 ( .A(N17) );
  GTECH_BUF B_9 ( .A(N19) );
  GTECH_BUF B_10 ( .A(N22) );
  GTECH_BUF B_11 ( .A(N24) );
endmodule

