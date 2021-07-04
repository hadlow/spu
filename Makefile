TOPLEVEL_LANG ?= verilog

PWD=$(shell pwd)

VERILOG_SOURCES = $(PWD)/hdl/microinference.v
TOPLEVEL := microinference
MODULE   := testbench

include $(shell cocotb-config --makefiles)/Makefile.sim
