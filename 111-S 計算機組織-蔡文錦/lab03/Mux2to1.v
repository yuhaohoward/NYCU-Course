// Class: 111暑 計算機組織
// Student: 黃育豪 312510198
// Date: 2023/08/05
module Mux2to1 (
    data0_i,
    data1_i,
    select_i,
    data_o
);

  parameter size = 32;

  //I/O ports
  input [size-1:0] data0_i;
  input [size-1:0] data1_i;
  input select_i;

  output [size-1:0] data_o;

  //Internal Signals
  reg [size-1:0] data_o;

  //Main function
  /*your code here*/

  always @(*) begin
    
    if (select_i==0) begin
      
      data_o=data0_i;
    
    end
    else begin

      data_o=data1_i;
    end

  end

endmodule
