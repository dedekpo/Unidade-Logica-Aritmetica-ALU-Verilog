module ADD (a, soma);
    input [31:0] a;
    output reg [31:0] soma;
    
    always @(*) begin  //sempre que mudar a entrada faça
        soma = a + 3'b100;
    end
endmodule