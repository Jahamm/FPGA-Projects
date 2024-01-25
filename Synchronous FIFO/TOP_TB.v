`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/06/2023 04:22:53 PM
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

reg reset;
reg write_en;
reg read_en;
reg nclk;
wire [2:0] refCount;
wire f;
wire e;
wire [7:0] AN;
wire [6:0] port_cc;
wire [7:0] out_data;
reg [7:0] in_data;
wire [3:0] to_ssd;

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
                    
                    
initial
begin
    nclk = 1;
    write_en = 0;
    read_en = 0;
    reset = 0;
    in_data = 8'b10100011;
    forever #5 nclk = ~nclk;
end

initial
begin
    #30 write_en = 1;
    #5 write_en = 0;
    #5 read_en = 1;
    #20 in_data = 8'b10110110;
    #5 write_en = 1;
    #10 write_en = 0;
    #30 in_data = 8'b10000011;
    #30 write_en = 1;
    #30 read_en = 1;
    #10 write_en = 0;
    #20 read_en = 0;
    #50 reset = 1;
end
endmodule
