`timescale 1ns / 1ps

module Contador(
clock , // Clock input of the design
reset , // active high, synchronous Reset input
enable , // Active high enable signal for counter
counter_out
); // End of port list
//-------------Input Ports-----------------------------
input clock ;
input reset ;
input enable ;
//-------------Output Ports----------------------------
output [11:0] counter_out ;
//-------------Input ports Data Type-------------------
wire clock ;
wire reset ;
wire enable ;
//-------------Output Ports Data Type------------------
reg [11:0] counter_out ;

//------------Code Starts Here-------------------------
always @ (posedge clock)
begin : COUNTER // Block Name

  if (reset == 1'b1) begin
    counter_out <= 0;
  end

  else if (enable == 1'b1) begin
    counter_out <= (counter_out + 1) & {12{1'b1}};
  end

end // End of Block COUNTER


endmodule // End of Module counter