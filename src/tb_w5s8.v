`default_nettype none
`timescale 1ns/1ps

module tb_w5s8(
    input clock,
    input [2:0] state_in,
    input [2:0] sym_in,
    output [2:0] state_out,
    output [2:0] sym_out,
    output dir_out
);

initial begin
    $dumpfile("tb_w5s8.vcd");
    $dumpvars;
end

wire [7:0] inputs;
wire [7:0] outputs;
wire mode;

assign mode = 1'b0;
assign inputs = {mode, sym_in, state_in, clock};
assign state_out = outputs[7:5];
assign sym_out = outputs[4:2];
assign dir_out = outputs[1];

afoote_w5s8_tt02_top dut(
    .io_in(inputs),
    .io_out(outputs)
);

endmodule
