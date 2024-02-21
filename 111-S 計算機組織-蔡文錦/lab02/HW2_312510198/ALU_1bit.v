module ALU_1bit( result, carryOut, a, b, invertA, invertB, operation, carryIn, less ); 
  
  output wire result;
  output wire carryOut;
  
  input wire a;
  input wire b;
  input wire invertA;
  input wire invertB;
  input wire[1:0] operation;
  input wire carryIn;
  input wire less;
  
  /*your code here*/ 
  wire A, B;
  //二對一多工器
  MUX_2to1 M1(a, ~a, invertA, A);
  MUX_2to1 M2(b, ~b, invertB, B);
  //or and adder gate set
  wire Or, And, Add;
  or (Or, A, B);
  and (And, A, B);
  Full_adder FA(Add, carryOut, carryIn, A, B);
  //四對二多工器運算結果
  MUX_4to2 M3({Or, And, Add, less}, operation, result );
  //
endmodule