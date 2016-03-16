`timescale 1ns / 1ps

module Pantalla(
	input wire clk,rst,enable,
	input wire [2:0] selC,selF,
	output wire [6:0] sseg,
	output wire [3:0] an
    );

wire [3:0] a0,a1,a2,a3;

Control_Datos Control(
    .selC(selC), 
    .selF(selF), 
    .enable(enable), 
    .r0(a0), 
    .r1(a1), 
    .r2(a2), 
    .r3(a3)
    );

Siete_Segmentos Display (
    .clk_g(clk), 
    .rst(rst), 
    .d0(a0), 
    .d1(a1), 
    .d2(a2), 
    .d3(a3), 
    .sseg(sseg), 
    .an(an)
    );


endmodule
