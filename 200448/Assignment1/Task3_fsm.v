`timescale 1ms/1ms
module heat_fsm(input wire [4:0] temp, input clk, output reg [1:0] state);

    //reg [1:0] state;

    initial begin
        state = 2'b00;
        //out = 2'b00;
    end

    always @(posedge clk)
    begin
        if (state==2'b00)
        begin
            if (temp<12) begin
            //heat
            state = 2'b10;
            end else if (temp>18) begin
            //cool
            state = 2'b01;  
            end
        end
        else if (state==2'b01)
        begin
            if (temp<8) begin
            //heat
            state = 2'b10;
            end else if (temp<14) begin
            //neutral 
            state = 2'b00; 
            end
        end
        else if (state==2'b10)
        begin
            if (temp>26) begin
            //cool
            state = 2'b01;
            end else if (temp>20) begin
            //neutral
            state = 2'b00;
            end
        end

        //out = state;
    end

endmodule

module tb;

    reg [4:0] temp_level;
    reg clk;
    wire [1:0] out;

    always begin
        #5
        clk = ~clk;
    end

    heat_fsm thermos(temp_level, clk, out);

    always @(negedge clk) begin
        $display("temperature = %d, state = %b", temp_level, out);
    end

    initial begin
        clk = 0;
        temp_level = 16;

        $dumpfile("heat_fsm.vcd");
        $dumpvars(0, tb);
        
        #10;
        temp_level = 10;
        #10;
        temp_level = 15 ;
        #10;
        temp_level = 20;
        #10;
        temp_level = 30;
        #10;
        temp_level = 25;
        #10;
        temp_level = 20;
        #10;
        temp_level = 9;
        #10;
        temp_level = 5;
        #10;
        temp_level = 14;
        #10;
        $finish;
    end

endmodule
