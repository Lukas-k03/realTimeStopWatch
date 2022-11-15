module mod10Count(clock,inc,reset,count);

output [3:0]count;

input clock,inc,reset;

wire [3:0]w;
wire rst;
wire ext;
wire clockout;
wire ceq9;

assign rst = (ceq9 & inc) | (reset);

fourByDFF D1(.clock(clock), .cin(w), .reset(rst),.cout(count));

assign ceq9 = (count == 4'b 1001)? 1 : 0;

fourBitRippleCarry G2(.A(count),.inc(inc),.sum(w),.cout(ext));

endmodule


module fourByDFF(clock,cin,reset,cout);

input clock;
input [3:0]cin;
input reset;
output [3:0]cout;

DFF0 d1(.data_in(cin[0]), .clock(clock), .reset(reset), .data_out(cout[0]));
DFF0 d2(.data_in(cin[1]), .clock(clock), .reset(reset), .data_out(cout[1]));
DFF0 d3(.data_in(cin[2]), .clock(clock), .reset(reset), .data_out(cout[2]));
DFF0 d4(.data_in(cin[3]), .clock(clock), .reset(reset), .data_out(cout[3]));

endmodule

