module dataMemory(adress, writeData, MemWrite, MemRead, dataMemory);
	input [31:0] adress;
	input [31:0] writeData;
	input MemWrite;
	input MemRead;
	output [31:0] dataMemory;

	reg [31:0] memory [127:0];

	always @ (MemWrite, MemRead) begin
		if (MemWrite == 1'b1) begin
			memory[adress] = writeData;
		end
	end

	assign dataMemory = MemWrite ? writeData: memory[adress][31:0];
endmodule