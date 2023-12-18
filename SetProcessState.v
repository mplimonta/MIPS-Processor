module SetProcessState(CLK,CurrentProcessState, changeROM, EOfProcess);
	input CLK;
	output reg CurrentProcessState;
	input changeROM;
	input EOfProcess;
	
	initial begin
		CurrentProcessState = 1;
	end
	
	always@(CLK)begin
		if(changeROM)begin
			CurrentProcessState <= 1;
		end
		if(EOfProcess)begin
			CurrentProcessState <= 0;
		end
	end
endmodule
