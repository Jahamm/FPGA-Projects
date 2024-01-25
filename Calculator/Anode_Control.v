module Anode_Control(
                    input [2:0] refreshcounter,
                    output reg [7:0] anode = 0
                    );
    
always@(refreshcounter)
    begin
        case(refreshcounter)
            3'b000: anode = 8'b11111110;    // Display 1 ON
            3'b001: anode = 8'b11111101;    // Display 2 ON
            3'b010: anode = 8'b11111011;    // Display 3 ON
            3'b011: anode = 8'b11110111;    // Display 4 ON
            3'b100: anode = 8'b11101111;    // Display 5 ON
            3'b101: anode = 8'b11011111;    // Display 6 ON
            3'b110: anode = 8'b10111111;    // Display 7 ON
            3'b111: anode = 8'b01111111;    // Display 8 ON
        endcase
    end
endmodule