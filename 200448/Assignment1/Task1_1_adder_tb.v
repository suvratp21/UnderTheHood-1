`timescale 1ns/1ns
`include "Task1_1_adder.v"

module tb;

    reg [7:0] A, B, C;
    wire [7:0] R;
    wire C_out;

    eight_bit_adder adder(A, B, C, R, C_out);

    initial begin
        A = 0;
        B = 0;
        C = 0;
        #2;

        $monitor("A = %b, B = %b, C = %b, R = %b, Carry = %b", A, B, C, R, C_out);

        repeat(10) begin
            A = $random;
            B = $random;
            C = $random;
            #15;
        end
    
    end

endmodule
