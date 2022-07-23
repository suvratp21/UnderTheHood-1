`timescale 1ns/1ns
module flip_flop(B1, B2, clk,Q);
    input B1, B2, clk;
    output reg Q;
    initial begin 
         Q=0;
    end

    always@(posedge clk) begin
        Q=(~Q & B1) | (B1 & B2) | (Q & ~B1 & ~B2);
    end
endmodule

