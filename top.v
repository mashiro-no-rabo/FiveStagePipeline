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
	
	wire [31:0] PR_EXMEM_ALUOutput;
	
	// Wire up stages and pipeline registers
	Stage_IF Stage_IF(
		.clock(StepButton),
		.reset(ResetButton),
		.PR_EXMEM_ALUOutput(PR_EXMEM_ALUOutput),
		.CS_Branch(CS_Branch),
		
		.EndStageIF_PC(EndStageIF_PC),
		.EndStageIF_PC4(EndStageIF_PC4),
		.EndStageIF_Inst(EndStageIF_Inst),
		.EndStageIF_InstNum(EndStageIF_InstNum),
		.EndStageIF_InstType(EndStageIF_InstType)
	);
	
	PipelineReg_IFID PipelineReg_IFID(
		.clock(StepButton),
		.FromIF_Inst(EndStageIF_Inst),
		.FromIF_NewPC(),
		.FromIF_InstNum(EndStageIF_InstNum),
		.FromIF_InstType(EndStageIF_InstType),
		.ToID_Inst(ToID_Inst),
		.ToID_NewPC(ToID_NewPC),
		.ToID_InstNum(ToID_InstNum),
		.ToID_InstType(ToID_InstType)
	);
	
	Stage_ID Stage_ID(
	);
	
	PipelineReg_IDEX PipelineReg_IDEX(
	);
	
	Stage_EX Stage_EX(
	);
	
	PipelineReg_EXMEM PipelineReg_EXMEM(
	);
	
	Stage_MEM Stage_MEM(
	);
	
	PipelineReg_MEMWB PipelineReg_MEMWB(
	);
	
	Stage_WB Stage_WB(
	);
	
endmodule
