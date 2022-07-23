`timescale 1ns/1ns

// Or gate module
module or_gate(A, B, C);

    input A;
    input B;
    output C;

    assign C = A | B; // assign - since C is a wire

endmodule

// Testbench module
module tb_or_gate;

    reg A;
    reg B;
    wire C;

    // Calling or_gate module
    or_gate or_ans(A, B, C);

    initial begin

        $dumpfile("or_gate.vcd");
        $dumpvars(0, tb_or_gate);

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