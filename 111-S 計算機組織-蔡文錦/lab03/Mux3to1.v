// Class: 111暑 計算機組織
// Student: 黃育豪 312510198
// Date: 2023/08/05
module Mux3to1 (
    data0_i,
    data1_i,
    data2_i,
    select_i,
    data_o
);

  parameter size = 32;

  //I/O ports
  input [size-1:0] data0_i;
  input [size-1:0] data1_i;
  input [size-1:0] data2_i;
  input [2-1:0] select_i;

  output [size-1:0] data_o;

  //Internal Signals
  reg [size-1:0] data_o;

  //Main function
  /*your code here*/

  always @(data0_i or data1_i or data2_i or select_i) begin

      case(select_i)
      2'b00:data_o=data0_i;
      2'b01:data_o=data1_i;
      2'b10:data_o=data2_i;
      endcase

  end


endmodule
