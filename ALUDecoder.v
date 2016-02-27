module ALUDecoder(ALUOp,funct,ALUControl);
	input [1:0] ALUOp;
	input [5:0] funct;
	output [2:0] ALUControl;
	reg [2:0] ALUControl;

	always @(ALUOp or funct) begin
		casex ({ALUOp, funct})
			8'b00xxxxxx: ALUControl = 3'b010;
			8'bx1xxxxxx: ALUControl = 3'b110;
			8'b1x100000: ALUControl = 3'b010;
			8'b1x100010: ALUControl = 3'b110;
			8'b1x100100: ALUControl = 3'b000;
			8'b1x100101: ALUControl = 3'b001;
			8'b1x101010: ALUControl = 3'b111;
		endcase
	end
endmodule
