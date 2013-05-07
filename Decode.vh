//////////////////////////////////////////////////////////////////////////////////
// Company:        Team.TeaWhen
// Engineer:       AquarHEAD L.
// 
// Create Date:    21:34:50 05/07/2013 
// Design Name: 
// Header Name:    Decode 
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

`define Inst_opcode(Inst) Inst[31:26]
`define Inst_rs(Inst) Inst[25:21]
`define Inst_rt(Inst) Inst[20:16]
`define Inst_rd(Inst) Inst[15:11]
`define Inst_func(Inst) Inst[5:0]