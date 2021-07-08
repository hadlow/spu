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

module registers(
	input clk,
	input reg_write_enable,
	input [2:0] reg_write_destination,
	input [15:0] reg_write_data,
	input [2:0] reg_read_address_1,
	input [2:0] reg_read_address_2,

	output [15:0] reg_read_data_1,
	output [15:0] reg_read_data_2
);

	reg [15:0] reg_mem [7:0];

	integer i;

	initial begin
		for(i = 0; i < 8; i = i + 1)
			reg_mem[i] <= 16'd0;
	end

	always @(posedge clk) begin
		if(reg_write_enable) begin
			reg_mem[reg_write_destination] <= reg_write_data;
		end
	end

	assign reg_read_data_1 = reg_mem[reg_read_address_1];
	assign reg_read_data_2 = reg_mem[reg_read_address_2];

endmodule

module data_memory(
	input clk,
	input [15:0] memory_access_address,
	input [15:0] memory_write_data,
	input memory_write_enable,
	input memory_read,

	output [15:0] memory_read_data
);

	reg [`col - 1:0] memory [`row_d - 1:0];

	integer f;

	wire [2:0] ram_address = memory_access_address[2:0];

	initial begin
		$readmemb("./test.data", memory);

		file = $fopen(`filename);

		$fmonitor(file, "time = &d\n", $time,
			"\tmemory[0] = %b\n", memory[0],   
			"\tmemory[1] = %b\n", memory[1],
			"\tmemory[2] = %b\n", memory[2],
			"\tmemory[3] = %b\n", memory[3],
			"\tmemory[4] = %b\n", memory[4],
			"\tmemory[5] = %b\n", memory[5],
			"\tmemory[6] = %b\n", memory[6],
			"\tmemory[7] = %b\n", memory[7]);
		`simulation_time;

		$fclose(file);
	end

	always @(posedge clk) begin
		if(memory_write_enable)
			memory[ram_address <= memory_write_data;
	end

	assign memory_read_data = (memory_read == 1`b1 ? memory[ram_address] : 16`d0;

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
