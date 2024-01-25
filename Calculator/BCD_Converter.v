`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/04/2023 01:46:41 PM
// Design Name: 
// Module Name: BCD_Converter
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


module BCD_Converter(
                    input [3:0] in,
                    input sign,
                    output [3:0] out,
                    output [3:0] signOut
    );
    
    reg [3:0] tmp;
    reg [3:0] signtmp;
    
    always@(in)
    begin

            if(in >= 10)
                tmp <= in + 4'b0110;
            else
                tmp <= in;
                
    if(sign == 1) signtmp = 4'b1111;
    if(sign == 0) signtmp = 4'b1110; 
    end
    
    assign out = tmp;
    assign signOut = signtmp;
    
endmodule
