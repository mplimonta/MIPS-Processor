module PC(CLK,addressIn,addressOut);
	input CLK;
	input [31:0] addressIn;
	output reg [31:0] addressOut;
	always@(posedge CLK)
	begin
		addressOut <= addressIn;
	end
endmodule
