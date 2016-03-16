
module Instruction_Memory(clk, rst, addr, instruct);

	input clk, rst;
	
	input [31:0] addr;
	
	output [31:0] instruct;
	reg [31:0] instruct; //just so we can assign in always
	
	
	reg[31:0] mem[31:0]; //array of 32, 32 bit registers (our "memory")
	
	always @(posedge clk) begin
		instruct <= mem[addr / 4];
	end
	
endmodule