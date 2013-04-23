`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:        Team.TeaWhen
// Engineer:       AquarHEAD L.
// 
// Create Date:    18:10:39 04/22/2013 
// Design Name: 
// Module Name:    Stage_IF 
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

module Stage_IF(
	input wire clock,
	input wire reset,
	
	input wire [31:0] PR_EXMEM_ALUOutput,
	input wire CS_Branch,
	
	output wire [31:0] EndStageIF_PC,
	output wire [31:0] EndStageIF_PC4,
	output wire [31:0] EndStageIF_Inst,
	output wire [3:0] EndStageIF_InstNum,
	output wire [3:0] EndStageIF_InstType
    );
	
	reg [31:0] pc;
	
	wire [31:0] StageIF_PC4;
	
	InstMemory InstMemory(
		.a(pc[7:0]),
		.spo(StageIF_Inst)
	);
	
	initial begin
		pc[31:0] = 32'hffffffff;
		EndStageIF_InstNum = 4'b0000;
		EndStageIF_InstType = 4'b0000;
	end
	
	assign EndStageIF_PC4 = pc + 1;
	assign StageIF_PC = CS_Branch ? PR_EXMEM_ALUOutput : StageIF_PC4;
	
	always @ (posedge clock) begin
		
	end
endmodule