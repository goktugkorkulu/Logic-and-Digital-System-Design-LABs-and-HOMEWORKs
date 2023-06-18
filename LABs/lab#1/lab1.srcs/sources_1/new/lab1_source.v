`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/24/2021 08:30:42 PM
// Design Name: 
// Module Name: lab1_source
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


module lab1_source(input A,
                   input B,
                   input Cin,
                   output Sum,
                   output Carry
    );
    
    wire and1, and2, and3;
    /*assign and1 = A&B;
    assign and2 = A&Cin;
    assign and3 = B&Cin;
    assign Sum = A^B^Cin;
    assign Carry = and1|and2|and3;*/
    assign Sum = (~A)&(~B)&Cin | (~A)&B&(~Cin) | A&(~B)&(~Cin) | A&B&Cin;
    assign Carry = (~A)&B&Cin | A&(~B)&Cin | A&B&(~Cin) | A&B&Cin;
    
endmodule
