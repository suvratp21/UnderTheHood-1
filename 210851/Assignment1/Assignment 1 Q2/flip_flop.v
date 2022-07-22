module flipflop(b1, b2, clk, q1, q2);

    input clk, b1, b2;
    output reg q1, q2;

    initial begin
        q1 = 0;
        q2 = 0;
    end

    always@(posedge clk)begin

    if(b2 == 1'b1)
    begin
        q2=b1;
    end

    else if((b2 == 1'b0) & (b1 == 1'b0))
    begin
        q2=q1;
    end

    else if((b2 == 1'b0) & (b1 == 1'b1))
    begin
        q2=~q1;
    end

    end
    always @(negedge clk ) begin
        q1 = q2;
    end
endmodule

module tb;
    reg B1, B2, CLK;
    wire Q1, Q2;


    flipflop soln(B1, B2, CLK, Q1, Q2);

    always begin
    #5;
    CLK = ~CLK;  
    end 

    always @(posedge CLK) begin
        $display("B1 = %b, B2 = %b, Q1 = %b, Q2 = %b", B1, B2, Q1, Q2);
    end

    initial begin 
        CLK=0; B1= 0; B2= 0;
        #10; B1 = 0; B2 = 0; 
        #10; B1 = 0; B2 = 0; 
        #10; B1 = 1; B2 = 0; 
        #10; B1 = 1; B2 = 1; 
        #10; B1 = 0; B2 = 1; 
        #10;
        $finish;
    end 

endmodule