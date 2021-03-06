`timescale 1ns / 1ps
//-----------------------------------------------------
// This is FSM demo program using always block
// Design Name : fsm_using_always
// File Name   : fsm_using_always.v
//-----------------------------------------------------
module Prueba_FSM (
clock      			,
reset      			,
comp_frecuencia   ,
comp_corriente    ,
reset_contador    ,
pwm					,
reset_contador_in ,
enable
);
//-------------Input Ports-----------------------------
input 	clock,reset,comp_frecuencia,comp_corriente;
input 	reset_contador_in;
input		enable;
 //-------------Output Ports---------------------------
output  	reset_contador,pwm;
//-------------Input ports Data Type-------------------
wire    	enable, clock,reset,comp_frecuencia,comp_corriente,reset_contador_in;
//-------------Output Ports Data Type------------------
reg     	reset_contador,pwm;
//-------------Internal Constants--------------------------
parameter SIZE = 3           ;
parameter IDLE  = 3'b001,GNT0 = 3'b010,GNT1 = 3'b100 ;
//-------------Internal Variables---------------------------
reg   [SIZE-1:0]          state        ;// Seq part of the FSM
reg   [SIZE-1:0]          next_state   ;// combo part of FSM
//----------Code startes Here------------------------
always @ (clock or state or comp_frecuencia or comp_corriente or reset_contador_in)
begin : FSM_COMBO
 next_state = 3'b000;
 case(state)
   IDLE : if (reset_contador_in == 1'b1) begin
                next_state = GNT1;
              end else begin
                next_state = IDLE;
              end
   GNT0 : if (comp_frecuencia == 1'b1) begin
                next_state = IDLE;
              end else begin
                next_state = GNT0;
              end
   GNT1 : if (comp_corriente == 1'b1) begin
                next_state = GNT0;
              end else begin
                next_state = GNT1;
              end
   default : next_state = IDLE;
  endcase
end
//----------Seq Logic-----------------------------
always @ (posedge clock)
begin : FSM_SEQ
  if (reset == 1'b1) begin
    state <= #1 IDLE;
  end else begin
    state <= #1 next_state;
  end
end
//----------Output Logic-----------------------------
always @ (posedge clock)
begin : OUTPUT_LOGIC
if ((reset == 1'b1)||(enable == 0)) begin
  reset_contador <= #1 1'b1;
  pwm <= #1 1'b0;
end
else begin
  case(state)
   IDLE : begin
                  reset_contador <= #1 1'b1;
                  pwm <= #1 1'b0;
               end
   GNT0 : begin
                   reset_contador <= #1 1'b0;
                   pwm <= #1 1'b0;
                end
   GNT1 : begin
                   reset_contador <= #1 1'b0;
                   pwm <= #1 1'b1;
                end
   default : begin
                    reset_contador <= #1 1'b1;
                    pwm <= #1 1'b0;
                  end
  endcase
end
end // End Of Block OUTPUT_LOGIC

endmodule // End of Module arbiter