// file: MUX.v
// author: @amrgouhar

`timescale 1ns/1ns

module MUX(A, B, Sel, Out);
parameter n =4;
input [n-1: 0] A, B;
input Sel;
output [n-1:0]Out;

assign {Out} = (Sel)? {A}:{B};
endmodule