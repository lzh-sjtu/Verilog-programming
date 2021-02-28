module ones_count(output reg [3:0] count, input [7:0] dat_in);

    integer k;

    always @(*) begin
        count = 4'd0;
        for(k=0; k<=7; k=k+1)
            count = count + dat_in[k];
    end

endmodule