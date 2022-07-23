`timescale 1ns/1ns

module func(A, B, C, D, R);

    input A, B, C, D;
    output R;

    assign R = (A & (~C) & (~D)) | (B & (~C) & D) | (B & C & D) | (A & C & (~D)) | ((~A) & (~B) & (~C));

endmodule

module one_bit_adder(A, B, C, C_in, O, C_out);
    
    input A, B, C, C_in;
    output O, C_out;

    func func_1(A, B, C, C_in, O);
    func func_2(C_in, A, B, C, C_out);

endmodule

module eight_bit_adder(A, B, C, C_in, R, C_out);

    input [7:0] A, B, C;
    input C_in;
    output [7:0] R, C_out;

    one_bit_adder adder1(A[0], B[0], C[0], C_in, R[0], C_out[0]);
    one_bit_adder adder2(A[1], B[1], C[1], C_out[0], R[1], C_out[1]);
    one_bit_adder adder3(A[2], B[2], C[2], C_out[1], R[2], C_out[2]);
    one_bit_adder adder4(A[3], B[3], C[3], C_out[2], R[3], C_out[3]);
    one_bit_adder adder5(A[4], B[4], C[4], C_out[3], R[4], C_out[4]);
    one_bit_adder adder6(A[5], B[5], C[5], C_out[4], R[5], C_out[5]);
    one_bit_adder adder7(A[6], B[6], C[6], C_out[5], R[6], C_out[6]);
    one_bit_adder adder8(A[7], B[7], C[7], C_out[6], R[7], C_out[7]);

endmodule

module tb_Ques_1_1;

    reg [7:0] A, B, C;
    wire [7:0] R, C_out;

    eight_bit_adder eight_bit_adder_1(A, B, C, 1'b0, R, C_out);

    initial begin
        A = 0;
        B = 0;
        C = 0;
        #5;

        $monitor("A = %b, B = %b, C = %b, R = %b", A, B, C, R);

        repeat(10) begin
            A = $random;
            B = $random;
            C = $random;
            #15;
        end
    end

endmodule