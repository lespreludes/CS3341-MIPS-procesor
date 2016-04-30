module Register_File(clk, rst, reg1, reg2, writereg, writedata, regwrite, out1, out2);


	input clk; //clock and reset
	input rst; 
	
	input [4:0] reg1; //two read registers
	input [4:0] reg2;
	input [4:0] writereg; //write regwrite	
	input [31:0] writedata; //write data
	input regwrite; //control
	

	output [31:0] out1;
	output [31:0] out2; 
	
	reg [31:0] registers[31:0]; //array of 32, 32 bit registers
	
	initial begin
		$readmemh("C:/Users/Satsuki/Documents/UTD/2016Spring/CS4341/CS3341-MIPS-processor/tests/test2_reg.mem", registers);
	end
	
	assign out1 = registers[reg1]; 
	assign out2 = registers[reg2];

	always @(posedge clk) begin //only write to registers at + edge of clk
		case(regwrite)
		
		   1'b1: 	registers[writereg] <= writedata;
		endcase 
	end
	
endmodule