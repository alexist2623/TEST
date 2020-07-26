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

logic [31:0] write_buffer;
logic full, empty;
logic [31:0] timer_upper, timer_lower, edges;
logic shift_start_buffer1, shift_start_buffer2;
logic flush_buffer1, flsuh_buffer2, flush;
logic wrst_buffer1, wrst_buffer2;
logic rrst;
logic write_to_fifo;
logic [MAX_NUM_SIGNAL_BITS-1:0] num_of_signal;
logic [$bits(counter)-1:0] counter_x8_domain;
logic [N_IN-1:0] din_buffer1;
logic [N_IN-1:0] din_buffer2;

assign shift_start = shift_start_buffer2             //write && cs && (addr==5'd4); was changed to prevent metastable
assign flush = flush_buffer2                        //write && cs && (addr == 5'd5); was changed to prevent metastable
assign rrst = reset | flush;
assign wrst = wrst_buffer2;

fifo_dualclk #(
    .DATA_WIDTH( $bits(time_upper) + $bits(time_lower) + $bits(edges) ),
	.LOGDEPTH(7)
)
fifo_dulaclk_0
(
    .clk(clk),
    .wrst(wrst),                                    // reset or flush duration should be larger than 1.25ns
    .rrst(rrst),                                    // reset or flush duration should be larger than 10ns
    .clkx8(clkx8),
	.wr_en(wr_en), 
	.rd_en(read),
	.din({counter_x8_domain, write_buffer}),        // {counter,{(32-2*N_IN){0}}, buffer} was changed to {counter,{(32-N_IN){0}}, buffer} 
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

//### synchronizing write, vs, addr signal to clkx8 (800MHz)
always @ (posedge clkx8) begin
    if( reset == 1'd1) begin
        shift_start_buffer1 <= 0;
        shift_start_buffer2 <= 0;
        flush_buffer1 <= 0;
        flush_buffer2 <= 0;
        wrst_buffer1 <= 0;
        wrst_buffer2 <= 0;
    end
    
    else begin
        shift_start_buffer1 <= write && cs && (addr==5'd4);
        flush_buffer1 <= write && cs && (addr == 5'd5);
        shift_start_buffer2 <= shift_start_buffer1;
        flush_buffer2 <= flush_buffer1;
        wrst_buffer1 <= reset | flush;
        wrst_buffer2 <= wrst_buffer1;
    end
end

//### shifting to put data in fifo
integer i;
always @ ( posedge clkx8 ) begin
    if( reset == 1'd1) begin
        num_of_signal <= 0;
        write_buffer <= 0;
        din_buffer1 <= 0;
        din_buffer2 <= 0;
        wr_en <= 0;
    end
    
    else begin
        din_buffer1 <= din;
        din_buffer2 <= din_buffer1;
        
        if( num_of_signal >= MAX_NUM_SIGNAL & shift_start == 1'd1 ) begin
            num_of_signal <= 0;
            wr_en <= 1;
            write_buffer <= din_buffer2;
        end
        else if( num_of_signal != 0 ) begin
            num_of_signal <= num_of_signal + 1;
            wr_en <= 0;
            write_buffer <= ( write_buffer << ( num_of_signal * N_IN ) ) | din_buffer2;
        end
        else if( shift_start == 1'd1) begin
            num_of_signal <= num_of_signal + 1;
            wr_en <= 0;
            write_buffer <= din_buffer2;
        end
        else begin
            num_of_signal <= 0;
            wr_en <= 0;
            write_buffer <= 0;
        end
    end
end
*/

always @ (*) begin
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
end

endmodule