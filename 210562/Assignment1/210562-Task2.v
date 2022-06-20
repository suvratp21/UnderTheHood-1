/* Implement a positive edge-triggered flip-flop 
which takes in two bits as inputs and outputs a 
single bit.
Truth Table: 
    B1  B2  Qt  Qt+1
    0   0   0   0
    0   0   1   1
    0   1   0   0
    0   1   1   0
    1   0   0   1
    1   0   1   0
    1   1   0   1
    1   1   1   1
*/
`timescale 1ns/1ns

module flipflop(
    input b1, b2, clk,
    output reg Q
);

always@(posedge clk)
begin
    Q = ((Q^b1) & ~b2) | (b1 & b2) ; 
end

endmodule

module tb;
    reg B1=0;   
    reg B2=0;   
    reg clk=0;
    wire Q;

    // assign Q = 0; 

    flipflop anything(B1, B2, clk, Q);

    always begin
        clk = ~clk;
        #10; 
    end

    initial begin
        $dumpfile("flipflop.vcd");
        $dumpvars(0, tb);
        $monitor("B1=%b, B2=%b, Q=%b", B1,B2,Q);
        B1=0; B2=0; #40;
        B1=0; B2=0; #45;
        B1=0; B2=1; #40;
        B1=0; B2=1; #45;
        B1=0; B2=1; #40;
        B1=1; B2=0; #45;
        B1=1; B2=0; #40;
        B1=1; B2=1; #45;
        B1=1; B2=1; #40;
        B1=0; B2=0; #45;
        B1=0; B2=0; #40;
        B1=0; B2=1; #45;
        B1=0; B2=1; #40;
        B1=0; B2=1; #45;

        $finish; 
    end 
endmodule



