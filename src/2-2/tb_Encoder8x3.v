`timescale 10ns/1ns 
`include "Encoder8x3.v"

module tb_Encoder8x3;

    wire [2:0] p_code;
    reg [7:0] p_data;
    integer i;

    Encoder8x3 encoder(.code(p_code), .data(p_data));

    initial begin
        p_data = 8'b0000_0001;
        for(i=1; i<=7; i=i+1)
        #5 p_data = p_data << 1;
    end

    initial begin
        $monitor("time=%4t, data=%b, code=%d", $time, p_data, p_code);
    end

endmodule