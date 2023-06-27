module ShiftLeft2_32(dataIN,dataOUT);
	input [31:0] dataIN;
	output reg [31:0] dataOUT;
	
	always@(dataIN)
	begin
		dataOUT[31:2] <= dataIN[29:0];
		dataOUT[1:0] <= 2'b00;
	end
endmodule
