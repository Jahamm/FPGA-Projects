`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/23/2023 01:54:27 PM
// Design Name: 
// Module Name: BCD_control
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



module BCD_control(
input [3:0] digit1, // right digit // ones
input [3:0] digit2, // left digit // tens
input refreshcounter,
output reg [3:0] ONE_DIGIT = 0 // choose which input digit is to be displayed
    );
    
always@(refreshcounter)
    begin
        case(refreshcounter)
            1'd0: ONE_DIGIT = digit1; // right // ones place on
            1'd1: ONE_DIGIT = digit2; // left // tens place on
        endcase
    end
endmodule

