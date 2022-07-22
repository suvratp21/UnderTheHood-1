module fsm(input [4:0] inp, clk, output reg out, s); 

    reg state, next_state; // * inp is the temp

    initial begin
        state = 2'b0;
        next_state = 2'b0;
        out = 2'b0;
    end

    always @(posedge clk) begin
        if (state == 2'b10) begin
            if(inp > 5'b11010)begin
                next_state=2'b01;
            end
            else if (inp > 5'b10100)begin
                next_state=2'b00;
            end
            else begin
                next_state=state;
            end
        end
         if (state == 2'b01) begin
            if(inp < 5'b01110)begin
                next_state=2'b00;
            end
            else if (inp < 5'b01000)begin
                next_state=2'b10;
            end
            else begin
                next_state=state;
            end
        end
         if (state == 2'b00) begin
            if(inp < 5'b01100)begin
                next_state=2'b10;
            end
            else if (inp > 5'b10010)begin
                next_state=2'b01;
            end
            else begin
                next_state=state;
            end
        end
        
    
    end

    always @(negedge clk) begin
        if (next_state == 2'b00) begin
            out = 2'b00;
        end 
        else if (next_state == 2'b01 ) begin
            out = 2'b01;
        end
        else  begin
            out = 2'b10;
        end

    end

    always @(negedge clk) begin
        state = next_state;
        s = next_state;
    end

endmodule
