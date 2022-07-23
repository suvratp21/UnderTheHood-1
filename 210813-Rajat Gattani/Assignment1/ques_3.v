`timescale 1ms/1ms
module fsm(input [4:0] inp, output reg [1:0] out,s);

    reg[1:0] state, next_state;

    initial begin
        state[0]=1'b0;
        state[1]=1'b0;
        next_state[0] = 1'b0;
        next_state[1] = 1'b0;
        out[0]= next_state[0];
        out[1]=next_state[1];
    end

    always @(inp) begin
        if (state[1]==1'b1&&state[0]==1'b0) begin
            if(inp>=20) begin
                next_state[0] = 1'b0;
                next_state[1] = 1'b0;
            end
            else if(inp>=26)begin
                next_state[0] = 1'b1;
                next_state[1] = 1'b0;
            end    
        end 
        else if (state[1]==1'b0&&state[0]==1'b1) begin
            if(inp<=14) begin
                next_state[0] = 1'b0;
                next_state[1] = 1'b0;
            end
            else if(inp<=8) begin
                next_state[0] = 1'b0;
                next_state[1] = 1'b1;
            end
        end
        else begin
            if(inp<=12) begin
                next_state[0] = 1'b0;
                next_state[1] = 1'b1;
            end
            else if(inp>=18) begin
                next_state[0] = 1'b1;
                next_state[1] = 1'b0;
            end
        end
        state[0] = next_state[0];
        state[1] = next_state[1];
        s[0] = next_state[0];
        s[1] = next_state[1];
    end

endmodule


module tb;

    reg [4:0] temp;
    wire [1:0] o, s;

    fsm f(temp, o, s);

    initial begin
        $monitor("Temp= %d s= %b%b",temp,s[1],s[0]);
        temp=18;
        #15;
        temp=12;
        #15;
        temp=27;
        #15;
        temp=5;
        #15;
        temp=28;
        #15;
        temp=13;
        #15;
        temp=35;
        #15;
        temp=15;
        #15;
        temp=17;
        #15;
        temp=2;
        #15;
        temp=31;
        #15;
    end
    
endmodule