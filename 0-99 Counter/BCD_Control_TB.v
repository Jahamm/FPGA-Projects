`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/23/2023 06:00:25 PM
// Design Name: 
// Module Name: BCD_Control_TB
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


module BCD_Control_TB(
    );
    reg [3:0] digit1_tb = 4'b1001;
    reg [3:0] digit2_tb= 4'b0110;
    reg refreshcounter_tb = 0;
    wire [3:0] ONE_DIGIT_TB;
    
BCD_control CHP(
            .digit1(digit1_tb),
            .digit2(digit2_tb),
            .refreshcounter(refreshcounter_tb),
            .ONE_DIGIT(ONE_DIGIT_TB)
    );

    always #5 refreshcounter_tb = ~refreshcounter_tb;
    

endmodule
