`timescale 10ns/1ns 

module wavegen;

    reg wave;

    initial begin
        wave = 1'b0;
        #2 wave = 1'b1;
        #1 wave = 1'b0;
        #9 wave = 1'b1;
        #10 wave = 1'b0;
        #2 wave = 1'b1;
        #3 wave = 1'b0;
        #5 wave = 1'b1;
    end

endmodule