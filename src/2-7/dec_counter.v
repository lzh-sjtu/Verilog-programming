module dec_counter(output reg [3:0] count, input clk, reset);

    always @(posedge clk) begin
        if(reset)
            count <= 4'd0;
        else if(count == 4'd10)
            count <= 4'd0;
        else
            count <= count + 4'd1;    
    end

endmodule