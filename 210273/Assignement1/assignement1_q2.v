`timescale 1ns/1ns
module flipflop(input B1, B2, clk, output reg Q);
    initial begin 
         Q=0;
    end

    always@(posedge clk) begin
        Q=(~Q & B1) | (B1 & B2) | (Q & ~B1 & ~B2);
    end
endmodule

module tb;
    reg B1=0;   
    reg B2=0;   
    reg clk=0;
    wire Q;
    flipflop flip(B1, B2, clk, Q);
    always begin
        clk=~clk;
        #10;
    end
    initial begin
        B1=0;   B2=1; 
        $monitor("B1=%b B2=%b Q=%b",B1,B2,Q); 
         #40;
        B1=1;   B2=0;  
         #40;
        B1=1;   B2=1;   
        #40;
        B1=0;   B2=0;  
         #40;
        
    end



endmodule

