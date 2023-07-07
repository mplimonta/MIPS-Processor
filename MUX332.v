module MUX332
#(parameter addrsize = 32)
(a,b,c,Condition,Out);
	input [addrsize-1:0] a,b,c;
	input [1:0]Condition;
	output [addrsize-1:0]Out;
	assign Out = (Condition == 0) ? a:(Condition == 1)? b:c;
endmodule
