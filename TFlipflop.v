module TFF0 (
data  , // Data Input
clk   , // Clock Input
reset , // Reset input
q       // Q output
);
//-----------Input Ports---------------
input data, clk, reset ; 
//-----------Output Ports---------------
output q;
//------------Internal Variables--------
reg q;
//-------------Code Starts Here---------
always @ ( posedge clk or posedge reset)
if (reset) begin
  q <= 1'b0;
end else if (data) begin
  q <= !q;
end

endmodule