`timescale 1ns/1ns 

module xnorgate(
    input a,B,
    output C
);
    assign C = (a&B)|((~a)&(~B));
endmodule


module tb;

    reg a, B;
    wire C;
    xnorgate ans(a, B, C);

    initial begin
        a = 1;
        B = 1;
        #2;
        $display("a = %b, B = %b, C = %b", a, B, C);
        #10;
        a = 0;
        B = 1;
        #2;
        $display("a = %b, B = %b, C = %b", a, B, C);
        #10;
        a=1;
        B=0;
        #2;
        $display("a = %b, B = %b, C = %b", a, B, C);
        #10;
        a = 0;
        B = 0;
        #2;
        $display("a = %b, B = %b, C = %b", a, B, C);
    end
endmodule