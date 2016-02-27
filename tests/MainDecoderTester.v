module MainDecoderTester;
	reg [5:0] opcode;
	wire regWrite, regDst, ALUSrc, branch,
		memWrite,memToReg, jump;
	wire [1:0] ALUOp;

	MainDecoder m(opcode,regWrite,regDst, 
		ALUSrc,branch,memWrite,memToReg,ALUOp,jump);

	initial begin
		opcode = 0;
		repeat (64) begin
			#10;
			$display("%d:",opcode);
			$display("regWrite: %b",regWrite);
			$display("regDst: %b",regDst);
			$display("ALUsrc: %b",ALUSrc);
			$display("branch: %b",branch);
			$display("memWrite: %b",memWrite);
			$display("memToReg: %b",memToReg);
			$display("ALUOp: %d",ALUOp);
			$display("jump: %b",jump);
			opcode = opcode + 1;
		end
	end
endmodule
