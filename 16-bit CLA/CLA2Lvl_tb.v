// file: CLA2Lvl_tb.v
// author: @amrgouhar
// Testbench for CLA2Lvl

`timescale 1ns/1ns

module CLA2Lvl_tb;

	//Inputs
	reg [15: 0] A;
	reg [15: 0] B;
	reg ci;


	//Outputs
	wire co, ref_co, err;
	wire [15: 0] S, ref_s;


	//Instantiation of Unit Under Test
	CLA2Lvl uut (
		.A(A),
		.B(B),
		.ci(ci),
		.co(co),
		.S(S)
	);
assign {ref_co,ref_s} = A + B+ ci;
assign err = (ref_s != S) || (ref_co != co);

integer i, j, k;
	initial begin
	//Inputs initialization
		A = 0;
		B = 0;
		ci = 0;
for(i =0; i < 2; i=i + 1) begin
    #5 ci = i;
    for (j=0; j< 256; j = j + 1)
        for(k =0; k < 32; k = k + 1) begin
            #5 A = j;
            B = k;
        end
 end
	//Wait for the reset
		#100;

	end

endmodule