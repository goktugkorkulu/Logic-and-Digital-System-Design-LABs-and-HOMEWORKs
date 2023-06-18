`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/24/2021 08:50:01 PM
// Design Name: 
// Module Name: lab1_simulation
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


module lab1_simulation(

    );
    
    reg A, B, Cin;
    wire Sum, Carry;
    lab1_source UUT(
    .A(A),
    .B(B),
    .Cin(Cin),
    .Sum(Sum),
    .Carry(Carry)
    );
    
    
    initial begin
    A=0;B=0;Cin=0;
    #10
    A=0;B=0;Cin=1;
    #10
    A=0;B=1;Cin=0;
    #10
    A=0;B=1;Cin=1;
    #10
    A=1;B=0;Cin=0;
    #10
    A=1;B=0;Cin=1;
    #10
    A=1;B=1;Cin=0;
    #10
    A=1;B=1;Cin=1;
    end
endmodule
