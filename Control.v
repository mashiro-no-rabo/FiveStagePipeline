`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:        Team.TeaWhen
// Engineer:       AquarHEAD L.
// 
// Create Date:    22:54:31 04/22/2013 
// Design Name: 
// Module Name:    Control 
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

module Control(
    input wire clock,
    input wire reset,
    
    input wire [31:0] PR_IFID_Inst,
    input wire [31:0] PR_IDEX_Inst,
    input wire [31:0] PR_EXMEM_Inst,
    input wire [31:0] PR_MEMWB_Inst,
    
    output wire CS_Branch,
    output wire CS_UseRT,
    output wire CS_NeedSignExtend,
    output wire CS_RegWrite,
    output wire CS_MemToReg,
    output wire CS_MemWrite,
    output reg [3:0] CS_ALUOP,
    output wire CS_Shift,
    output wire CS_UseImm
    
    );
    
    `define Inst_opcode(Inst) Inst[31:26]
    `define Inst_rs(Inst) Inst[25:21]
    `define Inst_rt(Inst) Inst[20:16]
    `define Inst_rd(Inst) Inst[15:11]
    `define Inst_func(Inst) Inst[5:0]
    
    /*wire [5:0] PR_IFID_Inst_opcode;
    wire [4:0] PR_IFID_Inst_rs;
    wire [4:0] PR_IFID_Inst_rt;
    wire [4:0] PR_IFID_Inst_rd;
    wire [5:0] PR_IFID_Inst_func;
    
    assign PR_IFID_Inst_opcode = PR_IFID_Inst[31:26];
    assign PR_IFID_Inst_rs = PR_IFID_Inst[25:21];
    assign PR_IFID_Inst_rt = PR_IFID_Inst[20:16];
    assign PR_IFID_Inst_rd = PR_IFID_Inst[15:11];
    assign PR_IFID_Inst_func = PR_IFID_Inst[5:0];
    
    wire [5:0] PR_IDEX_Inst_opcode;
    wire [4:0] PR_IDEX_Inst_rs;
    wire [4:0] PR_IDEX_Inst_rt;
    wire [4:0] PR_IDEX_Inst_rd;
    wire [5:0] PR_IDEX_Inst_func;
    
    assign PR_IDEX_Inst_opcode = PR_IDEX_Inst[31:26];
    assign PR_IDEX_Inst_rs = PR_IDEX_Inst[25:21];
    assign PR_IDEX_Inst_rt = PR_IDEX_Inst[20:16];
    assign PR_IDEX_Inst_rd = PR_IDEX_Inst[15:11];
    assign PR_IDEX_Inst_func = PR_IDEX_Inst[5:0];
    
    wire [5:0] PR_EXMEM_Inst_opcode;
    wire [4:0] PR_EXMEM_Inst_rs;
    wire [4:0] PR_EXMEM_Inst_rt;
    wire [4:0] PR_EXMEM_Inst_rd;
    wire [5:0] PR_EXMEM_Inst_func;
    
    assign PR_EXMEM_Inst_opcode = PR_EXMEM_Inst[31:26];
    assign PR_EXMEM_Inst_rs = PR_EXMEM_Inst[25:21];
    assign PR_EXMEM_Inst_rt = PR_EXMEM_Inst[20:16];
    assign PR_EXMEM_Inst_rd = PR_EXMEM_Inst[15:11];
    assign PR_EXMEM_Inst_func = PR_EXMEM_Inst[5:0];
    
    wire [5:0] PR_MEMWB_Inst_opcode;
    wire [4:0] PR_MEMWB_Inst_rs;
    wire [4:0] PR_MEMWB_Inst_rt;
    wire [4:0] PR_MEMWB_Inst_rd;
    wire [5:0] PR_MEMWB_Inst_func;
    
    assign PR_MEMWB_Inst_opcode = PR_MEMWB_Inst[31:26];
    assign PR_MEMWB_Inst_rs = PR_MEMWB_Inst[25:21];
    assign PR_MEMWB_Inst_rt = PR_MEMWB_Inst[20:16];
    assign PR_MEMWB_Inst_rd = PR_MEMWB_Inst[15:11];
    assign PR_MEMWB_Inst_func = PR_MEMWB_Inst[5:0];*/
    
    // need rewrite! use each stage's inst
    assign CS_Branch = (Inst_opcode(PR_EXMEM_Inst) == `OP_BEQ) ? 1 : 0;
    assign CS_UseRT = (Inst_opcode(PR_IDEXE_Inst) == `OP_ALUOP) ? 0 : 1;
//    assign CS_NeedSignExtend = (Inst_opcode == `OP_ALUOP) ? 0 : 1;
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
            `OP_ALUOP: begin
                case (Inst_func(PR_IDEX_Inst))
                    `FUNC_ADD: begin
                        CS_ALUOP <= `ALU_ADD;
                    end
                    `FUNC_SUB: begin
                        CS_ALUOP <= `ALU_SUB;
                    end
                    `FUNC_AND: begin
                        CS_ALUOP <= `ALU_AND;
                    end
                    `FUNC_OR: begin
                        CS_ALUOP <= `ALU_OR;
                    end
                    `FUNC_NOR: begin
                        CS_ALUOP <= `ALU_NOR;
                    end
                    `FUNC_SLT: begin
                        CS_ALUOP <= `ALU_SLT;
                    end
                    `FUNC_SLL: begin
                        CS_ALUOP <= `ALU_SLL;
                    end
                    `FUNC_SRL: begin
                        CS_ALUOP <= `ALU_SRL;
                    end
                    `FUNC_SRA: begin
                        CS_ALUOP <= `ALU_SRA;
                    end
                    default: begin
                    end
                endcase
            end
            default: begin
            end
        endcase
     end
    
endmodule
