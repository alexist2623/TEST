module fifo_dualclk
#(
	parameter
		DATA_WIDTH = 96,
		LOGDEPTH = 7,
		DEPTH = 2 ** LOGDEPTH
)
(
	input logic clk, wrst, rrst, clkx8,		// clk : main processor clock (100 MHz) , wrst : synchronous reset signal in wirte clock, rrst : synchronous reset signal in read clock, clkx8 : clock which is 8times faster clk ( 800MHz )
	input logic wr_en, rd_en,				// wr_en : write enable, rd_en : read enable
	input logic [DATA_WIDTH-1:0] din,			// data input
	output logic empty, full,				// empty : indicate fifo cannot discharge, full : indicate fifo is full
	output logic [DATA_WIDTH-1:0] dout		// data output
);

logic writeable;
logic readable;
logic array_reg_we;
logic [LOGDEPTH : 0] read_gray;
logic [LOGDEPTH : 0] write_gray;
logic [LOGDEPTH : 0] read_gray_synced;
logic [LOGDEPTH : 0] write_gray_synced;
logic [LOGDEPTH - 1 : 0] read_address;
logic [LOGDEPTH - 1:0] read_address_next;
logic [LOGDEPTH - 1:0] write_address;
logic [LOGDEPTH - 1:0] write_address_next;
logic [DATA_WIDTH - 1:0] dout_buffer;
logic [DATA_WIDTH - 1:0] din_buffer;
logic [DATA_WIDTH - 1:0] array_reg[0:DEPTH-1];

gray_counter #( .LENGTH( LOGDEPTH + 1 ) ) rd_counter(
	.clk_counter(clk),
	.clk_diff(clkx8),
	.reset_counter(rrst),
	.reset_diff(wrst),
	.ce(readable & rd_en),
	.binary_out(read_address_next),
	.gray_out(read_gray),
	.gray_out_synced(read_gray_synced)
);

gray_counter #( .LENGTH( LOGDEPTH + 1 ) ) wr_counter(
	.clk_counter(clkx8),
	.clk_diff(clk),
	.reset_counter(wrst),
	.reset_diff(rrst),
	.ce(writeable & wr_en),
	.binary_out(write_address_next),
	.gray_out(write_gray),
	.gray_out_synced(write_gray_synced)
);

integer i;

assign din_buffer = din;
assign dout_buffer = array_reg[read_address];
assign dout = dout_buffer;
assign array_reg_we = writeable & wr_en;
assign readable = ~(write_gray_synced == read_gray);
assign writeable = ( ( write_gray[LOGDEPTH] == read_gray_synced[LOGDEPTH] ) | ( write_gray[LOGDEPTH-1] == read_gray_synced[LOGDEPTH-1] ) | ~(write_gray[LOGDEPTH-2:0] == read_gray_synced[LOGDEPTH-2:0]) );
assign empty = ~readable;
assign full = ~writeable;
assign write_address = (wrst == 0 )? write_address_next : 0;
assign read_address = (rrst == 0 )? read_address_next : 0;

always @ ( posedge clkx8 ) begin
	if(wrst) begin
		for( i = 0; i < DEPTH ; i++) begin
			array_reg[i] <= 0;
		end
	end
	else begin
		if(array_reg_we) begin
			array_reg[write_address] <= din_buffer;
		end
		else begin
			array_reg[write_address] <= array_reg[write_address];
		end
	end
end

always @ ( posedge clk ) begin
	if(rrst) begin
		for( i = 0; i < DEPTH; i++ ) begin
			array_reg[i] <= 0;
		end
	end
end

endmodule
