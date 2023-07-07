module Registers(ReadReg1,ReadReg2,WriteReg,WriteData,ReadData1,ReadData2,RegWrite,CLK);
	input [4:0] ReadReg1;
	input [4:0] ReadReg2;
	input [4:0]	WriteReg;
	input [31:0] WriteData;
	output [31:0] ReadData1;
	output [31:0] ReadData2;
	input CLK,RegWrite;
	reg [31:0] Register[31:0];
	assign	ReadData1 = Register[ReadReg1];
	assign	ReadData2 = Register[ReadReg2];
	always@(negedge CLK)
	begin
		if(RegWrite) Register[WriteReg] <= WriteData;
	end
endmodule
