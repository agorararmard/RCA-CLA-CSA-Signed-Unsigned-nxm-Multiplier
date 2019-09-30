// file: CLA.v
// author: @amrgouhar

`timescale 1ns/1ns

module CLA(A, B, Ci, Co, S, PG, GG);
input [3:0] A, B;
input Ci;
output Co;
output [3:0] S;
output PG, GG;
wire [3:0] P, G;
wire [4:0] C;
assign C[0] = Ci;
assign Co = C[4];
assign PG = P[0] & P[1] & P[2] & P[3];
assign GG = G[3] | (G[2] & P[3]) | (G[1] & P[3] & P[2]) | (G[0] & P[3] & P[2] & P[1]);

genvar i;
generate
    for(i = 0; i < 4; i = i + 1) begin
        assign  G[i] = A[i] & B[i];
        assign  P[i] = A[i] | B[i];
        assign  C[i + 1] = G[i] | (P[i] & C[i]); 
    end
endgenerate
generate
    for(i =0; i< 4; i = i + 1)
        assign S[i] = A[i] ^ B[i] ^ C[i];
endgenerate
endmodule