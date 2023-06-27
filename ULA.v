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
		if (ALU_Control == 4'b0000)      			//Divisao
		begin
			result <= inA/inB;
		end
		else if (ALU_Control == 4'b0001) 			//Multiplicacao
		begin
				result <= inA*inB;
		end
		else if (ALU_Control == 4'b0010)          //Subtracao
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
		else if (ALU_Control == 4'b0110)		//para o BNE
		begin
			if(inA != inB)		
				result <= 32'b00000000000000000000000000000000;
			else
				result <= 32'b00000000000000000000000000000001;
		end
		else if (ALU_Control == 4'b0111)		//para o BGT
		begin
			if (inA > inB)
				result <= 0;
			else
				result <= 1;
		end
		else if (ALU_Control == 4'b1000)		//para o blt
		begin
			if (inA < inB)
				result <= 0;
			else
				result <= 1;
		end
		else
			result <= 0;
			
	end
	assign zero = (result == 0)? 1:0;
endmodule

