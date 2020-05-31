module Shift_Left2 (entrada, SaidaShift);
  input [31:0] entrada;
  output reg [31:0] SaidaShift;
    
  always @(*) begin  //sempre que mudar a entrada faça
    SaidaShift = entrada << 2;
  end
endmodule



module AND (Branch, Zero, ControleAND);
  input Branch;
  input Zero;
  output reg ControleAND;

  always @(Branch, Zero) begin
    ControleAND = Branch & Zero;
  end
endmodule



module AddALU (Entrada1, Shift, ALUAddResult);
  input [31:0] Entrada1;
  input [31:0] Shift;
  output reg [31:0] ALUAddResult;

  always @ (Shift, Entrada1) begin
    ALUAddResult = Entrada1 + Shift;
  end
endmodule