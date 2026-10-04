`timescale 1ns/1ps

module alu_4bit (
    input  [3:0] A,
    input  [3:0] B,
    input  [2:0] ALU_Sel,
    output reg [3:0] Result,
    output reg       Carry,
    output            Zero
);

always @(*) begin
    Result = 4'b0000;
    Carry  = 1'b0;

    case (ALU_Sel)
        3'b000: {Carry, Result} = {1'b0, A} + {1'b0, B}; // ADD
        3'b001: {Carry, Result} = {1'b0, A} - {1'b0, B}; // SUB
        3'b010: Result = A & B;                           // AND
        3'b011: Result = A | B;                           // OR
        3'b100: Result = A ^ B;                           // XOR
        3'b101: Result = ~A;                              // NOT
        3'b110: Result = A << 1;                          // LEFT SHIFT
        3'b111: Result = A >> 1;                          // RIGHT SHIFT
        default: begin
            Result = 4'b0000;
            Carry  = 1'b0;
        end
    endcase
end

assign Zero = (Result == 4'b0000);

endmodule
