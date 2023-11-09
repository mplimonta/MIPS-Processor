module MUX432
#(parameter addrsize = 32)
(a,b,c,d,Condition,Out);
	input [addrsize-1:0] a,b,c,d;
	input [1:0]Condition;
	output [addrsize-1:0]Out;
	assign Out = (Condition == 2'b00) ? a:(Condition == 2'b01)? b: (Condition == 2'b10)? c:d;
endmodule

