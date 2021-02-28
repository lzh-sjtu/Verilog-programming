module mux2x1(output dout, input sel, input [1:0] din);

    bufif0 u0(dout, din[0], sel);
    bufif1 u1(dout, din[1], sel);

endmodule