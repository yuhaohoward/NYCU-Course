// Class: 111暑 計算機組織
// Student: 黃育豪 312510198
// Date: 2023/08/09
`include "Program_Counter.v"
`include "Adder.v"
`include "Instr_Memory.v"
`include "Mux2to1.v"
`include "Mux3to1.v"
`include "Reg_File.v"
`include "Decoder.v"
`include "ALU_Ctrl.v"
`include "Sign_Extend.v"
`include "Zero_Filled.v"
`include "ALU.v"
`include "Shifter.v"
`include "Data_Memory.v"

   module Mux3to1_5bits (
    data0_i,
    data1_i,
    data2_i,
    select_i,
    data_o
);

  parameter size = 5;

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

module Simple_Single_CPU (
    clk_i,
    rst_n
);

  //I/O port
  input clk_i;
  input rst_n;

  //Internal Signal

  parameter four=32'd4;
  parameter reg31=5'b11111;
  wire  [31:0]  pcout,adder1out,instructionout,extend32,Rsdata,Rtdata,Rddata,alusource2,extend32shift2,shifterout,
                aluresult,memaddress,memdata,memtoregdata,adder2out,muxbranchout,muxjumpout,jumpaddress;
  wire  [27:0]  bits26shiftleft2;
  wire  [4:0]   Rdnumber;
  wire  [3:0]   aluoperationout;
  wire          fursltout,leftrightout,zeroout,zeromuxout,regwriteout,alusrcout,jumpout,branchout,branchtypeout,
                memreadout,memwriteout,memtoregout,linkout,PCSrc,overflowout;
  wire  [2:0]   aluopout;
  wire  [1:0]   regdstout;



  //modules
  Program_Counter PC (
      .clk_i(clk_i),
      .rst_n(rst_n),
      .pc_in_i(muxjumpout),
      .pc_out_o(pcout)
  );

  Adder Adder1 (
      .src1_i(pcout),
      .src2_i(four),
      .sum_o (adder1out)
  );

    assign extend32shift2[31:0]={extend32[29:0],2'b00};

  Adder Adder2 (
      .src1_i(adder1out),
      .src2_i(extend32shift2),
      .sum_o (adder2out)
  );

  Mux2to1 Mux_branch (
      .data0_i (adder1out),
      .data1_i (adder2out),
      .select_i(PCSrc),
      .data_o  (muxbranchout)
  );

  assign    bits26shiftleft2[27:0]=  {instructionout[25:0],2'b00};
  assign    jumpaddress[31:0]={adder1out[31:28],bits26shiftleft2[27:0]};
  Mux2to1 Mux_jump (
      .data0_i (muxbranchout),
      .data1_i (jumpaddress),
      .select_i(jumpout),
      .data_o  (muxjumpout)
  );

  Instr_Memory IM (
      .pc_addr_i(pcout),
      .instr_o  (instructionout)
  );

  Mux2to1 ALUtoMem (
      .data0_i (aluresult),
      .data1_i (shifterout),
      .select_i(fursltout),
      .data_o  (memaddress)
  );

  Reg_File RF (
      .clk_i(clk_i),
      .rst_n(rst_n),
      .RSaddr_i(instructionout[25:21]),
      .RTaddr_i(instructionout[20:16]),
      .RDaddr_i(Rdnumber),
      .RDdata_i(Rddata),
      .RegWrite_i(regwriteout),
      .RSdata_o(Rsdata),
      .RTdata_o(Rtdata)
  );

  Decoder Decoder (
      .instr_op_i(instructionout[31:26]),
      .RegWrite_o(regwriteout),
      .ALUOp_o(aluopout),
      .ALUSrc_o(alusrcout),
      .RegDst_o(regdstout),
      .Jump_o(jumpout),
      .Branch_o(branchout),
      .BranchType_o(branchtypeout),
      .MemRead_o(memreadout),
      .MemWrite_o(memwriteout),
      .MemtoReg_o(memtoregout),
      .link(linkout)
  );

  ALU_Ctrl AC (
      .funct_i(instructionout[5:0]),
      .ALUOp_i(aluopout),
      .ALU_operation_o(aluoperationout),
      .FURslt_o(fursltout),
      .leftRight_o(leftrightout)
  );

  Sign_Extend SE (
      .data_i(instructionout[15:0]),
      .data_o(extend32)
  );

  Mux2to1 #(
      .size(32)
  ) ALU_src2Src (
      .data0_i (Rtdata),
      .data1_i (extend32),
      .select_i(alusrcout),
      .data_o  (alusource2)
  );

  ALU ALU (
      .aluSrc1(Rsdata),
      .aluSrc2(alusource2),
      .invertA(aluoperationout[3]),
      .invertB(aluoperationout[2]),
      .operation(aluoperationout[1:0]),
      .result(aluresult),
      .zero(zeroout),
      .overflow(overflowout)
  );

   Mux2to1_1bit    zeroMux(
    .I1(~zeroout),
    .I0(zeroout),
    .S0(branchtypeout),
    .data(zeromuxout)
  );

  assign    PCSrc=branchout&zeromuxout; 

  Shifter shifter (
      .result(shifterout),
      .leftRight(leftrightout),
      .shamt(instructionout[10:6]),
      .sftSrc(alusource2)
  );

  Mux3to1_5bits RDdata_Source (
      .data0_i (instructionout[20:16]),
      .data1_i (instructionout[15:11]),
      .data2_i (reg31),
      .select_i(regdstout),
      .data_o  (Rdnumber)
  );

  Data_Memory DM (
      .clk_i(clk_i),
      .addr_i(memaddress),
      .data_i(Rtdata),
      .MemRead_i(memreadout),
      .MemWrite_i(memwriteout),
      .data_o(memdata)
  );

  Mux2to1 MemtoReg (
      .data0_i(memaddress),
      .data1_i(memdata),
      .select_i(memtoregout),
      .data_o(memtoregdata)
  );

  Mux2to1 linkMux(
      .data0_i(memtoregdata),
      .data1_i(adder1out),
      .select_i(linkout),
      .data_o(Rddata) 
  );

 
/*module Mux2to1_1bit (
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
endmodule*/

endmodule



