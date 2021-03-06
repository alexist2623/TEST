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
                N_IN=4
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
    input logic [N_IN-1:0] din                      // direction has been changed to "output"
);

logic [31:0] write_buffer;
logic full, empty;
logic full_diff_clk, full_buffer1, full_buffer2;
logic full_out;
logic [31:0] timer_upper, timer_lower, edges;
logic flush_buffer1, flush_buffer2, flush;
logic wrst_buffer1, wrst_buffer2;
logic rrst;
logic [$bits(counter)-1:0] counter_x8_domain;
logic [N_IN-1:0] din_buffer1;
logic [N_IN-1:0] din_buffer2;
logic wr_en;
logic flush_async;
logic rising_edge_detected;
logic rising_edge_detected_input;
logic rising_edge_detected_buffer1;
logic rising_edge_detected_buffer2;

assign flush = flush_buffer2;                       //write && cs && (addr == 5'd5); was changed to prevent metastable
assign rrst = reset;
assign wrst = wrst_buffer2;
assign write_buffer = {{(32-N_IN){0}}, din_buffer2};
assign wr_en = ( write && cs && (addr==5'd4) );
assign flush_async = ( write && cs && (addr == 5'd5) );
assign rising_edge_detected_input = rising_edge_detected_buffer2;
assign full_out = full_buffer2;

fifo_dualclk #(
    .DATA_WIDTH( $bits(timer_upper) + $bits(timer_lower) + $bits(edges) ),
	.LOGDEPTH(7)
)
fifo_dulaclk_0
(
    .clk(clk),
    .wrst(wrst | flush),                            // reset or flush duration should be larger than 1.25ns
    .rrst(rrst | flush_async),                      // reset or flush duration should be larger than 10ns
    .clkx8(clkx8),
	.wr_en(rising_edge_detected_input), 
	.rd_en(wr_en),
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

rising_edge_detector#(
    .N_IN(N_IN)
)
rising_edge_detector_0
(
    .din(din),
    .clk(clkx8),
    .reset(reset),
    .rising_edge_detected(rising_edge_detected)
);

//### synchronizing write, cs, addr signal to clkx8 (800MHz) & match timing with counter
always @ (posedge clkx8) begin
    if( wrst == 1'd1) begin
        flush_buffer1 <= 0;
        flush_buffer2 <= 0;
        wrst_buffer1 <= reset;
        wrst_buffer2 <= wrst_buffer1;
        rising_edge_detected_buffer2 <= 0;
        rising_edge_detected_buffer1 <= 0;
        din_buffer1 <= 0;
        din_buffer2 <= 0;
        full_diff_clk <= 0;
    end
    
    else begin
        flush_buffer1 <= flush_async;
        flush_buffer2 <= flush_buffer1;
        wrst_buffer1 <= reset;
        wrst_buffer2 <= wrst_buffer1;
        
        if( flush == 1'd0 ) begin
            if( full == 1'd1 ) begin
                full_diff_clk <= 1'd1;
            end
            
            else begin
                full_diff_clk <= full_diff_clk;
            end
            din_buffer1 <= din;
            din_buffer2 <= din_buffer1;
            rising_edge_detected_buffer1 <= rising_edge_detected;
            rising_edge_detected_buffer2 <= rising_edge_detected_buffer1;
        end
        
        else begin
            din_buffer1 <= 0;
            din_buffer2 <= 0;
            full_diff_clk <= 1'd0;
            rising_edge_detected_buffer1 <= 0;
            rising_edge_detected_buffer2 <= 0;
        end
    end
end

// ### save full if they were 1 and prevent meta stable
always @ ( posedge clk ) begin
    if( reset == 1'd1 | flush_async == 1'd1 ) begin
        full_buffer1 <= 0;
        full_buffer2 <= 0;
    end
    
    else begin
        full_buffer1 <= full_diff_clk;
        full_buffer2 <= full_buffer1;
    end
end

always @ (*) begin
    case(addr)
    5'd0:
        rd_data = timer_lower;
    5'd1:
        rd_data = timer_upper;
    5'd2:
        rd_data = edges;
    5'd3:
        rd_data = {30'b0, full_out, empty};
    default:
        rd_data = 0;  
    endcase
end

endmodule