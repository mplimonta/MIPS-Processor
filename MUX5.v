module MUX5(a,b,Condition,Out);
	input [4:0] a,b;
	input Condition;
	output [4:0]Out;
	assign Out = (Condition==0) ? a:b;
endmodule

