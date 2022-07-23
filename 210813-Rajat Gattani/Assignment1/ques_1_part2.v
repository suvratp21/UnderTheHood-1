module one_bit_adder (
    input a,b,c,c_in,
    output r, c_out
);
    assign r= (a&b) | (b&c_in) | (~b& ~c_in);
    assign c_out= (a&c) | (~a&~c) | (a&c_in);
endmodule

module eight_bit_adder (
    input [7:0] a,b,c,
    input [1:0] opcode,
    output[7:0] R, c_out,
    output C_out
);
    reg[7:0] A,B,C;

    always @(A or B or C) begin
        if(opcode==2'b00) begin
            B = ~b+1;
            C = ~c+1;
        end
        else if(opcode==2'b10) begin
            C=~c+1;
        end
        else if(opcode==2'b01) begin
            B=~b+1;
        end
    end
    one_bit_adder adder1(A[0],B[0],C[0],1'b0,R[0],c_out[0]);
    one_bit_adder adder2(A[1],B[1],C[1],c_out[0],R[1],c_out[1]);
    one_bit_adder adder3(A[2],B[2],C[2],c_out[1],R[2],c_out[2]);
    one_bit_adder adder4(A[3],B[3],C[3],c_out[2],R[3],c_out[3]);
    one_bit_adder adder5(A[4],B[4],C[4],c_out[3],R[4],c_out[4]);
    one_bit_adder adder6(A[5],B[5],C[5],c_out[4],R[5],c_out[5]);
    one_bit_adder adder7(A[6],B[6],C[6],c_out[5],R[6],c_out[6]);
    one_bit_adder adder8(A[7],B[7],C[7],c_out[6],R[7],c_out[7]);
    assign C_out=c_out[7];
    
endmodule
module tb;
      reg [7:0] A,B,C;
      wire [7:0] R, c_out;
      wire C_out;
      reg [1:0] opcode;

      eight_bit_adder adder(A,B,C,opcode,R,c_out,C_out);
      
      initial begin
        A = 0;
        B = 0;
        C = 0;
        opcode=2'b11;
        #2;
        $display("A = %d, B = %d, C = %d, opcode = %d, R = %d, Carry = %d", A, B, C,opcode, R, C_out);
        $monitor("A = %d, B = %d, C = %d, opcode = %d, R = %d, Carry = %d", A, B, C,opcode, R, C_out);

        repeat(10) begin
            A = $random;
            B = $random;
            C = $random;
            opcode=$random;
            #15;
        end
    end
endmodule