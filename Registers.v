`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:        Team.TeaWhen
// Engineer:       AquarHEAD L.
// 
// Create Date:    15:57:01 04/22/2013 
// Design Name: 
// Module Name:    Registers 
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
module Registers(
	input wire clock,
	input wire reset,
	input wire [4:0] rs,
	input wire [4:0] rt,
	input wire [4:0] rd,
	input wire [31:0] din,
	input wire we,
	output reg [31:0] douts,
	output reg [31:0] doutt,
	input wire [4:0] rdisp,
	output reg [31:0] ddisp
    );
	
	reg [31:0] register[1:31];
	
	integer i;
	
	// on init clear registers
	initial begin
		for (i=1; i<32; i=i+1)
			register[i] <= 32'b0;
	end
	
	// double bump? write first at negedge of clock
	always @ (negedge clock or posedge reset) begin
		if (reset) begin
			for (i=1; i<32; i=i+1)
				register[i] <= 32'b0;
		end
		else if ((rd != 0) && (we == 1))
			register[rd] <= din;
	end
	
	// then read
	always @ (clock) begin
		if (clock == 0) begin
			douts = (rs == 0) ? 32'b0: register[rs];
			doutt = (rt == 0) ? 32'b0: register[rt];
		end
	end
	
	// set display data
	always @ (clock or rdisp) begin
		ddisp <= (rdisp == 0) ? 32'b0: register[rdisp];
	end

endmodule
