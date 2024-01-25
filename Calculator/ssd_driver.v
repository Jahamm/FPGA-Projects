module ssd_driver(
                    input[3:0] ssd_driver_port_inp,
                    output[6:0] ssd_driver_port_cc
                 );
                 
reg [6:0] ssd_driver_tmp_cc;
wire[3:0] ssd_driver_digit;
assign ssd_driver_digit = ssd_driver_port_inp;
                 
always@(ssd_driver_digit)
    begin:SEG_ENC
    case(ssd_driver_digit)
        4'h0: ssd_driver_tmp_cc = 7'b0000001 ;
        4'h1: ssd_driver_tmp_cc = 7'b1001111 ;
        4'h2: ssd_driver_tmp_cc = 7'b0010010 ;
        4'h3: ssd_driver_tmp_cc = 7'b0000110 ;
        4'h4: ssd_driver_tmp_cc = 7'b1001100 ;
        4'h5: ssd_driver_tmp_cc = 7'b0100100 ;
        4'h6: ssd_driver_tmp_cc = 7'b0100000 ;
        4'h7: ssd_driver_tmp_cc = 7'b0001111 ;
        4'h8: ssd_driver_tmp_cc = 7'b0000000 ;
        4'h9: ssd_driver_tmp_cc = 7'b0000100 ; 
        4'hA: ssd_driver_tmp_cc = 7'b1111111 ; // blank display
        4'hB: ssd_driver_tmp_cc = 7'b1100000 ; // Shouldn't be used
        4'hC: ssd_driver_tmp_cc = 7'b0110001 ; // Shouldn't be used
        4'hD: ssd_driver_tmp_cc = 7'b1000010 ; // Shouldn't be used
        4'hE: ssd_driver_tmp_cc = 7'b0111010 ; // Positive sign
        4'hF: ssd_driver_tmp_cc = 7'b1011010 ; // Negative sign
                            
        default: ssd_driver_tmp_cc = 7'h0;
    endcase
end
        assign ssd_driver_port_cc = ssd_driver_tmp_cc;
                             
endmodule