`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:        Team.TeaWhen
// Engineer:       AquarHEAD L.
// 
// Create Date:    16:38:02 04/22/2013 
// Design Name: 
// Module Name:    Clock 
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
module Clock(
	input RawClock,
	input [31:0] ClockScale,
	output reg clock
    );

	reg [31:0] clkq = 0;
	
	always @ (posedge RawClock) begin
		clkq = clkq + 1;
		if (clkq >= ClockScale) begin
			clock = ~clock;
			clkq = 0;
		end
	end

endmodule
