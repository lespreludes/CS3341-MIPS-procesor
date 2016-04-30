module MainALU(SrcA,SrcB,ALUControl,ALUResult,zero);
	input [31:0] SrcA;
	input [31:0] SrcB;
	input [2:0] ALUControl;
	
	output zero;
	output [31:0] ALUResult;
	reg [31:0] ALUResult;

	always @(*) begin
		case (ALUControl)
			// A & B
			3'b000: ALUResult = SrcA & SrcB;
			// A | B
			3'b001: ALUResult = SrcA | SrcB;
			// A + B
			3'b010: ALUResult = SrcA + SrcB;
			// Unused, should never occur
			3'b011: ALUResult = 32'b0;
			// A & ~B
			3'b100: ALUResult = SrcA & ~SrcB;
			// A | ~B
			3'b101: ALUResult = SrcA | ~SrcB;
			// A - B
			3'b110: ALUResult = SrcA - SrcB;
			// SLT
			3'b111: ALUResult = SrcA < SrcB;
		endcase
	end
	
	assign zero = ALUResult == 32'h00000000;
endmodule
