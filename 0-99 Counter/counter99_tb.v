`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/22/2023 10:09:27 PM
// Design Name: 
// Module Name: counter99_tb
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
`define clock_period 10

module counter99_tb(
    );
    
    reg clk_tb = 0;
    reg en_tb = 1;
    reg rst_tb = 0;
    wire [3:0] ones_tb;
    wire [3:0] tens_tb;
    
counter99 CHP(
              .clk(clk_tb),
              .en(en_tb),
              .rst(rst_tb),
              .q1(ones_tb),
              .q10(tens_tb)   
            );

always@(posedge clk_tb)
begin
    #900 rst_tb = 1;
    #5 rst_tb = 0;
end

always #(`clock_period/4) clk_tb = ~clk_tb;

           
endmodule
