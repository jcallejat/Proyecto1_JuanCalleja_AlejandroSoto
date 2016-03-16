`timescale 1ns / 1ps

module Control_Datos( 
	input wire [2:0] selC,selF,
	input wire enable,
	output reg [3:0] r0,r1,r2,r3
    );


// Corriente 
always@(enable or selC or selF)begin
if (enable == 0)begin
	case (selC)
		default : begin
						r0 <= 4'b0000;
						r1 <= 4'b0001;		// 10
						r2 <= 4'b0000;
						r3 <= 4'b0000;
					 end
		3'b001 : begin
						r0 <= 4'b0000;
						r1 <= 4'b0101;		// 50
						r2 <= 4'b0000;
						r3 <= 4'b0000;
					 end
      3'b010 : begin
						r0 <= 4'b0000;
						r1 <= 4'b0000;		// 100
						r2 <= 4'b0001;
						r3 <= 4'b0000;
					end
      3'b011 : begin
						r0 <= 4'b0000;
						r1 <= 4'b0000;		// 200
						r2 <= 4'b0010;
						r3 <= 4'b0000;
					 end
      3'b100 : begin
						r0 <= 4'b0000;
						r1 <= 4'b0000;		// 400
						r2 <= 4'b0100;
						r3 <= 4'b0000;
					 end   
      3'b101 : begin
						r0 <= 4'b0000;
						r1 <= 4'b0000;		// 600
						r2 <= 4'b0110;
						r3 <= 4'b0000;
					 end
      3'b110 : begin
						r0 <= 4'b0000;
						r1 <= 4'b0000;		// 800
						r2 <= 4'b1000;
						r3 <= 4'b0000;
					 end
      3'b111 : begin
						r0 <= 4'b0000;
						r1 <= 4'b0000;		// 1000
						r2 <= 4'b0000;
						r3 <= 4'b0001;
					 end
	endcase
end	

// Frecuencia
else begin
	case (selF)
		default : begin
						r0 <= 4'b0000;
						r1 <= 4'b0011;		// 30
						r2 <= 4'b0000;
						r3 <= 4'b0000;
					 end
		3'b001 : begin
						r0 <= 4'b0000;
						r1 <= 4'b0101;		// 50
						r2 <= 4'b0000;
						r3 <= 4'b0000;
					 end 
      3'b010 : begin
						r0 <= 4'b0101;
						r1 <= 4'b0111;		// 75
						r2 <= 4'b0000;
						r3 <= 4'b0000;
					 end
      3'b011 : begin
						r0 <= 4'b0000;
						r1 <= 4'b0000;		// 100
						r2 <= 4'b0001;
						r3 <= 4'b0000;
					 end
      3'b100 : begin
						r0 <= 4'b0101;
						r1 <= 4'b0010;		// 125
						r2 <= 4'b0001;
						r3 <= 4'b0000;
					 end
      3'b101 : begin
						r0 <= 4'b0000;
						r1 <= 4'b0101;		// 150
						r2 <= 4'b0001;
						r3 <= 4'b0000;
					 end
      3'b110 : begin
						r0 <= 4'b0101;
						r1 <= 4'b0111;		// 175
						r2 <= 4'b0001;
						r3 <= 4'b0000;
					 end
      3'b111 : begin
						r0 <= 4'b0000;
						r1 <= 4'b0000;		// 200
						r2 <= 4'b0010;
						r3 <= 4'b0000;
					 end
	endcase
end
end

endmodule
