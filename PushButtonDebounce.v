`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:        Team.TeaWhen
// Engineer:       AquarHEAD L.
// 
// Create Date:    15:51:32 04/22/2013 
// Design Name: 
// Module Name:    PushButtonDebounce 
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
module PushButtonDebounce(
	input clock,
	input RawButton,
	output reg DebouncedButton
    );

	reg [3:0] Delay;

	always @ (posedge clock) begin
		Delay = Delay << 1;
		Delay[0] = RawButton;
		if (Delay == 0)
			DebouncedButton = 0;
		if (Delay == 15)
			DebouncedButton = 1;
	end

endmodule
