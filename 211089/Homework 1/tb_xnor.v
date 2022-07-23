`timescale 1ns/1ps
`include "Mod_xnor.v"

module tb;
    reg a,b;
    wire c;

    Mod_xnor xnor1(a,b,c);

    initial begin
        a=0;
        b=0;
        #2;

        $monitor("a = %b, b = %b, c = %b",a,b,c);
        repeat(10) begin
            a=$random;
            b=$random;
            #15;
        end
    end    

endmodule