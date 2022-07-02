`timescale 1ms/1ms
module fsm(input inp, clk, output reg out, s);

    reg state, next_state; // * 0 for even, 1 for odd

    initial begin
        state = 1'b0;
        next_state = 1'b0;
        out = 1'b1;
    end

    always @(posedge clk) begin
        if (inp == 1'b0) begin
            next_state = state;
        end else begin
            next_state = ~state;
        end
    end

    always @(negedge clk) begin
        if (next_state == 1'b1) begin
            out = 1'b0;
        end else begin
            out = 1'b1;
        end
    end

    always @(negedge clk) begin
        state = next_state;
        s = next_state;
    end

endmodule


module tb;

    reg a, clk;
    wire o, s;

    fsm f(a, clk, o, s);

    always begin
        #5;
        clk = ~clk;
    end

    always @(posedge clk) begin
        $display("a = %b, o = %b, s = %b", a, o, s);
    end

    initial begin
        clk = 0;
        a = 0;

        $dumpfile("fsm.vcd");
        $dumpvars(0, tb);
        
        #10;
        a = 1;
        #10;
        a = 0;
        #10;
        a = 1;
        #10;
        a = 1;
        #10;
        a = 0;
        #10;
        a = 1;
        #10;
        a = 1;
        #10;
        a = 1;
        #10;
        a = 0;
        #10;
        $finish;
    end
    
endmodule


// QTspim 