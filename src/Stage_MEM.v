`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:        Team.TeaWhen
// Engineer:       AquarHEAD L.
// 
// Create Date:    19:54:59 04/22/2013 
// Design Name: 
// Module Name:    Stage_MEM 
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
module Stage_MEM(
    input wire clock,
    input wire reset,
    
    input wire CS_Branch,
    input wire CS_MemWrite,
    
    input wire [31:0] BeginStageMEM_Inst,
    input wire [31:0] BeginStageMEM_NewPC,
    input wire [31:0] BeginStageMEM_RegDataA,
    input wire [31:0] BeginStageMEM_RegDataB,
    input wire [31:0] BeginStageMEM_Imm,
    input wire [31:0] BeginStageMEM_ALUOutput,
    input wire BeginStageMEM_Condition,
    
    output wire [31:0] EndStageMEM_Inst,
    output wire [31:0] EndStageMEM_NewPC,
    output wire [31:0] EndStageMEM_RegDataA,
    output wire [31:0] EndStageMEM_RegDataB,
    output wire [31:0] EndStageMEM_Imm,
    output wire [31:0] EndStageMEM_ALUOutput,
    output wire [31:0] EndStageMEM_MemData,
    );
    
    assign EndStageMEM_NewPC = (CS_Branch && BeginStageMEM_Condition) ? BeginStageMEM_ALUOutput : BeginStageMEM_NewPC;

endmodule
