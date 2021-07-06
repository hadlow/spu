TOPLEVEL_LANG ?= verilog

PWD=$(shell pwd)

VERILOG_SOURCES = $(PWD)/hdl/cpu.v
TOPLEVEL := cpu
MODULE   := testbench

include $(shell cocotb-config --makefiles)/Makefile.sim
