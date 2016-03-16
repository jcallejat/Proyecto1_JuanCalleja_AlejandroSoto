`timescale 1ns / 1ps

module Siete_Segmentos(
	input wire clk_g, rst,
	input wire [3:0] d0,d1,d2,d3,
	output wire [6:0] sseg,
	output wire [3:0] an
    );
	 
wire clk_Sseg;


Divisor_Frecuencia Frecuencia (
    .clk_interno(clk_g), 
    .clk_deseado(clk_Sseg)
    );
	 
Display Control_7Seg (
    .d0(d0), 
    .d1(d1), 
    .d2(d2), 
    .d3(d3), 
    .clk(clk_Sseg), 
    .rst(rst), 
    .sseg(sseg), 
    .an(an)
    ); 
endmodule
