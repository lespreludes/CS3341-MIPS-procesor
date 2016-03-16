`define RES {regWrite,regDst,ALUSrc,branch,memWrite,memToReg,ALUOp,jump}

module MainDecoder(opcode,regWrite,regDst, ALUSrc,branch,memWrite,memToReg,ALUOp,jump);
	
	input [5:0] opcode;
	output regWrite, regDst, ALUSrc, branch,
		memWrite,memToReg, jump;
	output [1:0] ALUOp;
	reg regWrite, regDst, ALUSrc, branch,
		memWrite,memToReg, jump;
	reg [1:0] ALUOp;

	always @(opcode) begin	
		case (opcode)
			//r-type
			6'b000000: `RES = 9'b110000100;
			//addi
			6'b001000: `RES = 9'b101000000;
			//addiu - currently cant do, need unsigned support in extender
			//6'b001001:
			//andi - as above
			//6'b001100:
			//beq
			6'b000100: `RES = 9'b0x010x010;
			//bne may necessitate another control bit
			//6'b000101: `RES = 
			//jump
			6'b000010: `RES = 9'b0xxx0xxx1;
			//jal not sure but need a way to direct PC to registers
			//6'b000011: `RES = 9'b1
			//lbu - unsigned extension
			//6'b100100:
			//lhu 
			//6'b100101:
			//ll - what does this even do
			//6'b110000:
			//lui need shifter
			//6'b001111:
			//lw
			6'b100011: `RES = 9'b101001000;
			//ori - unsigned extension
			//6'b001101:
			//slti
			6'b001010: `RES = 9'b101000010;
			//sltiu unsigned
			//6'b001110:
			//sb
			//6'b101000:
			//sc
			//6'b111000:
			//sh
			//6'b101001:
			//sw
			6'b101011: `RES = 9'b0x101x000;
			default: `RES = 9'bxxxxxxxxx; //panic!
		endcase
	end	

endmodule
