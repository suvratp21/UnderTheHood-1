module one_bit_subtract (
    input a, b, c_in, output r, c_out 
);  
    assign r = (a ^ b) ^ c_in;
    assign c_out = ((a&(b^1'b1)) | ((b^1'b1) &c_in) | (a & c_in));
    
endmodule

module four_bit_subtract(
    input wire [3:0] a, b, 
    output wire [3:0] r, output wire c_out
);

    wire [3:0] c;
    one_bit_subtract sub0 (a[0], b[0], 1'b0, r[0], c[0]);
    one_bit_subtract sub1 (a[1], b[1], c[0], r[1], c[1]);
    one_bit_subtract sub2 (a[2], b[2], c[1], r[2], c[2]);
    one_bit_subtract sub3 (a[3], b[3], c[2], r[3], c[3]);
    assign c_out = c[3];
    
endmodule

module eight_bit_subtract(
    input wire [7:0] a, b, 
    output wire [7:0] r, output wire c_out
);

    wire [1:0] c;
    four_bit_subtract sube0 (a[3:0], b[3:0], r[3:0] , c[0]);
    four_bit_subtract sube1 (a[7:4], b[7:4], r[7:4] , c[1]);
    // one_bit_subtract sube1 (a[1], b[1], c[0], r[1], c[1]);
    assign c_out = c[1];
    
endmodule
