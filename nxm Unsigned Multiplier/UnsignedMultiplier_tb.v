// file: UnsignedMultiplier_tb.v
// author: @amrgouhar
// Testbench for UnsignedMultiplier

`timescale 1ns/1ns

module UnsignedMultiplier_tb;

	//Inputs
	reg [3: 0] A;
	reg [3: 0] B;


	//Outputs
	wire [7: 0] P, ref_P;
	wire err;


	//Instantiation of Unit Under Test
	UnsignedMultiplier uut (
		.A(A),
		.B(B),
		.P(P)
	);
assign ref_P = A * B;
assign err = (ref_P!=P);

integer i, j;
	initial begin
	//Inputs initialization
		A = 0;
		B = 0;
for(i = 0; i < 16; i = i + 1)
    for(j = 0; j < 16; j = j +1) begin
        #5 A = i;
        B = j;
    end
	//Wait for the reset
		#100;

	end

endmodule