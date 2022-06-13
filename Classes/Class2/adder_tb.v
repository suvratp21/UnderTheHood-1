`include "one_bit_adder.v"
`timescale 1ns/1ns

module tb;

    reg [7:0] A, B;
    wire [7:0] R;
    wire C_out;

    eight_bit_adder adder(A, B, R, C_out);

    initial begin
        A = 0;
        B = 0;
        #2;

        $monitor("A = %b, B = %b, R = %b, Carry = %b", A, B, R, C_out);

        repeat(10) begin
            A = $random;
            B = $random;
            #15;
        end
    
    end

endmodule