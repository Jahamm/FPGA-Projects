`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/04/2023 05:41:17 PM
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
            input [3:0] inputA,
            input [3:0] inputB,
            input signAb,
            input signBb,
            input [1:0] op,
            output [7:0] AN,
            output [6:0] port_cc
    );
    
    
    wire [3:0] inA_Temp;
    wire [3:0] inB_Temp;
    wire [3:0] inQ_Temp;
    wire [3:0] ASi_dis;
    wire [3:0] BSi_dis;
    wire [3:0] QSi_dis;
    wire nclk;
    wire [2:0] refCount;
    wire [3:0] sel_dis;
    wire [3:0] signQ_Out;
    reg [3:0] blank = 4'b1010;
    
    clk_div CLKDIV(
                    .clock_in(clock),
                    .clock_out(nclk)
                    );
                    
    refreshcounter REF(
                    .refresh_clock(nclk),
                    .refreshcounter(refCount)
                    );
                  
    Anode_Control ANC(
                    .refreshcounter(refCount),
                    .anode(AN)
                    );
                    
    BCD_Control BCDCON(
                        .digit1(inQ_Temp), 
                        .digit2(QSi_dis), 
                        .digit3(blank),
                        .digit4(inB_Temp),
                        .digit5(BSi_dis),
                        .digit6(blank),
                        .digit7(inA_Temp),
                        .digit8(ASi_dis),
                        .refreshcounter(refCount),
                        .ONE_DIGIT(sel_dis)
                        );
                        
    ssd_driver SSD(
                   .ssd_driver_port_inp(sel_dis),
                    .ssd_driver_port_cc(port_cc)
                 );
    
BCD_Converter CONVA (
                    .in(inputA),
                    .sign(signAb),
                    .out(inA_Temp),
                    .signOut(ASi_dis)
                    );
                        
BCD_Converter CONVB (
                    .in(inputB),
                    .sign(signBb),
                    .out(inB_Temp),
                    .signOut(BSi_dis)
                    );
                        
    calculator CALC (
                    .signA(signAb), 
                    .signB(signBb),
                    .A(inA_Temp),
                    .B(inB_Temp),
                    .sel(op),
                    .signQ(QSi_dis),
                    .Q(inQ_Temp)
                    );
endmodule
