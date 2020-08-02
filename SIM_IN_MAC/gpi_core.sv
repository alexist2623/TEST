`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/21/2020 11:57:12 PM
// Design Name: 
// Module Name: gpi_core
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


module gpi_core
#(
    parameter N_SW=8
)
(
    input logic clk,
    input logic reset,
    
    input logic cs,
    input logic read,
    input logic write,
    input logic [4:0] addr,
    input logic [31:0] wr_data,
    output logic [31:0] rd_data,
    
    input logic [N_SW-1:0] din
);

logic [N_SW-1:0] buf_reg;

always @ (posedge clk)
    if(reset)
        buf_reg <= 0;
    else
        buf_reg <= din;

assign rd_data[N_SW-1:0] = buf_reg;
assign rd_data[31:N_SW] = 0;
        

endmodule
