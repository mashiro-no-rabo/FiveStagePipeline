`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:        Team.TeaWhen
// Engineer:       AquarHEAD L.
// 
// Create Date:    20:12:37 04/25/2013 
// Design Name: 
// Header Name:    MIPS32_Instruction_Set 
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

//operation code
`define OP_LW        6'b100011
`define OP_SW        6'b101011
`define OP_BEQ        6'b000100
`define OP_BNE         6'b000101
`define OP_JMP        6'b000010
`define OP_SPECIAL    6'b000000
`define OP_ADDI        6'b001000
`define OP_ANDI        6'b001100
`define OP_ORI        6'b001101
//`define OP_NOP        32'b00000_100000

//SPECIAL FUNC CODE
`define SPECIAL_FUNC_ADD    6'b100000
`define SPECIAL_FUNC_SUB    6'b100010
`define SPECIAL_FUNC_AND    6'b100100
`define SPECIAL_FUNC_OR        6'b100101
`define SPECIAL_FUNC_NOR    6'b100111
`define SPECIAL_FUNC_SLT    6'b101010
`define SPECIAL_FUNC_SLL    6'b000000
`define SPECIAL_FUNC_SRL    6'b000010
`define SPECIAL_FUNC_SRA    6'b000011
