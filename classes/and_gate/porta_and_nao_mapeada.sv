/////////////////////////////////////////////////////////////
// Created by: Synopsys Design Compiler(R)
// Version   : X-2025.06-SP2
// Date      : Fri May 29 20:35:21 2026
/////////////////////////////////////////////////////////////


module porta_and ( a, b, y );
  input a, b;
  output y;


  GTECH_AND2 C7 ( .A(a), .B(b), .Z(y) );
endmodule

