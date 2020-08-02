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
logic [10:0]counting_din = 1;
logic stop_din = 0;

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
    #0.0525 clkx8 = ~clkx8;
    #0.01;
    if( clkx8 == 0 && stop_din == 0) begin
        counting_din = counting_din + 1;
    end
    else if(stop_din == 1 ) begin
        counting_din = 0;
    end
end

always begin
    #0.0625;
    if( clkx8 == 1 & stop_din == 0) begin
        din = counting_din[3:0];
    end
end

always begin
    #0.5 clk = ~clk;
    if(clk == 1 & reset == 0) begin
        counter = counter + 1;
    end
    else if( clk == 0 & reset == 0 ) begin
        counter = counter;
    end
    else begin
        counter = 0;
    end
end

initial begin
    clk = 0;
    clkx8 = 1;
    counter = 0;
    reset = 1;
    cs = 0;
    addr = 0;
    wr_data = 0;
    rd_data = 0;
    read = 0;
    write = 0;
    
    #2.0 reset = 0;
    #30.0
    stop_din = 1;
    din = 0;
    #0.6
    addr = 0;
    #0.9
    #0.1
    addr = 1;
    #0.9
    #0.1
    addr = 2;
    #0.9
    
    #0.1
    cs = 1;
    write = 1;
    addr = 4;
    #0.9;
    
    #0.0625
    din = 4'b1111;
    
    #0.9375
    
    #0.1
    cs = 1;
    write = 1;
    addr = 5;
    reset = 0;
    #1.0
    stop_din = 1;
    #0.5
    stop_din = 0;
    #0.4
    
    #0.1
    addr = 2;
    write = 0;
    cs = 1;
    reset = 0;
    stop_din = 0;
    #9.9
    
    #0.1
    write = 1;
    addr = 5;
    cs = 1;
    #1.9
    addr = 2;
    write = 0;
    cs = 1;
    reset = 0;
    stop_din = 0;
    #0.1
    
    #39.9
    
    #0.1
    stop_din = 1;
    din = 4'b0000;
    cs = 1;
    write = 1;
    addr = 4;
    
    #10.0
    din = 4'b1111;
    
    #150.0
    addr = 5;
    #10.0
    addr = 3;
end

endmodule
