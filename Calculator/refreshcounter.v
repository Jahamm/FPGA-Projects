module refreshcounter(
                    input refresh_clock,
                    output reg [2:0] refreshcounter = 0 // 0 to 7 so it's for eight displays
                    );
    
    always@(posedge refresh_clock) refreshcounter <= refreshcounter + 1;
endmodule