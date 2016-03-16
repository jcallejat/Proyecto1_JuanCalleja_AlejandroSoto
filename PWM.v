`timescale 1ns / 1ps

module PWM(
	clock,
	reset,
	pwm,
	enable,
	tap_up,
	tap_down,
	seleccion,
	sseg,
	an
    );


input   	clock,reset,enable,seleccion;
input 	tap_up;
input 	tap_down;
 //-------------Output Ports----------------------------
output  	pwm;
output wire [6:0] sseg;
output wire [3:0] an;
//-------------Input ports Data Type-------------------
wire    	clock,reset,enable,seleccion;
//-------------Output Ports Data Type------------------
wire    	pwm;

//===================================BUFGS=========================================
wire clk_ibufg;
wire clk_int;
IBUFG clk_ibufg_inst (.I(clock), .O(clk_ibufg));
BUFG clk_bufg_inst (.I(clk_ibufg), .O(clk_int));
//=================================================================================

//---------------Internal connections------------------
wire [11:0] bus_corriente;
wire [11:0] bus_frecuencia;
wire [11:0] bus_contador;
wire comp_corriente,comp_frecuencia;
wire [2:0] corriente_in;
wire [2:0] frecuencia_in;
wire [1:0] seleccion_deco;
wire tap_up_estable;
wire tap_down_estable;

Prueba_FSM _fsm (
    .clock(clk_int),
    .reset(sync_reset_out),
    .comp_frecuencia(comp_frecuencia),
    .comp_corriente(comp_corriente),
    .reset_contador(gnt_0),
    .pwm(pwm),
    .reset_contador_in(gnt_0),
	 .enable(enable)
    );

Comparador _comparador (
    .entrada_corriente(bus_corriente), 
    .entrada_frecuencia(bus_frecuencia), 
    .entrada_contador(bus_contador), 
    .comp_corriente(comp_corriente), 
    .comp_frecuencia(comp_frecuencia), 
    .clock(clk_int)
    );

Contador _contador (
    .clock(clk_int),
    .reset(gnt_0),
    .enable(enable),
    .counter_out(bus_contador)
    );

Deco_PWM _deco_pwm (
    .corriente_in(corriente_in), 
    .frecuencia_in(frecuencia_in), 
    .corriente_out(bus_corriente), 
    .frecuencia_out(bus_frecuencia), 
    .enable(enable)
    );

Up_Down_Counter sel_corriente (
    .out(corriente_in), 
    .up(tap_up_estable), 
    .down(tap_down_estable), 
    .clk(clk_int), 
    .reset(sync_reset_out), 
    .enable(seleccion_deco[1])
    );

Up_Down_Counter sel_frecuencia (
    .out(frecuencia_in),
    .up(tap_up_estable),
    .down(tap_down_estable),
    .clk(clk_int),
    .reset(sync_reset_out),
    .enable(seleccion_deco[0])
    );

Deco_Sel deco_sel (
    .binary_in(seleccion),
    .decoder_out(seleccion_deco),
    .enable(enable)
    );

Antirrebotes antirrebotes_up (
    .dato_entrada(tap_up),
    .clk(clk_int),
    .reset(sync_reset_out),
    .dato_salida(tap_up_estable)
    );

Antirrebotes antirrebotes_down (
    .dato_entrada(tap_down), 
    .clk(clk_int),
    .reset(sync_reset_out), 
    .dato_salida(tap_down_estable)
    );
//sincroniza los reset de los sistemas con el clock
sync_reset _sync_reset (
    .clk(clk_int),
    .rst(reset),
    .sync_reset_out(sync_reset_out)
    );
	 
Pantalla Datos (
    .clk(clk_int),
    .rst(sync_reset_out),
    .enable(seleccion_deco[0]),
    .selC(corriente_in),
    .selF(frecuencia_in),
    .sseg(sseg),
    .an(an)
    );

endmodule