`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/06/2023 02:19:11 AM
// Design Name: 
// Module Name: calculator_tb
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


module calculator_tb(
    );

reg signA_tb;
reg signB_tb;
reg [3:0] A_tb;
reg [3:0] B_tb;
reg [1:0] sel_tb;
wire [3:0] signQ_tb;
wire [3:0] Q_tb;
    
calculator CALC(
                    .signA(signA_tb), 
                    .signB(signB_tb),
                    .A(A_tb),
                    .B(B_tb),
                    .sel(sel_tb),
                    .signQ(signQ_tb), 
                    .Q(Q_tb)
                    );
                    
initial
begin
    signA_tb = 1;
    signB_tb = 0;
    A_tb = 4'b0101;
    B_tb = 4'b0111;
    sel_tb = 2'b10;
    
end                    

endmodule
