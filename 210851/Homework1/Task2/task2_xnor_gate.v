`timescale 1ns/1ps

module xnorgate(A, B, C);
    input A, B;
    output C;
    assign C = (A&B)|((~A)&(~B));
endmodule

module tb;
    reg A, B;
    wire C;
    xnorgate gate1(A, B, C);

   initial begin
       A=0;
       B=0;
        #2;
        $display("A = %b, B = %b, C = %b", A, B, C);
        #15;
        A = 1;
        B = 0;
        #2;
        $display("A = %b, B = %b, C = %b", A, B, C);
        #15;
        A = 0;
        B = 1;
        #2;
        $display("A = %b, B = %b, C = %b", A, B, C);
        #15;
        A = 1;
        B = 1;
        #2;
        $display("A = %b, B = %b, C = %b", A, B, C);
        #15;
    end

endmodule
