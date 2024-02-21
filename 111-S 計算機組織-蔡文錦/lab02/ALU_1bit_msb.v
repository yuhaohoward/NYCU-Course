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

  Mux2to1   mux1(.I0(a),.I1(inverta),.data(mux1out),.S0(invertA));
  Mux2to1   mux2(.I0(b),.I1(invertb),.data(mux2out),.S0(invertB));
  assign  or1=mux1out|mux2out;
  assign  and1=mux1out&mux2out;
  Full_adder  adder1(.input1(mux1out),.input2(mux2out),.carryIn(carryIn),.carryOut(carryOut),.sum(add1));
  Mux4to1   mux3(.I3(less),.I2(add1),.I1(and1),.I0(or1),.data(result),.S1(operation[1]),.S0(operation[0]));
  assign  set=add1;
  assign  overflow=carryIn^carryOut;
  

endmodule
