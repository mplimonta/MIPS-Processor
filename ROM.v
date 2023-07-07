module ROM(addr,clk,q);
	input [9:0] addr;
	input clk; 
	output reg [31:0] q;
	reg [31:0] rom[1023:0];
	initial
	begin
		$readmemb("rom.txt", rom);
	end
	always @(addr)
	begin
		q <= rom[addr];
	end
endmodule
