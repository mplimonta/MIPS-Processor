module RAM
(
	input [31:0] data,
	input [9:0] addr,
	input mW,clk,clk2,
	output reg [31:0] DataOut
);
	reg [31:0] ram[2047:0];
	
	
	always @ (negedge clk)begin
		if (mW) ram[addr] <= data;
	end 
	always @ (negedge clk2)begin
		DataOut <= ram[addr];
	end
endmodule

