module MUX532
#(parameter addrsize = 32)
(a,b,c,d,e,Condition,Out);
	input [addrsize-1:0] a,b,c,d,e;
	input [2:0]Condition;
	output [addrsize-1:0]Out;
	assign Out = (Condition == 3'b000) ? a:(Condition == 3'b001)? b: (Condition == 3'b010)? c: (Condition == 3'b011)? d:e;
endmodule

