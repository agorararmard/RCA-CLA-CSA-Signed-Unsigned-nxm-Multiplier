// file: RCA_tb.v
// author: @amrgouhar
// Testbench for RCA

`timescale 1ns/1ns

module RCA_tb;

	//Inputs
	reg [3: 0] A;
	reg [3: 0] B;
	reg Ci;


	//Outputs
	wire Co, err, ref_co;
	wire [3: 0] S, ref_S;

	//Instantiation of Unit Under Test
	RCA uut (
		.A(A),
		.B(B),
		.Ci(Ci),
		.Co(Co),
		.S(S)
	);
    assign {ref_co, ref_S} = A + B + Ci;
    assign err = (ref_S != S) || (ref_co != Co);

integer i, j, k;
	initial begin
	//Inputs initialization
		A = 0;
		B = 0;
		Ci = 0;
for(k = 0; k < 2; k = k+1) begin
    #5 Ci = k;
    for(i = 0; i < 16; i= i+1)
        for(j =0; j < 16; j = j+1) begin
            #5  A = i;
            B = j;
        end
end
	//Wait for the reset
		#100;

	end

endmodule