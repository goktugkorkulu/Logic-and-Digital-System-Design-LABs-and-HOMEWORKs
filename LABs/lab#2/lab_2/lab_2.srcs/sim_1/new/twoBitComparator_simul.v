`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/11/2021 09:39:43 AM
// Design Name: 
// Module Name: twoBitComparator_simul
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


module twoBitComparator_simul(

    );
    
    reg X1, X0, Y1, Y0;
    wire EQ, LT, GT;
    
    twoBitComparator UUT(
    .X1(X1),
    .X0(X0),
    .Y1(Y1),
    .Y0(Y0),
    .EQ(EQ),
    .GT(GT),
    .LT(LT)
    );
    
    initial begin
    X1=0;X0=0;Y1=0;Y0=0;
    #1
    X1=0;X0=0;Y1=0;Y0=1;
    #1
    X1=0;X0=0;Y1=1;Y0=0;
    #1
    X1=0;X0=0;Y1=1;Y0=1;
    #1
    X1=0;X0=1;Y1=0;Y0=0;
    #1
    X1=0;X0=1;Y1=0;Y0=1;
    #1
    X1=0;X0=1;Y1=1;Y0=0;
    #1
    X1=0;X0=1;Y1=1;Y0=1;
    
    #1
    X1=1;X0=0;Y1=0;Y0=0;
    #1
    X1=1;X0=0;Y1=0;Y0=1;
    #1
    X1=1;X0=0;Y1=1;Y0=0;
    #1
    X1=1;X0=0;Y1=1;Y0=1;
    #1
    X1=1;X0=1;Y1=0;Y0=0;
    #1
    X1=1;X0=1;Y1=0;Y0=1;
    #1
    X1=1;X0=1;Y1=1;Y0=0;
    #1
    X1=1;X0=1;Y1=1;Y0=1;
    end
endmodule
