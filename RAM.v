module RAM
(
	input [31:0] data,
	input [9:0] addr,
	input mW, mR,clk,
	output [31:0] DataOut
);
	reg [31:0] ram[127:0];
	
	always @ (negedge clk)
	begin
		if (mW) ram[addr] <= data;
	end 
	assign DataOut = ram[addr];

endmodule
