`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/10/2023 07:09:52 PM
// Design Name: 
// Module Name: Display_Controller
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


module Display_Controller(
	input clk,
	output hSync, vSync,
	output reg bright,
	output reg [9:0] hCount, // Can be [9:0] since 10 bits (1024 max) would cover 640 x 480 for VGA
	output reg [9:0] vCount 
	);
	
	reg pulse;
	reg clk25;
	
	initial begin // Set all of them initially to 0
		clk25 = 0;
		pulse = 0;
	end
	
	// Makes clock without clock wizard
	always @(posedge clk)
		pulse = ~pulse;	// Divides 100Mhz System Clock in half
	always @(posedge pulse)
		clk25 = ~clk25; // Divides pulse in half, resulting in 25Mhz frequency
	


	// Goes through every pixel from left to right, top to bottom of the screen	
	always @ (posedge clk25)
		begin
		if (hCount < 10'd799) // 640 (Active Pixels) + 160 (Blanking Total)
			begin
			hCount <= hCount + 1;
			end
		else if (vCount < 10'd524) // 480 (Active Lines) + 45 (Blanking Total)
			begin
			hCount <= 0;
			vCount <= vCount + 1;
			end
		else
			begin
			hCount <= 0;
			vCount <= 0;
			end
		end
	// checks current position with Sync Width	
	assign hSync = (hCount < 96) ? 0:1; 
	assign vSync = (vCount < 2) ? 0:1;
		
	// Accounts for Blanking total (back and front porch + sync) and makes the active pixels... well, active.
	always @(posedge clk25)
		begin
		if(hCount > 10'd143 && hCount < 10'd783 && vCount > 10'd34 && vCount < 10'd514)
			bright <= 1;
		else
			bright <= 0;
		end	
		
endmodule
