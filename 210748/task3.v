module subtractor ( input a, b, c1, output r, c2);
assign r= (a^(~b)^c1);
assign c2 = (a & (~b)) | ((~b) & c1) | (c1 & a);
endmodule
module four_bit (input wire [3:0] a, b, input wire c, output wire [3:0] r, c2);
subtractor a0 (a[0], b[0], c, r[0], c2[0]);
subtractor a1 (a[1], b[1], c2[0], r[1], c2[1]);
subtractor a2 (a[2], b[2], c2[1], r[2], c2[2]);
subtractor a3 (a[3], b[3], c2[2], r[3], c2[3]);
endmodule
module eight_bit (input wire [7:0] a, b, output wire [7:0] r, output wire [7:0] c);

four_bit a0 (a[3:0], b[3:0], 1'b1, r[3:0], c[3:0]);
four_bit a1 (a[7:4], b[7:4], c[3], r[7:4], c[7:4]);

endmodule
module tb;
reg[7:0] A, B;
wire[7:0] R;
wire [7:0] C2;
eight_bit eight (A,B,R,C2);
initial begin
    A=0;
    B=0;
    #2;
    $monitor("A=%d,B=%d,R=%d,Carry=%d",A,B,R,C2);
    repeat(10) begin
    A=$random;
    B=$random;
    #15;
    end
end
endmodule

