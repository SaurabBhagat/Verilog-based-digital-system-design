`timescale 1ns/1ps

module tb_alu_4bit;

reg [3:0] A;
reg [3:0] B;
reg [2:0] ALU_Sel;

wire [3:0] Result;
wire Carry;
wire Zero;

alu_4bit uut (
    .A(A),
    .B(B),
    .ALU_Sel(ALU_Sel),
    .Result(Result),
    .Carry(Carry),
    .Zero(Zero)
);

initial begin
    $monitor("Time=%0t A=%b B=%b Sel=%b Result=%b Carry=%b Zero=%b",
             $time, A, B, ALU_Sel, Result, Carry, Zero);

    A=4'b0101; B=4'b0011; ALU_Sel=3'b000; #10;
    A=4'b1000; B=4'b0011; ALU_Sel=3'b001; #10;
    A=4'b1010; B=4'b1100; ALU_Sel=3'b010; #10;
    A=4'b1010; B=4'b1100; ALU_Sel=3'b011; #10;
    A=4'b1010; B=4'b1100; ALU_Sel=3'b100; #10;
    A=4'b1010; B=4'b0000; ALU_Sel=3'b101; #10;
    A=4'b0011; B=4'b0000; ALU_Sel=3'b110; #10;
    A=4'b1000; B=4'b0000; ALU_Sel=3'b111; #10;

    $finish;
end

endmodule
