module BCDtoSevenSegment(A,B,C,D,a,b,c,d,e,f,g);

input A,B,C,D;
output a,b,c,d,e,f,g;

assign a = (~A & ~B & ~C & D) | B & ~D;
assign b = B & (C^D);
assign c = ~B & C & ~D;
assign d = (B & ~(C^D)) | (~B & ~C & D);
assign e = (D | (B & ~C));
assign f = (~B & ((~A & D) | C)) | (C & D);
assign g = (~A & ~B & ~C) | (B & C & D);


endmodule