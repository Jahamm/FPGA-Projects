`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/10/2023 07:43:05 PM
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
            input ClkPort,
            input reset,
            output hSync, 
            output vSync, 
            output [3:0] vgaR, 
            output [3:0] vgaG, 
            output [3:0] vgaB
    );
    
// Clock Signals
wire ClkPort;
wire b;
wire board_clk;
reg [32:0] DIV_CLK;    
wire [9:0] vc;
wire [9:0] hc;
wire [11:0] rgb;
wire [11:0] background;

assign vgaR = rgb[11 : 8];
assign vgaG = rgb[7  : 4];
assign vgaB = rgb[3  : 0];
assign vga_clk = DIV_CLK[18];

// Clock Division
BUFGP BUFGP1 (board_clk, ClkPort);
always @(posedge board_clk, posedge reset)
begin
	if (reset) begin
		DIV_CLK <= 0;
	end
	else begin
		DIV_CLK <= DIV_CLK + 1'b1;
	end
end
   
    Display_Controller dc(
                    .clk(board_clk), 
                    .hSync(hSync), 
                    .vSync(vSync), 
                    .bright(b), 
                    .hCount(hc), 
                    .vCount(vc)
                    );
                    
        Display sc(
                    .Clk(vga_clk), 
                    .Bright(b),  
                    .hCount(hc), 
                    .vCount(vc), 
                    .rgb(rgb), 
                    .background(background)
                    );
    
endmodule
