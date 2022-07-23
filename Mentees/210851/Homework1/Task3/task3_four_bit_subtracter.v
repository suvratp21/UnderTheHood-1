module one_bit_adder (
    input a, b, c_in, output r, c_out
);
    assign r = (a ^ b ^ c_in);
    assign c_out = (a&b) | (b&c_in) | (a&c_in);

endmodule

module flip(
    input b, output bdash
);
    assign bdash = ~b;

endmodule

module four_bit_subtracter(
    input wire [3:0] a, bold, input wire c_in,
    output wire [3:0] r, output wire c_out
);

    wire [3:0] c;
    wire [3:0] bnew;
    flip flip0(bold[0], bnew[0]);
    flip flip1(bold[1], bnew[1]);
    flip flip2(bold[2], bnew[2]);
    flip flip3(bold[3], bnew[3]);
    
    one_bit_adder adder0 (a[0], bnew[0], c_in, r[0], c[0]);
    one_bit_adder adder1 (a[1], bnew[1], c[0], r[1], c[1]);
    one_bit_adder adder2 (a[2], bnew[2], c[1], r[2], c[2]);
    one_bit_adder adder3 (a[3], bnew[3], c[2], r[3], c[3]);
    assign c_out = c[3];


endmodule

module eight_bit_subtracter(
    input wire [7:0] a, bold,
    output wire [7:0] r, output wire c_out2
);
    wire c_out1;
    four_bit_subtracter sub1(a[3:0], bold[3:0], 1'b1, r[3:0], c_out1);
    four_bit_subtracter sub2(a[7:4], bold[7:4], c_out1, r[7:4], c_out2);

    
endmodule