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

`include "includes/MIPS32_Instruction_Set.vh"
`include "includes/DisplayData.vh"

module Stage_IF(
    input wire clock,
    input wire reset,
    
    input wire [31:0] FromMEM_NewPC,
    input wire Stall,
    
    output wire [31:0] EndStageIF_NewPC,
    output wire [31:0] EndStageIF_Inst,
    output reg [3:0] EndStageIF_InstNum,
    output wire [3:0] EndStageIF_InstType
    );
    
    reg [31:0] NowPC;
    
    always @ (posedge clock) begin
        if (reset || Stall) begin
            if (reset) begin
                NowPC[31:0] <= 32'b0;
            end
            EndStageIF_InstNum <= 4'b0000;
            EndStageIF_InstType <= 4'b0000;
        end
        else begin
            if (!Stall) begin
                NowPC[31:0] = FromMEM_NewPC[31:0];
            end
        end
    end
    
    assign EndStageIF_NewPC = NowPC + 1;
    assign EndStageIF_InstType = `INST_TYPE_NONE;
    
    always @ (posedge clock) begin
        EndStageIF_InstNum = EndStageIF_InstNum + 1;
    end
    
    // and link inst memory
endmodule
