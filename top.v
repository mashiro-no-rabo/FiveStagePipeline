`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:        Team.TeaWhen
// Engineer:       AquarHEAD L.
// 
// Create Date:    20:38:40 04/16/2013 
// Design Name: 
// Module Name:    top 
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
module top(
	input wire RawClock,
	input wire RawStepButton,
	input wire RawResetButton,
	input wire [3:0] RegisterIndex,
	
	output wire LED,
	output wire LCDE,
	output wire LCDRS,
	output wire LCDRW,
	output wire [3:0] LCDAT
    );
	
	wire clock;
	wire StepButton;
	wire ResetButton;
	
	// Scale clock and debounce push buttons
	Clock ScaleClock(
		.RawClock(RawClock),
		.ClockScale(25000),
		.clock(clock)
	);
	
	PushButtonDebounce StepButtonDebounce(
		.clock(clock),
		.RawButton(RawStepButton),
		.DebouncedButton(StepButton)
	);
	
	PushButtonDebounce ResetButtonDebounce(
		.clock(clock),
		.RawButton(RawResetButton),
		.DebouncedButton(ResetButton)
	);
	
	// wire up memories
	InstMemory InstMemory(
		.a(pc[7:0]),
		.spo(StageIF_Inst)
	);
	
	// data memory
	
	// wire up CPU
	
	CPU CPU (
	);
endmodule
