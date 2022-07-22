module flip_flop(inp1, inp2, clk, q1, q2);

input clk, inp1, inp2;
output reg q1, q2;

initial begin
    q1=0;
    q2 = 0;
end

always@(posedge clk)begin

if(inp2 == 1'b1)
begin
q2=inp1;

end

else if((inp2 == 1'b0) & (inp1 == 1'b0))
begin
q2=q1;

end

else if((inp2 == 1'b0) & (inp1 == 1'b1))
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



flip_flop ans(B1, B2, CLK, Q1, Q2);


always @(posedge CLK) begin
       $display(" B1 = %b, B2 = %b, Q1 = %b, Q2 = %b",B1, B2, Q1, Q2);
    end


always begin
  #5;
   CLK = ~CLK;  
end 
initial begin 

CLK=0; B1= 0; B2= 0;
 

 #10; B1= 0; B2= 0; 
 #10; B1= 0; B2= 1; 
 #10;  B1= 1; B2=0; 
 #10;  B1= 1; B2=1; 
 #10;  B1= 0; B2=1; 
#10;
 $finish;
end 
endmodule