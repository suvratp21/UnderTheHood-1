module func(input A,B,C,D, output R);
    assign R = ((A)|(~B|D))&(B|~D);
endmodule

module one_bit_adder (a, b, c, c_in, r, c_out );
    input a;
    input b;
    input c;
    input c_in;
    output r;
    output c_out;  
    wire p,q;

    func func0(a, b, c, c_in, p);
    func func1(c_in,a, b, c, q);
    assign r = p;
    assign c_out = q;

endmodule

module eight_bit_adder(
    input wire [7:0] a, b, c, 
    output wire [7:0] r, output wire c_out

);

    wire [7:0] d;
    one_bit_adder adder0 (a[0], b[0], c[0], 1'b0, r[0], d[0]);
    one_bit_adder adder1 (a[1], b[1], c[1], d[0], r[1], d[1]);
    one_bit_adder adder2 (a[2], b[2], c[2], d[1], r[2], d[2]);
    one_bit_adder adder3 (a[3], b[3], c[3], d[2], r[3], d[3]);
    one_bit_adder adder4 (a[4], b[4], c[4], d[3], r[4], d[4]);
    one_bit_adder adder5 (a[5], b[5], c[5], d[4], r[5], d[5]);
    one_bit_adder adder6 (a[6], b[6], c[6], d[5], r[6], d[6]);
    one_bit_adder adder7 (a[7], b[7], c[7], d[6], r[7], d[7]);
    assign c_out = d[7];

endmodule


module tb;

    reg [7:0] A, B, C;
    wire [7:0] R;
    wire C_out;

    eight_bit_adder adder(A, B, C, R, C_out);

    initial begin
        $dumpfile("Part1.vcd");
        $dumpvars(0,tb);
        A = 0;
        B = 0;
        C = 0;
        #2;

        $monitor("A = %b, B = %b, C = %b, R = %b, Carry = %b", A, B, C, R, C_out);

        repeat(10) begin
            A = $random;
            B = $random;
            C = $random;
            #15;
        end

        $finish;

    end
    

endmodule 