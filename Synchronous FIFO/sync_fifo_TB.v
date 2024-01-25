`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/06/2023 02:20:02 PM
// Design Name: 
// Module Name: sync_fifo_TB
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


module testbench;

  // Parameters
  parameter DEPTH = 8;
  parameter DATA_WIDTH = 8;
  
  // Signals
  reg clk;
  reg rst_n;
  reg w_en;
  reg r_en;
  reg [DATA_WIDTH-1:0] data_in;
  wire [DATA_WIDTH-1:0] data_out;
  wire full, empty;

  // Instantiate the synchronous_fifo module
  synchronous_fifo #(
    .DEPTH(DEPTH),
    .DATA_WIDTH(DATA_WIDTH)
  ) fifo_inst (
    .clk(clk),
    .rst_n(rst_n),
    .w_en(w_en),
    .r_en(r_en),
    .data_in(data_in),
    .data_out(data_out),
    .full(full),
    .empty(empty)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  // Test stimulus
  initial begin
    // Initialize signals
    rst_n = 0;
    w_en = 0;
    r_en = 0;
    data_in = 8'h00;

    // Apply reset
    #10 rst_n = 1;

    // Write data to FIFO
    w_en = 1;
    data_in = 8'h01;
    #10;
    data_in = 8'h02;
    #10;
    data_in = 8'h03;
    #10;
    w_en = 0;

    // Read data from FIFO
    r_en = 1;
    #10;
    r_en = 0;

    // Add more test cases as needed

    // End simulation after a period
    #100 $finish;
  end

  // Assertions
  // Add assertions to check the behavior of your FIFO

endmodule


