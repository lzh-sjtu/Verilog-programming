module shift_counter(output reg [7:0] count, input clk, reset);

    reg [1:0] status;
    reg dir;

    always @(posedge clk) begin
        if(~reset) begin
            count <= 8'b1;
            status <= 2'b00;
            dir <= 1'b1;           
        end
        else begin
            case(status)
                2'b00: status <= 2'b01;
                2'b01: status <= 2'b10;
                2'b10: status <= 2'b11;
                2'b11: begin
                    if(dir) begin
                        if(count == 8'b1000_0000) begin
                            count <= count >> 1;
                            dir <= 1'b0;
                        end
                        else
                            count <= count << 1;
                    end 
                    else begin
                        if(count == 8'b1) begin
                            status <= 2'b00;
                            dir <= 1'b1;
                        end
                        else
                            count <= count >> 1;         
                    end
                end
                default: begin
                    count <= 8'b1;
                    status <= 2'b00;
                    dir <= 1'b1;                   
                end
            endcase    
        end         
    end

endmodule