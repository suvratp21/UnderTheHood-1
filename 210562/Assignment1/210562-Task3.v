`timescale 1ms/1ms
// input: temperature 5-bit unsigned integer
module fsm(input [4:0] temp, 
    input clk, 
    output reg [1:0]out, s);

    reg [1:0] curr_state, next_state;

    initial begin
        curr_state = 2'b00;
        next_state = 2'b00;
        out = 2'b00;
    end

    always @(posedge clk) begin
        if (curr_state == 2'b00) 
        begin
            if(temp < 5'b01100)begin
                next_state = 2'b10;
            end else if(temp > 5'b10010)begin
                next_state = 2'b01;
            end else begin
                next_state = curr_state;
            end
        end 
        else if(curr_state == 2'b10) 
        begin
            if(temp > 5'b11010) begin
                next_state = 2'b01;
            end else if(temp > 5'b10100)begin
                next_state = 2'b00;
            end else begin
                next_state = curr_state;
            end
        end 
        else 
        begin
            if(temp < 5'b01000) begin
                next_state = 2'b10;
            end else if(temp < 5'b01110) begin
                next_state = 2'b00;
            end else begin
                next_state = curr_state;
            end
        end
    end

    always @(negedge clk) begin
        out = next_state; //output: next state fsm adopts
    end

    always @(negedge clk) begin
        curr_state = next_state;
        s = next_state;
    end

endmodule


module tb;

    reg clk;
    reg [4:0] temp;
    wire [1:0] o, ns;

    fsm f(temp, clk, o, ns);

    always begin
        #5;
        clk = ~clk;
    end

    always @(posedge clk) begin
        $display("temp = %b, ns = %b, o = %b", temp, ns, o);
    end

    initial begin
        clk = 0;
        temp = 0;

        $dumpfile("fsm.vcd");
        $dumpvars(0, tb);

        temp = 5'b10101;
        #10;
        temp = 5'b01101;
        #10;
        temp = 5'b01000;
        #10;
        temp = 5'b11101;
        #10;
        temp = 5'b00010;
        #10;
        temp = 5'b10101;
        #10;
        temp = 5'b10001;
        #10;
        temp = 5'b00110;
        #10;
        temp = 5'b11100;
        #10;
        temp = 5'b01111;
        #10;

        // One step lag is there
        $finish;
    end

endmodule 