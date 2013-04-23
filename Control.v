`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:        Team.TeaWhen
// Engineer:       AquarHEAD L.
// 
// Create Date:    22:54:31 04/22/2013 
// Design Name: 
// Module Name:    Control 
// Project Name:   Five Stage Pipeline CPU
// Target Devices: Spartan3E Starter Kit
// Tool versions:  Xilinx ISE 14.1
// Description:    I love @Lilian_Ye
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////

`include "Definitions.vh"

module Control(
	input wire clock,
	input wire reset,
	
	input wire [31:0] PR_IFID_Inst,
	input wire [31:0] PR_IDEX_Inst,
	input wire [31:0] PR_EXMEM_Inst,
	input wire [31:0] PR_MEMWB_Inst,
	
	output wire CS_Branch,
	output wire CS_UseRT,
	output wire CS_NeedSignExtend,
	output wire CS_RegWrite,
	output wire CS_MemToReg,
	output wire CS_MemWrite,
	output reg [3:0] CS_ALUOP,
	output wire CS_Shift,
	output wire CS_UseImm
	
    );
	
	wire [5:0] PR_IFID_Inst_opcode;
	wire [4:0] PR_IFID_Inst_rs;
	wire [4:0] PR_IFID_Inst_rt;
	wire [4:0] PR_IFID_Inst_rd;
	wire [5:0] PR_IFID_Inst_func;
	
	assign PR_IFID_Inst_opcode = PR_IFID_Inst[31:26];
	assign PR_IFID_Inst_rs = PR_IFID_Inst[25:21];
	assign PR_IFID_Inst_rt = PR_IFID_Inst[20:16];
	assign PR_IFID_Inst = PR_IFID_Inst[15:11];
	assign PR_IFID_Inst = PR_IFID_Inst[5:0];
	
	// need rewrite! use each stage's inst
	assign CS_Branch = (Inst_opcode == `OP_BEQ) ? 1 : 0;
	assign CS_UseRT = (Inst_opcode == `OP_ALUOP) ? 0 : 1;
	assign CS_NeedSignExtend = (Inst_opcode == `OP_ALUOP) ? 0 : 1;
	assign CS_RegWrite = ((Inst_opcode == `OP_ALUOP) || (Inst_opcode == `OP_LW)) ? 1 : 0;
	assign CS_MemToReg = (Inst_opcode == `OP_LW) ? 1 : 0;
	assign CS_MemWrite = (Inst_opcode == `OP_SW) ? 1 : 0;
	assign CS_Shift = ((Inst_opcode == `OP_ALUOP) && (func[5:2] == 4'b0)) ? 1 : 0;
	assign CS_UseImm = ((Inst_opcode == `OP_ALUOP) || (Inst_opcode == `OP_BEQ)) ? 0 : 1;
endmodule
