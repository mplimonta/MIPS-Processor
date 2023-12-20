module SetProcessState(CLK,CurrentProcessState, changeROM, EndOfProcess);
	input CLK;
	output reg [31:0] CurrentProcessState;
	input changeROM;
	input EndOfProcess;
	
	initial begin
		CurrentProcessState = 1;
	end
	
	always@(CLK)begin
		if(changeROM)begin
			CurrentProcessState <= 1;
		end
		if(EndOfProcess)begin
			CurrentProcessState <= 0;
		end
	end
endmodule
