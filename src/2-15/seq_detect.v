module seq_detect(output reg flag, input din, clk, rst_n);

    reg [6:0] status;
    parameter IDLE = 7'b000_0001,
                A1 = 7'b000_0010,
                A2 = 7'b000_0100,
                A3 = 7'b000_1000,
                B1 = 7'b001_0000,
                B2 = 7'b010_0000,
                B3 = 7'b100_0000;

    always @(negedge clk) begin
        if(~rst_n) begin
            flag <= 1'b0;
            status <= IDLE;
        end 
        else begin
            case(status)
                IDLE: if(din) begin flag <= 1'b0; status <= B1; end
                      else begin flag <= 1'b0; status <= A1; end
                A1: if(din) begin flag <= 1'b0; status <= A2; end
                    else begin flag <= 1'b0; status <= A1; end
                A2: if(din) begin flag <= 1'b0; status <= A3; end
                    else begin flag <= 1'b0; status <= A1; end
                A3: if(din) begin flag <= 1'b0; status <= B2; end
                    else begin flag <= 1'b1; status <= B3; end
                B1: if(din) begin flag <= 1'b0; status <= B2; end
                    else begin flag <= 1'b0; status <= A1; end
                B2: if(din) begin flag <= 1'b0; status <= B2; end
                    else begin flag <= 1'b0; status <= B3; end
                B3: if(din) begin flag <= 1'b1; status <= A2; end
                    else begin flag <= 1'b0; status <= A1; end          
                default: begin flag <= 1'b0; status <= IDLE; end
            endcase
        end
    end

endmodule