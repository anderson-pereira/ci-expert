/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : X-2025.06-SP2
// Date      : Fri May 29 20:35:23 2026
/////////////////////////////////////////////////////////////


module porta_and ( a, b, y );
  input a, b;
  output y;


  AND2X1_RVT U2 ( .A1(b), .A2(a), .Y(y) );
endmodule

