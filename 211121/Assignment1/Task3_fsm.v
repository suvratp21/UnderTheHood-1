`timescale 1ms/1ms
module fsm(input [4:0]inp, input clk, output reg [1:0]s);
    reg [1:0]state;
    reg [1:0]next_state;

    initial begin
        state = 2'b00;
        next_state = 2'b00;
    end

    always @(posedge clk) begin
        if(state==(2'b00)) begin
            if(inp<(5'b01100)) begin
                next_state = 2'b10;
            end
            else if(inp>(5'b10100)) begin
                next_state = 2'b01;
            end
        end
        else if(state==(2'b10)) begin
            if(inp>(5'b10100)&&inp<=(5'b11010)) begin
                next_state = 2'b00;
            end
            else if(inp>(5'b11010)) begin
                next_state = 2'b01;
            end
        end
        else if(state==(2'b01)) begin
            if(inp<(5'b01110)&&(inp>=(5'b01000))) begin
                next_state = 2'b00;
            end
            else if(inp<(5'b01000)) begin
                next_state = 2'b10;
            end
        end
    
    end
    always @(next_state)begin
        state = next_state;
        s=state;
    end

endmodule

module tb;

    reg [4:0]a;
    reg clk;
    wire [1:0]s;

    fsm f(a, clk, s);


    always begin
        clk = ~clk;
        #14;
    end

    always @(s) begin
    $display("a = %d, s = %b", a, s);
    end

    initial begin
        clk = 0;
        a = 5'bxxxxx;
        #28
        a = 5'b11011;
        clk=0;
        #28
        a = 5'b00011;
        #28
        a = 5'b11110;
        #28
        a = 5'b01100;
        #24
        a = 5'b00001;
        #28
        a = 5'b11000;
        #28
        a = 5'b11111;
        clk=0;
        #28
        a = 5'b00010;
        #24
        a = 5'b11001;
        #28
        a = 5'b11010;
        #42
        $finish;
    end
endmodule