`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/23/2023 02:26:45 PM
// Design Name: 
// Module Name: TOP_TB
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

module TOP_TB(
    );
  
    reg clk_tb = 0;
    reg en_tb = 1;
    reg rst_tb = 0;
    reg refreshcounter_tb = 0;
    wire [3:0] q1_tb;
    wire [3:0] q10_tb;
    wire [3:0] ONE_DIGIT_TB;
    wire [7:0] anode_tb;
    wire [6:0] port_cc_tb;
    
counter99 CHP(
              .clk(clk_tb),
              .en(en_tb),
              .rst(rst_tb),
              .q1(q1_tb),
              .q10(q10_tb)   
            );

BCD_control CHP2(
            .digit1(q1_tb),
            .digit2(q10_tb),
            .refreshcounter(refreshcounter_tb),
            .ONE_DIGIT(ONE_DIGIT_TB)
    );
    
anode_control CHP3(
                    .refreshcounter(refreshcounter_tb),
                    .anode(anode_tb)
                    );
                    
ssd_driver CHP4(
           .ssd_driver_port_inp(ONE_DIGIT_TB),
           .ssd_driver_port_cc(port_cc_tb)
                 );
                    
always@(posedge clk_tb)
begin
    #900 rst_tb = 1;
    #10 rst_tb = 0;
end

always #(`clock_period/2) clk_tb = ~clk_tb;



always #(`clock_period/2) refreshcounter_tb = ~refreshcounter_tb;
           
endmodule
    
    
/*
    reg  clock_tb = 0;
    reg reset_tb = 0;
    reg enable_tb = 1;
    wire [7:0] an_tb;
    wire [6:0] port_cc_tb;
    
    reg gen_rst_tb = 0;
    reg [4:0] gen_sc_tb = 5'b01111;
    
TOP CHP(
        .clock(clock_tb),
        .reset(reset_tb),
        .enable(enable_tb),
        .an(an_tb),
        .port_cc(port_cc_tb),
        
        .gen_rst(gen_rst_tb),
        .gen_sc(gen_sc_tb) 
    );
    
    always #5 clock_tb = ~clock_tb;
    
endmodule 
*/
