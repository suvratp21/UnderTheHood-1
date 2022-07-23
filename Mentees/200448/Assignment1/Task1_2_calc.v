module one_bit_adder (
    input b1, b2, b3, c_in, output r, c_out 
);  

    assign r = (b2&c_in) | (b1&b2) | (~b2&~c_in);
    assign c_out = (b1&b3) | (c_in&b1) | (~b1&~b3);
    
endmodule

module eight_bit_adder (
    input wire [7:0] a, b, c,
    input c_in,
    output wire [7:0] r, output wire c_out
);

    wire [7:0] carry;
    one_bit_adder adder0 (a[0], b[0], c[0], c_in, r[0], carry[0]);
    one_bit_adder adder1 (a[1], b[1], c[1], carry[0], r[1], carry[1]);
    one_bit_adder adder2 (a[2], b[2], c[2], carry[1], r[2], carry[2]);
    one_bit_adder adder3 (a[3], b[3], c[3], carry[2], r[3], carry[3]);
    one_bit_adder adder4 (a[4], b[4], c[4], carry[3], r[4], carry[4]);
    one_bit_adder adder5 (a[5], b[5], c[5], carry[4], r[5], carry[5]);
    one_bit_adder adder6 (a[6], b[6], c[6], carry[5], r[6], carry[6]);
    one_bit_adder adder7 (a[7], b[7], c[7], carry[6], r[7], carry[7]);
    assign c_out = carry[7];
    
endmodule

module calc(A, B, C, op, res, C_out);  

    input [7:0] A, B, C;
    input [1:0] op;
    output [7:0] res;
    output C_out;

    reg [7:0] Ac, Bc, Cc;
    reg c_in;

    always @(A or B or C) begin
        if (op == 2'b00) begin
            Ac = A;
            Bc = B;
            Cc = C;
            c_in = 0;
        end else if (op == 2'b01) begin
            Ac = ~A + 1;
            Bc = B;
            Cc = C;
            c_in = 0;
        end else if (op == 2'b10) begin
            Ac = A;
            Bc = ~B + 1;
            Cc = C;
            c_in = 0;
        end else if (op == 2'b11) begin
            Ac = A;
            Bc = B;
            Cc = ~C + 1;
            c_in = 0;
        end


    end

    eight_bit_adder sp_adder (Ac, Bc, Cc, 1'b0, res, C_out);

endmodule

module tb;
    reg [7:0] A, B, C;
    reg [1:0] op;
    wire [7:0] R;
    wire c_out;

    calc mycalc(A, B, C, op, R, c_out);

    initial begin
        A = 0;
        B = 0;
        C = 0;
        op = 0;
    

        $monitor("A = %b, B = %b, C = %b, op=%b, R = %b, Carry = %b", A, B, C, op, R, c_out);

        repeat(10) begin
            A = $random;
            B = $random;
            C = $random;
            op = $random;

            #15;
        end

    end

endmodule
