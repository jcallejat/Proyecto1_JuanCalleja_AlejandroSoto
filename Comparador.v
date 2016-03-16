`timescale 1ns / 1ps

module Comparador(
entrada_corriente,
entrada_frecuencia,
entrada_contador,
comp_corriente,
comp_frecuencia,
clock
);

input [11:0] entrada_corriente;
input [11:0] entrada_frecuencia;
input [11:0] entrada_contador;
input clock;

output comp_corriente;
output comp_frecuencia;

wire [11:0] entrada_corriente;
wire [11:0] entrada_frecuencia;
wire [11:0] entrada_contador;
wire clock;

reg comp_corriente;
reg comp_frecuencia;

always @(posedge clock) begin
	if (entrada_frecuencia == entrada_contador) begin
		comp_frecuencia = 1;
	end
	else if (entrada_corriente == entrada_contador) begin
		comp_corriente = 1;
	end
	else begin
		comp_frecuencia = 0;
		comp_corriente = 0;
	end
end

endmodule 