`timescale 1ns / 1ps

module Up_Down_Counter    (
out      ,  // Output of the counter
up			,
down  	, 
clk      ,  // clock input
reset		,  // reset input
enable
);
//----------Output Ports--------------
output [2:0] out;
//------------Input Ports--------------
input up, down, clk, reset, enable;
//------------Internal Variables--------
reg [2:0] out;
//-------------Code Starts Here-------
always @ (posedge clk) begin
if (reset) begin // active high reset
  out <= 3'b0;
  end else if ((enable == 1)&&(down == 1)) begin
	out <= (out - 1) & {3{1'b1}};
end else if ((enable == 1)&&(up == 1)) begin
	out <= (out + 1) & {3{1'b1}};
	end 
end
endmodule 