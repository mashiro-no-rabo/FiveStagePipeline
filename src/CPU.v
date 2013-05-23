`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:        Team.TeaWhen
// Engineer:       AquarHEAD L.
// 
// Create Date:    16:27:38 04/23/2013 
// Design Name: 
// Module Name:    CPU 
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
module CPU(
    input wire clock,
    input wire reset,
    
    input wire CS_Branch,
    input wire CS_RegWrite,
    
    input wire [4:0] RegDisplay,
    output wire [31:0] RegDispData
    );
    
    // it should have control(for bypass and stall detect) and datapath
    
    DataPath DataPath();
endmodule
