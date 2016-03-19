module Multiplexer(inp1,inp2,select,out);
	parameter size = 32;
	input [size-1:0] inp1, inp2;
	output [size-1:0] out;
	reg [size-1:0] out;
	input select;

	always @(*)
		out = select ? inp2 : inp1;
endmodule
