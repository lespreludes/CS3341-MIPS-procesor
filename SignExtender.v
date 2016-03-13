module SignExtender(in, out);
	parameter s1 = 16;
	parameter s2 = 32;

	input [s1-1:0] in;
	output [s2-1:0] out;

	assign out = {{(s2-s1){in[s1-1]}},in};
endmodule
