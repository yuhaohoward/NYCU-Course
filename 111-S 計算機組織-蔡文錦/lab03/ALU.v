// Class: 111暑 計算機組織
// Student: 黃育豪 312510198
// Date: 2023/08/05
module ALU (
    aluSrc1,
    aluSrc2,
    invertA,
    invertB,
    operation,
    result,
    zero,
    overflow
);

  //I/O ports
  input [31:0] aluSrc1;
  input [31:0] aluSrc2;
  input invertA;
  input invertB;
  input [2-1:0] operation;

  output [31:0] result;
  output zero;
  output overflow;

  //Internal Signals
  wire [31:0] result;
  wire  [31:0]  carryOut;
  wire zero;
  wire overflow,settoless;
  assign gnd=0;
  //Main function
  /*your code here*/
  ALU_1bit  ALU0(.a(aluSrc1[0]),.b(aluSrc2[0]),.invertA(invertA),.invertB(invertB),.operation(operation),.carryIn(invertB),.carryOut(carryOut[0]),.less(settoless),.result(result[0]));  
  ALU_1bit  ALU1(.a(aluSrc1[1]),.b(aluSrc2[1]),.invertA(invertA),.invertB(invertB),.operation(operation),.carryIn(carryOut[0]),.carryOut(carryOut[1]),.less(gnd),.result(result[1]));  
  ALU_1bit  ALU2(.a(aluSrc1[2]),.b(aluSrc2[2]),.invertA(invertA),.invertB(invertB),.operation(operation),.carryIn(carryOut[1]),.carryOut(carryOut[2]),.less(gnd),.result(result[2]));  
  ALU_1bit  ALU3(.a(aluSrc1[3]),.b(aluSrc2[3]),.invertA(invertA),.invertB(invertB),.operation(operation),.carryIn(carryOut[2]),.carryOut(carryOut[3]),.less(gnd),.result(result[3]));  
  ALU_1bit  ALU4(.a(aluSrc1[4]),.b(aluSrc2[4]),.invertA(invertA),.invertB(invertB),.operation(operation),.carryIn(carryOut[3]),.carryOut(carryOut[4]),.less(gnd),.result(result[4]));   
  ALU_1bit  ALU5(.a(aluSrc1[5]),.b(aluSrc2[5]),.invertA(invertA),.invertB(invertB),.operation(operation),.carryIn(carryOut[4]),.carryOut(carryOut[5]),.less(gnd),.result(result[5]));  
  ALU_1bit  ALU6(.a(aluSrc1[6]),.b(aluSrc2[6]),.invertA(invertA),.invertB(invertB),.operation(operation),.carryIn(carryOut[5]),.carryOut(carryOut[6]),.less(gnd),.result(result[6]));  
  ALU_1bit  ALU7(.a(aluSrc1[7]),.b(aluSrc2[7]),.invertA(invertA),.invertB(invertB),.operation(operation),.carryIn(carryOut[6]),.carryOut(carryOut[7]),.less(gnd),.result(result[7]));  
  ALU_1bit  ALU8(.a(aluSrc1[8]),.b(aluSrc2[8]),.invertA(invertA),.invertB(invertB),.operation(operation),.carryIn(carryOut[7]),.carryOut(carryOut[8]),.less(gnd),.result(result[8]));  
  ALU_1bit  ALU9(.a(aluSrc1[9]),.b(aluSrc2[9]),.invertA(invertA),.invertB(invertB),.operation(operation),.carryIn(carryOut[8]),.carryOut(carryOut[9]),.less(gnd),.result(result[9]));  
  ALU_1bit  ALU10(.a(aluSrc1[10]),.b(aluSrc2[10]),.invertA(invertA),.invertB(invertB),.operation(operation),.carryIn(carryOut[9]),.carryOut(carryOut[10]),.less(gnd),.result(result[10]));  
  ALU_1bit  ALU11(.a(aluSrc1[11]),.b(aluSrc2[11]),.invertA(invertA),.invertB(invertB),.operation(operation),.carryIn(carryOut[10]),.carryOut(carryOut[11]),.less(gnd),.result(result[11]));  
  ALU_1bit  ALU12(.a(aluSrc1[12]),.b(aluSrc2[12]),.invertA(invertA),.invertB(invertB),.operation(operation),.carryIn(carryOut[11]),.carryOut(carryOut[12]),.less(gnd),.result(result[12]));  
  ALU_1bit  ALU13(.a(aluSrc1[13]),.b(aluSrc2[13]),.invertA(invertA),.invertB(invertB),.operation(operation),.carryIn(carryOut[12]),.carryOut(carryOut[13]),.less(gnd),.result(result[13]));  
  ALU_1bit  ALU14(.a(aluSrc1[14]),.b(aluSrc2[14]),.invertA(invertA),.invertB(invertB),.operation(operation),.carryIn(carryOut[13]),.carryOut(carryOut[14]),.less(gnd),.result(result[14]));  
  ALU_1bit  ALU15(.a(aluSrc1[15]),.b(aluSrc2[15]),.invertA(invertA),.invertB(invertB),.operation(operation),.carryIn(carryOut[14]),.carryOut(carryOut[15]),.less(gnd),.result(result[15]));  
  ALU_1bit  ALU16(.a(aluSrc1[16]),.b(aluSrc2[16]),.invertA(invertA),.invertB(invertB),.operation(operation),.carryIn(carryOut[15]),.carryOut(carryOut[16]),.less(gnd),.result(result[16]));  
  ALU_1bit  ALU17(.a(aluSrc1[17]),.b(aluSrc2[17]),.invertA(invertA),.invertB(invertB),.operation(operation),.carryIn(carryOut[16]),.carryOut(carryOut[17]),.less(gnd),.result(result[17]));  
  ALU_1bit  ALU18(.a(aluSrc1[18]),.b(aluSrc2[18]),.invertA(invertA),.invertB(invertB),.operation(operation),.carryIn(carryOut[17]),.carryOut(carryOut[18]),.less(gnd),.result(result[18]));  
  ALU_1bit  ALU19(.a(aluSrc1[19]),.b(aluSrc2[19]),.invertA(invertA),.invertB(invertB),.operation(operation),.carryIn(carryOut[18]),.carryOut(carryOut[19]),.less(gnd),.result(result[19]));  
  ALU_1bit  ALU20(.a(aluSrc1[20]),.b(aluSrc2[20]),.invertA(invertA),.invertB(invertB),.operation(operation),.carryIn(carryOut[19]),.carryOut(carryOut[20]),.less(gnd),.result(result[20]));  
  ALU_1bit  ALU21(.a(aluSrc1[21]),.b(aluSrc2[21]),.invertA(invertA),.invertB(invertB),.operation(operation),.carryIn(carryOut[20]),.carryOut(carryOut[21]),.less(gnd),.result(result[21]));  
  ALU_1bit  ALU22(.a(aluSrc1[22]),.b(aluSrc2[22]),.invertA(invertA),.invertB(invertB),.operation(operation),.carryIn(carryOut[21]),.carryOut(carryOut[22]),.less(gnd),.result(result[22]));  
  ALU_1bit  ALU23(.a(aluSrc1[23]),.b(aluSrc2[23]),.invertA(invertA),.invertB(invertB),.operation(operation),.carryIn(carryOut[22]),.carryOut(carryOut[23]),.less(gnd),.result(result[23]));  
  ALU_1bit  ALU24(.a(aluSrc1[24]),.b(aluSrc2[24]),.invertA(invertA),.invertB(invertB),.operation(operation),.carryIn(carryOut[23]),.carryOut(carryOut[24]),.less(gnd),.result(result[24]));  
  ALU_1bit  ALU25(.a(aluSrc1[25]),.b(aluSrc2[25]),.invertA(invertA),.invertB(invertB),.operation(operation),.carryIn(carryOut[24]),.carryOut(carryOut[25]),.less(gnd),.result(result[25]));  
  ALU_1bit  ALU26(.a(aluSrc1[26]),.b(aluSrc2[26]),.invertA(invertA),.invertB(invertB),.operation(operation),.carryIn(carryOut[25]),.carryOut(carryOut[26]),.less(gnd),.result(result[26]));  
  ALU_1bit  ALU27(.a(aluSrc1[27]),.b(aluSrc2[27]),.invertA(invertA),.invertB(invertB),.operation(operation),.carryIn(carryOut[26]),.carryOut(carryOut[27]),.less(gnd),.result(result[27]));  
  ALU_1bit  ALU28(.a(aluSrc1[28]),.b(aluSrc2[28]),.invertA(invertA),.invertB(invertB),.operation(operation),.carryIn(carryOut[27]),.carryOut(carryOut[28]),.less(gnd),.result(result[28]));  
  ALU_1bit  ALU29(.a(aluSrc1[29]),.b(aluSrc2[29]),.invertA(invertA),.invertB(invertB),.operation(operation),.carryIn(carryOut[28]),.carryOut(carryOut[29]),.less(gnd),.result(result[29]));  
  ALU_1bit  ALU30(.a(aluSrc1[30]),.b(aluSrc2[30]),.invertA(invertA),.invertB(invertB),.operation(operation),.carryIn(carryOut[29]),.carryOut(carryOut[30]),.less(gnd),.result(result[30]));  
  ALU_1bit_msb  ALU31(.a(aluSrc1[31]),.b(aluSrc2[31]),.invertA(invertA),.invertB(invertB),.operation(operation),.carryIn(carryOut[30]),.carryOut(carryOut[31]),.less(gnd),.result(result[31]),.set(settoless),.overflow(overflow));
  assign  zero=~(result[31]|result[30]|result[29]|result[28]|result[27]|result[26]|result[25]|result[24]|result[23]|result[22]|result[21]|result[20]|result[19]|result[18]|result[17]|result[16]|result[15]|result[14]|result[13]|result[12]|result[11]|result[10]|result[9]|result[8]|result[7]|result[6]|result[5]|result[4]|result[3]|result[2]|result[1]|result[0]);
  
endmodule

module ALU_1bit (
    a,
    b,
    invertA,
    invertB,
    operation,
    carryIn,
    less,
    result,
    carryOut
);

  //I/O ports
  input a;
  input b;
  input invertA;
  input invertB;
  input [2-1:0] operation;
  input carryIn;
  input less;

  output result;
  output carryOut;

  //Internal Signals
  wire result;
  wire  inverta,invertb,mux1out,mux2out,or1,and1,add1;


  //Main function
  /*your code here*/

  assign  inverta=~a;
  assign  invertb=~b;

  Mux2to1_1bit   mux1(.I0(a),.I1(inverta),.data(mux1out),.S0(invertA));
  Mux2to1_1bit   mux2(.I0(b),.I1(invertb),.data(mux2out),.S0(invertB));
  assign  or1=mux1out|mux2out;
  assign  and1=mux1out&mux2out;
  Full_adder  adder1(.input1(mux1out),.input2(mux2out),.carryIn(carryIn),.carryOut(carryOut),.sum(add1));
  Mux4to1_1bit   mux3(.I3(less),.I2(add1),.I1(and1),.I0(or1),.data(result),.S1(operation[1]),.S0(operation[0]));


endmodule

module ALU_1bit_msb(
    a,
    b,
    invertA,
    invertB,
    operation,
    carryIn,
    less,
    result,
    carryOut,
    set,
    overflow
);

  //I/O ports
  input a;
  input b;
  input invertA;
  input invertB;
  input [2-1:0] operation;
  input carryIn;
  input less;

  output result;
  output carryOut;
  output  set;
  output  overflow;

  //Internal Signals
  wire  result;
  wire  carryIn,carryOut;
  wire  inverta,invertb,mux1out,mux2out,or1,and1,add1;


  //Main function
  /*your code here*/

  assign  inverta=~a;
  assign  invertb=~b;

  Mux2to1_1bit   mux1(.I0(a),.I1(inverta),.data(mux1out),.S0(invertA));
  Mux2to1_1bit   mux2(.I0(b),.I1(invertb),.data(mux2out),.S0(invertB));
  assign  or1=mux1out|mux2out;
  assign  and1=mux1out&mux2out;
  Full_adder  adder1(.input1(mux1out),.input2(mux2out),.carryIn(carryIn),.carryOut(carryOut),.sum(add1));
  Mux4to1_1bit   mux3(.I3(less),.I2(add1),.I1(and1),.I0(or1),.data(result),.S1(operation[1]),.S0(operation[0]));
  assign  set=add1;
  assign  overflow=carryIn^carryOut;
  

endmodule

module Full_adder (
    carryIn,
    input1,
    input2,
    sum,
    carryOut
);

  //I/O ports
  input carryIn;
  input input1;
  input input2;

  output sum;
  output carryOut;

  //Internal Signals
  wire sum;
  wire carryOut;
  wire w1, w2, w3;

  //Main function
  xor x1 (w1, input1, input2);
  xor x2 (sum, w1, carryIn);
  and a1 (w2, input1, input2);
  and a2 (w3, w1, carryIn);
  or o1 (carryOut, w2, w3);
endmodule

module Mux2to1_1bit (
    I1,
    I0,
    S0,
    data   
);

input   I1,I0,S0;
output  data;  
wire    invertS0,and1,and0;
assign      invertS0=~S0;
assign      and1=I1&S0;
assign      and0=I0&invertS0;
assign      data=and1|and0;
endmodule

module Mux4to1_1bit (
    I3,
    I2,
    I1,
    I0,
    S1,
    S0,
    data
);

input   I3,I2,I1,I0,S1,S0;
output  data;
wire    invertS1,invertS0,and3,and2,and1,and0;
assign      invertS1=~S1;
assign      invertS0=~S0;
assign      and3=I3&S1&S0;
assign      and2=I2&S1&invertS0;
assign      and1=I1&invertS1&S0;
assign      and0=I0&invertS1&invertS0;
assign      data=and3|and2|and1|and0;
endmodule




