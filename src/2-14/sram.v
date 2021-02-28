module sram(output [7:0] dout,
            input [7:0] din,
            input [7:0] addr,
            input wr, rd, cs);

    reg [7:0] memory [0:255];
    reg [7:0] data;
    
    assign dout = (cs && !rd) ? data : 8'bz;

    always @(posedge wr) begin
        if(cs && wr)
            memory[addr] <= din; 
    end

    always @(*) begin
        if(cs && !rd)
            data <= memory[addr]; 
    end

endmodule