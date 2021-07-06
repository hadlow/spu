`include "Parameter.v"

`timescale 1ns/1ps

// Instruction cache/ROM
module instruction_cache(
	input [15:0] counter,
	output [15:0] instruction
);

	reg [`col - 1:0] memory [`row_i - 1:0];
	wire [3:0] address = counter[4:1];

	initial begin
		$readmemb("./test.prog", memory, 0, 14);
	end

	assign instruction = memory[address];

endmodule

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
    $dumpvars(1, cpu);
  end

endmodule
