`include "mux2x1.v"

module mux4x1(output dout, input [1:0] sel, input [3:0] din);

    wire w0, w1;
    mux2x1 m0(.dout(w0), .sel(sel[0]), .din(din[1:0])),
           m1(.dout(w1), .sel(sel[0]), .din(din[3:2])),
           m2(.dout(dout), .sel(sel[1]), .din({w1, w0}));
           
endmodule