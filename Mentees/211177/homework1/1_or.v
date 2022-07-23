`timescale 1ns/1ns


module ormod(A, B, C);
   input A;
   input B;
   output C;
   assign C = A|B;
 endmodule

module tb;
    
     reg A, B;
     wire C;

     ormod ans(A, B, C);

     initial begin
        A = 0;
        B = 0;
        #3;
        $display("A=%b, B=%b, C=%b", A, B, C);
        #16;
        A = 0;
        B = 1;
        #3;
        $display("A=%b, B=%b, C=%b", A, B, C);
        #20;
        A = 1;
        B = 0;
        #3;
        $display("A=%b, B=%b, C=%b", A, B, C);
        #21;
        A = 1;
        B = 1;
        #3;
        $display("A=%b, B=%b, C=%b", A, B, C);
        end
endmodule
