`timescale 1ns/1ns

module or_gate(A,B,C);
    input A;
    input B;
    output C;

    /* C is assigned with A 'or' B */
    assign C = A | B; 
endmodule

/* creating test bench */
module tb; 
    reg A,B; 
    wire C;

or_gate orz(A,B,C);

initial begin
    /* creating dump file and setting all variables to 0 in test bench*/
    $dumpfile("or.vcd");
    $dumpvars(0, tb);

    /* to monitor changes in variable*/
    $display("A B C");
    $monitor("%b %b %b", A,B,C);
    
    A = 0;
    B = 0;
    #20;
    A = 0;
    B = 1;
    #20;
    A = 1;
    B = 0;
    #20; 
    A = 1;
    B = 1;
    #20;
end
endmodule
