module DivisorFreq
(
	input wire clk, reset, setFreq,
	output reg reg1Hz,
	input wire halt
);

initial begin
	reg1Hz <= 1;
	if(setFreq)	freq <= 0;
	else freq <= 25000000;
end

integer count = 0;
integer freq;

always @(negedge clk)  begin	
	if(halt) begin
		reg1Hz<= 0;
	end
	else begin
		if(reset) begin
			count <= 0;
			reg1Hz <= 0;
		end
		else if (count == freq) begin
			count <= 0;
			reg1Hz <= ~reg1Hz;
		end
		else begin
			count <= count + 1;
		end
	end
end

endmodule
