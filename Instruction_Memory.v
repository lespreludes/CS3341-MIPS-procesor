module Instruction_Memory(clk, rst, addr, instruct);

	input clk, rst;
	
	input [31:0] addr;
	
	output [31:0] instruct;
	reg [31:0] instruct; //just so we can assign in always
	
	
	reg[31:0] mem[31:0]; //array of 32, 32 bit registers (our "memory")
	
	
	
	initial begin
		$readmemh("C:/Users/Tyler/CS3341-MIPS-processor/tests/test2_instrs.mem" , mem);
        end 
	always @(*) begin
		instruct <= mem[addr / 4];
	end
	
endmodule