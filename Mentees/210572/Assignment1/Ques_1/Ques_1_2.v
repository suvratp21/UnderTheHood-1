`include "Ques_1_1.v"

module Calculator(A, B, C, OP, R, C_out);
    input [7:0] A, B, C;
    input [1:0] OP;
    output [7:0] R, C_out;

    reg [7:0] X, Y, Z;

    reg C_in;

    eight_bit_adder eight_bit_adder_3(X, Y, Z, C_in, R, C_out);

    always @(A or B or C) begin
        if (OP == 0) begin
            C_in = 0;
            assign X = A;
            assign Y = B;
            assign Z = C;
            //$display("X = %b, Y = %b, Z = %b, OP = %b, C_in = %b, R = %b", X, Y, Z, OP, C_in, R);
        end else if(OP == 1) begin
            C_in = 1;
            assign X = ~A;
            assign Y = B;
            assign Z = C;
            //$display("X = %b, Y = %b, Z = %b, C_in = %b, OP = %b, R = %b", X, Y, Z, OP, C_in, R);
        end else if(OP == 2) begin
            C_in = 1;
            assign X = A;
            assign Y = ~B;
            assign Z = C;
            //$display("X = %b, Y = %b, Z = %b, C_in = %b, OP = %b, R = %b", X, Y, Z, OP, C_in, R);
        end else begin
            C_in = 1;
            assign X = A;
            assign Y = B;
            assign Z = ~C;
            //$display("X = %b, Y = %b, Z = %b, C_in = %b, OP = %b, R = %b", X, Y, Z, OP, C_in, R);
        end
    end
endmodule

module tb_Ques_1_2;

    reg [7:0] A, B, C;
    reg [1:0] OP;
    wire [7:0] R, C_out;

    Calculator calculator_1(A, B, C, OP, R, C_out);

    initial begin

        A = 50;
        B = 60;
        C = 70;
        OP = 0;
        #15;
        $display("A = %b, B = %b, C = %b, OP = %b, R = %b", A, B, C, OP, R);
        #5;
        OP = 1;
        #15;
        $display("A = %b, B = %b, C = %b, OP = %b, R = %b", A, B, C, OP, R);
        #5;
        OP = 2;
        #15;
        $display("A = %b, B = %b, C = %b, OP = %b, R = %b", A, B, C, OP, R);
        #5;
        OP = 3;
        #15;
        $display("A = %b, B = %b, C = %b, OP = %b, R = %b", A, B, C, OP, R);
        #5;
    end

endmodule