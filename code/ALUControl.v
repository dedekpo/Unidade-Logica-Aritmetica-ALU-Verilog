module ALUControl (ALUOp, FuncCode, ALUCtl);
    input [1:0] ALUOp;
    input [5:0] FuncCode;
    output reg [3:0] ALUCtl;

    always @(*) begin
        if(ALUOp == 2'b10) begin
            case(FuncCode)
                6'b100000: ALUCtl = 4'b0010; //add
                6'b100010: ALUCtl = 4'b0110; //sub
                6'b100100: ALUCtl = 4'b0000; //and
                6'b100101: ALUCtl = 4'b0001; //or
                6'b101010: ALUCtl = 4'b0111; //slt
            endcase
        end    
        else if(ALUOp == 2'b00) begin
            ALUCtl = 4'b0010; //lw e sw
        end
        else if(ALUOp == 2'b01) begin
            ALUCtl = 4'b0110; //beq
        end    
    end
endmodule