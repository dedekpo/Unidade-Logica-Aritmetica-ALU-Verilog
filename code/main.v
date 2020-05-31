`include "ADD.V"
`include "AddALU.v"
`include "Alu.v"
`include "ALUControl.v"
`include "Banco_registradores.v"
`include "Control.v"
`include "Instruction.v"
`include "Memoria_dados.v"
`include "Instruction_Memory.v"
`include "Mux.v"
`include "PC.v"
`include "sign_extend.v"

module main();

//PC
    reg [31:0] EnderecoEntrada;
    reg clock;
    wire [31:0] EnderecoSaida;

//Memoria_instrução
    wire [31:0] InstrucaoSaida;
    wire [31:0] ProxInstrucao;

//Control
    wire RegDst, ALUSrc, MemToReg, RegWrite, MemRead, MemWrite, Branch, jump;
    wire [1:0] ALUOp;

//Instruction
    wire[4:0] RS, RT, RD;
    wire[5:0] OpCode, FuncCode;
    wire[15:0]Endereco;

//Mux
    //MUX1
    wire [4:0] SaidaMux1;
    //MUXALU
    wire [31:0] SaidaMuxAlu;
    //MUXDatawrite
    wire[31:0] WriteData;
    //MuxDesvio
    wire [31:0] SaidaMuxAdd;

//sign_extend
    wire [31:0] SaidaExtend;

//Banco_registradores
    wire [31:0] readData1, readData2;	

//ALUControl
    wire[3:0] ALUCtl;

//Alu
    wire[31:0] ALUOut;
    wire Zero;

//Memoria_dados
    wire [31:0] dataMemory;

//AddALU
    wire[31:0] SaidaShift;
    wire ControleAnd;
    wire [31:0] ALUAddResult;

//ADD
    wire[31:0] Soma;


    PC PC(EnderecoEntrada, clock, EnderecoSaida);
    instruction_memory memory(EnderecoEntrada, InstrucaoSaida, ProxInstrucao);
    instruction Instrucao(EnderecoEntrada, OpCode, RS, RT, RD, FuncCode, Endereco);
    control Controle(OpCode, RegDst, ALUSrc, MemToReg, regWrite, MemRead, MemWrite, Branch, jump, ALUOp);
    MUX1 mux1(RT, RD, RegDst, SaidaMux1);
    registers registrador(RegWrite, SaidaMux1, RS, RT, RD, readData1, readData2);
    signExtended extensor(Endereco, SaidaExtend);
    MUXALU muxalu(readData2, SaidaExtend, ALUSrc, SaidaMuxAlu);
    ALUControl ControleAlu(ALUOp, FuncCode, ALUCtl);
    ALU ALU(readData1, SaidaMuxAlu, ALUCtl, ALUOut, Zero);
    dataMemory memoria_dados(ALUOut, readData2, MemWrite, MemRead, dataMemory);
    MUXDataWrite muxdata(MemToReg, dataMemory, ALUOut, WriteData);
    Shift_Left2 deslocamento(SaidaExtend, SaidaShift);
    AND AndE(Branch, Zero, ControleAnd);
    ADD soma(EnderecoSaida, Soma);
    AddALU add(Soma, SaidaShift, ALUAddResult);
    muxDesvio desvio(Soma, ALUAddResult, ControleAnd, SaidaMuxAdd);

    initial begin
    $dumpfile("MIPS.vcd");
    $dumpvars;
    clock = 0; EnderecoEntrada=0;
    #1 clock=!clock; EnderecoEntrada=4;
    $display("Saida ALU: %b\n", ALUOut);
    #1 clock=!clock; EnderecoEntrada=8;
    $display("Saida ALU: %b\n", ALUOut);
    #1 clock=!clock; EnderecoEntrada=12;
    $display("Saida ALU: %b\n", ALUOut);
    #1 clock=!clock; EnderecoEntrada=16;
    $display("Saida ALU: %b\n", ALUOut);
    #1 clock=!clock; EnderecoEntrada=20;
    $display("Saida ALU: %b\n", ALUOut);
    #1 clock=!clock; EnderecoEntrada=24;
    $display("Saida ALU: %b\n", ALUOut);
    #1 clock=!clock; EnderecoEntrada=28;
    $display("Saida ALU: %b\n", ALUOut);
    #1 clock=!clock; EnderecoEntrada=32;
    $display("Saida ALU: %b\n", ALUOut);
    #1 clock=!clock;
  end
endmodule

