module subtractor (b1, b2, c_in, r, c_out);
    input b1;
    input b2;
    input c_in;
    output r;
    output c_out;

    assign r = (b1 ^ (~b2) ^ c_in);
    assign c_out = (b1 & ~b2) | ((~b2) & c_in) | (b1 & c_in);

endmodule

module four_bit_subtractor(b1, b2, c_in, r, c_out);
    input [3:0] b1, b2;
    input c_in;
    output [3:0] r;
    output c_out;

    wire [3:0] c;
    subtractor adder0 (b1[0], b2[0], c_in, r[0], c[0]);
    subtractor adder1 (b1[1], b2[1], c[0], r[1], c[1]);
    subtractor adder2 (b1[2], b2[2], c[1], r[2], c[2]);
    subtractor adder3 (b1[3], b2[3], c[2], r[3], c[3]);
    assign c_out = c[3];

endmodule



module eight_bit_subtractor(b1, b2, r, c_out);

    input [7:0] b1, b2;
    output [7:0] r;
    output c_out;

    
    wire [1:0] c;
    four_bit_subtractor sub0 (b1[3:0], b2[3:0], 1'b1, r[3:0], c[0]);
    four_bit_subtractor sub1 (b1[7:4], b2[7:4], c[0], r[7:4], c[1]);
    assign c_out = c[1];

    

endmodule 

module tb;

    reg [7:0] A, B;
    wire [7:0] R;
    wire C_out;

    eight_bit_subtractor sub(A, B, R, C_out);

    initial begin
        A = 0;
        B = 0;
        #2;

        $monitor("A = %d, B = %d, R = %d, Carry = %d", A, B, R, C_out);

        repeat(10) begin
            A = $random;
            B = $random;
            #15;
        end
    
    end

endmodule