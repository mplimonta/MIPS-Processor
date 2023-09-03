module DivisorFreq
(
	input clk, reset, setFreq,
	output reg reg1Hz,
	input halt
);

initial begin
	reg1Hz <= 1;
	if(setFreq)	freq <= 0;
	else freq <= 2500;//2500
end

integer count = 0;
integer freq;

always @(negedge clk)  begin	
//	if(halt) begin
//		reg1Hz<= 0;
//	end
	if(reset) begin
		count <= 0;
		reg1Hz <= 0;
	end
	else if (!halt || !reg1Hz)begin
		if (count == freq) begin
			count <= 0;
			reg1Hz <= ~reg1Hz;
		end
		else begin
			count <= count + 1;
		end
	end
end

endmodule
