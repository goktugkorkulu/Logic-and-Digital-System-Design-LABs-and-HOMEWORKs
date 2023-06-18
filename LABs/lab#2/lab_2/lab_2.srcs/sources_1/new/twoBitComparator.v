`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/11/2021 09:30:50 AM
// Design Name: 
// Module Name: twoBitComparator
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


module twoBitComparator(input X1,
                        input X0,
                        input Y1,
                        input Y0,
                        output LT,
                        output GT,
                        output EQ
    );
    
    assign LT = ((~X1)&Y1) | (~X1)&(~X0)&Y0 | (~X0)&Y1&Y0;
    assign GT = (X1&(~Y1)) | X1&X0&(~Y0) | X0&(~Y1)&(~Y0);
    assign EQ = ~(LT | GT);
    
endmodule
