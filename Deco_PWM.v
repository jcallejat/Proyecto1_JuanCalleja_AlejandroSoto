`timescale 1ns / 1ps

module Deco_PWM(
	corriente_in,
	frecuencia_in,
	corriente_out,
	frecuencia_out,
	enable
);

input [2:0] corriente_in;
input [2:0] frecuencia_in;
input enable;

output [11:0] corriente_out;
output [11:0] frecuencia_out;

wire [2:0] corriente_in;
wire [2:0] frecuencia_in;
wire enable;

reg [11:0] corriente_out;
reg [11:0] frecuencia_out;

always @ (enable or corriente_in or frecuencia_in) begin

if (enable == 1) begin
if (frecuencia_in == 0) begin
	frecuencia_out <= 3330;
	case (corriente_in)
		3'b000: corriente_out <= 33;
		3'b001: corriente_out <= 167;
		3'b010: corriente_out <= 333;
		3'b011: corriente_out <= 666;
		3'b100: corriente_out <= 1332;
		3'b101: corriente_out <= 1998;
		3'b110: corriente_out <= 2664;
		3'b111: corriente_out <= 3320;
		default:corriente_out <= 33;
	endcase
	end
else if (frecuencia_in == 1) begin
	frecuencia_out <= 2000;
	case (corriente_in)
		3'b000: corriente_out <= 20;
		3'b001: corriente_out <= 100;
		3'b010: corriente_out <= 200;
		3'b011: corriente_out <= 400;
		3'b100: corriente_out <= 800;
		3'b101: corriente_out <= 1200;
		3'b110: corriente_out <= 1600;
		3'b111: corriente_out <= 1990;
		default:corriente_out <= 20;
	endcase
	end
else if (frecuencia_in == 2) begin
	frecuencia_out <= 1330;
	case (corriente_in)
		3'b000: corriente_out <= 13;
		3'b001: corriente_out <= 67;
		3'b010: corriente_out <= 133;
		3'b011: corriente_out <= 266;
		3'b100: corriente_out <= 532;
		3'b101: corriente_out <= 798;
		3'b110: corriente_out <= 1064;
		3'b111: corriente_out <= 1320;
		default:corriente_out <= 13;
	endcase
	end
else if (frecuencia_in == 3) begin
	frecuencia_out <= 1000;
	case (corriente_in)
		3'b000: corriente_out <= 10;
		3'b001: corriente_out <= 50;
		3'b010: corriente_out <= 100;
		3'b011: corriente_out <= 200;
		3'b100: corriente_out <= 400;
		3'b101: corriente_out <= 600;
		3'b110: corriente_out <= 800;
		3'b111: corriente_out <= 990;
		default:corriente_out <= 10;
	endcase
	end
else if (frecuencia_in == 4) begin
	frecuencia_out <= 800;
	case (corriente_in)
		3'b000: corriente_out <= 8;
		3'b001: corriente_out <= 40;
		3'b010: corriente_out <= 80;
		3'b011: corriente_out <= 160;
		3'b100: corriente_out <= 320;
		3'b101: corriente_out <= 480;
		3'b110: corriente_out <= 640;
		3'b111: corriente_out <= 790;
		default:corriente_out <= 8;
	endcase
	end
else if (frecuencia_in == 5) begin
	frecuencia_out <= 670;
	case (corriente_in)
		3'b000: corriente_out <= 7;
		3'b001: corriente_out <= 34;
		3'b010: corriente_out <= 67;
		3'b011: corriente_out <= 134;
		3'b100: corriente_out <= 268;
		3'b101: corriente_out <= 402;
		3'b110: corriente_out <= 536;
		3'b111: corriente_out <= 660;
		default:corriente_out <= 7;
	endcase
	end
else if (frecuencia_in == 6) begin
	frecuencia_out <= 570;
	case (corriente_in)
		3'b000: corriente_out <= 6;
		3'b001: corriente_out <= 29;
		3'b010: corriente_out <= 57;
		3'b011: corriente_out <= 114;
		3'b100: corriente_out <= 228;
		3'b101: corriente_out <= 342;
		3'b110: corriente_out <= 456;
		3'b111: corriente_out <= 560;
		default:corriente_out <= 6;
	endcase
	end
else if (frecuencia_in == 7) begin
	frecuencia_out <= 500;
	case (corriente_in)
		3'b000: corriente_out <= 5;
		3'b001: corriente_out <= 25;
		3'b010: corriente_out <= 50;
		3'b011: corriente_out <= 100;
		3'b100: corriente_out <= 200;
		3'b101: corriente_out <= 300;
		3'b110: corriente_out <= 400;
		3'b111: corriente_out <= 490;
		default:corriente_out <= 5;
	endcase
	end
else begin
	frecuencia_out <= 0;
	corriente_out <= 0;
end
end

else begin
	frecuencia_out <= 0;
	corriente_out <= 0;
end

end//end para always

endmodule