`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/10/2023 10:46:25 PM
// Design Name: 
// Module Name: top_tb
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

module top_tb();

    reg Clk_tb;
	reg Bright_tb;
	reg Reset_tb;
	
	reg [9:0] hCount_tb, vCount_tb;

	wire [11:0] rgb_tb;
	wire [11:0] background_tb;
	reg hSync_tb;
	reg vSync_tb;
	
	initial
        begin
            Clk_tb = 1;
        end
    always
        begin
            #( `clock_period/2) Clk_tb = ~Clk_tb;
        end
        
Display CHP(
	.Clk(Clk_tb),
	.Bright(Bright_tb),
	.hCount(hCount_tb), 
	.vCount(vCount_tb),
	.rgb(rgb_tb),
	.background(background_tb)
    );
   
   
   initial
   begin
   Bright_tb = 0;
   hSync_tb = 0;
   vSync_tb = 0;
   Reset_tb = 1;
   hCount_tb = 270;
   vCount_tb = 150;
   #( 3 * `clock_period)
   Reset_tb = 0;
   #( 3 * `clock_period)
   while(vCount_tb != 524)
   begin
   if (hCount_tb < 10'd799)
			begin
			hCount_tb <= hCount_tb + 1;
			end
		else if (vCount_tb < 10'd524)
			begin
			hCount_tb <= 0;
			vCount_tb <= vCount_tb + 1;
			end
   if(hCount_tb > 10'd143 && hCount_tb < 10'd783 && vCount_tb > 10'd34 && vCount_tb < 10'd514)
			Bright_tb <= 1;
		else begin
			Bright_tb <= 0; 
			end
   if(hCount_tb < 96) hSync_tb = 0;
   else hSync_tb = 1;
   if(vCount_tb < 2) vSync_tb = 0;
   else vSync_tb = 1;
   #( 1 * `clock_period);
   end
   $finish;
   end
endmodule
