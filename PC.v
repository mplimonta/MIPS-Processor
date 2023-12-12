module PC(CLK,reset,input_flag, output_flag, insert, addressIn, inProgram,addressOut, ContextChangeBack,NextLineTBE,savedLine);
	input CLK, reset, input_flag, output_flag, insert;
	input [31:0] addressIn;
	input inProgram;
	output reg [31:0] addressOut;
	output reg ContextChangeBack;
	input NextLineTBE;
	
	output reg [31:0] savedLine;
	integer lastinsert = 0;
	integer instcount = 0;
	always@(CLK)
	begin
		if(NextLineTBE)begin
			savedLine = addressIn + (10)*4;
//			addressOut <= addressIn;
		end
	end 
	
	always@(posedge CLK or posedge reset)
	begin
		if (reset) begin
			instcount  <= 0;
			addressOut <= 0;
		end
//		else if(NextLineTBE)begin
//			savedLine = addressIn + (10)*4;
//			addressOut <= addressIn;
//		end
		else if(!input_flag && !output_flag)begin
			if (instcount > 10)begin
				ContextChangeBack <= 1;
				addressOut <= savedLine;
				instcount  <= 0;
			end
			else begin
				if (instcount == 0) ContextChangeBack <= 0;
				instcount <= instcount + 1;
				addressOut <= addressIn;
				if (!inProgram)begin
					instcount <= 0;
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

