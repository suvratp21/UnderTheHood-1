module SR_FF (
    input s,r,clk, output reg q
);
    initial begin
        q=0;
    end
    always @(posedge clk) begin
        q=(~s&~r&q)|(s&~r&~q)|(s&r);
    end
endmodule


module tb;
    reg s,r,clk;
    wire q;

    SR_FF solve(s,r,clk,q);

    initial begin
        clk=0;
        s=0;
        r=0;
        #20;
        $display("s=%b r=%b q=%b",s,r,q);
        #20;
        clk=1;
        s=0;
        r=0;
        #20;
        $display("s=%b r=%b q=%b",s,r,q);
        #20;
        clk=0;
        s=0;
        r=1;
        #20;
        $display("s=%b r=%b q=%b",s,r,q);
        #20
        clk=1;
        s=0;
        r=1;
        #20;
        $display("s=%b r=%b q=%b",s,r,q);
        #20;
        clk=0;
        s=1;
        r=0;
        #20;
        $display("s=%b r=%b q=%b",s,r,q);
        clk=1;
        s=1;
        r=0;
        #20;
        $display("s=%b r=%b q=%b",s,r,q);
        #20
        clk=0;
        s=1;
        r=1;
        #20;
        $display("s=%b r=%b q=%b",s,r,q);
        clk=1;
        s=1;
        r=1;
        #20;
        $display("s=%b r=%b q=%b",s,r,q);
        #20;
        $finish;
    end
endmodule