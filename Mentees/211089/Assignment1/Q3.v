`timescale 1ms/1ms

module FSM(input wire [4:0] temp, input clk, output reg [1:0] s);

    initial begin
        s = 2'b 0;
    end

    always @(posedge clk)
    begin
        if (s==2'b 0)
        begin
            if (temp<12) begin
            // heat
            s = 2'b 10;
            end else if (temp>18) begin
            // cool
            s = 2'b 1;  
            end
        end
        else if (s==2'b 01)
        begin
            if (temp<8) begin
            // heat
            s = 2'b 10;
            end else if (temp<14) begin
            // neutral 
            s = 2'b 0; 
            end
        end
        else if (s==2'b 10)
        begin
            if (temp>26) begin
            //cool
            s = 2'b 1;
            end else if (temp>20) begin
            //neutral
            s = 2'b 0;
            end
        end
    end

endmodule

