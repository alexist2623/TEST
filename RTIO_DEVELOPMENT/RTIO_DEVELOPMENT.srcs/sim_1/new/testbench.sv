`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/07/25 16:51:53
// Design Name: 
// Module Name: testbench
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

module testbench;

parameter DATA_WIDTH  = 68;
parameter LOGDEPTH = 7;

logic clk, wrst, rrst, clkx8;
logic wr_en;
logic rd_en;
logic [DATA_WIDTH - 1:0] din;
logic [DATA_WIDTH - 1:0] dout;
logic empty; 
logic full;

fifo_dualclk#( 
.DATA_WIDTH(DATA_WIDTH),
.LOGDEPTH(LOGDEPTH)
)FIFO_TEST
(
.clk(clk),
.wrst(wrst),
.rrst(rrst),
.clkx8(clkx8),
.wr_en(wr_en),
.rd_en(rd_en),
.din(din),
.empty(empty),
.full(full),
.dout(dout)
);

integer k = 0;
integer l = 0;

initial
begin
    clk = 0;
    clkx8 = 1;
    wrst = 1;
    rrst = 1;
    wr_en = 0;
    rd_en = 0;
    din = 0;
    
    for( k = 0; k < 2; k = k + 1) begin
        for( l = 0; l < 8; l++) begin
            #0.0625 clkx8 = ~clkx8;
        end
        clk = ~clk;
    end
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    clk = ~clk;
    
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    clk = ~clk;
    
    rrst = 0;
    wrst = 0;
    
    #0.03125
    wr_en = 0;
    din = 10;
    #0.03125 clkx8 = ~clkx8;
    #0.03125
    wr_en = 1;
    #0.03125 clkx8 = ~clkx8;
    #0.03125
    wr_en = 0;
    din = 20;
    #0.03125 clkx8 = ~clkx8;
    #0.03125
    wr_en = 1;
    #0.03125 clkx8 = ~clkx8;
    #0.03125
    wr_en = 0;
    din = 30;
    #0.03125 clkx8 = ~clkx8;
    #0.03125
    wr_en = 1;
    #0.03125 clkx8 = ~clkx8;
    #0.03125
    wr_en = 0;
    din = 40;
    #0.03125 clkx8 = ~clkx8;
    #0.03125
    wr_en = 1;
    #0.03125 clkx8 = ~clkx8;
    clk = ~clk;
    
    #0.03125
    wr_en = 0;
    din = 50;
    #0.03125 clkx8 = ~clkx8;
    #0.03125
    wr_en = 1;
    #0.03125 clkx8 = ~clkx8;
    #0.03125
    wr_en = 0;
    din = 60;
    #0.03125 clkx8 = ~clkx8;
    #0.03125
    wr_en = 1;
    #0.03125 clkx8 = ~clkx8;
    #0.03125
    wr_en = 0;
    din = 70;
    #0.03125 clkx8 = ~clkx8;
    #0.03125
    wr_en = 1;
    #0.03125 clkx8 = ~clkx8;
    #0.03125
    wr_en = 0;
    din = 80;
    #0.03125 clkx8 = ~clkx8;
    #0.03125
    wr_en = 1;
    #0.03125 clkx8 = ~clkx8;
    clk = ~clk;
    
    for( l = 0; l < 32; l++ )begin
        #0.03125
        wr_en = 0;
        din = 90 + l*40;
        #0.03125 clkx8 = ~clkx8;
        #0.03125
        wr_en = 1;
        #0.03125 clkx8 = ~clkx8;
        #0.03125
        wr_en = 0;
        din = 100 + l*40;
        #0.03125 clkx8 = ~clkx8;
        #0.03125
        wr_en = 1;
        #0.03125 clkx8 = ~clkx8;
        #0.03125
        wr_en = 0;
        din = 110 + l*40;
        #0.03125 clkx8 = ~clkx8;
        #0.03125
        wr_en = 1;
        #0.03125 clkx8 = ~clkx8;
        #0.03125
        wr_en = 0;
        din = 120 + l*40;
        #0.03125 clkx8 = ~clkx8;
        #0.03125
        wr_en = 1;
        #0.03125 clkx8 = ~clkx8;
        clk = ~clk;
    end
    
    #0.03125
    wr_en = 0;
    #0.03125 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    rd_en = 1;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    clk = ~clk;
    
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    rd_en = 0;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    clk = ~clk;
    
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    rd_en = 1;
    #0.03125
    wr_en = 0;
    din = 1;
    #0.03125 clkx8 = ~clkx8;
    #0.03125
    wr_en = 1;
    #0.03125 clkx8 = ~clkx8;
    clk = ~clk;
    
    #0.03125
    wr_en = 0;
    din = 2;
    #0.03125 clkx8 = ~clkx8;
    #0.03125
    wr_en = 1;
    #0.03125 clkx8 = ~clkx8;
    #0.03125
    wr_en = 0;
    din = 3;
    #0.03125 clkx8 = ~clkx8;
    #0.03125
    wr_en = 1;
    #0.03125 clkx8 = ~clkx8;
    rd_en = 0;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    clk = ~clk;
    
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    clk = ~clk;
    
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    clk = ~clk;
    
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    clk = ~clk;
    
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    clk = ~clk;
    
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    clk = ~clk;
    
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    clk = ~clk;
    
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    clk = ~clk;
    
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    clk = ~clk;
    
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    clk = ~clk;
    
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    clk = ~clk;
    
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    clk = ~clk;
    
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    clk = ~clk;
    
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    clk = ~clk;
    
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    clk = ~clk;
    
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    clk = ~clk;
    
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    clk = ~clk;
    
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    clk = ~clk;
    
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    clk = ~clk;
    
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    clk = ~clk;
    
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    clk = ~clk;
    
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    clk = ~clk;
    
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    clk = ~clk;
    
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    clk = ~clk;
    
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    clk = ~clk;
    
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    clk = ~clk;
    
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    clk = ~clk;
    
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    clk = ~clk;
    
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    clk = ~clk;
    
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    clk = ~clk;
    
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    clk = ~clk;
    
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    clk = ~clk;
    
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    clk = ~clk;
    
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    clk = ~clk;
    
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    clk = ~clk;
    
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    clk = ~clk;
    
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    clk = ~clk;
    
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    clk = ~clk;
    
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    clk = ~clk;
    
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    clk = ~clk;
    
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    clk = ~clk;
    
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    #0.0625 clkx8 = ~clkx8;
    clk = ~clk;

end

endmodule
