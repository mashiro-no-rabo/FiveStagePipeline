`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:        Team.TeaWhen
// Engineer:       AquarHEAD L.
// 
// Create Date:    19:55:16 04/22/2013 
// Design Name: 
// Module Name:    Stage_WB 
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
module Stage_WB(
    input wire clock;
    input wire reset;
    
    input wire [31:0] BeginStageWB_Inst,
    input wire [31:0] BeginStageWB_NewPC,
    input wire [31:0] BeginStageWB_RegDataA,
    input wire [31:0] BeginStageWB_RegDataB,
    input wire [31:0] BeginStageWB_Imm,
    input wire [31:0] BeginStageWB_ALUOutput,
    input wire [31:0] BeginStageWB_MemData,

    );


endmodule
