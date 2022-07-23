module one_bit_adder (
    input a, b, c_in, output r, c_out 
);  
    assign r = (a ^ b ^ c_in);
    assign c_out = (a & b) | (b & c_in) | (a & c_in);
    
endmodule

module four_bit_subtracter(
    input wire [3:0] a, b,
    input carry_in,
    output wire [3:0] r, output wire c_out
);
    wire [3:0] c;
    one_bit_adder adder0 (a[0], ~b[0], carry_in, r[0], c[0]);
    one_bit_adder adder1 (a[1], ~b[1], c[0], r[1], c[1]);
    one_bit_adder adder2 (a[2], ~b[2], c[1], r[2], c[2]);
    one_bit_adder adder3 (a[3], ~b[3], c[2], r[3], c[3]);
    assign c_out = c[3];
    
endmodule

module eigth_bit_subtracter (
    input wire [7:0] a,b,
    output wire [7:0] r, output wire c_out
);
    wire [1:0] d;
    four_bit_subtracter ans0(a[3:0],b[3:0],1'b1,r[3:0],d[0]);
    four_bit_subtracter ans1(a[7:4],b[7:4],d[0],r[7:4],d[1]);
    assign c_out=d[1];
    
endmodule

module tb;

    reg [7:0] A, B;
    wire [7:0] R;
    wire C_out;

    eigth_bit_subtracter subtracter(A, B, R, C_out);

    initial begin
        A = 0;
        B = 0;
        #2;
        $display("A = %d, B = %d, R = %d, Carry = %d", A, B, R, C_out);
        $monitor("A = %d, B = %d, R = %d, Carry = %d", A, B, R, C_out);

        repeat(10) begin
            A = $random;
            B = $random;
            #15;
        end
    
    end

endmodule