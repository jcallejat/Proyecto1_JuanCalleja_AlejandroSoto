`timescale 1ns / 1ps

module Deco_Sel (
binary_in   ,
decoder_out ,
enable
);
input binary_in  ;
input enable ;
output [1:0] decoder_out ;

reg [1:0] decoder_out ;

always @ (enable or binary_in)
begin
  decoder_out <= 0;
  if (enable) begin
    case (binary_in)
		1'b0 : decoder_out <= 2'b01;
		1'b1 : decoder_out <= 2'b10;
    endcase
  end
  else begin
		decoder_out <= 2'b00;
  end
end
endmodule