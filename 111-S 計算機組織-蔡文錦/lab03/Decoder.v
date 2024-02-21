// Class: 111暑 計算機組織
// Student: 黃育豪 312510198
// Date: 2023/08/06
module Decoder (
    instr_op_i,
    RegWrite_o,
    ALUOp_o,
    ALUSrc_o,
    RegDst_o,
    Jump_o,
    Branch_o,
    BranchType_o,
    MemRead_o,
    MemWrite_o,
    MemtoReg_o,
    link
);

  //I/O ports
  input [6-1:0] instr_op_i;

  output RegWrite_o;
  output [3-1:0] ALUOp_o;
  output ALUSrc_o;
  output [1:0] RegDst_o;
  output Jump_o;
  output Branch_o;
  output BranchType_o;
  output MemRead_o;
  output MemWrite_o;
  output MemtoReg_o;
  output link;

  //Internal Signals
  wire RegWrite_o;
  wire [3-1:0] ALUOp_o;
  wire ALUSrc_o;
  wire [1:0]RegDst_o;
  wire Jump_o;
  wire Branch_o;
  wire BranchType_o;
  wire MemRead_o;
  wire MemWrite_o;
  wire MemtoReg_o;

  wire  R,addi,lw,sw,beq,bne,jump,jal,blt,bnez,bgez;

  //Main function
  /*your code here*/

  assign  R=~instr_op_i[5]&~instr_op_i[4]&~instr_op_i[3]&~instr_op_i[2]&~instr_op_i[1]&~instr_op_i[0];
  assign  addi=~instr_op_i[5]&instr_op_i[4]&~instr_op_i[3]&~instr_op_i[2]&instr_op_i[1]&instr_op_i[0];
  assign  lw=~instr_op_i[5]&instr_op_i[4]&instr_op_i[3]&~instr_op_i[2]&~instr_op_i[1]&~instr_op_i[0];
  assign  sw=instr_op_i[5]&~instr_op_i[4]&instr_op_i[3]&~instr_op_i[2]&~instr_op_i[1]&~instr_op_i[0];
  assign  beq=~instr_op_i[5]&instr_op_i[4]&instr_op_i[3]&~instr_op_i[2]&~instr_op_i[1]&instr_op_i[0];
  assign  bne=~instr_op_i[5]&instr_op_i[4]&instr_op_i[3]&~instr_op_i[2]&instr_op_i[1]&~instr_op_i[0];
  assign  jump=~instr_op_i[5]&~instr_op_i[4]&instr_op_i[3]&instr_op_i[2]&~instr_op_i[1]&~instr_op_i[0];
  assign  jal=~instr_op_i[5]&~instr_op_i[4]&instr_op_i[3]&instr_op_i[2]&instr_op_i[1]&instr_op_i[0];
  assign  blt=~instr_op_i[5]&instr_op_i[4]&instr_op_i[3]&instr_op_i[2]&~instr_op_i[1]&~instr_op_i[0];
  assign  bnez=~instr_op_i[5]&instr_op_i[4]&instr_op_i[3]&instr_op_i[2]&~instr_op_i[1]&instr_op_i[0];
  assign  bgez=~instr_op_i[5]&instr_op_i[4]&instr_op_i[3]&instr_op_i[2]&instr_op_i[1]&~instr_op_i[0];

  assign  RegDst_o[1]=jal;
  assign  RegDst_o[0]=R;
  assign  ALUSrc_o=addi|lw|sw;
  assign  MemtoReg_o=lw;
  assign  RegWrite_o=R|addi|lw|jal;
  assign  MemRead_o=lw;
  assign  MemWrite_o=sw;
  assign  Branch_o=beq|bne|blt|bnez|bgez;
  assign  ALUOp_o[2]=blt|bnez|bgez|addi;
  assign  ALUOp_o[1]=R|jump|jal;
  assign  ALUOp_o[0]=beq|bne|jump|jal|addi;
  assign  Jump_o=jump|jal;
  assign  BranchType_o=bne|blt|bnez;
  assign  link=jal;

endmodule
