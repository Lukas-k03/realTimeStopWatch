module mod10Count(clock,inc,reset,count,ceq9);

output [3:0]count;

input clock,inc,reset;

wire [3:0]w;
wire rst;
wire ext;
wire clockout;
output ceq9;

assign rst = (ceq9 & inc) | (reset);

fourByDFF1 m101(.clock(clock), .cin(w), .reset(rst),.cout(count));

assign ceq9 = (count == 4'b 1001)? 1 : 0;

fourBitRippleCarry G2(.A(count),.inc(inc),.sum(w),.cout(ext));

endmodule


module fourByDFF1(clock,cin,reset,cout);

input clock;
input [3:0]cin;
input reset;
output [3:0]cout;

DFF0 d1(.data_in(cin[0]), .clock(clock), .reset(reset), .data_out(cout[0]));
DFF0 d2(.data_in(cin[1]), .clock(clock), .reset(reset), .data_out(cout[1]));
DFF0 d3(.data_in(cin[2]), .clock(clock), .reset(reset), .data_out(cout[2]));
DFF0 d4(.data_in(cin[3]), .clock(clock), .reset(reset), .data_out(cout[3]));

endmodule

/*Explanation of this count10 module:

This module counts to 10, the inputs are clock inc and reset. 

clock is the input of the internal clock of the FPGA, in our upper-level design this is divded to match
the period we want for a update of 1/milliseconds frequency.

Inc is an input for increment, When inc is =1 the count will increase by one with accordance to the clock,
is is basically like a a start stop. so when its zero the count will pause and when its 1 the count will 
increment

Reset, is fairly self explanatory, when reset is set to 0 the module will not be reset and will operate as normal
when reset is set to one the module will reset its count to zero.

This module has the output of count
count is the value returned from the 4xDFF. This value is a 4'b BCD number which is then converted to a 
7 segement display signal which is described in BCDtoSevensegment module.

Contained in this count10 module is a module for 4xDFF, This module just cotains 4 D Flip Flops connected
together each holds the value of 1 bit of the 4 bit bcd number we use to keep track of the count.
