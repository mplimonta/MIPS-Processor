module PC(CLK,reset,input_flag, output_flag, insert,
addressIn, inProgram,addressOut, ContextChangeBack,
NextLineTBE,savedLine, changeROM, Read_Data_Out, EndProcess, setQuantum, ReadData1, quantumAdd);
	
	input CLK, reset, input_flag, output_flag, insert;
	input [31:0] addressIn;
	input inProgram;
	output reg [31:0] addressOut;
	output reg ContextChangeBack;
	input [1:0] NextLineTBE;
	output reg [31:0] savedLine;
	input changeROM;
	input [31:0] Read_Data_Out;
	
	integer lastinsert = 0;
	integer instcount = 0;
	reg [31:0] nextSoInst;
	input EndProcess;
	input setQuantum;
	input [31:0] ReadData1;
	output reg [31:0] quantumAdd;


	
	always@(negedge CLK)
	begin
		if(inProgram)begin
			savedLine = addressIn;
		end
		if(setQuantum)begin
			quantumAdd <= ReadData1;
		end
	end 
	always@(posedge CLK or posedge reset)
	begin
		if (reset) begin
			instcount  <= 0;
			addressOut <= 0;
		end
		else if(!input_flag && !output_flag)begin
			if (instcount > 50 + 32 + quantumAdd || EndProcess)begin
				ContextChangeBack <= 1;
				addressOut <= nextSoInst;
				instcount  <= 0;
			end
			else begin
				if (instcount == 0) ContextChangeBack <= 0;
				instcount <= instcount + 1;
				addressOut <= addressIn;
				if (!inProgram)begin
					instcount <= 0;
				end
				if(changeROM)begin
					nextSoInst <= addressIn;
					addressOut <= Read_Data_Out;
				end
			end
		end
		else if(insert != lastinsert)begin
			addressOut <= addressIn;
			instcount <= instcount + 1;
			lastinsert <= insert;
		end
	end
endmodule

