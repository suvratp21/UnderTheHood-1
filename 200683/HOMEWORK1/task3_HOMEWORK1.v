module halfadder(a,b,sum0,carry);
input a,b;
output sum0,carry;
 assign sum0=a^b;
and(carry,a,b);
endmodule

module fulladder(c,d,cin,cout,sum1);
input c,d,cin;
output sum1,cout;
wire temp,temp1,temp2;
halfadder a1 (.a(c),.b(d),.sum0(temp),.carry(temp1));
halfadder a2 (.a(temp),.b(cin),.sum0(sum1),.carry(temp2));
or(cout,temp1,temp2);
endmodule

module bitsubtractor(e,f,cin1,cout1,out1);
input [3:0]e,f;
input cin1;
output cout1;
output [3:0]out1;
wire w1,w2,w3;
wire ww1,ww2,ww3,ww4;
not(ww1,f[0]);
not(ww1,f[1]);
not(ww1,f[2]);
not(ww1,f[3]);
fulladder a2(.c(e[0]),.d(ww1),.cin(cin1),.cout(w1),.sum1(out1[0]));
fulladder a3(.c(e[1]),.d(ww2),.cin(w1),.cout(w2),.sum1(out1[1]));
fulladder a4(.c(e[2]),.d(ww3),.cin(w2),.cout(w3),.sum1(out1[2]));
fulladder a5(.c(e[3]),.d(ww4),.cin(w3),.cout(cout1),.sum1(out1[3]));
endmodule

module bbitsubtractor(g,h,out2,cout2);
input [7:0]g,h;
output [7:0]out2;output cout2;
wire w4;
bitsubtractor a6(.e({g[3],g[2],g[1],g[0]}),.f({h[3],h[2],h[1],h[0]}),.cin1(1'b1),.cout1(w4),.out1({out2[3],out2[2],out2[1],out2[0]}));
bitsubtractor a7(.e({g[7],g[6],g[5],g[4]}),.f({h[7],h[6],h[5],h[4]}),.cin1(w4),.cout1(cout2),.out1({out2[7],out2[6],out2[5],out2[4]}));
endmodule







