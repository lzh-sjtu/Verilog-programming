module comb_str(output Y, input A, B, C, D);

    wire w11;
    wire w21, w22;
    wire w31;
    wire w41;

    not u1(w11, D),
        u2(w31, w21);

    or u3(w21, A, D);

    and u4(w22, B, C, w11),
        u5(w41, w31, w22);

    buf u6(Y, w41);
        
endmodule