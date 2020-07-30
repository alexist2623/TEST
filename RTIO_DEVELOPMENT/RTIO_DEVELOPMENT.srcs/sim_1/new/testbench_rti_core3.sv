`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/07/30 10:37:34
// Design Name: 
// Module Name: testbench_rti_core3
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module testbench_rti_core3;

logic clk;
logic clkx8;
logic[63:0] counter;
logic reset;
logic cs;
logic [4:0] addr;
logic [31:0] wr_data;
logic [31:0] rd_data;
logic [3:0] din;
logic read;
logic write;

rti_core
#(
    .N_IN(4)
)
rti_core_0
(
    .clk(clk),
    .clkx8(clkx8),                              // input clock(800MHz) is added
    .reset(reset),
    .cs(cs),
    .read(read),
    .write(write),
    .addr(addr),
    .wr_data(wr_data),
    .rd_data(rd_data),
    
    .counter(counter),
    .din(din)
);

integer k = 0;
integer l = 0;

always begin
    #0.0625 clkx8 = ~clkx8;
end
always begin
    #0.5 clk = ~clk;
end

endmodule
