module SetJumpOffset(CLK,ReadData2, Offsetchange, JumpOffset);
 input CLK;
 input [31:0] ReadData2;
 input Offsetchange;
 output reg [31:0] JumpOffset;
 
 initial begin
		JumpOffset <= 0;
	end
	always@(posedge CLK)begin
		if(Offsetchange)begin
			JumpOffset <= ReadData2;
		end
	end
endmodule
