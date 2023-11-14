module Registers(ReadReg1,ReadReg2,WriteReg,WriteData,ReadData1,ReadData2,RegWrite,CLK,Dump,Save, Load);
	input [4:0] ReadReg1;
	input [4:0] ReadReg2;
	input [4:0]	WriteReg;
	input [31:0] WriteData;
	output [31:0] ReadData1;
	output [31:0] ReadData2;
	input RegWrite,CLK;
	output reg [991:0] Dump, LDump;
	input Save, Load;
	
	reg [31:0] Register[31:0];
	assign	ReadData1 = Register[ReadReg1];
	assign	ReadData2 = Register[ReadReg2];
	always@(negedge CLK)
	begin
		if(RegWrite) Register[WriteReg] <= WriteData;
		if(Save)begin
			Dump <= {Register[31],Register[30],Register[29],Register[28],
			Register[27],Register[26],Register[25],Register[24],Register[23],
			Register[22], Register[21], Register[20], Register[19], Register[18],
			Register[17], Register[16], Register[15], Register[14], Register[13],
			Register[12], Register[11], Register[10], Register[9], Register[8],
			Register[7], Register[6], Register[5], Register[4], Register[3],
			Register[2], Register[1] };
		end
		if (Load)begin
			Register[1] <= LDump[31:0];
			Register[2] <= LDump[63:32];
			Register[3] <= LDump[95:64];
			Register[4] <= LDump[127:96];
			Register[5] <= LDump[159:128];
			Register[6] <= LDump[191:160];
			Register[7] <= LDump[223:192];
			Register[8] <= LDump[255:224];
			Register[9] <= LDump[287:256];
			Register[10] <= LDump[319:288];
			Register[11] <= LDump[351:320];
			Register[12] <= LDump[383:352];
			Register[13] <= LDump[415:384];
			Register[14] <= LDump[447:416];
			Register[15] <= LDump[479:448];
			Register[16] <= LDump[511:480];
			Register[17] <= LDump[543:512];
			Register[18] <= LDump[575:544];
			Register[19] <= LDump[607:576];
			Register[20] <= LDump[639:608];
			Register[21] <= LDump[671:640];
			Register[22] <= LDump[703:672];
			Register[23] <= LDump[735:704];
			Register[24] <= LDump[767:736];
			Register[25] <= LDump[799:768];
			Register[26] <= LDump[831:800];
			Register[27] <= LDump[863:832];
			Register[28] <= LDump[895:864];
			Register[29] <= LDump[927:896];
			Register[30] <= LDump[959:928];
			Register[31] <= LDump[991:960];
		end
//			Dump[991:960] <= Register[31];
//			Dump[959:928] <= Register[30];
//			Dump[927:896] <= Register[29];
	end
endmodule

