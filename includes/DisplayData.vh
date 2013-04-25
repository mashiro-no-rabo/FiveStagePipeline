`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:        Team.TeaWhen
// Engineer:       AquarHEAD L.
// 
// Create Date:    21:33:40 04/25/2013 
// Design Name: 
// Header Name:    DisplayData 
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

//INST TYPE CODE
`define INST_TYPE_NOP    4'b0000
`define INST_TYPE_ADD    4'b0001
`define INST_TYPE_SUB    4'b0010
`define INST_TYPE_AND    4'b0011
`define INST_TYPE_OR     4'b0100
`define INST_TYPE_NOR    4'b0101
`define INST_TYPE_LW     4'b0110
`define INST_TYPE_SW     4'b0111
`define INST_TYPE_BEQ    4'b1000
`define INST_TYPE_JMP    4'b1001
`define INST_TYPE_BNE    4'b1010
`define INST_TYPE_SLT    4'b1011
`define INST_TYPE_SLL    4'b1100
`define INST_TYPE_SRL    4'b1101
`define INST_TYPE_SRA    4'b1110
`define INST_TYPE_NONE   4'b1111
