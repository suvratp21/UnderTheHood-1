module one_bit_adder (a, b, c_in, r, c_out);
    input a;
    input b;
    input c_in;
    output r;
    output c_out;

    assign r = (a ^ b ^ c_in);
    assign c_out = (a & b) | (b & c_in) | (a & c_in);
    
endmodule

/*
//////////////////////////////////////////////////////////////

module twos_comp(a, r);
    input [7:0] a;
    output [7:0] r;

    wire [7:0] c;
    one_bit_adder ad0 (~a[0], 1'b1, 1'b0, r[0], c[0]);
    one_bit_adder ad1 (~a[1], 1'b0, c[0], r[1], c[1]);
    one_bit_adder ad2 (~a[2], 1'b0, c[1], r[2], c[2]);
    one_bit_adder ad3 (~a[3], 1'b0, c[2], r[3], c[3]);
    one_bit_adder ad4 (~a[4], 1'b0, c[3], r[4], c[4]);
    one_bit_adder ad5 (~a[5], 1'b0, c[4], r[5], c[5]);
    one_bit_adder ad6 (~a[6], 1'b0, c[5], r[6], c[6]);
    one_bit_adder ad7 (~a[7], 1'b0, c[6], r[7], c[7]);
    
endmodule


//////////////////////////////////////////////////////////////////
*/

module four_bit_subtractor(a, b, carry_in, r, c_out);
    input [3:0] a, b;
    input carry_in;
    output [3:0] r;
    output c_out;

    wire [3:0] c;
    one_bit_adder adder0 (a[0], ~b[0], carry_in, r[0], c[0]);
    one_bit_adder adder1 (a[1], ~b[1], c[0], r[1], c[1]);
    one_bit_adder adder2 (a[2], ~b[2], c[1], r[2], c[2]);
    one_bit_adder adder3 (a[3], ~b[3], c[2], r[3], c[3]);
    assign c_out = c[3];
    
endmodule

module eight_bit_subtractor(a, b, r, c_out);

    input [7:0] a, b;
    output [7:0] r;
    output c_out;

    //wire [7:0] ir;
    wire [1:0] c;
    four_bit_subtractor sub0 (a[3:0], b[3:0], 1'b1, r[3:0], c[0]);
    four_bit_subtractor sub1 (a[7:4], b[7:4], c[0], r[7:4], c[1]);
    assign c_out = c[1];

    // Attempt to take 2's complement if carry is zero
    /*
    if (c[1])
        twos_comp two (ir, r);
    else
        assign r = ir;
    */

endmodule