module Processor
(
	input CLK, reset, insert, setFreq,
	input [14:0] SW,
	output [6:0] HEX0,
	output [6:0] HEX1,
	output [6:0] HEX2,
	output [6:0] HEX3,
	output [6:0] HEX4,
	output [6:0] HEX5,
	output [6:0] HEX6,
	output [6:0] HEX7,
	output Clock,
	output [31:0] addressIn,
	output [31:0] addressOut,
	output [31:0] instruction,
	output [31:0] writeData, user_input,
	output [31:0] ReadData1,
	output [31:0] ReadData2, data,
	output [3:0] ALU_Control,
	output [2:0] ALU_Op,
	output zero, BranchOut, halt, output_flag, input_flag, 
	output [31:0] ALU_Out,savedLine,
	output [31:0] Read_Data_Out,
	output [31:0] ALU_Add_Out,
	output [1:0] Jump, RegisterDST, memtoReg,
	output Branch,regWrite,memWrite,
	output ALUSrc,
	output ContextChangeTo, ContextChangeBack, 
	output inProgram,
	output NextLineTBE,OffsetChange,
	output [11:0] inRAMOffset
	//output [3:0] instcount
);	
	wire [31:0] Branch_Normal;
	wire [31:0] addressOut_ADD;
	wire [31:0] sign32;
	wire [31:0] ALU_in;
	wire [31:0] sign_Out;
	wire [31:0] shift26_Out;
	wire [4:0] writeRegister;
	
	DivisorFreq DF(CLK, reset, setFreq, Clock, halt);
	PC pc(Clock, reset, input_flag, output_flag, insert, addressIn, inProgram, addressOut, ContextChangeBack,NextLineTBE,savedLine);
	PC_4 pc4(addressOut, addressOut_ADD);
	single_port_rom rom(addressOut[13:2], instruction);
	ControlUnit UC(instruction[31:26], RegisterDST, Jump, Branch, memtoReg, ALUSrc, regWrite, memWrite, ALU_Op, halt, output_flag, input_flag,NextLineTBE, OffsetChange);
	MUX432 #(5) mx332(instruction[20:16], instruction[15:11], 5'b11111, 5'b11100, RegisterDST, writeRegister);
	Registers regs(instruction[25:21], instruction[20:16], writeRegister, writeData, ReadData1, ReadData2, regWrite, Clock);
	sign_extend Se(instruction[15:0], sign32);
	MUX32 mux32(ReadData2, sign32, ALUSrc, ALU_in);
	ALUControl ulacontrol(ALU_Op, instruction[5:0], ALU_Control);
	ULA alu(ALU_Control, ReadData1, ALU_in, zero, ALU_Out);
	
	MUX32 mux32_2(ReadData2, savedLine, NextLineTBE, data);
	
	RAM single_port_RAM(data, ALU_Out[31:0], memWrite, Clock, CLK, Read_Data_Out, ReadData1, OffsetChange, inRAMOffset);
	MUX432 mutiplex332_1(ALU_Out, Read_Data_Out, addressOut_ADD, user_input, memtoReg, writeData);
	ShiftLeft2_32 SL32(sign32, sign_Out);
	Add adder(addressOut_ADD, sign_Out, ALU_Add_Out);
	and(BranchOut, Branch, ~zero);
	MUX32 multiplex32(addressOut_ADD, ALU_Add_Out, BranchOut, Branch_Normal);
	ShiftLeft2_26 SL26(instruction[25:0], addressOut_ADD[31:28], shift26_Out);
	MUX332 mutiplex332_2(Branch_Normal, shift26_Out, ReadData1, Jump, addressIn);
	IO InputOutput(Clock, reset, halt, ReadData1, output_flag, input_flag, SW, user_input, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7);
endmodule
