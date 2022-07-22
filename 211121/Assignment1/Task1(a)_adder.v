module one_bit_adder (
    input b1, b2, b3, c_in, output r, c_out 
);
    assign r =  ( ~b2| b1 | c_in ) & ( b2 | ~c_in );
    assign c_out = ( b1 | ~b3 ) & ( ~b1 | c_in | b3 );
    
endmodule

module eight_bit_adder(
    input wire [7:0] b1, b2, b3, 
    output wire [7:0] r, output wire c_out
);

    wire [7:0] c;
    one_bit_adder adder0 (b1[0], b2[0], b3[0], 1'b0, r[0], c[0]);
    one_bit_adder adder1 (b1[1], b2[1], b3[1], c[0], r[1], c[1]);
    one_bit_adder adder2 (b1[2], b2[2], b3[2], c[1], r[2], c[2]);
    one_bit_adder adder3 (b1[3], b2[3], b3[3], c[2], r[3], c[3]);
    one_bit_adder adder4 (b1[4], b2[4], b3[4], c[3], r[4], c[4]);
    one_bit_adder adder5 (b1[5], b2[5], b3[5], c[4], r[5], c[5]);
    one_bit_adder adder6 (b1[6], b2[6], b3[6], c[5], r[6], c[6]);
    one_bit_adder adder7 (b1[7], b2[7], b3[7], c[6], r[7], c[7]);
    assign c_out = c[7];
    
endmodule

module tb;

    reg [7:0] b1, b2, b3;
    wire [7:0] r;
    wire c_out;

    eight_bit_adder adder(b1,b2,b3,r,c_out);

    initial begin
        b1 = 0;
        b2 = 0;
        b3 = 0;
        #2;

        $monitor("b1 = %b, b2 = %b, b3 = %b, r=%b, Carry = %b", b1, b2, b3,r, c_out);

        repeat(5) begin
            b1 = $random;
            b2 = $random;
            b3 = $random;
            #15;
        end
    
    end

endmodule