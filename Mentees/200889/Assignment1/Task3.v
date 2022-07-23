`timescale 1ms/1ms
module fsm(input [4:0] inp, clk, output reg [1:0] out);

    reg [1:0]state;
    reg[1:0]next_state; 
    initial begin
        state = 2'b00;
        next_state =2'b00;
    end

    always @(posedge clk) begin
        if(state ==2'b00)begin
            if(inp < 5'b01100)begin
                next_state = 2'b10;
            end
            else if(inp > 5'b10010)begin
                next_state = 2'b01;
            end

        end
        else if(state ==2'b10)begin
            if(inp > 5'b11010)begin
                next_state = 2'b01;
            end
            else if(inp > 5'b10100)begin
                next_state = 2'b00;
            end

        end
        else if(state ==2'b01)begin
            if(inp < 5'b01000)begin
                next_state = 2'b10;
            end
            else if(inp < 5'b01110)begin
                next_state = 2'b00;
            end

        end

        state = next_state;
        out = next_state;
    end
endmodule


module tb;

    reg [4:0]a, clk;
    wire[1:0] o;

    fsm f(a, clk, o);


    always begin
        clk = ~clk;
        #5;
    end

    always @(posedge clk) begin
        $display("a = %b, o = %b", a, o);
    end

    initial begin
        clk = 0;
        $dumpfile("Task3.vcd");
        $dumpvars(0,tb);

        repeat(10) begin
            a = $random;
            #20;
        end
        $finish;

    end

endmodule