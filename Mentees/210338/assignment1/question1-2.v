
module one_bit_adder (
    input a,b,c,c_in, output r, c_out
);  
    // wire a, b, c_in;

    assign r = ((~a)|b|(~c_in))&(a|b|(~c_in))&(a|(~b)|c_in);
    assign c_out = ((~c_in)|a|(~c))&(c_in|a|(~c))&(c_in|(~a)|c);
    
endmodule

module eight_bit_adder(
    input wire [7:0] a, b, c, input wire [1:0] op,
    output wire [7:0] r, output wire c_out
    // * 7 6 .. 0
);

    wire [7:0] c_temp;


 

//10---->-a       01----->-b         11------->-c      00----->all positive
    one_bit_adder adder1 (a[1]^(op[1] & ~op[0]), b[1]^(~op[1] & op[0]), c[1]^(op[0] & op[1]), c_temp[0], r[1], c_temp[1]);
    one_bit_adder adder0 (a[0]^(op[1] & ~op[0]), b[0]^(~op[1] & op[0]), c[0]^(op[0] & op[1]), op[0] | op[1], r[0], c_temp[0]);
    one_bit_adder adder3 (a[3]^(op[1] & ~op[0]), b[3]^(~op[1] & op[0]), c[3]^(op[0] & op[1]), c_temp[2], r[3], c_temp[3]);
    one_bit_adder adder2 (a[2]^(op[1] & ~op[0]), b[2]^(~op[1] & op[0]), c[2]^(op[0] & op[1]), c_temp[1], r[2], c_temp[2]);
    one_bit_adder adder4 (a[4]^(op[1] & ~op[0]), b[4]^(~op[1] & op[0]), c[4]^(op[0] & op[1]), c_temp[3], r[4], c_temp[4]);
    one_bit_adder adder5 (a[5]^(op[1] & ~op[0]), b[5]^(~op[1] & op[0]), c[5]^(op[0] & op[1]), c_temp[4], r[5], c_temp[5]);
    one_bit_adder adder6 (a[6]^(op[1] & ~op[0]), b[6]^(~op[1] & op[0]), c[6]^(op[0] & op[1]), c_temp[5], r[6], c_temp[6]);
    one_bit_adder adder7 (a[7]^(op[1] & ~op[0]), b[7]^(~op[1] & op[0]), c[7]^(op[0] & op[1]), c_temp[6], r[7], c_temp[7]);
       assign c_out = c_temp[7];
  
    
endmodule