`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/06/2023 02:55:50 PM
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
            input write_en,
            input read_en,
            input [7:0] in_data,
            output f,
            output e,
            output [7:0] AN,
            output [6:0] port_cc
    );
    
    wire nclk;
    wire tempclk;
    wire [2:0] refCount;
    wire [3:0] to_ssd;
    wire [7:0] out_data;
    wire [4:0] clk_sp;
    wire clk_rst;
    wire und;
    wire thres;
    wire over;
    assign clk_rst = 0;
    assign clk_sp = 5'b11001;

    
    clk_gen #(.SIZE(32)) CH1
    (
            .fsys(clock),
            .clk_gen_rst(clk_rst),
            .clk_gen_sc(clk_sp),
            .clk_gen_out(tempclk)
    ); 
    
    clk_div CLK(
            .clock_in(clock),
            .clock_out(nclk)
            );
            
refreshcounter REF(
               .refresh_clock(nclk),
               .refreshcounter(refCount)
               );
               
Anode_Control anode(
              .refreshcounter(refCount),
              .anode(AN)
              );
              
BCD_Control BCD(
                .digit1(out_data[3:0]), 
                .digit2(out_data[7:4]), 
                .digit3(),
                .digit4(),
                .digit5(),
                .digit6(),
                .digit7(in_data[3:0]),
                .digit8(in_data[7:4]),
                .refreshcounter(refCount),
                .ONE_DIGIT(to_ssd)
                );
           
ssd_driver SSD(
                .ssd_driver_port_inp(to_ssd),
                .ssd_driver_port_cc(port_cc)
                );
    
    
synchronous_fifo CHP(
                    .data_out(out_data),
                    .fifo_full(f), 
                    .fifo_empty(e), 
                    .fifo_threshold(thres), 
                    .fifo_overflow(over), 
                    .fifo_underflow(und),
                    .clk(nclk),
                    .rst_n(reset), 
                    .wr(write_en), 
                    .rd(read_en), 
                    .data_in(in_data)
                    );    
    /*
synchronous_fifo #(.DEPTH(8), .DATA_WIDTH(8)) CHP  
(
  .clk(tempclk), 
  .rst_n(reset),
  .w_en(write_en), 
  .r_en(read_en),
  .data_in(in_data),
  .data_out(out_data),
  .full(f),
  .empty(e)
);
*/

endmodule
