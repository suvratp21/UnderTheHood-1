// * flip flop-> reg

module simple(input a, b, output reg c);

    // c = a^b if c=0
    // c = a&b, c=1

    // * c_new = ((~c_old) & (a^b)) | (c_old & (a&b));
    
    // initial begin
    //     c = 1'b0;
    // end
    // wire tempResult1;    
    // adder add1(a, b, op, tempResult1);
    // wire tempResult2;
    // adder add2(a, ~b, op, tempResult2);

    initial begin
        c = 0;
    end

    always @(a or b) begin
        c = ((~c) & (a^b)) | (c & (a&b));
        // if (op == 1'b0) begin
        //     // addition
        //     c = tempResult1;
        // end else begin
        //     // subtraction
        //     c = tempResult2;
        // end
    end

    always @(b or a) begin
        c =  a|b;
    end

endmodule

module tb;

    reg a, b;
    wire c;

    simple simp1(a, b, c);
    simple simp2(a, b, c);

    initial begin
        a = 1;
        b = 1;

        $monitor("a = %b, b= %b, c = %b", a, b, c);

        #5;
        a=1; b=0;
        #5;
        a =0; b = 1;
        #5;
        a = 0; b = 0;
        #5;
    end

endmodule