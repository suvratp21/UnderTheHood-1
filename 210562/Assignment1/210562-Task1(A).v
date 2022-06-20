/*DEFINE NEW ADDITION*/
module addition(
    input a,b,c,d,
    output r
    );
    /* f(A,B,C,D) == (A + ~B + D). (B + ~D) */
    assign r = (a|~b|d) & (b|~d);

endmodule

/*DEFINE ONE BIT ADDER USING NEW ADDITION*/
module one_bit_add(
    input b1,b2,b3,c_in,
    output r,c_out
    );
    // r = f(b1,b2,b3,c_in) 
    addition result(b1,b2,b3,c_in,r);
    // c_out = f(c_in, b1,b2,b3) 
    addition cout(c_in,b1,b2,b3,c_out);

endmodule

/*MAKE 8-BIT ADDER TO ADD THREE NUMBERS*/
module add_three_num(
    input wire [7:0] A,B,C,
    output wire [7:0] r, output wire c_out
    );

    wire [7:0] c; /*TRANSFER CARRY*/
    wire d;
    assign d = 1'b0;

    one_bit_add add0(A[0],B[0],C[0],d,r[0],c[0]);
    one_bit_add add1(A[1],B[1],C[1],c[0],r[1],c[1]);
    one_bit_add add2(A[2],B[2],C[2],c[1],r[2],c[2]);
    one_bit_add add3(A[3],B[3],C[3],c[2],r[3],c[3]);
    one_bit_add add4(A[4],B[4],C[4],c[3],r[4],c[4]);
    one_bit_add add5(A[5],B[5],C[5],c[4],r[5],c[5]);
    one_bit_add add6(A[6],B[6],C[6],c[5],r[6],c[6]);
    one_bit_add add7(A[7],B[7],C[7],c[6],r[7],c[7]);

    assign c_out = c[7];
    
endmodule

/*TEST BENCH*/
module tb;

    reg [7:0] A, B,C;
    wire [7:0] R;
    wire C_out;

    add_three_num finale(A, B, C, R, C_out);

    initial begin
        $display(" A   B   C   Sum");
        $monitor("%d %d %d  %d", A, B, C, R);

        repeat(10) begin
            A = $random;
            B = $random;
            C = $random;
            #25;
        end
    
    end

endmodule