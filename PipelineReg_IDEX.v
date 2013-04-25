`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:        Team.TeaWhen
// Engineer:       AquarHEAD L.
// 
// Create Date:    19:56:21 04/22/2013 
// Design Name: 
// Module Name:    PipelineReg_IDEX 
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
module PipelineReg_IDEX(
    input wire clock,
    input wire reset,
    
    input wire [31:0] FromID_Inst,
    input wire [31:0] FromID_NewPC,
    input wire [31:0] FromID_RegDataA,
    input wire [31:0] FromID_RegDataB,
    input wire [31:0] FromID_Imm,
    input wire [3:0] FromID_InstNum,
    input wire [3:0] FromID_InstType,
    
    output reg [31:0] ToEX_Inst,
    output reg [31:0] ToEX_NewPC,
    output reg [31:0] ToEX_RegDataA,
    output reg [31:0] ToEX_RegDataB,
    output reg [31:0] ToEX_Imm,
    output reg [3:0] ToEX_InstNum,
    output reg [3:0] ToEX_InstType
    );
    
    always @ (posedge clock or posedge reset) begin
        if (reset == 1) begin
            ToEX_Inst <= 32'b0;
            ToEX_NewPC <= 32'b0;
            ToEX_RegDataA <= 32'b0;
            ToEX_RegDataB <= 32'b0;
            ToEX_Imm <= 32'b0;
            ToEX_InstNum <= 4'b0;
            ToEX_InstType <= 4'b0;
        end
        else begin
            ToEX_Inst <= FromID_Inst;
            ToEX_NewPC <= FromID_NewPC;
            ToEX_RegDataA <= FromID_RegDataA;
            ToEX_RegDataB <= FromID_RegDataB;
            ToEX_Imm <= FromID_Imm;
            ToEX_InstNum <= FromID_InstNum;
            ToEX_InstType <= FromID_InstType;
        end
    end
    
endmodule
