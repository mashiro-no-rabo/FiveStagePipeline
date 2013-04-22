`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:        Team.TeaWhen
// Engineer:       AquarHEAD L.
// 
// Create Date:    18:24:03 04/22/2013 
// Design Name: 
// Module Name:    PipelineReg_IFID 
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
module PipelineReg_IFID(
	input wire clock,
	input wire [31:0] FromIF_Inst,
	input wire [31:0] FromIF_NewPC,
	input wire [3:0]  FromIF_InstNum,
	input wire [3:0]  FromIF_InstType,
	output reg [31:0] ToID_Inst,
	output reg [31:0] ToID_NewPC,
	output reg [3:0]  ToID_InstNum,
	output reg [3:0]  ToID_InstType
    );

	always @ (posedge clock) begin
		ToID_Inst <= FromIF_Inst;
		ToID_NewPC <= FromIF_NewPC;
		ToID_InstNum <= FromIF_InstNum;
		ToID_InstType <= FromIF_InstType;
	end

endmodule
