`timescale 1ms/1ms

module system_mode(T, clk, o);

    input [4:0] T;
    input clk;

    output reg [1:0] o;

    reg [1:0] state, next_state; // neutral mode = 0, cooling mode = 1, heating mode = 2;  

    initial begin
        //$dumpfile("Ques_3_extra.vcd");
        //$dumpvars(0, system_mode);
        state = 0;
        next_state = 0;
    end

    always @(posedge clk) begin
        if(state == 0 & (T < 12)) begin
                next_state = 2;
        end else if(state == 0 & (T < 18)) begin
                next_state = 0;
        end else if(state == 0 & (T >= 18))begin
                next_state = 1;
        end else if(state == 1 & (T < 8)) begin
                next_state = 2;
        end else if(state == 1 & (T < 14)) begin
                next_state = 0;
        end else if(state == 1 & (T >= 14)) begin
                next_state = 1;
        end else if(state == 2 & (T < 20)) begin
                next_state = 2;
        end else if(state == 2 & (T < 26)) begin
                next_state = 0;
        end else if(state == 2 & (T >= 26)) begin
                next_state = 1;
        end
       // $display("state = %b, nstate = %b", state, next_state);
    end

    always @(negedge clk) begin
        o = next_state;
        state = next_state;
    end

endmodule

module tb_Ques_3;
    
    reg [4:0] T;
    reg clk;

    wire [1:0] o;

    system_mode system_mode_1(T, clk, o);

    always begin
        #5;
        clk = ~clk;
    end 

    always @(posedge clk) begin
        $display("T = %d, o = %b", T, o,);
    end

    initial begin
    $dumpfile("Ques_3.vcd");
    $dumpvars(0 ,tb_Ques_3);

        T = 16;
        clk = 0;

        #4;

        T = 20;
        #10;
        T = 11;
        #10;
        T = 18;
        #10;
        T = 6;
        #10;
        T = 27;
        #10;
        T = 10;
        #10;
        T = 14;
        #10;
        T = 6;
        #10;
        T = 28;
        #10;
        T = 6;
        #10;
        T = 25;
        #10;

        #5;

        $finish;
    end

endmodule