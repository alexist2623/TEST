`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/07/29 13:10:25
// Design Name: 
// Module Name: testbench_edge_detect
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


module testbench_edge_detect;

parameter N_IN = 4;

rising_edge_detector
#(
    .N_IN(4)
)
rising_edge_detector_0
(
    .din(din),
    .clk(clk),
    .reset(reset),
    .rising_edge_detected(rising_edge_detected)
);

logic [N_IN-1:0] din;
logic clk;
logic reset;
logic rising_edge_detected;

integer k;

initial begin
    din = 0;
    clk = 0;
    reset = 1;
    
    for( k = 0; k < 10; k = k + 1) begin
        #0.0625 clk = ~clk;
    end
    reset = 0;
    
    #0.0625 clk = ~clk;
    #0.0625 clk = ~clk;
    din = 4'b0111;
    #0.0625 clk = ~clk;
    #0.0625 clk = ~clk;
    din = 4'b1111;
    #0.0625 clk = ~clk;
    #0.0625 clk = ~clk;
    din = 4'b0000;
    #0.0625 clk = ~clk;
    #0.0625 clk = ~clk;
    din = 4'b1000;
    #0.0625 clk = ~clk;
    #0.0625 clk = ~clk;
    din = 4'b0011;
    #0.0625 clk = ~clk;
    #0.0625 clk = ~clk;
    din = 4'b1111;
    #0.0625 clk = ~clk;
    #0.0625 clk = ~clk;
    din = 4'b1011;
    #0.0625 clk = ~clk;
    #0.0625 clk = ~clk;
    din = 4'b0000;
    #0.0625 clk = ~clk;
    #0.0625 clk = ~clk;
    din = 4'b0001;
    #0.0625 clk = ~clk;
    #0.0625 clk = ~clk;
    din = 4'd2;
    #0.0625 clk = ~clk;
    #0.0625 clk = ~clk;
    din = 4'd3;
    #0.0625 clk = ~clk;
    #0.0625 clk = ~clk;
    din = 4'd4;
    #0.0625 clk = ~clk;
    #0.0625 clk = ~clk;
    din = 4'd5;
    #0.0625 clk = ~clk;
    #0.0625 clk = ~clk;
    din = 4'd6;
    #0.0625 clk = ~clk;
    #0.0625 clk = ~clk;
    din = 4'd7;
    #0.0625 clk = ~clk;
    #0.0625 clk = ~clk;
    din = 4'd8;
    #0.0625 clk = ~clk;
    #0.0625 clk = ~clk;
    din = 4'd9;
    #0.0625 clk = ~clk;
    #0.0625 clk = ~clk;
    din = 4'd10;
    #0.0625 clk = ~clk;
    #0.0625 clk = ~clk;
    din = 4'd11;
    #0.0625 clk = ~clk;
    #0.0625 clk = ~clk;
    din = 4'd12;
    #0.0625 clk = ~clk;
    #0.0625 clk = ~clk;
    din = 4'd13;
    #0.0625 clk = ~clk;
    #0.0625 clk = ~clk;
    din = 4'd14;
    #0.0625 clk = ~clk;
    #0.0625 clk = ~clk;
    din = 4'd15;
    #0.0625 clk = ~clk;
    #0.0625 clk = ~clk;
    din = 4'b0001;
    #0.0625 clk = ~clk;
    #0.0625 clk = ~clk;
    din = 4'b1110;
    #0.0625 clk = ~clk;
    #0.0625 clk = ~clk;
    din = 4'b1111;
    #0.0625 clk = ~clk;
    #0.0625 clk = ~clk;
    din = 4'b1111;
    #0.0625 clk = ~clk;
    #0.0625 clk = ~clk;
    din = 4'b1000;
    #0.0625 clk = ~clk;
    #0.0625 clk = ~clk;
    din = 4'b1111;
    #0.0625 clk = ~clk;
    #0.0625 clk = ~clk;
    din = 4'b1101;
    
end

endmodule
