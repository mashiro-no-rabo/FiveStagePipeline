`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:        Team.TeaWhen
// Engineer:       AquarHEAD L.
// 
// Create Date:    21:27:58 04/25/2013 
// Design Name: 
// Header Name:    ALUOP 
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

// ALU Encoding
`define ALU_ADD    6'b100000
`define ALU_AND    6'b100100
`define ALU_NOR    6'b100111
`define ALU_OR     6'b100101
`define ALU_SLL    6'b000000
`define ALU_SLT    6'b101010
`define ALU_SRA    6'b000011
`define ALU_SRL    6'b000010
`define ALU_SUB    6'b100010
`define ALU_XOR    6'b100110

// some "unsigned" version should use 
// the same encoding as "signed" version instructions
