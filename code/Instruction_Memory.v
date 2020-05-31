module instruction_memory(EnderecoEntrada, InstrucaoSaida, ProxInstrucao);
  input [31:0]EnderecoEntrada;             //addressIn -> endereco recebido do process_count (entrada)
  output reg[31:0]InstrucaoSaida;         //InstructionOut ->instrucao enviada para leitura dos registradores (saida)
  output reg[31:0]ProxInstrucao; //ProxInstruction -> Próxima instrução

  reg[31:0]InstructionEnd[8:0];

  initial begin
    InstructionEnd[0] = 32'b00000010001100100100000000100000; //add $t0,$s1,$s2
    InstructionEnd[1] = 32'b00000001000010011000000000100010; //sub $s0,$t0,$t1
    InstructionEnd[2] = 32'b00000001001010100100000000100101; //or $t0,$t1,$t2
    InstructionEnd[3] = 32'b10001110011010000000000000001000; //lw $t0, 8($s3)
    InstructionEnd[4] = 32'b00000001001010100100000000100100; //and $t0,$t1,$t2
    InstructionEnd[5] = 32'b10101110011010000000000000110000; //sw $t0, 48($s3)
    InstructionEnd[6] = 32'b00010010001100010000000000000001; //beq $s1,$s1,1
    InstructionEnd[7] = 32'b00001000000000000000000000001000; //j 8
    InstructionEnd[8] = 32'b00000010011101000100000000101010; //slt $t0,$s3,$s4
  end
  
  always @ (EnderecoEntrada)
  begin
    InstrucaoSaida = InstructionEnd[EnderecoEntrada/32'b00000000000000000000000000000100];
    $display("Instrucao: %b", InstrucaoSaida);
    ProxInstrucao = InstructionEnd[(EnderecoEntrada+4)/4];
    $display("Prox Instrucao: %b", ProxInstrucao);
  end
endmodule