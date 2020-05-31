module signExtended (instructionIn, instructionOut);
	input [15:0] instructionIn;
	output [31:0] instructionOut;

	assign instructionOut[15:0] = instructionIn[15:0];
	assign instructionOut[31:16] = instructionIn[15];
	
endmodule
