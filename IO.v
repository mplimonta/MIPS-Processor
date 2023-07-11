module IO (
	input clk, reset, halt,
	input [31:0] num,
	input output_flag, input_flag,
	input [3:0] SW,
	output [31:0] user_input,
	output reg [6:0] HEX0,HEX1,HEX2,HEX3,HEX4,HEX5,HEX6,HEX7
);

initial begin
	HEX0 = 7'b1111111;
	HEX1 = 7'b1111111;
	HEX2 = 7'b1111111;
	HEX3 = 7'b1111111;
	HEX4 = 7'b1111111;
	HEX5 = 7'b1111111;
	HEX6 = 7'b1111111;
	HEX7 = 7'b1111111;
end

  task set_7seg;
	input [3:0] numero;
	output [6:0] HEX;
	case (numero)
		0: HEX <= 7'b1000000;
		1: HEX <= 7'b1111001;
		2: HEX <= 7'b0100100;
		3: HEX <= 7'b0110000;
		4: HEX <= 7'b0011001;
		5: HEX <= 7'b0010010;
		6: HEX <= 7'b0000010;
		7: HEX <= 7'b1111000;
		8: HEX <= 7'b0000000;
		9: HEX <= 7'b0010000;
		10: HEX <= 7'b0001000;
		11: HEX <= 7'b0000011;
		12: HEX <= 7'b1000110;
		13: HEX <= 7'b0100001;
		14: HEX <= 7'b0000110;
		15: HEX <= 7'b0001110;
		default: HEX <= 7'b1111111;
	endcase
  endtask
  
  always @ (posedge clk or posedge reset/* or posedge halt*/)
  begin
	if(reset) 
	begin
		HEX0 <= 7'b1111111;
		HEX1 <= 7'b1111111;
		HEX2 <= 7'b1111111;
		HEX3 <= 7'b1111111;
		HEX4 <= 7'b1111111;
		HEX5 <= 7'b1111111;
		HEX6 <= 7'b1111111;
		HEX7 <= 7'b1111111;
	end
	else if(halt)
	begin
		HEX0 <= 7'b1111111;
		HEX1 <= 7'b1111111;
		HEX2 <= 7'b1111111;
		HEX3 <= 7'b1111111;
		HEX4 <= 7'b1111111;
		HEX5 <= 7'b1111111;
		HEX6 <= 7'b1111111;
		HEX7 <= 7'b1111111;
	end
	else if(output_flag && !input_flag)
	begin		  
		set_7seg(num%10, HEX0);
		set_7seg((num%100)/10, HEX1);
		set_7seg((num%1000)/100, HEX2);
		set_7seg((num%10000)/1000, HEX3);
		set_7seg((num%100000)/10000, HEX4);
		set_7seg((num%1000000)/100000, HEX5);
		set_7seg((num%10000000)/1000000, HEX6);
		set_7seg((num%100000000)/10000000, HEX7);
	end
	else if(!output_flag && input_flag)
	begin
		if (!user_input)
		begin			
			HEX0 <= 7'b0111111;
			HEX1 <= 7'b0111111;
			HEX2 <= 7'b0111111;
			HEX3 <= 7'b0111111;
			HEX4 <= 7'b0111111;
			HEX5 <= 7'b0111111;
			HEX6 <= 7'b0111111;
			HEX7 <= 7'b0111111;
		end
		else
		begin
			set_7seg(user_input%10, HEX0);
			set_7seg((user_input%100)/10, HEX1);
			set_7seg((user_input%1000)/100, HEX2);
			set_7seg((user_input%10000)/1000, HEX3);
			set_7seg((user_input%100000)/10000, HEX4);
			set_7seg((user_input%1000000)/100000, HEX5);
			set_7seg((user_input%10000000)/1000000, HEX6);
			set_7seg((user_input%100000000)/10000000, HEX7);
		end
	end
	else
	begin
			HEX0 <= 7'b1000000;
			HEX1 <= 7'b1000000;
			HEX2 <= 7'b1000000;
			HEX3 <= 7'b1000000;
			HEX4 <= 7'b1000000;
			HEX5 <= 7'b1000000;
			HEX6 <= 7'b1000000;
			HEX7 <= 7'b1000000;
	end
  end
  
  assign user_input = {28'd0,SW[3],SW[2],SW[1],SW[0]};
  
  
endmodule