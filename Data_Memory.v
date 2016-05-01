module Data_Memory(clk, rst, addr, writeData, readData, memWrite, memRead);

	input clk, rst, memWrite, memRead;
	
	input [31:0] addr;
	input [31:0] writeData;
	
	output [31:0] readData;
	reg [31:0] readData;
	
	
	reg[31:0] mem[31:0]; //array of 32, 32 bit registers (our "memory")
	
	
	initial begin
		$readmemh("C:/Users/Tyler/CS3341-MIPS-processor/tests/test2_data.mem", mem);
	end
	
	always @ (*) begin //if inputs change, check if memRead is set and if so change output
		case (memRead)
			1'b1: readData = mem[(addr/4)];
		endcase
	end
	
	
	always @ (posedge clk) begin
		case (memWrite)
			1'b1: mem[(addr / 4 )] <= writeData;
		endcase
	end
	
endmodule