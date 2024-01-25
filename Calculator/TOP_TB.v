`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/06/2023 04:55:19 PM
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


module TOP_TB(
    );
reg [3:0] inputA;
reg [3:0] inputB;
reg signAb;
reg signBb;
reg [1:0] op;
reg nclk;
reg [2:0] refCount;
wire [7:0] AN;
wire [6:0] port_cc;
wire [3:0] inA_Temp;
    wire [3:0] inB_Temp;
    wire [3:0] inQ_Temp;
    wire [3:0] ASi_dis;
    wire [3:0] BSi_dis;
    wire [3:0] QSi_dis;
    wire nclk;

    wire [3:0] sel_dis;
    wire [3:0] signQ_Out;
    reg [3:0] blank = 4'b1010;
    
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
                    
                    
initial 
begin
    inputA = 4'b1001;
    signAb = 0;
    signBb = 0;
    inputB = 4'b0101;
    op = 2'b01;
    forever #5 nclk = ~nclk;
end

initial
begin
    #50 inputA = 4'b0110;
end
endmodule
