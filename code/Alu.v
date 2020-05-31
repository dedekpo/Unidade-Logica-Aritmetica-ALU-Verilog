module ALU (A, B, ALUCtl, ALUOut, Zero);
  input [31:0] A;
  input [31:0] B;
  input [3:0] ALUCtl;
  output reg [31:0] ALUOut;
  output reg Zero;


  always @ (ALUCtl, A, B) begin
    case (ALUCtl)
      4'b0000: ALUOut = A & B; //and
      4'b0001: ALUOut = A | B; //or
      4'b0010: ALUOut = A + B; //add
      4'b0110: ALUOut = A - B; //sub
      4'b0111: ALUOut = A < B ? 1 : 0; //slt
      4'b1100: ALUOut = ~(A | B); // nor
      default: ALUOut = 32'b0;
    endcase
  end

  always @ (ALUOut) begin
    if(ALUOut == 0) begin
      Zero = 1;
    end
    else begin
      Zero = 0;
    end
  end
endmodule