`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:        Team.TeaWhen
// Engineer:       AquarHEAD L.
// 
// Create Date:    19:56:44 04/22/2013 
// Design Name: 
// Module Name:    PipelineReg_EXMEM 
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
module PipelineReg_EXMEM(
    input wire clock,
    input wire reset,
    
    input wire [31:0] FromEX_Inst,
    input wire [31:0] FromEX_NewPC,
    input wire [31:0] FromEX_RegDataA,
    input wire [31:0] FromEX_RegDataB,
    input wire [31:0] FromEX_Imm,
    input wire [31:0] FromEX_ALUOutput,
    input wire FromEX_Condition,
    input wire [3:0] FromEX_InstNum,
    input wire [3:0] FromEX_InstType,
    
    output reg [31:0] ToMEM_Inst,
    output reg [31:0] ToMEM_NewPC,
    output reg [31:0] ToMEM_RegDataA,
    output reg [31:0] ToMEM_RegDataB,
    output reg [31:0] ToMEM_Imm,
    output reg [31:0] ToMEM_ALUOutput,
    output reg ToMEM_Condition,
    output reg [3:0] ToMEM_InstNum,
    output reg [3:0] ToMEM_InstType
    );
    
    always @ (posedge clock or posedge reset) begin
        if (reset == 1) begin
            ToMEM_Inst <= 32'b0;
            ToMEM_NewPC <= 32'b0;
            ToMEM_RegDataA <= 32'b0;
            ToMEM_RegDataB <= 32'b0;
            ToMEM_Imm <= 32'b0;
            ToMEM_InstNum <= 4'b0;
            ToMEM_InstType <= 4'b0;
        end
        else begin
            ToMEM_Inst <= FromEX_Inst;
            ToMEM_NewPC <= FromEX_NewPC;
            ToMEM_RegDataA <= FromEX_RegDataA;
            ToMEM_RegDataB <= FromEX_RegDataB;
            ToMEM_Imm <= FromEX_Imm;
            ToMEM_ALUOutput <= FromEX_ALUOutput;
            ToMEM_Condition <= FromEX_Condition;
            ToMEM_InstNum <= FromEX_InstNum;
            ToMEM_InstType <= FromEX_InstType;
        end
    end

endmodule
