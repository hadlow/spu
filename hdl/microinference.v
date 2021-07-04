`timescale 1ns/1ps

module cpu #(
  parameter integer DATA_WIDTH = 8
) (
  input  logic unsigned [DATA_WIDTH-1:0] A,
  input  logic unsigned [DATA_WIDTH-1:0] B,
  output logic unsigned [DATA_WIDTH:0]   X
);

  assign X = A * B;

  // Dump waves
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1, microinference);
  end

endmodule


module alu (
	
);

endmodule

module cu (

);

endmodule

module  (

);

endmodule
