module ROM(addr,q);
	input [11:0] addr;
	output reg [31:0] q;
	reg [31:0] rom[1407:0];//1408
	initial
	begin
		$readmemb("rom.txt", rom);
	end
	always @(addr)
	begin
		q <= rom[addr];
	end
endmodule
