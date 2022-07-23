


// I am getting delayed results, the output/state is one step behind the current temperature



`timescale 1ms/1ms
module fsm(input [4:0] temp, input clk, output reg [1:0]out, s);

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
        out = next_state;
    end

    always @(negedge clk) begin
        state = next_state;
        s = next_state;
    end

endmodule


module tb;

    reg clk;
    reg [4:0] temp;
    wire [1:0] o, s;

    fsm f(temp, clk, o, s);

    always begin
        #5;
        clk = ~clk;
    end

    always @(posedge clk) begin
        $display("temp = %d, o = %b, s = %b", temp, o, s);
    end

    initial begin
        clk = 0;
        temp = 0;

        $dumpfile("fsm.vcd");
        $dumpvars(0, tb);
        
        #10;
        repeat(10) begin
            temp = $random;
            #10;
        end
        
        temp = 21;
        #10;
        temp = 11;
        #10;
        temp = 28;
        #10;
        temp = 15;
        #10;
        $finish;
    end
    
endmodule