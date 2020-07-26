module diff_counter_transfer#(
    parameter COUNTER_LENGTH = 64
)
(
    input logic clk,
    input logic clk_diff,
    input logic [COUNTER_LENGTH - 1:0]counter,
    input logic reset,
    input logic reset_diff,
    output logic [COUNTER_LENGTH - 1:0]counter_diff
);

logic[COUNTER_LENGTH - 1:0] counter_original_gray;
logic[COUNTER_LENGTH - 1:0] counter_diff_gray_buffer1;
logic[COUNTER_LENGTH - 1:0] counter_diff_gray_buffer2;
logic[COUNTER_LENGTH - 1:0] counter_diff_gray;
logic[COUNTER_LENGTH - 1:0] counter_diff_binary;

genvar i;
assign counter_diff_binary = 0;
assign counter_diff_binary[COUNTER_LENGTH-1] = counter_diff_gray[COUNTER_LENGTH-1];
generate
    for( i = COUNTER_LENGTH - 2; i >=0 ;i--) begin
        assign counter_diff_binary[i] = counter_diff_binary[i+1] ^ counter_diff_gray[i];
    end
endgenerate

assign counter_diff_gray = counter_diff_gray_buffer2;

always @(posedge clk) begin
    counter_original_gray <= (counter ^ counter[COUNTER_LENGTH - 1:1]);
end

always @(posedge clk_diff) begin
    if(reset_diff == 1'd0) begin
        counter_diff <= counter_diff_binary;
        counter_diff_gray_buffer1 <= counter_original_gray;
        counter_diff_gray_buffer2 <= counter_diff_gray_buffer1;
    end
    else begin
        counter_diff <= 0;
        counter_diff_gray_buffer1 <= 0;
        counter_diff_gray_buffer2 <= 0;
    end
end

endmodule