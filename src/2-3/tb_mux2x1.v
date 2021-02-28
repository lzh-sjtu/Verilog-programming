`timescale 10ns/1ns 
`include "mux2x1.v"

module tb_mux2x1;

    wire p_out;
    reg p_sel;
    reg [1:0] p_in;

    mux2x1 mx2(.dout(p_out), .sel(p_sel), .din(p_in));

    initial begin
        p_sel = 0;
        p_in = 2'b00;
        #1 p_in = 2'b01;
        #1 p_in = 2'b10;
        #1 p_in = 2'b11;
        #5;
        p_sel = 1;
        p_in = 2'b00;
        #1 p_in = 2'b01;
        #1 p_in = 2'b10;
        #1 p_in = 2'b11;
    end

    initial begin
        $monitor("time=%4t, sel=%b, in=%b, out=%b", $time, p_sel, p_in, p_out);
    end

endmodule