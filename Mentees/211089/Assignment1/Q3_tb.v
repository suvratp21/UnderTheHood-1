`include "Q3.v"
module tb;

    reg [4:0] tmp;
    reg clk;
    wire [1:0] out;

    always begin
        #5
        clk = ~clk;
    end

    FSM thermos(tmp, clk, out);

    always @(negedge clk) begin
        $display("temperature = %d, state = %b", tmp, out);
    end

    initial begin
        clk = 0;
        tmp = 16;

        $dumpfile("FSM.vcd");
        $dumpvars(0, tb);
        
        #10;
        tmp = 10;
        #10;
        tmp= 15 ;
        #10;
        tmp = 20;
        #10;
        tmp = 30;
        #10;
        tmp = 25;
        #10;
        tmp = 20;
        #10;
        tmp = 9;
        #10;
        tmp = 5;
        #10;
        tmp = 14;
        #10;
        $finish;
    end

endmodule