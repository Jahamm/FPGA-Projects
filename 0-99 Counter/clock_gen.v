`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/22/2023 09:11:13 PM
// Design Name: 
// Module Name: clock_gen
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


module clock_gen #(parameter SIZE = 32) 
            (
            input fsys,
    		input clk_gen_rst,
    		input [$clog2(SIZE)-1:0] clk_gen_sc,
    		output clk_gen_out
            );
            
	reg [SIZE-1:0] clk_gen_tmp;
	always@(posedge fsys)
	      begin:CLK_GEN
		if(clk_gen_rst)
		   clk_gen_tmp <= 0;
		else
		   clk_gen_tmp <= clk_gen_tmp + 1;
	      end
       assign clk_gen_out = clk_gen_tmp[clk_gen_sc];	      	
endmodule
