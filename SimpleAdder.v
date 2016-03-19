module SimpleAdder (in1, in2, out);
	parameter size = 32;
	input [size-1:0] in1;
	input [size-1:0] in2;
	output [size-1:0] out;
	reg [size-1:0] out;

	always @(in1,in2)
		out = in1 + in2;
endmodule
