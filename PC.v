module PC(CLK,reset,input_flag, output_flag, insert, addressIn,addressOut);
	input CLK, reset, input_flag, output_flag, insert;
	input [31:0] addressIn;
	output reg [31:0] addressOut;
	
	integer counter = 0;
	always@(posedge CLK or posedge reset)
	begin
		if (reset) addressOut <= 0;
		else if(!input_flag && !output_flag)begin
			addressOut <= addressIn;
		end
		else if (insert && (counter < 5)) counter <= counter + 1;
		else if(insert)begin
			counter <= 0;
			addressOut <= addressIn;
		end
	end
endmodule
