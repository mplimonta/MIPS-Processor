module ALUControl(ALU_Op,Funct,ALU_Control);
	input [5:0] Funct;
	input [2:0] ALU_Op;
	output reg [3:0] ALU_Control;
	
	always @(ALU_Op,Funct)
	begin
		case(ALU_Op)
			3'b000: ALU_Control <= 4'b0011; //Addi
			3'b001: ALU_Control <= 4'b0010; //Subi
			3'b011: ALU_Control <= 4'b1010; //beq
			3'b100:
				begin
					case(Funct)	// Type R
						6'b100000: ALU_Control <= 4'b0000; //Div
						6'b000001: ALU_Control <= 4'b0001; //Mult
						6'b000010: ALU_Control <= 4'b0010; //Sub
						6'b000011: ALU_Control <= 4'b0011; //Add
						6'b000100: ALU_Control <= 4'b0100; //Or
						6'b000101: ALU_Control <= 4'b0101; //And
						6'b000110: ALU_Control <= 4'b0110; //lt
						6'b000111: ALU_Control <= 4'b0111; //let
						6'b001000: ALU_Control <= 4'b1000; //gt
						6'b001001: ALU_Control <= 4'b1001; //get
						6'b001010: ALU_Control <= 4'b1010; //comp
						6'b001011: ALU_Control <= 4'b1011; //neq
						default: ALU_Control <= 4'b1111;
					endcase
				end
			default: ALU_Control <= 4'b1111;
		endcase
	end
endmodule
