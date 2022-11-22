module finalOutput(reset,Start_Stop,clock,A,B,C,D);

input reset, Start_Stop , clock;

wire clockout;

wire q;
wire [2:0]ceq9;
wire inc1,inc2,inc3;


output [6:0]A; 
output [6:0]B; 
output [6:0]C;
output [6:0]D; // D is least signifigant display

clk_divider c1(.clock(clock), .rst(0), .clk_in(clockout));

TFF0 T1(.data(1),.clk(Start_Stop),.reset(0),.q(q)); //D[6] through A[6] is most signifigant bit



oneDisplay D1 (.clock(clockout),.inc(q),.reset(reset),.a(D[6]),.b(D[5]),.c(D[4]),.d(D[3]),.e(D[2]),.f(D[1]),.g(D[0]),.ceq9(ceq9[0]));

assign inc1= ceq9[0] & q;
assign inc2= ceq9[1] & inc1;
assign inc3= ceq9[2] & inc2;

oneDisplay C1 (.clock(clockout),.inc(inc1),.reset(reset),.a(C[6]),.b(C[5]),.c(C[4]),.d(C[3]),.e(C[2]),.f(C[1]),.g(C[0]),.ceq9(ceq9[1]));
oneDisplay B1 (.clock(clockout),.inc(inc2),.reset(reset),.a(B[6]),.b(B[5]),.c(B[4]),.d(B[3]),.e(B[2]),.f(B[1]),.g(B[0]),.ceq9(ceq9[2]));
oneDisplayC6 A1 (.clock(clockout),.inc(inc3),.reset(reset),.a(A[6]),.b(A[5]),.c(A[4]),.d(A[3]),.e(A[2]),.f(A[1]),.g(A[0]));




endmodule