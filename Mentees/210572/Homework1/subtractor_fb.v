module one_bit_adder(A, B, C_in, R, C_out); // one_bit_adder module

    input A, B, C_in;
    output R, C_out;

    assign R = A ^ B ^ C_in;
    assign C_out = (A & B) | (B & C_in) | (C_in & A);

endmodule

module four_bit_subtractor(A, B, C_in, R, C_out); // four_bit_subtractor module

    input [3:0] A, B;
    input C_in;
    output [3:0] R, C_out;

    one_bit_adder one_bit_adder_ans1(A[0], ~B[0], C_in, R[0], C_out[0]);
    one_bit_adder one_bit_adder_ans2(A[1], ~B[1], C_out[0], R[1], C_out[1]);
    one_bit_adder one_bit_adder_ans3(A[2], ~B[2], C_out[1], R[2], C_out[2]);
    one_bit_adder one_bit_adder_ans4(A[3], ~B[3], C_out[2], R[3], C_out[3]);

endmodule

module eight_bit_subtractor(A, B, R, C_out); // eight_bit_subtractor module

    input [7:0] A, B;
    output [7:0] R, C_out;

    four_bit_subtractor four_bit_subtractor1(A[3:0], B[3:0], 1'b1, R[3:0], C_out[3:0]); // call one

    four_bit_subtractor four_bit_subtractor2(A[7:4], B[7:4], C_out[3], R[7:4], C_out[7:4]); // call two

endmodule

module tb_subtractor;

    reg [7:0] A, B;
    wire [7:0] R, C_out;

    eight_bit_subtractor eight_bit_subtractor_ans(A, B, R, C_out);

    initial begin
        $monitor("A = %d, B = %d, R = %d, C_out = %d", A, B, R, C_out);

        repeat(10)begin
            A = $random;
            B = $random;
            #20;
        end

    end 

endmodule