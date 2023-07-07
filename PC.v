module PC(CLK,addressIn,addressOut, linha);
	input CLK;
	input [31:0] addressIn;
	output reg [31:0] addressOut;
	output reg [31:0] linha;
	always@(posedge CLK)
	begin
		addressOut <= addressIn;
		linha = (addressOut >> 2) + 2;
	end
endmodule
