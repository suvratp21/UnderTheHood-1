`include "task3_four_bit_subtracter.v"

module tb;

    reg [7:0] A, B;
    wire [7:0] R;
    wire C_out;

    eight_bit_subtracter sub(A, B, R, C_out);

    initial begin
        A = 0;
        B = 0;
        #2;

        $monitor("A = %d, B = %d, R = %d, Carry = %d", A, B, R, C_out);
        x
        repeat(20) begin
            A = $random;
            B = $random;
            #15;
        end

    end
    
endmodule