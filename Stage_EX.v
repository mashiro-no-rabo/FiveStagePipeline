`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:        Team.TeaWhen
// Engineer:       AquarHEAD L.
// 
// Create Date:    19:53:52 04/22/2013 
// Design Name: 
// Module Name:    Stage_EX 
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
module Stage_EX(
	input wire [3:0] CS_ALUOP,
	
	input wire [31:0] BeginStageEX_Inst,
	input wire [31:0] BeginStageEX_NewPC,
	input wire [31:0] BeginStageEX_RegDataA,
	input wire [31:0] BeginStageEX_RegDataB,
	input wire [31:0] BeginStageEX_Imm,
	
	output wire [31:0] EndStageEX_Inst,
	output wire [31:0] EndStageEX_NewPC,
	output wire [31:0] EndStageEX_RegDataA,
	output wire [31:0] EndStageEX_RegDataB,
	output wire [31:0] EndStageEX_Imm,
	output wire [31:0] EndStageEX_ALUOutput
	
	);
	
	ALU ALU(
		.A(BeginStageEX_RegDataA),
		.B(BeginStageEX_RegDataB),
		.ALUOP(CS_ALUOP),
		.result(EndStageEX_ALUOutput)
	);
	
endmodule
