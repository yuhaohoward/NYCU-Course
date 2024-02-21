// Class: 111暑 計算機組織
// Student: 黃育豪 312510198
// Date: 2023/08/05
module Shifter (
    result,
    leftRight,
    shamt,
    sftSrc
);
  parameter SHIFT_RIGHT = 1'b1;
  //I/O ports
  output [32-1:0] result;

  input leftRight;
  input [5-1:0] shamt;
  input [32-1:0] sftSrc;

  //Internal Signals
  wire [32-1:0] result;

  //Main function
  /*your code here*/

  assign  result=(leftRight==SHIFT_RIGHT)?sftSrc>>shamt:sftSrc<<shamt;

endmodule
