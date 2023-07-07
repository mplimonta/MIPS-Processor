module IO (
	input clk, reset, halt,
	input [31:0]num,
	input output_flag, input_flag,
	input [17:0] SW,
	output reg [6:0]HEX0,HEX1,HEX2,HEX3,HEX4,HEX5,HEX6,HEX7
);
reg [31:0]DisplayNum;
initial begin
	DisplayNum = 0;
	HEX0 = 7'b1000000;
	HEX1 = 7'b1111001;
	HEX2 = 7'b1000000;
	HEX3 = 7'b1111001;
	HEX4 = 7'b1000000;
	HEX5 = 7'b1111001;
	HEX6 = 7'b1000000;
	HEX7 = 7'b1111001;
end

	task set_7seg;
		input [3:0]numero;
		output [6:0]HEX;
		case (numero)
			0: HEX = 7'b1000000;
			1: HEX = 7'b1111001;
			2: HEX = 7'b0100100;
			3: HEX = 7'b0110000;
			4: HEX = 7'b0011001;
			5: HEX = 7'b0010010;
			6: HEX = 7'b0000010;
			7: HEX = 7'b1111000;
			8: HEX = 7'b0000000;
			9: HEX = 7'b0010000;
			10: HEX = 7'b0001000;
			11: HEX = 7'b0000011;
			12: HEX = 7'b1000110;
			13: HEX = 7'b0100001;
			14: HEX = 7'b0000110;
			15: HEX = 7'b0001110;
			default: HEX <= 7'b1111111;
		endcase
	endtask
always @(negedge clk)begin
	if(output_flag)begin
		DisplayNum = num;
	end
end
always @(*) begin
		set_7seg(DisplayNum%10, HEX0);
		set_7seg(((DisplayNum/10)%10), HEX1);
		set_7seg(((DisplayNum/100)%10), HEX2);
		set_7seg(((DisplayNum/1000)%10), HEX3);
		set_7seg(((DisplayNum/10000)%10), HEX4);
		set_7seg(((DisplayNum/100000)%10), HEX5);
		set_7seg(((DisplayNum/1000000)%10), HEX6);
		set_7seg(((DisplayNum/10000000)%10), HEX7);
		
//		set_7seg(HEX0, num%10);
//		set_7seg(HEX1, ((num/10)%10));
//		set_7seg(HEX2, ((num/100)%10));
//		set_7seg(HEX3, ((num/1000)%10));
//		set_7seg(HEX4, ((num/10000)%10));
//		set_7seg(HEX5, ((num/100000)%10));
//		set_7seg(HEX6, ((num/1000000)%10));
//		set_7seg(HEX7, ((num/10000000)%10));

/*
	if(halt) begin
		set_7seg(1, HEX0);
		set_7seg(2, HEX1);
		set_7seg(3, HEX2);
		set_7seg(4, HEX3);
		set_7seg(5, HEX4);
		set_7seg(6, HEX5);
		set_7seg(7, HEX6);
		set_7seg(8, HEX7);
	end
*/
	/*
	if(input_flag)begin
		set_7seg(HEX0, {SW[9],SW[8],SW[7],SW[6],SW[5],SW[4],SW[3],SW[2],SW[1],SW[0]}%10);
		set_7seg(HEX1, ({SW[9],SW[8],SW[7],SW[6],SW[5],SW[4],SW[3],SW[2],SW[1],SW[0]}/10)%10);
		set_7seg(HEX2, ({SW[9],SW[8],SW[7],SW[6],SW[5],SW[4],SW[3],SW[2],SW[1],SW[0]}/100)%10);
		set_7seg(HEX3, ({SW[9],SW[8],SW[7],SW[6],SW[5],SW[4],SW[3],SW[2],SW[1],SW[0]}/1000)%10);
		set_7seg(HEX4, ({SW[9],SW[8],SW[7],SW[6],SW[5],SW[4],SW[3],SW[2],SW[1],SW[0]}/10000)%10);
		set_7seg(HEX5, ({SW[9],SW[8],SW[7],SW[6],SW[5],SW[4],SW[3],SW[2],SW[1],SW[0]}/100000)%10);
		set_7seg(HEX6, ({SW[9],SW[8],SW[7],SW[6],SW[5],SW[4],SW[3],SW[2],SW[1],SW[0]}/1000000)%10);
		set_7seg(HEX7, ({SW[9],SW[8],SW[7],SW[6],SW[5],SW[4],SW[3],SW[2],SW[1],SW[0]}/10000000)%10);
	end
	*/
end
endmodule
//



//
//
//        4'b0000: HEX = 7'b0000001;
//        4'b0001: HEX = 7'b1001111;
//        4'b0010: HEX = 7'b0010010;
//        4'b0011: HEX = 7'b0000110;
//        4'b0100: HEX = 7'b1001100;
//        4'b0101: HEX = 7'b0100100;
//        4'b0110: HEX = 7'b0100000;
//        4'b0111: HEX = 7'b0001111;
//        4'b1000: HEX = 7'b0000000;
//        4'b1001: HEX = 7'b0000100;
//        default: HEX = 7'b1111111;
//
//			0: HEX <= 7'b1000000;
//			1: HEX <= 7'b1111001;
//			2: HEX <= 7'b0100100;
//			3: HEX <= 7'b0110000;
//			4: HEX <= 7'b0011001;
//			5: HEX <= 7'b0010010;
//			6: HEX <= 7'b0000010;
//			7: HEX <= 7'b1111000;
	//		8: HEX <= 7'b0000000;
//			9: HEX <= 7'b0010000;
//			default: HEX <= 7'b1111111;


//module BCD(SW, HEX0);
//    input [0:17]SW;
//    output [0:6]HEX0;
//    reg [0:6] segmentos;
//    always@(*)
//    case ({SW[14],SW[15],SW[16],SW[17]})
//        4'b0000: segmentos = 7'b0000001;
//        4'b0001: segmentos = 7'b1001111;
//        4'b0010: segmentos = 7'b0010010;
//        4'b0011: segmentos = 7'b0000110;
//        4'b0100: segmentos = 7'b1001100;
//        4'b0101: segmentos = 7'b0100100;
//        4'b0110: segmentos = 7'b0100000;
//        4'b0111: segmentos = 7'b0001111;
//        4'b1000: segmentos = 7'b0000000;
//        4'b1001: segmentos = 7'b0000100;
//        default: segmentos = 7'b1111111;
//    endcase
//    assign HEX0 = segmentos;
//endmodule