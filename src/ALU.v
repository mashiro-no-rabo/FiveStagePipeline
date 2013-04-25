`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:        Team.TeaWhen
// Engineer:       AquarHEAD L.
// 
// Create Date:    16:23:57 04/22/2013 
// Design Name: 
// Module Name:    ALU 
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

`include "includes/ALUOP.vh"

module ALU(
    input wire [31:0] A,
    input wire [31:0] B,
    input wire [5:0]  ALUOP,
    input wire CS_CanOverflow,
    output reg [31:0] result,
    output wire zero,
    output wire overflow
    );

    parameter max = 32'hffffffff;
    
    // result wires
    wire [31:0] rADD,
                rAND,
                rNOR,
                rOR,
                rSLL,
                rSLT,
                rSRA,
                rSRL,
                rSUB,
                rXOR;
    
    assign rADD = A + B;
    assign rAND = A & B;
    assign rNOR = ~(A | B);
    assign rOR  = A | B;
    //assign rSLL = ;
    assign rSLT = (A < B) ? 32'b01 : 32'b0;
    //assign rSRA = ;
    //assign rSRL = ;
    assign rSUB = A - B;
    assign rXOR = A ^ B;
    
    assign zero = (result == 0) ? 1 : 0;
    
    // need rewrite overflow condition
    assign overflow = (ALUOP == 3'b010 && A + B > max) ? 1 : 0;
    
    always @* begin
        case (ALUOP)
            `ALU_ADD: result <= rADD;
            `ALU_AND: result <= rAND;
            `ALU_NOR: result <= rNOR;
            `ALU_OR:  result <= rOR;
            `ALU_SLL: result <= rSLL;
            `ALU_SLT: result <= rSLT;
            `ALU_SRA: result <= rSRA;
            `ALU_SRL: result <= rSRL;
            `ALU_SUB: result <= rSUB;
            `ALU_XOR: result <= rXOR;
            default:  result <= 32'hx;
        endcase
    end

endmodule
