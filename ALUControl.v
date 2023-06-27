module ALUControl(ALU_Op,Funct,ALU_Control);
	input [5:0] Funct;
	input [2:0] ALU_Op;
	output reg [3:0] ALU_Control;
	
	always @(ALU_Op,Funct)
	begin
		case(ALU_Op)
			2'b000: ALU_Control <= 4'b0011; //Soma
			2'b001: ALU_Control <= 4'b0010; //Sub
			2'b010:
				begin
					case(Funct)
						6'b100000: ALU_Control <= 4'b0000; //Divisao
						6'b000001: ALU_Control <= 4'b0001; //Multiplicacao
						6'b000010: ALU_Control <= 4'b0010; //Subtracao
						6'b000011: ALU_Control <= 4'b0011; //Soma
						6'b000100: ALU_Control <= 4'b0100; //Or
						6'b000101: ALU_Control <= 4'b0101; //And
						
						
						default: ALU_Control <= 4'b1111;
					endcase
				end
			2'b011: ALU_Control <= 4'b0110; //bne
			2'b100: ALU_Control <= 4'b0111; //bgt
			2'b101: ALU_Control <= 4'b1000; //blt
			default: ALU_Control <= 4'b1111;
		endcase
	end
endmodule