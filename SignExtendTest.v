module SignExtendTest;
	
	reg [15:0] inp;
	wire [31:0] out;

	SignExtender #(16,32) s(inp,out);

	initial begin
		inp = -32;
		repeat (65) begin
			#10
			$display("16 bit: %h 32 bit %h",inp,out);
			inp = inp + 1;
		end
	end
endmodule
