module SetJumpOffset(CLK,ReadData2, Offsetchange, NewJumpADDR, shift26_Out, JumpOffset);
 input CLK;
 input [31:0] ReadData2;
 input Offsetchange;
 output [31:0] NewJumpADDR;
 input [31:0] shift26_Out;
 output reg [31:0] JumpOffset;
 
 initial begin
		JumpOffset <= 0;
	end
	always@(posedge CLK)begin
		if(Offsetchange)begin
			JumpOffset <= ReadData2;
		end
		
	end
	assign NewJumpADDR = shift26_Out + JumpOffset;
endmodule
