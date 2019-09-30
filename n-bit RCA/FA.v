// file: FA.v
// author: @amrgouhar

`timescale 1ns/1ns

module FA(a, b, ci, co, s);
input a, b, ci;
output co, s;

assign s = a ^ b ^ ci;
assign co = (a & b) |(a & ci) | (b & ci);
endmodule