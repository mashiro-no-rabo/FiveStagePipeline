`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:        Team.TeaWhen
// Engineer:       AquarHEAD L.
// 
// Create Date:    19:57:01 04/22/2013 
// Design Name: 
// Module Name:    PipelineReg_MEMWB 
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
module PipelineReg_MEMWB(
    input wire clock,
    input wire reset,
    
    input wire [31:0] FromMEM_Inst,
    input wire [31:0] FromMEM_NewPC,
    input wire [31:0] FromMEM_RegDataA,
    input wire [31:0] FromMEM_RegDataB,
    input wire [31:0] FromMEM_Imm,
    input wire [31:0] FromMEM_ALUOutput,
    input wire [3:0] FromMEM_InstNum,
    input wire [3:0] FromMEM_InstType,
    
    output reg [31:0] ToWB_Inst,
    output reg [31:0] ToWB_NewPC,
    output reg [31:0] ToWB_RegDataA,
    output reg [31:0] ToWB_RegDataB,
    output reg [31:0] ToWB_Imm,
    output reg [31:0] ToWB_ALUOutput,
    output reg [3:0] ToWB_InstNum,
    output reg [3:0] ToWB_InstType
    );
    
    always @ (posedge clock or posedge reset) begin
        if (reset == 1) begin
            ToWB_Inst <= 32'b0;
            ToWB_NewPC <= 32'b0;
            ToWB_RegDataA <= 32'b0;
            ToWB_RegDataB <= 32'b0;
            ToWB_Imm <= 32'b0;
            ToWB_InstNum <= 4'b0;
            ToWB_InstType <= 4'b0;
        end
        else begin
            ToWB_Inst <= FromMEM_Inst;
            ToWB_NewPC <= FromMEM_NewPC;
            ToWB_RegDataA <= FromMEM_RegDataA;
            ToWB_RegDataB <= FromMEM_RegDataB;
            ToWB_Imm <= FromMEM_Imm;
            ToWB_ALUOutput <= FromMEM_ALUOutput;
            ToWB_Condition <= FromMEM_Condition;
            ToWB_InstNum <= FromMEM_InstNum;
            ToWB_InstType <= FromMEM_InstType;
        end
    end

endmodule
