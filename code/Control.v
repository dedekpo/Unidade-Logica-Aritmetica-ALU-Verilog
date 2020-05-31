module control (opcode, RegDst, ALUSrc, MemToReg, regWrite, MemRead, MemWrite, Branch, jump, ALUOp); 

  input [5:0] opcode;
  output reg RegDst;
  output reg ALUSrc;
  output reg MemToReg;
  output reg regWrite;
  output reg MemRead;
  output reg MemWrite;
  output reg Branch;
  output reg jump;
  output reg [1:0] ALUOp;

always @(opcode) begin
// tipo R
  if(opcode == 6'b000000) begin
    RegDst = 1;
    ALUSrc = 0;
    MemToReg = 0;
    regWrite = 1;
    MemRead = 0;
    MemWrite = 0;
    Branch = 0;
    jump = 0;
    ALUOp = 2'b10;
  end

    // Tipo LW
  else if(opcode == 6'b100011) begin
    RegDst = 0;
    ALUSrc = 1;
    MemToReg = 1;
    regWrite = 1;
    MemRead = 1;
    MemWrite = 0;
    Branch = 0;
    jump = 0;
    ALUOp = 2'b00;
  end
  
    // TIPO SW
  else if(opcode == 6'b101011) begin
    RegDst = 0;
    ALUSrc = 1;
    MemToReg = 0;
    regWrite = 0;
    MemRead = 0;
    MemWrite = 1;
    Branch = 0;
    jump = 0;
    ALUOp = 2'b00;
  end
  
    //BEQ
  else if(opcode == 6'b000100) begin
    RegDst = 0;
    ALUSrc = 0;
    MemToReg = 0;
    regWrite = 0;
    MemRead = 0;
    MemWrite = 0;
    Branch = 1;
    jump = 0;
    ALUOp = 2'b01;
  end
  
    //JUMP
  else if(opcode == 6'b	000010) begin
  RegDst = 0;
  ALUSrc = 0;
  MemToReg = 0;
  regWrite = 0;
  MemWrite = 0;
  MemRead = 0;
  Branch = 0;
  jump = 1;
  ALUOp = 2'b11;
  end
  
end
endmodule