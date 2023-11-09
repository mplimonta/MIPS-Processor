module PC_4(address,addressOut);
	input [31:0] address;
	output [31:0] addressOut;
	assign addressOut = address + 32'd4;
endmodule
