`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/22/2023 09:15:04 PM
// Design Name: 
// Module Name: TOP
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


module TOP(
        input clock,
        input reset,
        input enable,
        output wire [7:0] an,
        output [6:0] port_cc,
        
        input gen_rst,
        input [4:0] gen_sc 
    );
    
    wire nclk;
    wire nclk2;
    wire refCount;
    wire [3:0] to_Display;
    wire [3:0] count1;
    wire [3:0] count2;
    
//////////////////////////////////////////////////////
clk_div clock_div(
                .clock_in(clock),
                .clock_out(nclk)
                );
                
clock_gen CLK
            (
            .fsys(clock),
    		.clk_gen_rst(gen_rst),
    		.clk_gen_sc(gen_sc),
    		.clk_gen_out(nclk2)
            );
            
refreshcounter REFRESH(
                    .refresh_clock(nclk),
                    .refreshcounter(refCount)
                    );
                    
//////////////////////////////////////////////////////
//Counter
counter99 CHP(
              .clk(nclk2),
              .en(enable),
              .rst(reset),
              .q1(count1),
              .q10(count2)   
            );                 
//////////////////////////////////////////////////////
anode_control AN_CON(
                    .refreshcounter(refCount),
                    .anode(an)
                    );  
                  
BCD_control BCD_Con(
                    .digit1(count1),
                    .digit2(count2),
                    .refreshcounter(refCount),
                    .ONE_DIGIT(to_Display)
    );
   
///////////////////////////////////////////////////////////////
ssd_driver SSD(
            .ssd_driver_port_inp(to_Display),
            .ssd_driver_port_cc(port_cc)
                 ); 
    
endmodule
