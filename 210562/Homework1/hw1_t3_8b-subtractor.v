`timescale 1ns/1ns

module one_bit_subtr(
    input a,b,c_in, output r, c_out
);
    // wire a,b,c_in;
    assign r = (a ^ (b^1'b1) ^ c_in); 
    assign c_out =  ((a&(b^1'b1)) | ((b^1'b1) &c_in) | (a & c_in)); 
endmodule

module four_bit_subtr(
    input wire [3:0] a,b, input wire d,
    output wire [3:0] r, output wire c_out
    // 7, 6, 5,4 ... 0
); 
    wire [3:0] c;

    one_bit_subtr subtr0(a[0], b[0], d, r[0], c[0]);
    one_bit_subtr subtr1(a[1], b[1], c[0], r[1], c[1]);
    one_bit_subtr subtr2(a[2], b[2], c[1], r[2], c[2]);
    one_bit_subtr subtr3(a[3], b[3], c[2], r[3], c[3]);
    assign c_out = c[3];

endmodule

module eight_bit_subtr(
    input wire [7:0] a,b, 
    output wire [7:0] r, output wire c_out
);

wire [7:0] c;

    assign d = 1'b1;
    four_bit_subtr subtr1(a[3:0], b[3:0], d, r[3:0], c_out);
    four_bit_subtr subtr2(a[7:4], b[7:4], c[3], r[7:4], c_out );
    assign c_out = c[7];
endmodule


module tb;
    reg [7:0] A,B;
    wire [7:0] R;
    wire c_out; 

    eight_bit_subtr subtr(A,B,R, C_out);

    initial begin
    $monitor("A = %d, B = %d, R = %d, Carry = %d", A,B,R,C_out);

    repeat(15) begin
        A = $random;
        B = $random; 
        #15;  
    end 
    end 
endmodule
