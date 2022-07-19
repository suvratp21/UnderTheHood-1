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

module eight_bit_adder0(
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

module eight_bit_adder_op(
    input [7:0] a,b,c, 
    input [1:0] op,
    output [7:0] r, output c_out
);
    reg [7:0] xn,yn,zn;
    // wire C_out;

    always @(op)begin
    if(op==2'b00)begin
         xn = a;
         yn = b;
         zn = c;
    end

    else if(op==2'b01)begin
         xn = ~a+ 1'b1;
         yn = b;
         zn = c;
    end

    else if(op==2'b10)begin
         xn = a;
         yn = ~b+ 1'b1;
         zn = c; 
    end
    
    else begin
         xn = a;
         yn = b;
         zn = ~c+1'b1; 
    end
    end
    eight_bit_adder0 adding(xn,yn,zn,r,c_out);


endmodule


module tb;

    reg [7:0] A, B, C;
    reg [1:0] D;
    wire [7:0] R;
    wire C_out;

    eight_bit_adder_op adder(A, B, C, D, R, C_out);

    initial begin
        $dumpfile("Part2.vcd");
        $dumpvars(0,tb);
        A = 0;
        B = 0;
        C = 0;
        D = 2'b00;
        #2;

        $monitor("A = %b, B = %b, C = %b,D = %b, R = %b, Carry = %b", A, B, C,D, R, C_out);


        A = $random;
        B = $random;
        C = $random;
        D = 2'b01;
        #2;

        $monitor("A = %b, B = %b, C = %b,D = %b, R = %b, Carry = %b", A, B, C,D, R, C_out);

        A = $random;
        B = $random;
        C = $random;
        D = 2'b10;
        #2;

        $monitor("A = %b, B = %b, C = %b,D = %b, R = %b, Carry = %b", A, B, C,D, R, C_out);

        A = $random;
        B = $random;
        C = $random;
        D = 2'b11;
        #2;

        $monitor("A = %b, B = %b, C = %b,D = %b, R = %b, Carry = %b", A, B, C,D, R, C_out);

        A = $random;
        B = $random;
        C = $random;
        D = 2'b00;
        #2;

        $monitor("A = %b, B = %b, C = %b,D = %b, R = %b, Carry = %b", A, B, C,D, R, C_out);

        
        $finish;

    end

endmodule 