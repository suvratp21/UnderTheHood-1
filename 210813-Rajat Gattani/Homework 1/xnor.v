`timescale 1ns/1ps
module xnorMod(A, B, C);

    input A, B;
    output C;

    assign C = ~((A & ~B) | (~A & B));

endmodule

module tb;

    reg A, B;
    wire C;

    xnorMod xor1(A, B, C);

    initial begin
        $monitor("A = %b, B = %b, C = %b", A, B, C);
        A = 1;
        B = 1;
        #2;
        #15;
        A = 1;
        B = 0;
        #2;
        #15;
        A = 0;
        B = 1;
        #2;
        #15;
        A = 0;
        B = 0;
        #2;
        #15;
    end
    
endmodule