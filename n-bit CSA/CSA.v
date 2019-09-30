// file: CSA.v
// author: @amrgouhar

`timescale 1ns/1ns

module CSA(A, B, Ci, Co, S);
parameter Type = 1;
parameter n = 16;
parameter k = 4;
input [n-1: 0] A, B;
input Ci;
output Co;
output [n-1:0] S;
wire [n/k:0] C;
wire [n-1:k] Stmp[1:0];
wire [1:0] Ctmp;
assign C[0] = Ci;
assign Co = C[n/k];

genvar i;
generate
    if(Type == 0 || k != 4) begin:addbit
        RCA #(k) bitN(.A(A[k-1:0]),.B(B[k-1:0]),.Ci(C[0]),.Co(C[1]), .S(S[k-1:0]));

    for(i =k; i < n; i = i +k)begin
        RCA #(k) bitA(.A(A[i+k-1:i]),.B(B[i+k-1:i]),.Ci(1'b0),.Co(Ctmp[0]), .S(Stmp[0][i+k-1:i]));
        RCA #(k) bitB(.A(A[i+k-1:i]),.B(B[i+k-1:i]),.Ci(1'b1),.Co(Ctmp[1]), .S(Stmp[1][i+k-1:i]));
        MUX #(k) bitX(.A(Stmp[1][i+k-1:i]),.B(Stmp[0][i+k-1:i]),.Sel(C[i/k]),.Out(S[i+k-1:i]));
        MUX #(1) bitZ(.A(Ctmp[1]),.B(Ctmp[0]),.Sel(C[i/k]),.Out(C[i/k + 1]));
    end
end
else begin:addbit
    CLA #(k) bitQ(.A(A[k-1:0]),.B(B[k-1:0]),.Ci(C[0]),.Co(C[1]), .S(S[k-1:0]));
    for(i =k; i < n; i = i +k)begin
        CLA #(k) bitW(.A(A[i+k-1:i]),.B(B[i+k-1:i]),.Ci(1'b0),.Co(Ctmp[0]), .S(Stmp[0][i+k-1:i]));
        CLA #(k) bitE(.A(A[i+k-1:i]),.B(B[i+k-1:i]),.Ci(1'b1),.Co(Ctmp[1]), .S(Stmp[1][i+k-1:i]));
        MUX #(k) bitR(.A(Stmp[1][i+k-1:i]),.B(Stmp[0][i+k-1:i]),.Sel(C[i/k]),.Out(S[i+k-1:i]));
        MUX #(1) bitT(.A(Ctmp[1]),.B(Ctmp[0]),.Sel(C[i/k]),.Out(C[i/k + 1]));
    end
    end
endgenerate
endmodule