`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.12.2021 09:54:34
// Design Name: 
// Module Name: fullAdder
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module FullAdder (A, B, Cin, Sum, Carry);

    input A, B, Cin;
    output Sum, Carry;
    
    assign Carry = (A & B) | (A & Cin) | (B & Cin);
    assign Sum = A ^ B ^ Cin;

endmodule


