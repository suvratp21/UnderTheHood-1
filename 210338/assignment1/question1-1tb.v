`include "question1-1.v"

module tb;

    reg [7:0] A, B, C;
    reg [1:0] OP;
    wire [7:0] R;
    wire C_out;

    eight_bit_adder adder(A, B, C, R, C_out);

    initial begin
        A = 0;
        B = 0;
        C = 0;
        #2;

        $monitor("A = %d, B = %d, C = %d, R = %d, Carry = %b", A, B, C, R, C_out);

        repeat(10) begin
            A = $random;
            B = $random;
            C = $random;
            #15;
        end
    
    end

endmodule