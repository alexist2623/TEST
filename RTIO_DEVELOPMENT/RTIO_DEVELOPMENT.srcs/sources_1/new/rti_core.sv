`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/23/2020 09:14:30 PM
// Design Name: 
// Module Name: rti_core
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


module rti_core
#(
    parameter 
                N_IN=4,
                MAX_NUM_SIGNAL = $floor(32 / N_IN),
                MAX_NUM_SIGNAL_BITS = $bits(MAX_NUM_SIGNAL)
)
(
    input logic clk,
    input logic clkx8,                              // input clock(800MHz) is added
    input logic reset,
    
    input logic cs,
    input logic read,
    input logic write,
    input logic [4:0] addr,
    input logic [31:0] wr_data,
    output logic [31:0] rd_data,
    
    input logic [63:0] counter,
    output logic [N_IN-1:0] din
);

logic [N_IN-1:0] buffer; // Prevent metastable
logic [N_IN-1:0] prev;
logic full, empty;
logic [31:0] timer_upper, timer_lower, edges;
logic wr_en;
logic flush;
logic [31:0] write_buffer;
logic write_to_fifo;
logic prev_wr_en;
logic [MAX_NUM_SIGNAL_BITS-1:0] num_of_signal;
logic [$bits(counter)-1:0] counter_x8_domain;

assign wr_en = write && cs && (addr==5'd4);
assign flush = write && cs && (addr == 5'd5);

fifo_dualclk #(
    .DATA_WIDTH($bits(time_upper)+$bits(time_lower)+$bits(edges)),
	.LOGDEPTH(7)
)
fifo_dulaclk_0
(
    .clk(clk),
    .wrst(reset | flush),                           // reset or flush duration should be larger than 1.25ns
    .rrst(reset | flush),                           // reset or flush duration should be larger than 10ns
    .clkx8(clkx8),
	.wr_en(wr_en), 
	.rd_en(read),
	.din({counter_x8_domain, write_buffer}),                 // {counter,{(32-2*N_IN){0}}, buffer} was changed to {counter,{(32-N_IN){0}}, buffer} 
	.empty(empty), 
	.full(full),
	.dout({timer_upper, timer_lower, edges})
);

diff_counter_transfer#(
    .COUNTER_LENGTH($bits(counter))
)
diff_counter_transfer_0
(
    .clk(clk),
    .clk_diff(clkx8),
    .counter(counter),
    .reset(reset),
    .reset_diff(reset),
    .counter_diff(counter_x8_domain)
);

always @(posedge clkx8) begin
    buffer <= din;
    prev <= buffer;
end

always @( posedge clkx8 ) begin
    if( reset ) begin
        write_buffer <= 0;
        write_to_fifo <= 0;
        prev_wr_en <= 0;
        num_of_signal <= 0;
    end
    
    else begin
        prev_wr_en <= wr_en;
        if( wr_en == 1'd1) begin
            if( num_of_signal == MAX_NUM_SIGNAL - 1) begin
                num_of_signal <= 0;
            end
            else begin
                num_of_signal <= num_of_signal + 1;
                
                
            end
        end
        else begin
            num_of_signal <= 0;
            if( prev_wr_en == 1'd1 ) begin
                write_to_fifo <= 1;
            end
            
            else begin
                write_to_fifo <= 0;
            end
        end
    end
        
end

always @ (*)
    case(addr)
    5'd0:
        rd_data = timer_lower;
    5'd1:
        rd_data = timer_upper;
    5'd2:
        rd_data = edges;
    5'd3:
        rd_data = {30'b0, full, empty};
    default:
        rd_data = 0;  
    endcase
    



endmodule
