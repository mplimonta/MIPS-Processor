module PC(CLK,reset,input_flag, output_flag, insert, addressIn,addressOut);
	input CLK, reset, input_flag, output_flag, insert;
	input [31:0] addressIn;
	output reg [31:0] addressOut;
	
	integer counter = 0;
	integer instcount  = 0;
	always@(posedge CLK or posedge reset)
	begin
		if (reset) begin
		instcount  <= 0;
		addressOut <= 0;
		end
		else if(!input_flag && !output_flag)begin
			instcount <= instcount + 1;
			addressOut <= addressIn;
		end
		else if (insert && (counter < 5)) counter <= counter + 1;
		else if(insert)begin
			counter <= 0;
			addressOut <= addressIn;
			instcount <= instcount + 1;
		end
	end
endmodule

