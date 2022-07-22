/* b1 b2 s  ns
   0  0  0  0
   0  0  1  1
   0  1  0  0
   0  1  1  0
   1  0  0  1
   1  0  1  0
   1  1  0  1
   1  1  1  1 */


`timescale 1ns/1ns
module flipflop(input B1, B2, clk, output reg qt,qtt);
    initial begin 
         qt=1'b0;
         qtt=1'b0;
    end

    always@(posedge clk) begin
        qt=qtt;
        qtt=(~qtt & B1 & ~B2) | (B1 & B2) | (qtt & ~B1 & ~B2);
    end
endmodule

module tb;
    reg B1=0;   
    reg B2=0;   
    reg clk=0;
    wire qt;
    wire qtt;
    flipflop flip(B1, B2, clk, qt,qtt);
    always begin
        clk=~clk;
        #10;
    end
    initial begin
        B1=0;   B2=0; 
        $monitor("B1=%b B2=%b qt=%b qtt=%b",B1,B2,qt,qtt);
        #40;
        B1=0;   B2=1;  
        #40;
        B1=1;   B2=0;   
        #40;
        B1=1;   B2=1;  
        #40;
        $finish;
    end



endmodule