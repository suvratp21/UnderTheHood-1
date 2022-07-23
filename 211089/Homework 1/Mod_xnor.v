module Mod_xnor (a,b,c);
    input a,b;
    output c;

    assign c= (a ^b)^1;
    
endmodule