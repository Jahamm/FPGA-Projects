`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/06/2023 03:06:18 PM
// Design Name: 
// Module Name: refreshcounter
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


module refreshcounter(
                    input refresh_clock,
                    output reg [2:0] refreshcounter = 0 // 0 to 7 so it's for eight displays
                    );
    
    always@(posedge refresh_clock) refreshcounter <= refreshcounter + 1;
endmodule
