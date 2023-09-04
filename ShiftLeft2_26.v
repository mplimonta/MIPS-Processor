module ShiftLeft2_26(dataIN1,dataIN2,dataOUT);
	input [25:0] dataIN1;
	input [3:0] dataIN2;
	output reg [31:0] dataOUT;
	
	always@(dataIN1,dataIN2)
	begin
		dataOUT <= dataIN1 << 2;
		//dataOUT[27:2] <= dataIN1[25:0];
		//dataOUT[1:0] <= 2'b00;
		//dataOUT[31:28] <= dataIN2[3:0];
	end
endmodule


//01234567890123456789012 00