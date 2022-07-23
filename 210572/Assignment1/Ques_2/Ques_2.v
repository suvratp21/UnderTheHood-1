`timescale 1ns/1ns

module flipflop(A, B, clk, Q);

    input A, B, clk;
    output reg Q;

    initial begin
        Q = 0;
    end


    always @(posedge clk ) begin
        if((A == 0) & (B == 0) & (Q == 0)) begin
            Q = Q;
        end else if((A == 0) & (B == 0) & (Q == 1)) begin
            Q = Q;
        end else if((A == 0) & (B == 1) & (Q == 0)) begin
            Q = Q;
        end else if((A == 0) & (B == 1) & (Q == 1)) begin
            Q = ~Q;
        end else if((A == 1) & (B == 0) & (Q == 0)) begin
            Q = ~Q;
        end else if((A == 1) & (B == 0) & (Q == 1)) begin
            Q = ~Q;
        end else if((A == 1) & (B == 1) & (Q == 0)) begin
            Q = ~Q;
        end else if ((A == 1) & (B == 1) & (Q == 1)) begin
            Q = Q;
        end

    end
    
endmodule

module tb_Ques_2;

    reg A = 0, B = 0, clk = 0;
    wire Q;

    flipflop flipflop_1(A, B, clk, Q);

    always begin
        clk = ~clk;
        #20;
    end

    initial begin

        $dumpfile("Ques_2.vcd");
        $dumpvars(0 ,tb_Ques_2);
        repeat(10) begin
            #5;
            #20;
            A = $random;
            B = $random;
            #20;
            $display("A = %b, B = %b, Q = %b", A, B, Q);

        end
        $finish;
    end
    
    
endmodule