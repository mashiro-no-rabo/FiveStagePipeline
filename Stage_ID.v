`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:        Team.TeaWhen
// Engineer:       AquarHEAD L.
// 
// Create Date:    18:40:46 04/22/2013 
// Design Name: 
// Module Name:    Stage_ID 
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
module Stage_ID(
	input wire clock,
	input wire reset,
	
	input wire [31:0] BeginStageID_Inst,
	input wire [31:0] BeginStageID_NewPC,
	
	output wire [4:0] RegAdd_rs,
	output wire [4:0] RegAdd_rt,
	
	input wire [31:0] RegData_rs,
	input wire [31:0] RegData_rt,
	
	output wire [31:0] EndStageID_Inst,
	output wire [31:0] EndStageID_NewPC,
	output wire [31:0] EndStageID_RegDataA,
	output wire [31:0] EndStageID_RegDataB,
	output wire [31:0] EndStageID_Imm
	);
	
	assign EndStageID_Inst = BeginStageID_Inst;
	assign EndStageID_NewPC = BeginStageID_NewPC;
	
	assign RegAdd_rs = BeginStageID_Inst[31:26];
	assign RegAdd_rt = BeginStageID_Inst[25:21];
	
	assign EndStageID_RegDataA = RegData_rs;
	assign EndStageID_RegDataB = RegData_rt;
	assign EndStageID_Imm = {{16{BeginStageID_Inst[15]}}, BeginStageID_Inst[15:0]};
	
endmodule
