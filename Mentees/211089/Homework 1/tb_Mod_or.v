`timescale 1ns/1ps
`include "Mod_or.v"
module tb;

    reg a,b;
    wire c;
    
    Mod_OR or_gate1(a,b,c);
    initial begin
        a=0;
        b=0;
        #2;
        $monitor("a = %b , b =%b , c= %b",a,b,c);
        repeat (20) begin
            a=$random;
            b=$random;
            #15;
        end
    end
    
endmodule