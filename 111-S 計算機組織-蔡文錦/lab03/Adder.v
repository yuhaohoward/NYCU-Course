// Class: 111暑 計算機組織
// Student: 黃育豪 312510198
// Date: 2023/08/05
module Adder (
    src1_i,
    src2_i,
    sum_o
);

  //I/O ports
  input [32-1:0] src1_i;
  input [32-1:0] src2_i;

  output [32-1:0] sum_o;

  //Internal Signals
  wire [32-1:0] sum_o;
  wire [1:0] operation;
  wire zero,overflow; 
  //Main function
  /*your code here*/
  assign operation=2'b10;

ALU ALU_add(
    .aluSrc1(src1_i),
    .aluSrc2(src2_i),
    .invertA(1'b0),
    .invertB(1'b0),
    .operation(operation),
    .result(sum_o),
    .zero(zero),
    .overflow(overflow));

endmodule
