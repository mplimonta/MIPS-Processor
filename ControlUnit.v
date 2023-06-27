module ControlUnit(Opcode,RegisterDST,Jump,Branch,memtoReg,ALUSrc,regWrite,memWrite,memRead,Alu_op);
	input [5:0] Opcode;
	output reg RegisterDST,Jump,Branch,memtoReg,ALUSrc,regWrite,memWrite,memRead;
	output reg [2:0] Alu_op;
	always@(*) 
	begin
		if(Opcode == 6'b000000)				//Instrução tipo R
		begin
			RegisterDST <= 1;
			Jump <= 0;
			Branch <= 0;
			memtoReg <= 0;
			ALUSrc <= 0;
			regWrite <= 1;
			memWrite <= 0;
			memRead <= 0;
			Alu_op <= 3'b010;
		end
		else if (Opcode == 6'b000001)		//Instrução tipo I : lw
		begin
			RegisterDST <= 0;
			Jump <= 0;
			Branch <= 0;
			memtoReg <= 1;
			ALUSrc <= 1;
			regWrite <= 1;
			memWrite <= 0;
			memRead <= 1;
			Alu_op <= 3'b000;
		end
		else if (Opcode == 6'b000010)		//Instrução tipo I : sw
		begin
			RegisterDST <= 0;
			Jump <= 0;
			Branch <= 0;
			memtoReg <= 0;
			ALUSrc <= 1;
			regWrite <= 0;
			memWrite <= 1;
			memRead <= 0;
			Alu_op <= 3'b000;
		end
		else if (Opcode == 6'b000011)		//Instrução tipo I : addi
		begin
			RegisterDST <= 0;
			Jump <= 0;
			Branch <= 0;
			memtoReg <= 0;
			ALUSrc <= 1;
			regWrite <= 1;
			memWrite <= 0;
			memRead <= 0;
			Alu_op <= 3'b000;
		end
		else if (Opcode == 6'b000100)		//Instrução tipo I : subi
		begin
			RegisterDST <= 0;
			Jump <= 0;
			Branch <= 0;
			memtoReg <= 0;
			ALUSrc <= 1;
			regWrite <= 1;
			memWrite <= 0;
			memRead <= 0;
			Alu_op <= 3'b001;
		end
		else if (Opcode == 6'b000101)		//Instrução tipo I : beq
		begin
			RegisterDST <= 0;
			Jump <= 0;
			Branch <= 1;
			memtoReg <= 0;
			ALUSrc <= 0;
			regWrite <= 0;
			memWrite <= 0;
			memRead <= 0;
			Alu_op <= 3'b001;
		end
		else if (Opcode == 6'b000110)		//Instrução tipo I : bne
		begin
			RegisterDST <= 0;
			Jump <= 0;
			Branch <= 1;
			memtoReg <= 0;
			ALUSrc <= 0;
			regWrite <= 0;
			memWrite <= 0;
			memRead <= 0;
			Alu_op <= 3'b011;
		end
		else if (Opcode == 6'b000111)		//Instrução tipo I : bgt
		begin
			RegisterDST <= 0;
			Jump <= 0;
			Branch <= 1;
			memtoReg <= 0;
			ALUSrc <= 0;
			regWrite <= 0;
			memWrite <= 0;
			memRead <= 0;
			Alu_op <= 3'b100;
		end
		else if (Opcode == 6'b001000)		//Instrução tipo I : blt
		begin
			RegisterDST <= 0;
			Jump <= 0;
			Branch <= 1;
			memtoReg <= 0;
			ALUSrc <= 0;
			regWrite <= 0;
			memWrite <= 0;
			memRead <= 0;
			Alu_op <= 3'b101;
		end
		else if (Opcode == 6'b001001)		//Instrução tipo J : j
		begin
			RegisterDST <= 0;
			Jump <= 1;
			Branch <= 0;
			memtoReg <= 0;
			ALUSrc <= 0;
			regWrite <= 0;
			memWrite <= 0;
			memRead <= 0;
			Alu_op <= 3'b000;
		end
		else 										//default
		begin
			RegisterDST <= 0;
			Jump <= 0;
			Branch <= 0;
			memtoReg <= 0;
			ALUSrc <= 0;
			regWrite <= 0;
			memWrite <= 0;
			memRead <= 0;
			Alu_op <= 3'b000;
		end
	end
endmodule
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	