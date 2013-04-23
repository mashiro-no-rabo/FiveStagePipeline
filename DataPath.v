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
	input wire clock,
	input wire reset,
    );
	
	wire [31:0] PR_EXMEM_ALUOutput;
	
	// Wire up registers here to support double bump
	Registers Registers(
		.clock(clock),
		.reset(reset),
		.rs(RegAdd_rs),
		.rt(RegAdd_rt),
		.rd(RegAdd_rd),
		.rdin(),
		.we(),
		.douts(RegData_rs),
		.doutt(RegData_rt),
		.rdisp(),
		.ddisp()
	);
	
	// Wire up stages and pipeline registers
	Stage_IF Stage_IF(
		.clock(clock),
		.reset(reset),
		.PR_EXMEM_ALUOutput(PR_EXMEM_ALUOutput),
		.CS_Branch(CS_Branch),
		
		.EndStageIF_PC(FromIF_PC),
		.EndStageIF_NewPC(FromIF_NewPC),
		.EndStageIF_Inst(FromIF_Inst),
		.EndStageIF_InstNum(FromIF_InstNum),
		.EndStageIF_InstType(FromIF_InstType)
	);
	
	PipelineReg_IFID PipelineReg_IFID(
		.clock(clock),
		.reset(reset),
		.FromIF_Inst(FromIF_Inst),
		.FromIF_NewPC(FromIF_NewPC),
		.FromIF_InstNum(FromIF_InstNum),
		.FromIF_InstType(FromIF_InstType),
		.ToID_Inst(ToID_Inst),
		.ToID_NewPC(ToID_NewPC),
		.ToID_InstNum(ToID_InstNum),
		.ToID_InstType(ToID_InstType)
	);
	
	Stage_ID Stage_ID(
		.clock(clock),
		.reset(reset),
		.BeginStageID_Inst(ToID_Inst),
		.BeginStageID_NewPC(ToID_NewPC),
		.BeginStageID_InstNum(ToID_InstNum),
		.BeginStageID_InstType(ToID_InstType),
		.RegAdd_rs(RegAdd_rs),
		.RegAdd_rt(RegAdd_rt),
		.RegData_rs(RegData_rs),
		.RegData_rt(RegData_rt),
		.EndStageID_Inst(),
		.EndStageID_NewPC(),
		.EndStageID_RegDataA(),
		.EndStageID_RegDataB(),
		.EndStageID_Imm(),
		.EndStageID_InstNum(),
		.EndStageID_InstType(),
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
