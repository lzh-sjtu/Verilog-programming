module mealy(output reg flag, input din, clk, rst);

    reg [7:0] status;
    parameter IDLE = 8'b0000_0001,
                 A = 8'b0000_0010,
                 B = 8'b0000_0100,
                 C = 8'b0000_1000,
                 D = 8'b0001_0000,
                 E = 8'b0010_0000,
                 F = 8'b0100_0000,
                 G = 8'b1000_0000;

    always @(posedge clk, posedge rst) begin
        if(rst) begin
            flag <= 1'b0;
            status <= IDLE;
        end    
        else begin
            case(status)
                IDLE: if(din) begin flag <= 1'b0; status <= IDLE; end
                      else begin flag <= 1'b0; status <= A; end
                A: if(din) begin flag <= 1'b0; status <= B; end
                   else begin flag <= 1'b0; status <= A; end
                B: if(din) begin flag <= 1'b0; status <= IDLE; end
                   else begin flag <= 1'b0; status <= C; end
                C: if(din) begin flag <= 1'b0; status <= D; end
                   else begin flag <= 1'b0; status <= A; end
                D: if(din) begin flag <= 1'b0; status <= IDLE; end
                   else begin flag <= 1'b0; status <= E; end
                E: if(din) begin flag <= 1'b0; status <= F; end
                   else begin flag <= 1'b0; status <= A; end
                F: if(din) begin flag <= 1'b0; status <= IDLE; end
                   else begin flag <= 1'b0; status <= G; end
                G: if(din) begin flag <= 1'b1; status <= F; end
                   else begin flag <= 1'b0; status <= A; end
                default: begin flag <= 1'b0; status <= IDLE; end 
            endcase
        end
    end

endmodule