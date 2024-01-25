`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/23/2023 06:17:20 PM
// Design Name: 
// Module Name: anode_control_tb
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


module anode_control_tb(
    );
    reg refreshcounter_tb = 0;
    wire [7:0] anode_tb;
    
anode_control CHP(
                    .refreshcounter(refreshcounter_tb),
                    .anode(anode_tb)
                    );

always #5 refreshcounter_tb = ~refreshcounter_tb;
                    
endmodule
