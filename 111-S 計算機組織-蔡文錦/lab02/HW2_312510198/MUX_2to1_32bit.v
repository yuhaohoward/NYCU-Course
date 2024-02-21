module MUX_2to1_32bit(input [31:0] data0, data1, input select, output [31:0] data );
	//Do same MUX_2to1 32 times 
	//generate
	genvar i;
	generate
		for(i = 0; i < 32; i = i + 1)
			MUX_2to1 M( data0[i], data1[i], select, data[i] );
	endgenerate
	//
endmodule