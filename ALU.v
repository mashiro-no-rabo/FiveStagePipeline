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
module ALU(
    input wire [31:0] A,
    input wire [31:0] B,
    input wire [2:0]  ALUOP,
    output reg [31:0] result,
    output wire zero,
    output wire overflow
    );

    parameter max = 32'hffffffff;
    
    wire [31:0] result_and, result_or, result_add,
            result_subtract, result_nor, result_slt;
    assign result_and = A & B;
    assign result_or = A | B;
    assign result_add = A + B;
    assign result_subtract = A - B;
    assign result_nor = ~(A | B);
    assign result_slt = (A < B) ? 32'b01 : 32'b0;
    
    assign zero = (result == 0) ? 1 : 0;
    // Since we are using verilog's operations,
    // it's hard to define 'overflow'.
    assign overflow = (ALUOP == 3'b010 && A + B > max) ? 1 : 0;
    
    always @* begin
        case (ALUOP)
            3'b000:  result = result_and; // <= or = ?
            3'b001:  result = result_or; 
            3'b010:  result = result_add;
            3'b110:  result = result_subtract; 
            3'b100:  result = result_nor;
            3'b111:  result = result_slt;
            default: result = 32'hx;
        endcase
    end

endmodule
