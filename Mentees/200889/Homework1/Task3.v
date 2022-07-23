`timescale 1ns/1ps
module subtractor (a, b, c_in, s, c_out);
    input a;
    input b;
    input c_in;
    output s;
    output c_out;

    assign s = (a ^ (~b) ^ c_in);
    assign c_out = (a & ~b) | ((~b) & c_in) | (a & c_in);

endmodule

module four_bit_subtractor(a, b, c_in, s, c_out);
    input [3:0] a, b;
    input c_in;
    output [3:0] s;
    output c_out;

    wire [3:0] c;
    subtractor adder0 (a[0], b[0], c_in, s[0], c[0]);
    subtractor adder1 (a[1], b[1], c[0], s[1], c[1]);
    subtractor adder2 (a[2], b[2], c[1], s[2], c[2]);
    subtractor adder3 (a[3], b[3], c[2], s[3], c[3]);
    assign c_out = c[3];

endmodule



module eight_bit_subtractor(a, b, s, c_out);

    input [7:0] a, b;
    output [7:0] s;
    output c_out;

    
    wire [1:0] c;
    four_bit_subtractor sub0 (a[3:0], b[3:0], 1'b1, s[3:0], c[0]);
    four_bit_subtractor sub1 (a[7:4], b[7:4], c[0], s[7:4], c[1]);
    assign c_out = c[1];

    

endmodule 


module tb;

    reg [7:0] A, B;
    wire [7:0] S;
    wire C_out;

    eight_bit_subtractor sub(A, B, S, C_out);

    initial begin
        $dumpfile("_8bit_sub.vcd");
        $dumpvars(0,tb);
        A = 0;
        B = 0;
        #5;
        $display("A = %b, B = %b, S = %b, Carry = %b", A, B, S, C_out);

        A = 0;
        B = 1;
        #5;
        $display("A = %b, B = %b, S = %b, Carry = %b", A, B, S, C_out);

        A = 1;
        B = 0;
        #5;
        $display("A = %b, B = %b, S = %b, Carry = %b", A, B, S, C_out);

        A = 2;
        B = 1;
        #5;
        $display("A = %b, B = %b, S = %b, Carry = %b", A, B, S, C_out);       

    end

endmodule 


