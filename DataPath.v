`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:29:36 04/23/2013 
// Design Name: 
// Module Name:    DataPath 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module DataPath(
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
	
	Registers Registers(
	);
	
endmodule
