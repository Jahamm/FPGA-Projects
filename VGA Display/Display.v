`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/10/2023 07:13:04 PM
// Design Name: 
// Module Name: Display
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


module Display(
	input Clk,
	input Bright,
	input [9:0] hCount, vCount,
	output reg [11:0] rgb,
	output reg [11:0] background
    );
    
    // Color Parameter references 
	parameter  	RED   = 12'b1111_0000_0000;
	parameter	YELLOW = 12'b1111_1111_0000;
	parameter   WHITE = 12'b1111_1111_1111;
	parameter	BLACK = 12'b0000_0000_0000;
	parameter	GREEN = 12'b0000_1111_0000;
	parameter   BLUE = 12'b0000_0000_1111;
	parameter   PURPLE = 12'b1111_0000_1111;
	
	//wire block_fill;
	
	always@ (*) begin
    	if(~Bright )	//force black if not inside the display area
			rgb = BLACK;
			else if(h1_fill || h2_fill || h3_fill) rgb = BLUE;
			else if(e1_fill || e2_fill || e3_fill || e4_fill) rgb = GREEN;
			else if(l1_fill || l2_fill) rgb = RED;
			else if(l3_fill || l4_fill) rgb = YELLOW;
			else if(o1_fill || o2_fill || o3_fill || o4_fill) rgb = PURPLE;
			//else if(block2_fill || floor) rgb = GREEN;
			//else if(block3_fill) rgb = RED;
			//else if (sun1) rgb = YELLOW;
			else rgb = WHITE;
	end

//Top Left (144,35) bottom right corner ~(783,515).  
assign h1_fill = (vCount>=(150) && vCount<=(240) && hCount>=(270) && hCount<=(290));
assign h2_fill = (vCount>=(185) && vCount<=(205) && hCount>=(290) && hCount<=(320));
assign h3_fill = (vCount>=(150) && vCount<=(240) && hCount>=(320) && hCount<=(340));

assign e1_fill = (vCount>=(150) && vCount<=(240) && hCount>=(360) && hCount<=(380));
assign e2_fill = (vCount>=(150) && vCount<=(170) && hCount>=(380) && hCount<=(410));
assign e3_fill = (vCount>=(185) && vCount<=(205) && hCount>=(380) && hCount<=(410));
assign e4_fill = (vCount>=(220) && vCount<=(240) && hCount>=(380) && hCount<=(410));

assign l1_fill = (vCount>=(150) && vCount<=(240) && hCount>=(430) && hCount<=(450));
assign l2_fill = (vCount>=(220) && vCount<=(240) && hCount>=(450) && hCount<=(480));

assign l3_fill = (vCount>=(150) && vCount<=(240) && hCount>=(500) && hCount<=(520));
assign l4_fill = (vCount>=(220) && vCount<=(240) && hCount>=(520) && hCount<=(550));

assign o1_fill = (vCount>=(150) && vCount<=(170) && hCount>=(580) && hCount<=(630));
assign o2_fill = (vCount>=(160) && vCount<=(230) && hCount>=(570) && hCount<=(590));
assign o3_fill = (vCount>=(160) && vCount<=(230) && hCount>=(620) && hCount<=(640));
assign o4_fill = (vCount>=(220) && vCount<=(240) && hCount>=(580) && hCount<=(630));


endmodule

//assign block2_fill = (vCount>=(66) && vCount<=(96) && hCount>=(185) && hCount<=(225));	
//assign block3_fill = (vCount>=(97) && vCount<=(127) && hCount>=(226) && hCount<=(266));	    
//assign floor = (vCount>=(455) && vCount<=(515) && hCount>=(144) && hCount<=(783));	    
//assign sun1 = (vCount>=(35) && vCount<=(155) && hCount>=(623) && hCount<=(783));
//assign sun2 = (vCount>=(35) && vCount<=(95) && hCount>=(583) && hCount<=(623));

            //s_xpos <= (125 % 16)*40 + 144 + 15;
			//s_ypos <= (125 / 16)*30 + 35 + 15;