`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/07/29 12:47:00
// Design Name: 
// Module Name: rising_edge_detector
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


module rising_edge_detector
#(
    parameter N_IN = 4
)
(
    input logic[N_IN-1:0] din,
    input logic clk,
    input logic reset,
    output logic rising_edge_detected
    );
    
logic [N_IN-1:0] din_prev;
logic [N_IN-1:0] check_rising;
logic is_first;

always @(posedge clk) begin
    if(reset == 1'd0) begin
        din_prev <= din;
        is_first <= 1'd0;
    end
    else begin
        din_prev <= 0;
        is_first <= 1'd1;
    end
end

genvar i;

generate
    for( i = N_IN-1; i> 0; i--) begin
        assign check_rising[i-1] = (~din[i] && din[i-1])? 1'd1:1'd0;
    end
endgenerate

assign check_rising[N_IN - 1] = (is_first)? 1'd0 : din[N_IN-1] & ~din_prev[0]; //assume MSB is first bit
assign rising_edge_detected = |check_rising;
endmodule
