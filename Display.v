`timescale 1ns / 1ps

module Display(
	input [3:0] d0,
	input [3:0] d1,
	input [3:0] d2,
	input [3:0] d3,
	input clk,
	input rst,
	output reg [6:0] sseg,
	output reg [3:0] an
   );
	

reg [3:0] mux_out;
reg [1:0] sel;




// Seleciona valor
always@(*)
	case(sel)
		default: mux_out <= d0;
		1: mux_out <= d1;
		2: mux_out <= d2;
		3: mux_out <= d3;
	endcase


// Selecciona Display
always@(*)
	case(sel)
		default: an <= 4'b0111;		//7
		1: an <= 4'b1011;    //11
		2: an <= 4'b1101;		//13
		3: an <= 4'b1110;	//14
	endcase

always@(posedge clk, posedge rst)
	if(rst)
		sel <= 0;
	else
		sel <= sel + 1;
		
// 7-segment encoding
//      0
//     ---
//  5 |   | 1
//     --- <--6
//  4 |   | 2
//     ---
//      3
// se enciende con 0

always@(*)
	case (mux_out)
		4'b0001 : sseg <= 7'b1111001;   // 1
      4'b0010 : sseg <= 7'b0100100;   // 2
      4'b0011 : sseg <= 7'b0110000;   // 3
      4'b0100 : sseg <= 7'b0011001;   // 4
      4'b0101 : sseg <= 7'b0010010;   // 5
      4'b0110 : sseg <= 7'b0000010;   // 6
      4'b0111 : sseg <= 7'b1111000;   // 7
      4'b1000 : sseg <= 7'b0000000;   // 8
      4'b1001 : sseg <= 7'b0010000;   // 9
      default : sseg <= 7'b1000000;   // 0
	endcase
endmodule
