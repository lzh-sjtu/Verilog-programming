module comb_dataflow(output Y, input A, B, C, D);

    wire w11;
    wire w21, w22;
    wire w31;

    assign w11 = ~D,
           w21 = A | D,
           w22 = B & C &w11,
           w31 = ~w21,
           Y = w31 & w22;

endmodule