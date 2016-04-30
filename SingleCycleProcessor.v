/**
 * Single cycle MIPS processor
 * with limited instruction set
 */

module SingleCycleProcessor(clock,reset);
	input clock;
	input reset;
	
	reg [31:0] pc;
	wire [31:0] newpc;
	wire [31:0] noBranchAddr;
	wire [31:0] branchAddr;

	wire [31:0] instrWire;
	reg [31:0] instruction;
	wire [4:0] writeRegister;
	wire [31:0] writeData;
	wire [31:0] data1, data2;
	wire [31:0] extImm;
	
	wire zero;
	wire [31:0] ALUInpB;
	wire [31:0] ALUResult;

	wire [31:0] readData;

	wire regDst, jump, branch, memToReg, memWrite,ALUSrc, regWrite;
	wire [1:0] ALUOp;
	wire [2:0] ALUControl;
	
	wire [31:0] intAddr;
	
	/*pc address calculation*/
	always @(posedge clock) begin
		case (reset)
			1'b0: pc = newpc;
			1'b1: pc = 0;
		endcase
	end

	always @(instrWire) begin
		case (reset)
			1'b1: instruction = instrWire;
			1'b0: instruction = instrWire;
		endcase
	end

	SimpleAdder noBranchAdder(pc,32'h00000004,noBranchAddr);
	SimpleAdder #(32) branchAdder({extImm[29:0],2'b00},noBranchAddr,branchAddr);
	Multiplexer #(32) branchMux(noBranchAddr,branchAddr,branch&zero,intAddr);
	Multiplexer #(32) jumpMux(intAddr,{noBranchAddr[31:28],instruction[25:0],2'b00},jump,newpc);
	
	
	/*Instruction memory*/
	Instruction_Memory im(clock, reset, pc, instrWire);


	/*register file*/
	Multiplexer #(5) writeSelectMux(instruction[20:16],instruction[15:11],regDst,writeRegister);
	Register_File rf(clock, reset, instruction[25:21], instruction[20:16], 
		writeRegister, writeData, regWrite, data1, data2);

	
	/*Sign extension*/
	SignExtender se(instruction[15:0],extImm);
	

	/*ALU*/
	Multiplexer #(32) ALUInpMux(data2,extImm,ALUSrc,ALUInpB);
	MainALU ma(data1,ALUInpB,ALUControl,ALUResult,zero);


	/*Data memory*/
	Data_Memory dm(clock, reset, ALUResult, data2, readData, memWrite, memToReg);
	Multiplexer #(32) writeDataMux(ALUResult,readData,memToReg,writeData);


	/*Control*/
	MainDecoder md(instruction[31:26],regWrite,regDst, 
		ALUSrc,branch,memWrite,memToReg,ALUOp,jump);
	ALUDecoder ad(ALUOp,instruction[5:0],ALUControl);

	initial begin
		pc = 32'h00000000;
		instruction = 32'h00000000;
	end

endmodule
