// Class: 111暑 計算機組織
// Student: 黃育豪 312510198
// Date: 2023/08/06
module ALU_Ctrl (
    funct_i,
    ALUOp_i,
    ALU_operation_o,
    FURslt_o,
    leftRight_o
);

  //I/O ports
  input [6-1:0] funct_i;
  input [3-1:0] ALUOp_i;

  output [4-1:0] ALU_operation_o;
  output FURslt_o;
  output leftRight_o;

  //Internal Signals
  wire [4-1:0] ALU_operation_o;
  wire FURslt_o;
  wire leftRight_o;

  parameter lwsw=3'b000;
  parameter addi=3'b101;
  parameter beqbne=3'b001;
  parameter bltbnezbgez=3'b100;
  parameter Jtype=3'b011;
  parameter Rtype=3'b010;

  //Main function
  /*your code here*/

  assign  ALU_operation_o=(ALUOp_i==lwsw||ALUOp_i==addi||(ALUOp_i==Rtype&funct_i==6'b100011))?4'b0010:
                          (ALUOp_i==beqbne||(ALUOp_i==Rtype&funct_i==6'b010011))?4'b0110:
                          (ALUOp_i==bltbnezbgez||(ALUOp_i==Rtype&funct_i==6'b010100))?4'b0111:
                          (ALUOp_i==Rtype&funct_i==6'b011111)?4'b0001:
                          (ALUOp_i==Rtype&funct_i==6'b010000)?4'b1101:4'b0000;

  assign FURslt_o=(ALUOp_i==Jtype||(ALUOp_i==Rtype&funct_i==6'b010010)||(ALUOp_i==Rtype&funct_i==6'b100010)||(ALUOp_i==Rtype&funct_i==6'b011000)||(ALUOp_i==Rtype&funct_i==6'b101000))?1'b1:1'b0;
  assign leftRight_o=((ALUOp_i==Rtype&funct_i==6'b100010)||(ALUOp_i==Rtype&funct_i==6'b101000))?1'b1:1'b0;



endmodule
