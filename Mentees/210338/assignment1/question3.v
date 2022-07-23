`timescale 1ns/1ns
module fsm(input [4:0] inp, input clk, output reg [1:0]out);

    reg [1:0] curr_st, nxt_st;

    initial begin
        curr_st = 2'b00;
        nxt_st = 2'b10;
    
    end

    always @(posedge clk) begin
        if (curr_st == 2'b00) begin
            if(inp < 12)begin
                nxt_st = 2'b10;
            end 
            else if(inp > 18)begin
                nxt_st = 2'b01;
            end 
            else begin
                nxt_st = curr_st;
            end
        end
         else if(curr_st == 2'b10) begin
            if(inp > 26) begin
                nxt_st = 2'b01;
            end 
            else if(inp > 20)begin
                nxt_st = 2'b00;
            end
             else begin
                nxt_st = curr_st;
            end
        end
         else begin
            if(inp < 8) begin
                nxt_st = 2'b10;
            end 
            else if(inp < 14) begin
                nxt_st = 2'b00;
            end 
            else begin
                nxt_st = curr_st;
            end
        end
    end

    always @(negedge clk) begin
    
           curr_st = nxt_st;
    end
  always @(negedge clk) begin
 
           out = nxt_st;
    end
  

endmodule


module tb;

    reg clk;
    reg [4:0] inp;
    wire [1:0] out;

    fsm f(inp, clk, out);

    always begin
        #5;
        clk = ~clk;
    end

    always @(posedge clk) begin
        $display("inp = %d, o = %b", inp, out);
    end

    initial begin
        clk = 0;
      
        inp = 0;
        #10; 
        inp = 15;
        #10;
        inp = 25;
        #10;
        inp = 10;
        #10;
        inp = 19;
        #10;
        inp = 27;
        #10;
        inp = 13;
        #10;
        inp = 9;
        #10;
        inp = 3;
        #10;
        inp = 23;
        #10;

        $finish;
    end
    
endmodule
// result delay of one cycle