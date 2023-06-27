module RAM
(
	input [31:0] data,
	input [31:0] addr,
	input mW, mR,clk,
	output [31:0] DataOut
);
	reg [31:0] ram[31:0];
	always @ (posedge clk)
	begin
		if (mW)
			ram[addr[6:2]] <= data;
	end 
	assign DataOut = ram[addr[6:2]];

endmodule
