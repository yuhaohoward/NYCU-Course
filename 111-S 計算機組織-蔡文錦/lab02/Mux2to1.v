module Mux2to1(
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