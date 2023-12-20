module ShiftLeft2_26(dataIN1,dataIN2,dataOUT);
	input [25:0] dataIN1;
	input [3:0] dataIN2;
	output reg [31:0] dataOUT;
	
	always@(dataIN1,dataIN2)
	begin
		dataOUT <= dataIN1 << 2;
	end
endmodule
