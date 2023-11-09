module MUX32(a,b,Condition,Out);
	input [31:0] a,b;
	input Condition;
	output [31:0]Out;
	assign Out = (Condition == 0) ? a:b;
endmodule

