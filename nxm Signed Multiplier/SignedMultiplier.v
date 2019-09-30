// file: SignedMultiplier.v
// author: @amrgouhar

`timescale 1ns/1ns

module SignedMultiplier(A, B, P);
parameter n = 4;
parameter m = 4;
input [n - 1 : 0] A;
input [m - 1 : 0] B;
output [n + m - 1 : 0] P;
wire [n + m - 1 : 0] S [m - 1 : 0];
wire [n + m - 1 : 0] Snew [m - 1 : 0];
wire [m - 1 : 0] Carry;
assign Carry[0] = 1'b0;
assign Snew[0] = S[0];
assign P = {Snew[m-1]};

genvar i, j, k, l, z, x, v;
generate
    for(i = 0; i < m; i = i + 1)
        for(j = i; (j-i) < n; j = j + 1)
            if(((j-i == n-1) || (i == m - 1)) && !((j-i == n-1) && (i == m - 1)))
                assign S[i][j] = ~(A[j-i] & B[i]);
            else
                assign S[i][j] = A[j-i] & B[i];
                
 for(k = 1; k < m; k = k + 1)
        for(l = 0 ; l < k; l = l + 1)
            assign S[k][l] = 1'b0;
            
    for(z = 0; z < m; z = z + 1)
        for (x = z + n; x < m + n;  x= x + 1)
            if(((x == m + n - 1) && (z == m - 1)) || ((z == 0) && (x == n)))
                assign S[z][x] = 1'b1;
            else
                assign S[z][x] = 1'b0;
    for(v =0; v < m - 1; v = v + 1) begin: addbit
        RCA #(m + n) bit(.A(Snew[v]),.B(S[v + 1]), .Ci(Carry[v]), .Co(Carry[v + 1]), .S(Snew[v + 1]));
    end
endgenerate

endmodule