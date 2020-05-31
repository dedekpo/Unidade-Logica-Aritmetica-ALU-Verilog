module PC (EnderecoEntrada, clock, EnderecoSaida);
    input [31:0]  EnderecoEntrada;
    input clock;
    output reg [31:0] EnderecoSaida;

    initial begin
        EnderecoSaida =  EnderecoEntrada;
    end
    always @(clock) begin
        EnderecoSaida =  EnderecoEntrada;
    end
endmodule