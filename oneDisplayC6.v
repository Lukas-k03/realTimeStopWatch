module oneDisplayC6(clock,inc,reset,a,b,c,d,e,f,g);

input clock,inc,reset;
output a,b,c,d,e,f,g;
wire [3:0]O;
wire ceq9;
// clk_divider G1(.clock(clock), .rst(reset), .clk_out(clockout));

mod6Count G2(.clock(clock),.inc(inc),.reset(reset),.count(O));

BCDtoSevenSegment G3(.A(O[3]),.B(O[2]),.C(O[1]),.D(O[0]),.a(a),.b(b),.c(c),.d(d),.e(e),.f(f),.g(g));

endmodule