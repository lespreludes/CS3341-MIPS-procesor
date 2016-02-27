module ALUDecoderTester;
	reg [1:0] ALUOp;
	reg [5:0] funct;
	wire [2:0] ALUControl;
	
	ALUDecoder a(ALUOp,funct,ALUControl);

	initial begin
		ALUOp = 0;
		funct = 0;
		repeat (192) begin //op 11 not used
			#10;
			$display("ALUOp: %d, funct: %d, ALUControl: %d",ALUOp, funct,ALUControl);
			if (funct == 6'b111111) begin
				funct = 0;
				ALUOp = ALUOp+1;
			end
			else begin
				funct = funct+1;
			end
		end
	end
endmodule