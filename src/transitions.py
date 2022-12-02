import cocotb
from cocotb.clock import Clock
from cocotb.triggers import ClockCycles
from cocotb.binary import BinaryValue

state_chars = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H']
dir_chars = ['L', 'R']
sym_chars = {0:'0', 1:'1', 2:'*', 4:'o', 5:'i'}

@cocotb.test()
async def test_transitions(dut):
    dut._log.info("start")
    clock = Clock(dut.clock, 10, units="us")
    cocotb.start_soon(clock.start())

    await ClockCycles(dut.clock, 10)

    dut._log.info("check all transitions")
    for state in range(8):
        for sym in sym_chars.keys():
            dut._log.info(" state {} + symbol {}".format(state, sym))
            dut.state_in.value = state
            dut.sym_in.value = sym
            await ClockCycles(dut.clock, 1)
            dut._log.info(" state {} + symbol {}".format(state_chars[dut.state_in.value], sym_chars[dut.sym_in.value.integer]))
            dut._log.info(" -> new symbol {}".format(sym_chars[dut.sym_out.value.integer]))
            dut._log.info(" -> direction {}".format(dir_chars[dut.dir_out.value]))
            dut._log.info(" -> next state {}".format(state_chars[dut.state_out.value]))
            dut._log.info("")
            await ClockCycles(dut.clock, 1)
