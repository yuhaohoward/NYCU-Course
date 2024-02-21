module Mux4to1 (
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