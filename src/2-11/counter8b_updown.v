module counter8b_updown(output reg [7:0] count, input clk, reset, dir);

    always @(posedge clk, negedge reset) begin
        if(~reset)
            count <= 8'b0;
        else begin
            if(dir) begin
                if(count == 8'b1111_1111)
                    count <= 8'b0;
                else
                    count <= count + 1'b1;
            end
            else begin
                if(count == 8'b0)
                    count <= 8'b1111_1111;
                else
                    count <= count - 1'b1;
            end
        end 
    end
    
endmodule