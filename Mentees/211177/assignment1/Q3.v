`timescale 1ms/1ms
module fsm(input [4:0] temp, input clk, output reg [1:0]out);

    reg [1:0] state, next_state;

    initial begin
        state = 2'b00;
        next_state = 2'b00;
        out = 2'b00;
    end

    always @(posedge clk) begin
        if (state == 2'b00) begin
            if(temp < 12)begin
                next_state = 2'b10;
            end else if(temp > 18)begin
                next_state = 2'b01;
            end else begin
                next_state = state;
            end
        end else if(state == 2'b10) begin
            if(temp > 26) begin
                next_state = 2'b01;
            end else if(temp > 20)begin
                next_state = 2'b00;
            end else begin
                next_state = state;
            end
        end else begin
            if(temp < 8) begin
                next_state = 2'b10;
            end else if(temp < 14) begin
                next_state = 2'b00;
            end else begin
                next_state = state;
            end
        end
    end

    always @(negedge clk) begin
        state = next_state;
        out = next_state;
    end

endmodule


module tb;

    reg clk;
    reg [4:0] temp;
    wire [1:0] o;

    fsm f(temp, clk, o);

    always begin
        #5;
        clk = ~clk;
    end

    always @(posedge clk) begin
        $display("temp = %d, o = %b", temp, o);
    end

    initial begin
        clk = 0;
        temp = 0;
        
        #10;
        repeat(20) begin
            temp = $random;
            #10;
        end
        $finish;
    end
    
endmodule