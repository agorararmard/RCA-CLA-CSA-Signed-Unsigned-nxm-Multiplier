// file: CSA_tb.v
// author: @amrgouhar
// Testbench for CSA

`timescale 1ns/1ns

module CSA_tb;

	//Inputs
	reg [15: 0] A;
	reg [15: 0] B;
	reg Ci;


	//Outputs
	wire Co, ref_co, err;
	wire [15: 0] S, ref_s;


	//Instantiation of Unit Under Test
	CSA uut (
		.A(A),
		.B(B),
		.Ci(Ci),
		.Co(Co),
		.S(S)
	);
assign {ref_co, ref_s} = A+B+Ci;
assign err = (ref_s != S) || (ref_co != Co);

integer i, j, k;
	initial begin
	//Inputs initialization
		A = 0;
		B = 0;
		Ci = 0;
for(k=0; k<2; k = k+1) begin
    #5 Ci = k;
    for(i =0; i < 256; i= i+1)
        for(j=0; j < 16; j = j +1) begin
            #5 A = i;
            B= j;
        end
end
	//Wait for the reset
	

	end

endmodule