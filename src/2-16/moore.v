module moore(output reg flag, input din, clk, rst);

    reg [8:0] status;
    parameter IDLE = 9'b0_0000_0001,
                 A = 9'b0_0000_0010,
                 B = 9'b0_0000_0100,
                 C = 9'b0_0000_1000,
                 D = 9'b0_0001_0000,
                 E = 9'b0_0010_0000,
                 F = 9'b0_0100_0000,
                 G = 9'b0_1000_0000,
                 H = 9'b1_0000_0000;

    always @(posedge clk, posedge rst) begin
        if(rst) begin
            flag <= 1'b0;
            status <= IDLE;
        end
        else begin
            flag <= (status == H) ? 1'b1 : 1'b0;
            case(status)
                IDLE: status <= (din) ? IDLE : A;
                A: status <= (din) ? B : A;
                B: status <= (din) ? IDLE : C;
                C: status <= (din) ? D : A;
                D: status <= (din) ? IDLE : E;
                E: status <= (din) ? F : A;
                F: status <= (din) ? IDLE : G;
                G: status <= (din) ? H : A;
                H: status <= (din) ? IDLE : G;
                default: ;
            endcase     
        end
    end

endmodule