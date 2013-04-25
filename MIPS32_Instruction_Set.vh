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

// Encoding of the Opcode field
`define OP_SPECIAL          6'b000000
`define OP_REGIMM           6'b000001
`define OP_SPECIAL2         6'b011100
`define OP_SPECIAL3         6'b011111
`define OP_ADDI             6'b001000
`define OP_ADDIU            6'b001001
`define OP_ANDI             6'b001100
`define OP_BEQ              6'b000100
`define OP_BGTZ             6'b000111
`define OP_BLEZ             6'b000110
`define OP_BNE              6'b000101
`define OP_J                6'b000010
`define OP_JAL              6'b000011
`define OP_LB               6'b100000
`define OP_LBU              6'b100100
`define OP_LH               6'b100001
`define OP_LHU              6'b100101
`define OP_LUI              6'b001111
`define OP_LW               6'b100011
`define OP_ORI              6'b001101
`define OP_SB               6'b101000
`define OP_SH               6'b101001
`define OP_SLTI             6'b001010
`define OP_SLTIU            6'b001011
`define OP_SW               6'b101011
`define OP_XORI             6'b001110

// SPECIAL Opcode Encoding of Function Field
`define SPECIAL_FUNC_ADD    6'b100000
`define SPECIAL_FUNC_ADDU   6'b100001
`define SPECIAL_FUNC_AND    6'b100100
`define SPECIAL_FUNC_JALR   6'b001001
`define SPECIAL_FUNC_JR     6'b001000
`define SPECIAL_FUNC_NOR    6'b100111
`define SPECIAL_FUNC_OR     6'b100101
`define SPECIAL_FUNC_SLL    6'b000000
`define SPECIAL_FUNC_SLLV   6'b000100
`define SPECIAL_FUNC_SLT    6'b101010
`define SPECIAL_FUNC_SLTU   6'b101011
`define SPECIAL_FUNC_SRA    6'b000011
`define SPECIAL_FUNC_SRAV   6'b000111
`define SPECIAL_FUNC_SRL    6'b000010
`define SPECIAL_FUNC_SRLV   6'b000110
`define SPECIAL_FUNC_SUB    6'b100010
`define SPECIAL_FUNC_SUBU   6'b100011
`define SPECIAL_FUNC_XOR    6'b100110

// REGIMM Encoding of rt Field
`define REGIMM_RT_BGEZAL    5'b10001
`define REGIMM_RT_BGEZ      5'b00001
`define REGIMM_RT_BLTZ      5'b00000
`define REGIMM_RT_BLTZAL    5'b10000

// SPECIAL2 Opcode Encoding of Function Field
`define SPECIAL2_FUNC_CLO   6'b100001
`define SPECIAL2_FUNC_CLZ   6'b100000

// SPECIAL3 Opcode Encoding of Function Field
`define SPECIAL3_FUNC_BSHFL 6'b100000

// BSHFL Encoding of sa Field
`define BSHFL_SA_SEB        5'b10000
`define BSHFL_SA_SEH        5'b11000