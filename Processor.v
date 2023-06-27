module Processor(CLK,ALUSrc,sign32,ALU_Control,ReadData1,ALU_in , instruction, ALU_Out);
	input CLK;
	
	wire Clock;
	wire [31:0] addressIn;
	wire [31:0] addressOut;
	wire [31:0] addressOut_ADD;
	output wire [31:0] instruction;
	wire [5:0] writeRegister;
	wire [31:0] writeData;
	output wire [31:0] ReadData1;
	wire [31:0] ReadData2;
	output wire [31:0] sign32;
	output wire [31:0] ALU_in;
	output wire [3:0] ALU_Control;
	wire [2:0] ALU_Op;
	wire zero,MUX32;
	output wire [31:0] ALU_Out;
	wire [31:0] Read_Data_Out;
	wire [31:0] sign_Out;
	wire [31:0] ALU_Add_Out;
	wire [31:0] Branch_Normal;
	wire [31:0] shift26_Out;
	wire RegisterDST,Jump,Branch,memtoReg,regWrite,memWrite,memRead;	
	output wire ALUSrc;
	assign Clock = ~CLK;			//para começar em nivel baixo
	
	ControlUnit(instruction[31:26],RegisterDST,Jump,Branch,memtoReg,ALUSrc,regWrite,memWrite,memRead,ALU_Op);
	PC(Clock,addressIn,addressOut);
	PC_4(addressOut,addressOut_ADD);
	ROM(addressOut[6:2],Clock,instruction);
	MUX5(instruction[20:16],instruction[15:11],RegisterDST,writeRegister);
	Registers(instruction[25:21],instruction[20:16],writeRegister,writeData,ReadData1,ReadData2,regWrite,Clock);
	sign_extend(instruction[15:0],sign32);
	MUX32(ReadData2,sign32,ALUSrc,ALU_in);
	ALUControl(ALU_Op,instruction[5:0],ALU_Control);
	ULA(ALU_Control,ReadData1,ALU_in,zero,ALU_Out);
	RAM(ReadData2,ALU_Out,memWrite,memRead,Clock,Read_Data_Out);
	MUX32(ALU_Out,Read_Data_Out,memtoReg,writeData);
	ShiftLeft2_32(sign32,sign_Out);
	Add(addressOut_ADD,sign_Out,ALU_Add_Out);
	and(MUX32,Branch,zero);
	MUX32(addressOut_ADD,ALU_Add_Out,MUX32,Branch_Normal);
	ShiftLeft2_26(instruction[25:0],addressOut_ADD[31:28],shift26_Out);
	MUX32(Branch_Normal,shift26_Out,Jump,addressIn);
endmodule
