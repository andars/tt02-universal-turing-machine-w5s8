a universal turing machine core, using Watanabe's 5 symbol, 8 state machine.

infinite tape not included.

Shigeru Watanabe. 1961. 5-Symbol 8-State and 5-Symbol 6-State Universal Turing Machines. J. ACM 8, 4 (Oct. 1961), 476–483.

### Tiny Tapeout Module

currently the tiny tapeout user module has two modes: either pure combinational
to compute the (state, symbol) -> (state, symbol, direction) transition
function, or sequential where internal memory elements hold the current state
which advances when a tape interface gives the core a new symbol to process.

tiny tapeout files are from https://github.com/TinyTapeout/tt02-verilog-demo.
