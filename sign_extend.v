module sign_extend(in,out);
	input [15:0] in;
	output reg [31:0] out;
	always@(in)
	begin
		out = in;
		if(in[15] == 1)begin
			out[31:16]= 16'b1111111111111111;
		end
		else begin
			out[31:16] = 16'b0000000000000000;
		end
	end
endmodule
