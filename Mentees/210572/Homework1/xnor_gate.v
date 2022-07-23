`timescale 1ns/1ns

module xnor_gate(A, B, C); // xnor_gate module

    input A;
    input B;
    output C;

    assign C = ~((A & (~B)) | ((~A) & B)); // C is a wire

endmodule

module tb_xnor_gate;

    reg A;
    reg B;
    wire C;

    xnor_gate xnor_gate_ans(A, B, C);

    initial begin

        $dumpfile("xnor_gate.vcd"); // Dumpfile for waves
        $dumpvars(0, tb_xnor_gate); // Setting variables 0

        $monitor("A = %b, B = %b, C = %b", A, B, C);

        A = 0;
        B = 0;
        #15;

        A = 0;
        B = 1;
        #15;

        A = 1;
        B = 0;
        #15;

        A = 1;
        B = 1;
        #15;
    end

endmodule