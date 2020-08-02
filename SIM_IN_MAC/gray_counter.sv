module gray_counter
#(
	parameter LENGTH = 8						// legth of graycode(binary counter)
)
(
	input logic clk_counter,					// clock where counter works
	input logic clk_diff,						// clock which is different with clk_counter
	input logic reset_counter,					// reset binary and gray to zero synchronously 
												//in clk_counter domain
	input logic reset_diff,						// reset binary and gray to zero synchronously
												//in clk_diff domain
	input logic ce,								// clock enable
	output logic [LENGTH-2:0] binary_out,		// binary number of counter
	output logic [LENGTH-1:0] gray_out,			// binary converted to gray code
	output logic [LENGTH-1:0] gray_out_synced	// gray code synchronized for "clk_diff"
);

logic [LENGTH-1:0] binary;
logic [LENGTH-1:0] binary_next;					// binary number of counter which would replace "binary"
logic [LENGTH-1:0] gray_next;					// graycode of binary_next. this will replace gray_out
logic [LENGTH-1:0] gray_out_buffer;				// graycode for synchronize in "clk_diff"

always @( * ) begin
	binary_next = (ce == 1'd0)? binary : (binary + 1);
	gray_next = binary_next[LENGTH-1:1] ^ binary_next[LENGTH-1:0];	// convert binary number to gray code
end

assign binary_out = binary;

always @(posedge clk_counter) begin				// counter which works in "clk_counter" clock
	if(reset_counter) begin
		binary <= 0;							// synchronous reset
		gray_out <= 0;
	end
		
	else begin
		gray_out <= gray_next;					// discharge gray_out in clk_counter
		case(ce)								// only when "ce" is high, counter chnage
			1'd1: begin
				binary <= binary_next;
				//binary_out <= binary_next[LENGTH-2:0];
			end
			default: begin
				binary <= binary;
				//binary_out <= binary[LENGTH-2:0];
			end
		endcase
	end
end


always @(posedge clk_diff) begin
	if( reset_diff) begin
		gray_out_buffer <= 0;
		gray_out_synced <= 0;
	end
	else begin
		gray_out_buffer <= gray_out;
		gray_out_synced <= gray_out_buffer;
	end
end

endmodule
