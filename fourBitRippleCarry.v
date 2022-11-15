module fourBitRippleCarry(A,inc,sum,cout); // array thing to make the thing work each four bits
input [3:0]A;
input inc;
output [3:0]sum;
output cout;
wire w1,w2,w3;

half_adder g1 (.x(A[0]), .y(inc), .sum(sum[0]), .cout(w1));
half_adder g2 (.x(A[1]), .y(w1), .sum(sum[1]), .cout(w2)); //
half_adder g3 (.x(A[2]), .y(w2), .sum(sum[2]), .cout(w3));
half_adder g4 (.x(A[3]), .y(w3), .sum(sum[3]), .cout(cout)); 

endmodule