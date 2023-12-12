module RAM
(
	input [31:0] data,
	input [11:0] addr,
	input mW,clk,clk2,
	output reg [31:0] DataOut,
	input [11:0] ProcessOffset,
	input OffsetChange,
	output reg [11:0] inRAMOffset
);
	reg [31:0] ram[3178:0];
	reg [11:0] Offset;
	
	initial begin
		Offset = 12'b000000000000;
	end
	
	always @ (negedge clk)begin
		if (mW)begin
			ram[addr+Offset] <= data;
		end
	end 
	always @ (negedge clk2)begin
		DataOut <= ram[addr+Offset];
		
		if(OffsetChange)begin
			Offset = ProcessOffset;
			inRAMOffset = Offset;
		end
		
	end
endmodule
