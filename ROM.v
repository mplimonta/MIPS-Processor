module ROM(addr,clk,q);
	input [4:0] addr;
	input clk; 
	output reg [31:0] q;
	reg [31:0] rom[31:0];
	initial
	begin
		$readmemb("rom.txt", rom);
	end
	always @ (posedge clk)
	begin
		q <= rom[addr];
	end
endmodule
