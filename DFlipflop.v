module DFF0(data_in,clock,reset, data_out);
input data_in;
input clock,reset;

output reg data_out;

always@(posedge clock)
	begin
		if(reset)
			data_out<=1'b0;
		else
			data_out<=data_in;
	end	

endmodule
