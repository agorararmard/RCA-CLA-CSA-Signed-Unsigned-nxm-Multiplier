// file: CLA_tb.v
// author: @amrgouhar
// Testbench for CLA

`timescale 1ns/1ns

module CLA_tb;

	//Inputs
	reg [3: 0] A;
	reg [3: 0] B;
	reg Ci;


	//Outputs
	wire Co, ref_co, err;
	wire [3: 0] S, ref_S;


	//Instantiation of Unit Under Test
	CLA uut (
		.A(A),
		.B(B),
		.Ci(Ci),
		.Co(Co),
		.S(S)
	);
assign {ref_co, ref_S} = A + B + Ci;
assign err = (ref_co != Co) || (ref_S != S);

integer i, j, k;
	initial begin
	//Inputs initialization
		A = 0;
		B = 0;
		Ci = 0;
for(k =0; k < 2; k=k+1) begin
    #5 Ci = k;
    for(i = 0; i < 4; i = i + 1)
        for(j=0; j< 4; j = j + 1) begin
            #5 A = i;
            B = j;
        end
end        
	
	end

endmodule