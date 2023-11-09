module ControlUnit(Opcode,RegisterDST,Jump,Branch,memtoReg,ALUSrc,regWrite,memWrite,memRead,Alu_op,halt, output_flag, input_flag);
	input [5:0] Opcode;
	output reg halt, output_flag, input_flag;
	output reg [1:0] Jump, RegisterDST, memtoReg;
	output reg Branch,ALUSrc,regWrite,memWrite,memRead;
	output reg [2:0] Alu_op;
	always@(*) 
	begin
		if(Opcode == 6'b000000)				//Instrução tipo R
		begin
			RegisterDST <= 2'b01;
			Jump <= 2'b00;
			Branch <= 1'b0;
			memtoReg <= 2'b00;
			ALUSrc <= 1'b0;
			regWrite <= 1'b1;
			memWrite <= 1'b0;
			memRead <= 1'b0;
			Alu_op <= 3'b100;
			halt <= 1'b0;
			output_flag <= 1'b0;
			input_flag <= 1'b0;
		end
		else if (Opcode == 6'b000001)		//Instrução tipo I : lw
		begin
			RegisterDST <= 2'b00;
			Jump <= 2'b00;
			Branch <= 1'b0;
			memtoReg <= 2'b01;
			ALUSrc <= 1'b1;
			regWrite <= 1'b1;
			memWrite <= 1'b0;
			memRead <= 1'b1;
			Alu_op <= 3'b000;
			halt <= 1'b0;
			output_flag <= 1'b0;
			input_flag <= 1'b0;
		end
		else if (Opcode == 6'b000010)		//Instrução tipo I : sw
		begin
			RegisterDST <= 2'b00;
			Jump <= 2'b00;
			Branch <= 1'b0;
			memtoReg <= 2'b00;
			ALUSrc <= 1'b1;
			regWrite <= 1'b0;
			memWrite <= 1'b1;
			memRead <= 1'b0;
			Alu_op <= 3'b000;
			halt <= 1'b0;
			output_flag <= 1'b0;
			input_flag <= 1'b0;
		end
		else if (Opcode == 6'b000011)		//Instrução tipo I : addi
		begin
			RegisterDST <= 2'b00;
			Jump <= 2'b00;
			Branch <= 1'b0;
			memtoReg <= 2'b00;
			ALUSrc <= 1'b1;
			regWrite <= 1'b1;
			memWrite <= 1'b0;
			memRead <= 1'b0;
			Alu_op <= 3'b000;
			halt <= 1'b0;
			output_flag <= 1'b0;
			input_flag <= 1'b0;
		end
		else if (Opcode == 6'b000100)		//Instrução tipo I : subi
		begin
			RegisterDST <= 2'b00;
			Jump <= 2'b00;
			Branch <= 1'b0;
			memtoReg <= 2'b00;
			ALUSrc <= 1'b1;
			regWrite <= 1'b1;
			memWrite <= 1'b0;
			memRead <= 1'b0;
			Alu_op <= 3'b001;
			halt <= 1'b0;
			output_flag <= 1'b0;
			input_flag <= 1'b0;
		end
		else if (Opcode == 6'b000101)		//Instrução tipo I : beq
		begin
			RegisterDST <= 2'b00;
			Jump <= 2'b00;
			Branch <= 1'b1;
			memtoReg <= 2'b00;
			ALUSrc <= 1'b0;
			regWrite <= 1'b0;
			memWrite <= 1'b0;
			memRead <= 1'b0;
			Alu_op <= 3'b011;
			halt <= 1'b0;
			output_flag <= 1'b0;
			input_flag <= 1'b0;
		end

		else if (Opcode == 6'b001001)		//Instrução tipo J : j
		begin
			RegisterDST <= 2'b00;
			Jump <= 2'b01;
			Branch <= 1'b0;
			memtoReg <= 2'b00;
			ALUSrc <= 1'b0;
			regWrite <= 1'b0;
			memWrite <= 1'b0;
			memRead <= 1'b0;
			Alu_op <= 3'b000;
			halt <= 1'b0;
			output_flag <= 1'b0;
			input_flag <= 1'b0;
		end
		else if (Opcode == 6'b001010)		//Instrução tipo J : jr
		begin
			RegisterDST <= 2'b10;
			Jump <= 2'b10;
			Branch <= 1'b0;
			memtoReg <= 2'b00;
			ALUSrc <= 1'b0;
			regWrite <= 1'b0;
			memWrite <= 1'b0;
			memRead <= 1'b0;
			Alu_op <= 3'b000;
			halt <= 1'b0;
			output_flag <= 1'b0;
			input_flag <= 1'b0;
		end
		else if (Opcode == 6'b001011)		//Instrução tipo J : jal
		begin
			RegisterDST <= 2'b10;
			Jump <= 2'b01;
			Branch <= 1'b0;
			memtoReg <= 2'b10;
			ALUSrc <= 1'b0;
			regWrite <= 1'b1;
			memWrite <= 1'b0;
			memRead <= 1'b0;
			Alu_op <= 3'b000;
			halt <= 1'b0;
			output_flag <= 1'b0;	
			input_flag <= 1'b0;
		end
		else if (Opcode == 6'b001100)		//Input
		begin
			RegisterDST <= 2'b11;
			Jump <= 2'b00;
			Branch <= 1'b0;
			memtoReg <= 2'b11;
			ALUSrc <= 1'b0;
			regWrite <= 1'b1;
			memWrite <= 1'b0;
			memRead <= 1'b0;
			Alu_op <= 3'b000;
			halt <= 1'b0;
			output_flag <= 1'b0;
			input_flag <= 1'b1;
		end
		else if (Opcode == 6'b001101)		//Output
		begin
			RegisterDST <= 2'b00;
			Jump <= 2'b00;
			Branch <= 1'b0;
			memtoReg <= 2'b00;
			ALUSrc <= 1'b0;
			regWrite <= 1'b0;
			memWrite <= 1'b0;
			memRead <= 1'b0;
			Alu_op <= 3'b000;
			halt <= 1'b0;
			output_flag <= 1'b1;
			input_flag <= 1'b0;
		end
		else if (Opcode == 6'b111111)		//HALT
		begin
			RegisterDST <= 2'b00;
			Jump <= 2'b00;
			Branch <= 1'b0;
			memtoReg <= 2'b00;
			ALUSrc <= 1'b0;
			regWrite <= 1'b0;
			memWrite <= 1'b0;
			memRead <= 1'b0;
			Alu_op <= 3'b000;
			halt <= 1'b1;
			output_flag <= 1'b0;
			input_flag <= 1'b0;
		end
		else 										//default
		begin
			RegisterDST <= 2'b00;
			Jump <= 2'b00;
			Branch <= 1'b0;
			memtoReg <= 2'b00;
			ALUSrc <= 1'b0;
			regWrite <= 1'b0;
			memWrite <= 1'b0;
			memRead <= 1'b0;
			Alu_op <= 3'b000;
			halt <= 1'b0;
			output_flag <= 1'b0;
			input_flag <= 1'b0;
		end
	end
endmodule
	
	
	
	
	
	
	
	
	
	