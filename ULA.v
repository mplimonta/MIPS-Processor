module ULA
(
	input [3:0] ALU_Control,
	input [31:0] inA,
	input [31:0] inB,
	output zero,
	output reg [31:0] result
	
);

	always@(inA,inB,ALU_Control)
	begin
		if (ALU_Control == 4'b0000)      			//Div
		begin
			result <= inA/inB;
		end
		else if (ALU_Control == 4'b0001) 			//Mult
		begin
				result <= inA*inB;
		end
		else if (ALU_Control == 4'b0010)          //Subi
		begin
			result <= inA-inB;
		end
		else if (ALU_Control == 4'b0011) 			//Soma
		begin
			result <= inA+inB;
		end
		else if (ALU_Control == 4'b0100)          //Or
		begin
			result <= inA | inB;
		end
		else if (ALU_Control == 4'b0101)          //And
		begin
			result <= inA & inB;
		end
		else if (ALU_Control == 4'b0110)		//para o lt
		begin
			if(inA < inB)		
				result <= 1;
			else
				result <= 0;
		end
		else if (ALU_Control == 4'b0111)		//para o let
		begin
			if (inA <= inB)
				result <= 1;
			else
				result <= 0;
		end
		
		else if (ALU_Control == 4'b1000)		//para o gt
		begin
			if (inA > inB)
				result <= 1;
			else
				result <= 0;
		end
		else if (ALU_Control == 4'b1001)		//para o get
		begin
			if (inA >= inB)
				result <= 1;
			else
				result <= 0;
		end
		else if (ALU_Control == 4'b1010)		//para o comp
		begin
			if (inA == inB)
				result <= 1;
			else
				result <= 0;
		end
		else if (ALU_Control == 4'b1011)		//para o neq
		begin
			if (inA != inB)
				result <= 1;
			else
				result <= 0;
		end
		else
			result <= 0;
	end
	assign zero = (result == 0);
endmodule

