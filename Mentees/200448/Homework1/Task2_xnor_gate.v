`timescale 1ns/1ns

module xnorMod(A, B, C);
    input A;
    input B;
    output C;
    assign C = (A & B) | (~A & ~B);
endmodule

//test bench

module tb;
    reg A, B;
    wire C;
    xnorMod ans(A, B, C);

    //testing for different inputs
    initial begin
        A = 1;
        B = 1;
        #2;
        $display("A = %b, B = %b, C = %b", A, B, C);
        #15;
        A = 0;
        B = 1;
        #2;
        $display("A = %b, B = %b, C = %b", A, B, C);
        #20;
        A=1;
        B=0;
        #2;
        $display("A = %b, B = %b, C = %b", A, B, C);
        #15;
        A = 0;
        B = 0;
        #2;
        $display("A = %b, B = %b, C = %b", A, B, C);
    end
endmodule
