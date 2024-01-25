`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/23/2023 01:58:48 PM
// Design Name: 
// Module Name: anode_control
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


module anode_control(
                    input refreshcounter,
                    output reg [7:0] anode = 0
                    );
    
always@(refreshcounter)
    begin
        case(refreshcounter)
            1'b0: anode = 8'b11111110;
            1'b1: anode = 8'b11111101;
        endcase
    end
endmodule
