`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.11.2021 10:21:46
// Design Name: 
// Module Name: lab3_sim
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


module lab3_sim(

    );
        reg [15:0]A;
        reg [15:0]B;
        reg SUB;
     
        wire [15:0] C;
        wire OVF;
        
        lab3_source UUT(
        .A(A),
        .B(B),
        .SUB(SUB),
        .Sum(C),
        .OVF(OVF)
        );
        
        // ------------------------------------------------------------------------------------------------------------------
        // ------------------------------------------------------------------------------------------------------------------
        
        // Input & Output Definitions
        // Operation A (- or +) B
        // A,B: operation inputs
        // SUB: Add/Sub control signal
        // C: output
        // OVF: overflow
        
        // -----------------------------------------------------------
        // Modify definitions below according to your pin names!
        `define A  {A}
        `define B  {B}
        `define T  {SUB}
        `define C  {C}
        `define V  {OVF}
        // -----------------------------------------------------------
        
        // Test cases
        reg [15:0] A_array [15:0];
        reg [15:0] B_array [15:0];
        reg [15:0] C_array [15:0];
        reg [0:0]  V_array [15:0];
        
        initial begin
            // Addition with No Overflow
            A_array[ 0]=   (1468); B_array[ 0]=   (2053); C_array[ 0]=   (3521); V_array[ 0]= 0; // (+) + (+) - No overflow
            A_array[ 1]=  (10744); B_array[ 1]=  (-8009); C_array[ 1]=   (2735); V_array[ 1]= 0; // (+) + (-) - No overflow (Sum: (+))
            A_array[ 2]=   (3563); B_array[ 2]=  (-6730); C_array[ 2]=  (-3167); V_array[ 2]= 0; // (+) + (-) - No overflow (Sum: (-))
            A_array[ 3]=  (-3208); B_array[ 3]=   (4745); C_array[ 3]=   (1537); V_array[ 3]= 0; // (-) + (+) - No overflow (Sum: (+))
            A_array[ 4]=  (-7581); B_array[ 4]=   (1802); C_array[ 4]=  (-5779); V_array[ 4]= 0; // (-) + (+) - No overflow (Sum: (-))
            A_array[ 5]=  (-1304); B_array[ 5]= (-12603); C_array[ 5]= (-13907); V_array[ 5]= 0; // (-) + (-) - No overflow
            // Addition with Overflow
            A_array[ 6]=   (32760); B_array[ 6]=   (32360); C_array[ 6]= (-416); V_array[ 6]= 1; // (+) + (+) - overflow
            A_array[ 7]=  (-7444); B_array[ 7]= (-25995); C_array[ 7]=  (32097); V_array[ 7]= 1; // (-) + (-) - overflow
            // Subtraction with No Overflow
            A_array[ 8]=  (10287); B_array[ 8]=   (4787); C_array[ 8]=   (5500); V_array[ 8]= 0; // (+) - (+) - No overflow (Sum: (+))
            A_array[ 9]=   (6650); B_array[ 9]=  (15398); C_array[ 9]=  (-8748); V_array[ 9]= 0; // (+) - (+) - No overflow (Sum: (-))
            A_array[10]=   (3214); B_array[10]=  (-3428); C_array[10]=   (6642); V_array[10]= 0; // (+) - (-) - No overflow
            A_array[11]= (-10657); B_array[11]=   (3396); C_array[11]= (-14053); V_array[11]= 0; // (-) - (+) - No overflow
            A_array[12]=  (-9893); B_array[12]= (-13495); C_array[12]=   (3602); V_array[12]= 0; // (-) - (-) - No overflow (Sum: (+))
            A_array[13]= (-16087); B_array[13]=  (-7443); C_array[13]=  (-8644); V_array[13]= 0; // (-) - (-) - No overflow (Sum: (-))
            // Subtraction with Overflow
            A_array[14]=  (26691); B_array[14]= (-28530); C_array[14]=  (-10315); V_array[14]= 1; // (+) - (-) - overflow
            A_array[15]=  (-16336); B_array[15]=  (30470); C_array[15]=  (18730); V_array[15]= 1; // (-) - (+) - overflow
            #0;
        end
        
        // Test signals
        integer A_test;
        integer B_test;
        
        integer _MAX_VAL = 32'b00000000000000000111111111111111;
        integer _MIN_VAL = 32'b11111111111111111000000000000000;
        
        // Test & grade
        integer k;
        integer GRADE;
        
        parameter ADD_SUM_RIGHT= 4;
        parameter ADD_OVF_RIGHT= 2;
        parameter SUB_SUM_RIGHT= 3;
        parameter SUB_OVF_RIGHT= 2;
        parameter TOTAL_GRADE  = 8*(ADD_SUM_RIGHT+ADD_OVF_RIGHT) + 8*(SUB_SUM_RIGHT+SUB_OVF_RIGHT);
        
        initial begin
            // reset all signal
            `A = 16'd0;
            `B = 16'd0;
            `T = 1'b0;
            GRADE = 0;
            A_test = 0;    B_test = 0;
            k = 0;
        
            #100;
            // initialize
            `A = 16'd0;
            `B = 16'd0;
            `T = 1'b0;
            GRADE = 0;
            #10;
        
            // addition
            for(k=0; k<8; k=k+1) begin
                // give input
                `A = A_array[k];
                `B = B_array[k];
                `T = 1'b0;
                #1;
        
                // check result
                A_test = {{17{A_array[k][14]}},A_array[k]};
                B_test = {{17{B_array[k][14]}},B_array[k]};
                #1;
        
                $display("Addition -- Testcase:%d",k);
        
                if(C_array[k] === `C) begin
                    $display("Addition result is correct! %d == %d",C_array[k],`C);
                    GRADE = GRADE + ADD_SUM_RIGHT; #1;
                end
                else begin
                    $display("Addition result is wrong! %d != %d",C_array[k],`C);
                    #1;
                end
        
                if(((C_array[k] > _MAX_VAL) | (C_array[k] < _MIN_VAL)) & (`V === V_array[k])) begin
                    $display("Overflow result is correct! %d == %d\n",V_array[k],`V);
                    GRADE = GRADE + ADD_OVF_RIGHT; #1;
                end
                else if(((C_array[k] <= _MAX_VAL) | (C_array[k] >= _MIN_VAL)) & (`V === V_array[k])) begin
                    $display("Overflow result is correct! %d == %d\n",V_array[k],`V);
                    GRADE = GRADE + ADD_OVF_RIGHT; #1;
                end
                else begin
                    $display("Overflow result is wrong! %d != %d\n",V_array[k],`V);
                    #1;
                end
                #6;
            end
            #10;
        
            // subtraction
            for(k=8; k<16; k=k+1) begin
                `A = A_array[k];
                `B = B_array[k];
                `T = 1'b1;
                #1;
        
                // check result
                A_test = {{17{A_array[k][14]}},A_array[k]};
                B_test = {{17{B_array[k][14]}},B_array[k]};
                #1;
        
                $display("Subtraction -- Testcase:%d",k);
        
                if(C_array[k] === `C) begin
                    $display("Subtraction result is correct! %d == %d",C_array[k],`C);
                    GRADE = GRADE + SUB_SUM_RIGHT; #1;
                end
                else begin
                    $display("Subtraction result is wrong! %d != %d",C_array[k],`C);
                    #1;
                end
        
                if(((C_array[k] > _MAX_VAL) | (C_array[k] < _MIN_VAL)) & (`V === V_array[k])) begin
                    $display("Overflow result is correct! %d == %d\n",V_array[k],`V);
                    GRADE = GRADE + SUB_OVF_RIGHT; #1;
                end
                else if(((C_array[k] <= _MAX_VAL) | (C_array[k] >= _MIN_VAL)) & (`V === V_array[k])) begin
                    $display("Overflow result is correct! %d == %d\n",V_array[k],`V);
                    GRADE = GRADE + SUB_OVF_RIGHT; #1;
                end
                else begin
                    $display("Overflow result is wrong! %d != %d\n",V_array[k],`V);
                    #1;
                end
                #6;
            end
        
            $display("Your simulation grade is %d out of %d!\n",(GRADE>>1),(TOTAL_GRADE>>1));
            #1;
            $finish;
        end
        
        // ------------------------------------------------------------------------------------------------------------------
        // ------------------------------------------------------------------------------------------------------------------

endmodule
