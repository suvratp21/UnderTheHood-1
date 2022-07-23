`timescale 1ns/1ps
module orMod(A, B, C);

    input A, B;
    output C;

    assign C = A|B;

endmodule

module tb;

    reg A, B;
    wire C;

    orMod or1(A, B, C);

    initial begin
        $dumpfile("or.vcd");
        $dumpvars(0, tb);
        $monitor("A = %b, B = %b, C = %b", A, B, C);
        A = 1;
        B = 1;
        #2;
        // $display("A = %b, B = %b, C = %b", A, B, C);
        #15;
        A = 1;
        B = 0;
        #2;
        // $display("A = %b, B = %b, C = %b", A, B, C);
        #15;
        A = 0;
        B = 1;
        #2;
        // $display("A = %b, B = %b, C = %b", A, B, C);
        #15;
        A = 0;
        B = 0;
        #2;
        // $display("A = %b, B = %b, C = %b", A, B, C);
        #15;
    end
    
endmodule