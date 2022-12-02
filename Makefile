# derived from https://github.com/mattvenn/wokwi-verilog-gds-test/blob/main/Makefile

WOKWI_PROJECT_ID=341174563322724948

VERILOG_FILES = core.v direction.v next_state.v new_symbol.v decoder_3to8.v encoder_8to3.v user_module.v
SOURCE_VERILOG_FILES = $(patsubst %.v,verilog/%.v,$(VERILOG_FILES))
$(info source verilog files: $(SOURCE_VERILOG_FILES))

src/user_module_$(WOKWI_PROJECT_ID).v: $(SOURCE_VERILOG_FILES)
	mkdir -p src
	cat $^ | sed -e 's/PROJECT_ID/$(WOKWI_PROJECT_ID)/g' > $@
