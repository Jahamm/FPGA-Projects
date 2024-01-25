`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/23/2023 01:50:34 PM
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
                    output reg refreshcounter = 0 // 0 to 1 so it's for two displays
                    );
    
    always@(posedge refresh_clock) refreshcounter <= refreshcounter + 1;
endmodule
