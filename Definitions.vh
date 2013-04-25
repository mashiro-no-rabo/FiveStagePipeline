//////////////////////////////////////////////////////////////////////////////////
// Company:        Team.TeaWhen
// Engineer:       AquarHEAD L.
// 
// Create Date:    22:23:11 04/22/2013 
// Design Name: 
// Module Name:    Definitions 
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
`define OP_LW		6'b100011
`define OP_SW		6'b101011
`define OP_BEQ		6'b000100
`define OP_BNE 		6'b000101
`define OP_JMP		6'b000010
`define OP_SPECIAL	6'b000000
`define OP_ADDI		6'b001000
`define OP_ANDI		6'b001100
`define OP_ORI		6'b001101
//`define OP_NOP		32'b00000_100000

//SPECIAL FUNC CODE
`define SPECIAL_FUNC_ADD	6'b100000
`define SPECIAL_FUNC_SUB	6'b100010
`define SPECIAL_FUNC_AND	6'b100100
`define SPECIAL_FUNC_OR		6'b100101
`define SPECIAL_FUNC_NOR	6'b100111
`define SPECIAL_FUNC_SLT	6'b101010
`define SPECIAL_FUNC_SLL	6'b000000
`define SPECIAL_FUNC_SRL	6'b000010
`define SPECIAL_FUNC_SRA	6'b000011

// should be moved to seperate files for alu and inst display
//ALU CODE
`define ALU_ADD		4'b0000
`define ALU_SUB		4'b0010
`define ALU_AND		4'b0100
`define ALU_OR		4'b0101
`define ALU_NOR		4'b0111
`define ALU_SLT		4'b1000
`define ALU_SLL		4'b1100
`define ALU_SRL		4'b1101
`define ALU_SRA		4'b1111
`define ALU_NONE	4'b1110

//INST TYPE CODE
`define INST_TYPE_NOP	4'b0000
`define INST_TYPE_ADD	4'b0001
`define INST_TYPE_SUB	4'b0010
`define INST_TYPE_AND	4'b0011
`define INST_TYPE_OR	4'b0100
`define INST_TYPE_NOR	4'b0101
`define INST_TYPE_LW	4'b0110
`define INST_TYPE_SW	4'b0111
`define INST_TYPE_BEQ	4'b1000
`define INST_TYPE_JMP	4'b1001
`define INST_TYPE_BNE	4'b1010
`define INST_TYPE_SLT	4'b1011
`define INST_TYPE_SLL	4'b1100
`define INST_TYPE_SRL	4'b1101
`define INST_TYPE_SRA	4'b1110
`define INST_TYPE_NONE	4'b1111
