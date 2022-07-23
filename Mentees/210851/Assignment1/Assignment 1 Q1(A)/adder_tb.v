`include "one_bit_adder.v"

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

        $monitor("A = %d, B = %d, C = %d, R = %d, Carry = %d", A, B, C, R, C_out);

        repeat(20) begin
            A = $random;
            B = $random;
            C = $random;
            #15;
        end

    end
    
endmodule