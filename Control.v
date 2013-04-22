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
	
	input wire [31:0] Inst,
	
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
	
	wire [5:0] Inst_opcode;
	wire [4:0] Inst_rs;
	wire [4:0] Inst_rt;
	wire [4:0] Inst_rd;
	wire [5:0] Inst_func;
	
	assign Inst_opcode = Inst[31:26];
	assign Inst_rs = Inst[25:21];
	assign Inst_rt = Inst[20:16];
	assign Inst_rd = Inst[15:11];
	assign Inst_func = Inst[5:0];
	
	
	assign CS_Branch = (Inst_opcode == `OP_BEQ) ? 1 : 0;
	assign CS_UseRT = (Inst_opcode == `OP_ALUOP) ? 0 : 1;
endmodule
