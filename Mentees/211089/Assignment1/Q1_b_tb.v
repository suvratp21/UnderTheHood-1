`include "Q1_b.v"

module tb;

    reg [7:0] A, B,C;
    wire [7:0] R;
    wire C_out;
    reg[1:0] opcode;

    eight_bit_adder add(A, B, C,opcode , R, C_out);

    initial begin
        A = 0;
        B = 0;
        C = 0;
        opcode=0;
        #2;

        $monitor("A = %d, B = %d, C= %d , opcode= %d R = %d, Carry = %d", A, B, C,opcode, R, C_out);

        repeat(10) begin
            A = $random;
            B = $random;
            C = $random;
            opcode=$random;
            #15;
        end
    
    end

endmodule
