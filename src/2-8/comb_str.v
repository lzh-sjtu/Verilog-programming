`timescale 1ns/1ns

module comb_str(output y, input sel, A, B, C, D);

    wire w0, w1;

    nand #3 u1(w0, A, B),
         #4 u2(w1, C, D);

    bufif0 u3(y, w0, sel);
    bufif1 u4(y, w1, sel);
    
endmodule