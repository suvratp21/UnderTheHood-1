module function1 (a,b,c,d,res);
    input a,b,c,d;
    output res;

    assign res = (b |(d^1))& (a | (b^1) | d);

endmodule
module one_bit_adder(a,b,c,c_in,r,c_out);
    input a,b,c,c_in;
    output c_out,r;

    function1 add(a,b,c,c_in,r);
    function1 carry(c_in,a,b,c,c_out);

    // assign r =  a ^ b ^ c ^ c1 ^c2;
    // assign c_out1 = ((a&b&c&c1) | ((a^1)&(b^1)&(c^1)&(c_in^1))) ^ 1;
    // assign c_out2= (a&b&c&c_in);1
endmodule

module eight_bit_adder(
    input wire [7:0] a, b,c, 
    output wire [7:0] r, output wire c_out
);

    wire [7:0] d;
    one_bit_adder add0 (a[0], b[0],c[0], 1'b0, r[0], d[0]);
    one_bit_adder add1 (a[1], b[1],c[1], d[0], r[1], d[1]);
    one_bit_adder add2 (a[2], b[2],c[2],d[1], r[2], d[2]);
    one_bit_adder add3 (a[3], b[3],c[3],d[2], r[3], d[3]);
    one_bit_adder add4 (a[4], b[4],c[4],d[3], r[4], d[4]);
    one_bit_adder add5 (a[5], b[5],c[5],d[4], r[5], d[5]);
    one_bit_adder add6 (a[6], b[6],c[6],d[5], r[6], d[6]);
    one_bit_adder add7 (a[7], b[7],c[7],d[6], r[7], d[7]);
    
    assign c_out = d[7];
    
endmodule