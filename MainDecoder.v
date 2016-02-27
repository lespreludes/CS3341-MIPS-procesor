module MainDecoder(opcode,regWrite,regDst, ALUSrc,branch,memWrite,memToReg,ALUOp,jump);
	
	input [5:0] opcode;
	output regWrite, regDst, ALUSrc, branch,
		memWrite,memToReg, jump;
	output [1:0] ALUOp;

	assign regWrite = opcode == 6'b000000 | opcode == 6'b100011;
	assign regDst = opcode == 6'b000000;
	assign ALUSrc = opcode == 6'b100011 | opcode == 6'b101011;
	assign branch = opcode == 6'b000100;
	assign memWrite = opcode == 6'b101011;
	assign memToReg = opcode == 6'b100011;
	assign jump = opcode == 6'b000100;
	assign ALUOp[0] = opcode == 6'b000100;
	assign ALUOp[1] = opcode == 6'b000000;

endmodule
