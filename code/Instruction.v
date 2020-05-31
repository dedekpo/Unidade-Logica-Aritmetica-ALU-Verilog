module instruction(EnderecoEntrada, OpCode, RS, RT, RD, FuncCode, Endereco);
  input [31:0] EnderecoEntrada;
  output [5:0] OpCode;
  output reg[4:0] RS;
  output reg[4:0] RT;
  output reg[4:0] RD;
  output reg[5:0] FuncCode;
  output reg[15:0] Endereco;

  assign OpCode = EnderecoEntrada[31:26];

  always @(EnderecoEntrada) begin
    RS = EnderecoEntrada[25:21];
    RT =  EnderecoEntrada[20:16];
    RD =  EnderecoEntrada[15:11];
    FuncCode =  EnderecoEntrada[5:0];
    Endereco =  EnderecoEntrada[15:0];
  end
endmodule