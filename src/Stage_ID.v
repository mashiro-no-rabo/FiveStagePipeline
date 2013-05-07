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

`include "includes/Decode.vh"

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
    
    
    
    
    
    
    output reg CS_Branch,
    output reg CS_CanOverflow,
    output reg CS_UseRT,
    output reg CS_NeedSignExtend,
    output reg CS_RegWrite,
    output reg CS_MemToReg,
    output reg CS_MemWrite,
    output reg [5:0] CS_ALUOP,
    output reg CS_Shift,
    output reg CS_UseImm
    
    assign CS_Branch = (Inst_opcode(PR_EXMEM_Inst) == `OP_BEQ) ? 1 : 0;
    //assign CS_CanOverflow = ;
    assign CS_UseRT = (Inst_opcode(PR_IDEXE_Inst) == `OP_ALUOP) ? 0 : 1;
    assign CS_NeedSignExtend = (Inst_opcode == `OP_ALUOP) ? 0 : 1;
    assign CS_RegWrite = ((Inst_opcode(PR_MEMWB_Inst) == `OP_ALUOP) || (Inst_opcode(PR_MEMWB_Inst) == `OP_LW)) ? 1 : 0;
    assign CS_MemToReg = (Inst_opcode(PR_MEMWB_Inst) == `OP_LW) ? 1 : 0; //PR_EXMEM?
    assign CS_MemWrite = (Inst_opcode(PR_EXMEM_Inst) == `OP_SW) ? 1 : 0;
    assign CS_Shift = ((Inst_opcode(PR_IDEX_Inst) == `OP_ALUOP) && (PR_IDEX_Inst[5:2] == 4'b0)) ? 1 : 0;
    assign CS_UseImm = ((Inst_opcode(PR_IDEX_Inst) == `OP_ALUOP) || (Inst_opcode(PR_IDEX_Inst) == `OP_BEQ)) ? 0 : 1;
    
    always @ (PR_IDEX_Inst) begin
        case (Inst_opcode(PR_IDEX_Inst))
            `OP_ADDI: begin
                CS_ALUOP <= `ALU_ADD;
            end
            `OP_ANDI: begin
                CS_ALUOP <= `ALU_AND;
            end
            `OP_ORI: begin
                CS_ALUOP <= `ALU_OR;
            end
            `OP_SPECIAL: begin
                case (Inst_func(PR_IDEX_Inst))
                    `SPECIAL_FUNC_ADD: begin
                        CS_ALUOP <= `ALU_ADD;
                    end
                    `SPECIAL_FUNC_AND: begin
                        CS_ALUOP <= `ALU_AND;
                    end
                    `SPECIAL_FUNC_NOR: begin
                        CS_ALUOP <= `ALU_NOR;
                    end
                    `SPECIAL_FUNC_OR: begin
                        CS_ALUOP <= `ALU_OR;
                    end
                    `SPECIAL_FUNC_SLL: begin
                        CS_ALUOP <= `ALU_SLL;
                    end
                    `SPECIAL_FUNC_SLT: begin
                        CS_ALUOP <= `ALU_SLT;
                    end
                    `SPECIAL_FUNC_SRA: begin
                        CS_ALUOP <= `ALU_SRA;
                    end
                    `SPECIAL_FUNC_SRL: begin
                        CS_ALUOP <= `ALU_SRL;
                    end
                    `SPECIAL_FUNC_SUB: begin
                        CS_ALUOP <= `ALU_SUB;
                    end
                    `SPECIAL_FUNC_XOR: begin
                        CS_ALUOP <= `ALU_XOR
                    end
                    default: begin
                        CS_ALUOP <= `ALU_SLL;
                    end
                endcase
            end
            default: begin
                CS_ALUOP <= `ALU_SLL;
            end
        endcase
     end
    
endmodule
