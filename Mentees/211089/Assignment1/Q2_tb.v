`timescale 1ns/1ps
`include "Q2.v"
module tb;
    reg B1=0;   
    reg B2=0;   
    reg clk=0;
    wire Q;
    flip_flop f(B1, B2, clk, Q);
    always begin
        clk=clk ^1;
        #5;
    end
    initial begin
        B1=0;   
        B2=0; 
        $monitor("B1=%b B2=%b Q=%b",B1,B2,Q); 
        #20;
        B1=0;   B2=1;  
        #20;
        B1=1;   B2=0;   
        #20;
        B1=0;   B2=1;  
        #20;
    end
endmodule