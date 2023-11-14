module RAM
(
	input [31:0] data,
	input [9:0] addr,
	input mW,clk,
	output [31:0] DataOut,
	input [991:0]Dump, LDump,
	input Save,
	input Load
);
	reg [31:0] ram[81:0];
	
	
	always @ (negedge clk)begin
		if (mW) ram[addr+5'b11111] <= data;
		if (Save)begin
			ram[0] <= Dump[31:0];
			ram[1] <= Dump[63:32];
			ram[2] <= Dump[95:64];
			ram[3] <= Dump[127:96];
			ram[4] <= Dump[159:128];
			ram[5] <= Dump[191:160];
			ram[6] <= Dump[223:192];
			ram[7] <= Dump[255:224];
			ram[8] <= Dump[287:256];
			ram[9] <= Dump[319:288];
			ram[10] <= Dump[351:320];
			ram[11] <= Dump[383:352];
			ram[12] <= Dump[415:384];
			ram[13] <= Dump[447:416];
			ram[14] <= Dump[479:448];
			ram[15] <= Dump[511:480];
			ram[16] <= Dump[543:512];
			ram[17] <= Dump[575:544];
			ram[18] <= Dump[607:576];
			ram[19] <= Dump[639:608];
			ram[20] <= Dump[671:640];
			ram[21] <= Dump[703:672];
			ram[22] <= Dump[735:704];
			ram[23] <= Dump[767:736];
			ram[24] <= Dump[799:768];
			ram[25] <= Dump[831:800];
			ram[26] <= Dump[863:832];
			ram[27] <= Dump[895:864];
			ram[28] <= Dump[927:896];
			ram[29] <= Dump[959:928];
			ram[30] <= Dump[991:960];
		end
		if (Load)begin
			LDump[31:0] <= ram[0];
			LDump[63:32] <= ram[1];
			LDump[95:64] <= ram[2];
			LDump[127:96] <= ram[3];
			LDump[159:128] <= ram[4];
			LDump[191:160] <= ram[5];
			LDump[223:192] <= ram[6];
			LDump[255:224] <= ram[7];
			LDump[287:256] <= ram[8];
			LDump[319:288] <= ram[9];
			LDump[351:320] <= ram[10];
			LDump[383:352] <= ram[11];
			LDump[415:384] <= ram[12];
			LDump[447:416] <= ram[13];
			LDump[479:448] <= ram[14];
			LDump[511:480] <= ram[15];
			LDump[543:512] <= ram[16];
			LDump[575:544] <= ram[17];
			LDump[607:576] <= ram[18];
			LDump[639:608] <= ram[19];
			LDump[671:640] <= ram[20];
			LDump[703:672] <= ram[21];
			LDump[735:704] <= ram[22];
			LDump[767:736] <= ram[23];
			LDump[799:768] <= ram[24];
			LDump[831:800] <= ram[25];
			LDump[863:832] <= ram[26];
			LDump[895:864] <= ram[27];
			LDump[927:896] <= ram[28];
			LDump[959:928] <= ram[29];
			LDump[991:960] <= ram[30];
		end
	end 
	assign DataOut = ram[addr+5'b11111];

endmodule

