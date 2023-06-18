`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.11.2021 10:12:25
// Design Name: 
// Module Name: lab3_source
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


module lab3_source(A, B, SUB, Sum, OVF

    );
    input [15:0] A, B;
    input SUB;
    output [15:0] Sum;
    output OVF;
    
    wire [15:0] C;
    
    FullAdder FA0 (A[0], B[0]^SUB, SUB, Sum[0], C[0]);
    FullAdder FA1 (A[1], B[1]^SUB, C[0], Sum[1], C[1]);
    FullAdder FA2 (A[2], B[2]^SUB, C[1], Sum[2], C[2]);
    FullAdder FA3 (A[3], B[3]^SUB, C[2], Sum[3], C[3]);
    FullAdder FA4 (A[4], B[4]^SUB, C[3], Sum[4], C[4]);
    FullAdder FA5 (A[5], B[5]^SUB, C[4], Sum[5], C[5]);
    FullAdder FA6 (A[6], B[6]^SUB, C[5], Sum[6], C[6]);
    FullAdder FA7 (A[7], B[7]^SUB, C[6], Sum[7], C[7]);
    FullAdder FA8 (A[8], B[8]^SUB, C[7], Sum[8], C[8]);
    FullAdder FA9 (A[9], B[9]^SUB, C[8], Sum[9], C[9]);
    FullAdder FA10 (A[10], B[10]^SUB, C[9], Sum[10], C[10]);
    FullAdder FA11 (A[11], B[11]^SUB, C[10], Sum[11], C[11]);
    FullAdder FA12 (A[12], B[12]^SUB, C[11], Sum[12], C[12]);
    FullAdder FA13 (A[13], B[13]^SUB, C[12], Sum[13], C[13]);
    FullAdder FA15 (A[14], B[14]^SUB, C[13], Sum[14], C[14]);
    FullAdder FA16 (A[15], B[15]^SUB, C[14], Sum[15], C[15]);
    
    assign OVF = C[14] ^C[15];
    
endmodule
