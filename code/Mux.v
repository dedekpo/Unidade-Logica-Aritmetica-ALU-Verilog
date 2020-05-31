module MUX1 (RD, RT, RegDst, SaidaMux1);
  input [4:0] RD; //parte [15:11] da instrucao
  input [4:0] RT; //parte [20:16] da instrucao
  input RegDst;
  output reg [4:0] SaidaMux1;

  always @ (RegDst) begin
    if (RegDst == 1'b1) begin
      SaidaMux1 = RD;
    end
    if (RegDst == 1'b0) begin
      SaidaMux1 = RT;
    end
  end
endmodule




module MUXALU (Mux0, Mux1, ALUSrc, SaidaMuxAlu);
  input [31:0]Mux0;    //recebe Read data 2 do Banco de Registradores
  input [31:0]Mux1;   //recebe a instrucao [15:0] apos o Sign-extend
  input ALUSrc;       //Sinal de controle
  output reg[31:0] SaidaMuxAlu;

  always @(ALUSrc) begin
    if (ALUSrc == 1'b1) begin
      SaidaMuxAlu = Mux1;
    end
    if(ALUSrc == 1'b0) begin
      SaidaMuxAlu = Mux0;
    end
  end
endmodule




module MUXDataWrite (MemToReg, ReadData, ALUResult, WriteData);
  input MemToReg;
  input [31:0] ReadData;
  input [31:0] ALUResult;
  output reg [31:0] WriteData;

  always @(MemToReg) begin
    if(MemToReg == 0) begin
      WriteData = ALUResult;
    end
    if(MemToReg == 1) begin
      WriteData = ReadData;
    end
  end
endmodule




//Multiplexador do Desvio condicional
module muxDesvio (Mux0, Mux1, ControleAND, SaidaMuxAdd);
  input [31:0] Mux0; //Valor 1 de entrada no MUX de desvio condicional
  input [31:0] Mux1; //Valor 2 de entrada no MUX de desvio condicional
  input ControleAND; //Controle de sinal apos AND
  output reg [31:0] SaidaMuxAdd; //Saida do MUX de desvio condicional

  always @ (ControleAND) begin
    if(ControleAND == 1'b1) begin
      SaidaMuxAdd = Mux0;
    end
    else begin
      SaidaMuxAdd = Mux1;
    end
  end
endmodule