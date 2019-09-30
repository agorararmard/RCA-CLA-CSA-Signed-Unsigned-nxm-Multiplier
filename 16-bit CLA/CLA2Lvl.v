// file: CLA2Lvl.v
// author: @amrgouhar

`timescale 1ns/1ns

module CLA2Lvl(A, B, ci, co, S);
input [15:0] A, B;
input ci;
output co;
output [15:0] S;
wire [4:0] C;
wire [3:0] PG, GG;
assign C[0] = ci;
assign co = C[4];

genvar i;
    generate
    for(i = 0; i < 4; i = i + 1 ) begin: addbit
        assign C[i + 1] = GG[i] | (PG[i] & C[i]);
        CLA bit(.A(A[(i+1)*4 - 1:i * 4]),.B(B[(i+1)*4 - 1:i * 4]),.Ci(C[i]),.Co(),.S(S[(i+1)*4 - 1:i * 4]),.PG(PG[i]),.GG(GG[i]));
end
endgenerate
endmodule