module Reg_Test;
	reg clk, rst;

 
 	reg [4:0] in1;
	reg [4:0] in2;
	reg [4:0] inWriteReg;
	reg [31:0] inWriteData;
	reg regWrite;
	
	
	wire [31:0] out1;
	wire [31:0] out2;
	
	//test module
	Register_File r1(clk, rst, in1, in2, inWriteReg, inWriteData, regWrite, out1, out2);
	
	//clock
	initial begin
		clk = 1; #5 clk = 0;
		forever
			begin
				$display("%b %b %b %b %b", rst, in1, in2, out1, out2);
				#5 clk = 1; #5 clk =0;
			end
		end
		
	
	//input stimuli
	initial begin
		regWrite = 1; inWriteReg = 5'b00000; inWriteData = 32'h0000000D;
		#20
		regWrite = 1; inWriteReg = 5'b00001; inWriteData = 32'h0000001E;
		#20
		regWrite = 0; in1 = 5'b00000; in2 = 5'b00001;
		#20
		regWrite = 1; inWriteReg = 5'b00000; inWriteData = 32'h0000001E;
		#20
		regWrite = 0; in1 = 5'b00000; in2 = 5'b00001;
		#60
		$stop;
	end
endmodule