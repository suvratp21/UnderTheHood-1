
module one_bit_adder(
    input a, b, c_in, output r, c_out 
);  
    // wire a, b, c_in;
    assign r = (a ^ (~b) ^ c_in);
    assign c_out = (a & (~b)) | ((~b) & c_in) | (a & c_in);
    
endmodule

module four_bit_sub1(
    input wire [3:0] a, b, 
    output wire [3:0] r, output wire c_out1
    // * 7 6 .. 0
);

    wire [3:0] c;
    one_bit_adder adder0 (a[0], b[0], 1'b1, r[0], c[0]);
    one_bit_adder adder1 (a[1], b[1], c[0], r[1], c[1]);
    one_bit_adder adder2 (a[2], b[2], c[1], r[2], c[2]);
    one_bit_adder adder3 (a[3], b[3], c[2], r[3], c[3]);
 
    assign c_out1 = c[3];
    
endmodule

module four_bit_sub2(
    input wire [3:0] a, b, input c_out1,
    
    output wire [3:0] r, output wire c_out2
    // * 7 6 .. 0
);

    wire [3:0] c;
   one_bit_adder adder4 (a[4], b[4], c_out1, r[0], c[0]);
    one_bit_adder adder5 (a[5], b[5], c[0], r[1], c[1]);
    one_bit_adder adder6 (a[6], b[6], c[1], r[2], c[2]);
    one_bit_adder adder7 (a[7], b[7], c[2], r[3], c[3]);
 
    assign c_out2 = c[3];
    
endmodule

module tb;

    reg [7:0] A, B;
    wire [7:0] R;
   wire [3:0] r1,r2;
    wire cout1,cout2;

    four_bit_sub1 ans1(A, B, r1, cout1);
    four_bit_sub2 ans2(A, B, cout1, r2, cout2);
assign R[0]=r1[0];
assign R[1]=r1[1];
assign R[2]=r1[2];
assign R[3]=r1[3];
assign R[4]=r2[0];
assign R[5]=r2[1];
assign R[6]=r2[2];
assign R[7]=r2[3];
    initial begin
        A = 0;
        B = 0;
        #2;

        $monitor("A = %d, B = %d, R = %d, Carry = %b", A, B, R, cout2);

        repeat(10) begin
            A = $random;
            B = $random;
            #15;
        end
    
    end

endmodule