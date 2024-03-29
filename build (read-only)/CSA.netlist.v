/* Generated by Yosys 0.6 (git sha1 UNKNOWN, clang 3.4-1ubuntu3 -fPIC -Os) */

module \$paramod\MUX\n=1 (A, B, Sel, Out);
  wire _0_;
  wire _1_;
  input A;
  input B;
  output Out;
  input Sel;
  INVX1 _2_ (
    .A(B),
    .Y(_0_)
  );
  NAND2X1 _3_ (
    .A(A),
    .B(Sel),
    .Y(_1_)
  );
  OAI21X1 _4_ (
    .A(_0_),
    .B(Sel),
    .C(_1_),
    .Y(Out)
  );
endmodule

module \$paramod\MUX\n=4 (A, B, Sel, Out);
  wire _00_;
  wire _01_;
  wire _02_;
  wire _03_;
  wire _04_;
  wire _05_;
  wire _06_;
  wire _07_;
  input [3:0] A;
  input [3:0] B;
  output [3:0] Out;
  input Sel;
  INVX1 _08_ (
    .A(B[0]),
    .Y(_00_)
  );
  NAND2X1 _09_ (
    .A(A[0]),
    .B(Sel),
    .Y(_01_)
  );
  OAI21X1 _10_ (
    .A(_00_),
    .B(Sel),
    .C(_01_),
    .Y(Out[0])
  );
  INVX1 _11_ (
    .A(B[1]),
    .Y(_02_)
  );
  NAND2X1 _12_ (
    .A(Sel),
    .B(A[1]),
    .Y(_03_)
  );
  OAI21X1 _13_ (
    .A(_02_),
    .B(Sel),
    .C(_03_),
    .Y(Out[1])
  );
  INVX1 _14_ (
    .A(B[2]),
    .Y(_04_)
  );
  NAND2X1 _15_ (
    .A(Sel),
    .B(A[2]),
    .Y(_05_)
  );
  OAI21X1 _16_ (
    .A(_04_),
    .B(Sel),
    .C(_05_),
    .Y(Out[2])
  );
  INVX1 _17_ (
    .A(B[3]),
    .Y(_06_)
  );
  NAND2X1 _18_ (
    .A(Sel),
    .B(A[3]),
    .Y(_07_)
  );
  OAI21X1 _19_ (
    .A(_06_),
    .B(Sel),
    .C(_07_),
    .Y(Out[3])
  );
endmodule

module \$paramod\RCA\n=4 (A, B, Ci, Co, S);
  input [3:0] A;
  input [3:0] B;
  input Ci;
  output Co;
  output [3:0] S;
  wire [4:0] c;
  FA \addbit[0].bit  (
    .a(A[0]),
    .b(B[0]),
    .ci(Ci),
    .co(c[1]),
    .s(S[0])
  );
  FA \addbit[1].bit  (
    .a(A[1]),
    .b(B[1]),
    .ci(c[1]),
    .co(c[2]),
    .s(S[1])
  );
  FA \addbit[2].bit  (
    .a(A[2]),
    .b(B[2]),
    .ci(c[2]),
    .co(c[3]),
    .s(S[2])
  );
  FA \addbit[3].bit  (
    .a(A[3]),
    .b(B[3]),
    .ci(c[3]),
    .co(Co),
    .s(S[3])
  );
endmodule

module CSA(A, B, Ci, Co, S);
  input [15:0] A;
  input [15:0] B;
  wire [4:0] C;
  input Ci;
  output Co;
  wire [1:0] Ctmp;
  output [15:0] S;
  wire [11:0] \Stmp[0] ;
  wire [11:0] \Stmp[1] ;
  \$paramod\RCA\n=4  \addbit.$genblock$n-bit%20CSA\CSA.v:25$33[4].bitA  (
    .A(A[7:4]),
    .B(B[7:4]),
    .Ci(1'b0),
    .Co(Ctmp[0]),
    .S(\Stmp[0] [7:4])
  );
  \$paramod\RCA\n=4  \addbit.$genblock$n-bit%20CSA\CSA.v:25$33[4].bitB  (
    .A(A[7:4]),
    .B(B[7:4]),
    .Ci(1'b1),
    .Co(Ctmp[1]),
    .S(\Stmp[1] [7:4])
  );
  \$paramod\MUX\n=4  \addbit.$genblock$n-bit%20CSA\CSA.v:25$33[4].bitX  (
    .A(\Stmp[1] [7:4]),
    .B(\Stmp[0] [7:4]),
    .Out(S[7:4]),
    .Sel(C[1])
  );
  \$paramod\MUX\n=1  \addbit.$genblock$n-bit%20CSA\CSA.v:25$33[4].bitZ  (
    .A(Ctmp[1]),
    .B(Ctmp[0]),
    .Out(C[2]),
    .Sel(C[1])
  );
  \$paramod\RCA\n=4  \addbit.$genblock$n-bit%20CSA\CSA.v:25$38[8].bitA  (
    .A(A[11:8]),
    .B(B[11:8]),
    .Ci(1'b0),
    .Co(Ctmp[0]),
    .S(\Stmp[0] [11:8])
  );
  \$paramod\RCA\n=4  \addbit.$genblock$n-bit%20CSA\CSA.v:25$38[8].bitB  (
    .A(A[11:8]),
    .B(B[11:8]),
    .Ci(1'b1),
    .Co(Ctmp[1]),
    .S(\Stmp[1] [11:8])
  );
  \$paramod\MUX\n=4  \addbit.$genblock$n-bit%20CSA\CSA.v:25$38[8].bitX  (
    .A(\Stmp[1] [11:8]),
    .B(\Stmp[0] [11:8]),
    .Out(S[11:8]),
    .Sel(C[2])
  );
  \$paramod\MUX\n=1  \addbit.$genblock$n-bit%20CSA\CSA.v:25$38[8].bitZ  (
    .A(Ctmp[1]),
    .B(Ctmp[0]),
    .Out(C[3]),
    .Sel(C[2])
  );
  \$paramod\RCA\n=4  \addbit.$genblock$n-bit%20CSA\CSA.v:25$43[12].bitA  (
    .A(A[15:12]),
    .B(B[15:12]),
    .Ci(1'b0),
    .Co(Ctmp[0]),
    .S(4'bxxxx)
  );
  \$paramod\RCA\n=4  \addbit.$genblock$n-bit%20CSA\CSA.v:25$43[12].bitB  (
    .A(A[15:12]),
    .B(B[15:12]),
    .Ci(1'b1),
    .Co(Ctmp[1]),
    .S(4'bxxxx)
  );
  \$paramod\MUX\n=4  \addbit.$genblock$n-bit%20CSA\CSA.v:25$43[12].bitX  (
    .A(4'bxxxx),
    .B(4'bxxxx),
    .Out(S[15:12]),
    .Sel(C[3])
  );
  \$paramod\MUX\n=1  \addbit.$genblock$n-bit%20CSA\CSA.v:25$43[12].bitZ  (
    .A(Ctmp[1]),
    .B(Ctmp[0]),
    .Out(Co),
    .Sel(C[3])
  );
  \$paramod\RCA\n=4  \addbit.bitN  (
    .A(A[3:0]),
    .B(B[3:0]),
    .Ci(Ci),
    .Co(C[1]),
    .S(S[3:0])
  );
endmodule

module FA(a, b, ci, co, s);
  wire _00_;
  wire _01_;
  wire _02_;
  wire _03_;
  wire _04_;
  wire _05_;
  wire _06_;
  input a;
  input b;
  input ci;
  output co;
  output s;
  AND2X2 _07_ (
    .A(a),
    .B(ci),
    .Y(_03_)
  );
  NOR2X1 _08_ (
    .A(a),
    .B(ci),
    .Y(_04_)
  );
  OAI21X1 _09_ (
    .A(_03_),
    .B(_04_),
    .C(b),
    .Y(_05_)
  );
  INVX1 _10_ (
    .A(b),
    .Y(_06_)
  );
  NAND2X1 _11_ (
    .A(a),
    .B(ci),
    .Y(_00_)
  );
  OR2X2 _12_ (
    .A(a),
    .B(ci),
    .Y(_01_)
  );
  NAND3X1 _13_ (
    .A(_06_),
    .B(_00_),
    .C(_01_),
    .Y(_02_)
  );
  NAND2X1 _14_ (
    .A(_05_),
    .B(_02_),
    .Y(s)
  );
  AOI21X1 _15_ (
    .A(_06_),
    .B(_00_),
    .C(_04_),
    .Y(co)
  );
endmodule
