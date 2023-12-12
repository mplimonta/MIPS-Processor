module RAM
(
	input [31:0] data,
	input [11:0] addr,
	input mW,clk,clk2,
	output reg [31:0] DataOut,
	input [11:0] ProcessOffset
);
	reg [31:0] ram[3178:0];
	
	
	always @ (negedge clk)begin
		if (mW)begin
			ram[addr] <= data;
		end
//		else if(NextLineTBE)begin
//			ram[0] <= savedLine;
//		end
	end 
	always @ (negedge clk2)begin
		DataOut <= ram[addr];
	end
endmodule
