`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/07/26 14:31:41
// Design Name: 
// Module Name: testbench_diff_counter_transfer
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


module testbench_diff_counter_transfer;

logic clk;
logic clkx8;
logic[63:0] counter;
logic reset;
logic[63:0] counter_x8_domain;

diff_counter_transfer# (
    .COUNTER_LENGTH($bits(counter))
)
transfer
(
    .clk(clk),
    .clk_diff(clkx8),
    .counter(counter),
    .reset(reset),
    .reset_diff(reset),
    .counter_diff(counter_x8_domain)
);
integer k = 0;
integer l = 0;

initial begin
    clk = 0;
    clkx8 = 1;
    counter = 0;
    reset = 1;
    
    
    for( k = 0; k < 2; k = k + 1) begin
        for( l = 0; l < 8; l++) begin
            #0.0625 clkx8 = ~clkx8;
        end
        clk = ~clk;
        
        for( l = 0; l < 8; l++) begin
            #0.0625 clkx8 = ~clkx8;
        end
        clk = ~clk;

    end
            reset = 0;
    for( k = 0; k < 20; k = k + 1) begin
        for( l = 0; l < 8; l++) begin
            #0.0625 clkx8 = ~clkx8;
        end
        clk = ~clk;
        counter = counter + 1;
        
        for( l = 0; l < 8; l++) begin
            #0.0625 clkx8 = ~clkx8;
        end
        clk = ~clk;
    end
end

endmodule
