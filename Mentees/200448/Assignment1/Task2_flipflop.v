`timescale 1ns/1ns

module flipflop (input b1, b2, output reg q);
    initial begin
        q = 0;
    end

    always @(b1 or b2) begin
        q = (b1 & b2) | (b1 & ~q) | (~b1 & ~b2 & q);
    end

endmodule

module tb;

    reg a, b;
    wire c;

    flipflop f1(a, b, c);
    flipflop f2(a, b, c);

    initial begin
        a = 1;
        b = 1;

        $monitor("a = %b, b= %b, c = %b", a, b, c);

        #5;
        a=1; b=0;
        #5;
        a =0; b = 1;
        #5;
        a = 0; b = 0;
        #5;
    end

endmodule
