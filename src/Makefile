VERILATOR ?= verilator
SIM ?= icarus
TOPLEVEL_LANG ?= verilog

VERILOG_SOURCES += $(PWD)/tb_w5s8.v $(PWD)/w5s8.v

TOPLEVEL = tb_w5s8
MODULE = transitions

include $(shell cocotb-config --makefiles)/Makefile.sim

.PHONY: lint
lint:
	$(VERILATOR) --lint-only $(VERILOG_SOURCES)
