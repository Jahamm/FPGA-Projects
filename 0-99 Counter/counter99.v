`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/22/2023 09:15:32 PM
// Design Name: 
// Module Name: counter99
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


module counter99(
                input clk,
                input en,
                input rst,
                output [3:0] q1,
                output [3:0] q10   
                );
    reg [3:0] ones_place = 4'b0000;
    reg [3:0] tens_place = 4'b0000;
    
    always@(posedge clk)
    begin:MAIN_LOOP
        if(ones_place == 9)
        begin:EN_ACT2
            if(en == 1)
            tens_place <= tens_place + 1;
        end
        if(ones_place >= 9 || rst == 1)
            ones_place <= 4'b0000;
        else
        begin:EN_ACT
            if(en == 1)
            ones_place <= ones_place + 1;
        end
        if((tens_place == 9 && ones_place == 9) || rst == 1)
            tens_place <= 4'b0000;         

    end
    
assign q1 = ones_place;
assign q10 = tens_place; 
    
endmodule
