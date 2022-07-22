module flip(b1, b2, clk, q1, q2);

    input clk, b1, b2;
    output reg q1, q2;

    initial begin
        q1 = 0;
        q2 = 0;
    end

    always@(posedge clk)begin

        if(b2 == 1'b1)begin
            q2=b1;
        end

        else if((b2 == 1'b0) & (b1 == 1'b0))begin
            q2=q1;
        end

        else if((b2 == 1'b0) & (b1 == 1'b1))begin
            q2=~q1;
        end

    end
    always @(negedge clk ) begin
        q1 = q2;
    end

endmodule

module tb;
    reg b1, b2, clk;
    wire q1, q2;


    flip ans(b1, b2, clk, q1, q2);

    always begin
    #5;
    clk = ~clk;  
    end 

    always @(posedge clk) begin
        $display("B1 = %b, B2 = %b, Q1 = %b, Q2 = %b", b1, b2, q1, q2);
    end

    initial begin 
        clk=0; b1= 0; b2= 0;
        #10; b1 = 0; b2 = 0; 
        #10; b1 = 0; b2 = 0; 
        #10; b1 = 1; b2 = 0; 
        #10; b1 = 1; b2 = 1; 
        #10; b1 = 0; b2 = 1; 
        #10;
        $finish;
    end 

endmodule