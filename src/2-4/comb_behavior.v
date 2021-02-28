module comb_behavior(output reg Y, input A, B, C, D);

    reg r11;
    reg r21, r22;
    reg r31;

    always @(*) begin
        r11 = ~D;
        r21 = A | D;
        r22 = B & C & r11;
        r31 = ~r21;
        Y = w31 & w22;
    end

endmodule