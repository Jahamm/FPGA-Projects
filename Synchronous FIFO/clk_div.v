module clk_div(
clock_in,clock_out
    );
input clock_in;
output reg clock_out; 
reg[31:0] counter=32'd0;
parameter DIVISOR = 32'd100000; //1Mhz
// You will modify the DIVISOR parameter value to 28'd50.000.000
// Then the frequency of the output clk_out = 100Mhz/50.000.000 = 2Hz
always @(posedge clock_in)
begin
 counter <= counter + 32'd1;
 if(counter>=(DIVISOR-1))
  counter <= 32'd0;
 clock_out <= (counter<DIVISOR/2)?1'b1:1'b0;
end
endmodule