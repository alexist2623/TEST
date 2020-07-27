`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/07/26 20:35:50
// Design Name: 
// Module Name: testbench_rti_core
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


module testbench_rti_core;

logic clk;
logic clkx8;
logic[63:0] counter;
logic reset;
logic cs;
logic [4:0] addr;
logic [31:0] wr_data;
logic [31:0] rd_data;
logic [3:0] din;
logic read;
logic write;

rti_core
#(
    .N_IN(4)
)
rti_core_0
(
    .clk(clk),
    .clkx8(clkx8),                              // input clock(800MHz) is added
    .reset(reset),
    .cs(cs),
    .read(read),
    .write(write),
    .addr(addr),
    .wr_data(wr_data),
    .rd_data(rd_data),
    
    .counter(counter),
    .din(din)
);

integer k = 0;
integer l = 0;

initial begin
    clk = 0;
    clkx8 = 1;
    counter = 0;
    reset = 1;
    cs = 0;
    addr = 0;
    wr_data = 0;
    rd_data = 0;
    din = 0;
    read = 0;
    write = 0;
    
    
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
    //
    for( k = 0; k < 20; k = k + 1) begin
        #0.03125 ;  
        #0.03125 clkx8 = ~clkx8;
        #0.03125 ;
        din = k*8 + 1;
        addr = 4;
        cs = 1;
        write = 1;
        #0.03125 clkx8 = ~clkx8;
        #0.03125 ;
        #0.03125 clkx8 = ~clkx8;
        #0.03125 ;
        din = k*8 + 2;
        addr = 4;
        cs = 1;
        write = 1;
        #0.03125 clkx8 = ~clkx8;
        #0.03125 ;
        #0.03125 clkx8 = ~clkx8;
        #0.03125 ;
        din = k*8 + 3;
        addr = 4;
        cs = 1;
        write = 1;
        #0.03125 clkx8 = ~clkx8;
        #0.03125 ;
        #0.03125 clkx8 = ~clkx8;
        #0.03125 ;
        din = k*8 + 4;
        addr = 4;
        cs = 1;
        write = 1;
        #0.03125 clkx8 = ~clkx8;
        clk = ~clk;
        counter = counter + 1;
        
        #0.03125 ;
        #0.03125 clkx8 = ~clkx8;
        #0.03125 ;
        din = k*8 + 5;
        addr = 4;
        cs = 1;
        write = 1;
        #0.03125 clkx8 = ~clkx8;
        #0.03125 ;
        #0.03125 clkx8 = ~clkx8;
        #0.03125 ;
        din = k*8 + 6;
        addr = 4;
        cs = 1;
        write = 1;
        #0.03125 clkx8 = ~clkx8;
        #0.03125 ;
        #0.03125 clkx8 = ~clkx8;
        #0.03125 ;
        din = k*8 + 7;
        addr = 4;
        cs = 1;
        write = 1;
        #0.03125 clkx8 = ~clkx8;
        #0.03125 ;
        #0.03125 clkx8 = ~clkx8;
        #0.03125 ;
        din = k*8 + 8;
        addr = 4;
        cs = 1;
        write = 1;
        #0.03125 clkx8 = ~clkx8;
        clk = ~clk;
    end
    cs = 1;
    addr = 4;
    write = 0;
    for( k = 0; k < 2; k = k + 1) begin
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
    addr = 2;
    
    for( k = 0; k < 129; k = k + 1) begin
        #0.03125 ;
        #0.03125 clkx8 = ~clkx8;
        #0.03125 ;
        #0.03125 clkx8 = ~clkx8;
        #0.03125 ;
        #0.03125 clkx8 = ~clkx8;
        #0.03125 ;
        #0.03125 clkx8 = ~clkx8;
        #0.03125 ;
        #0.03125 clkx8 = ~clkx8;
        #0.03125 ;
        #0.03125 clkx8 = ~clkx8;
        #0.03125 ;
        #0.03125 clkx8 = ~clkx8;
        #0.03125 ;
        #0.03125 clkx8 = ~clkx8;
        clk = ~clk;
        counter = counter + 1;
        $display(counter);
        
        #0.03125 ;
        din = k*8 + 1;
        cs = 1;
        read = 1;
        #0.03125 clkx8 = ~clkx8;
        #0.03125 ;
        din = k*8 + 2;
        cs = 1;
        read = 1;
        #0.03125 clkx8 = ~clkx8;
        #0.03125 ;
        din = k*8 + 3;
        cs = 1;
        read = 1;
        #0.03125 clkx8 = ~clkx8;
        #0.03125 ;
        din = k*8 + 4;
        cs = 1;
        read = 1;
        #0.03125 clkx8 = ~clkx8;
        #0.03125 ;
        din = k*8 + 5;
        cs = 1;
        read = 1;
        #0.03125 clkx8 = ~clkx8;
        #0.03125 ;
        din = k*8 + 6;
        cs = 1;
        read = 1;
        #0.03125 clkx8 = ~clkx8;
        #0.03125 ;
        din = k*8 + 7;
        cs = 1;
        read = 1;
        #0.03125 clkx8 = ~clkx8;
        #0.03125 ;
        din = k*8 + 8;
        cs = 1;
        read = 1;
        #0.03125 clkx8 = ~clkx8;
        clk = ~clk;
    end
    read = 0;
    //
    for( k = 0; k < 2; k = k + 1) begin
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
    #0.03125 ;
    write = 0;  
    #0.03125 clkx8 = ~clkx8;
    #0.03125 ;
    #0.03125 clkx8 = ~clkx8;
    #0.03125 ;
    #0.03125 clkx8 = ~clkx8;
    #0.03125 ;
    #0.03125 clkx8 = ~clkx8;
    #0.03125 ;
    #0.03125 clkx8 = ~clkx8;
    #0.03125;
    #0.03125 clkx8 = ~clkx8;
    #0.03125 ;
    #0.03125 clkx8 = ~clkx8;
    #0.03125 ;
    #0.03125 clkx8 = ~clkx8;
    clk = ~clk;
    counter = counter + 1;
    
    //write again
    #0.03125 ;
    #0.03125 clkx8 = ~clkx8;
    #0.03125 ;
    din =15;
    addr = 4;
    cs = 1;
    write = 1;
    #0.03125 clkx8 = ~clkx8;
    #0.03125;
    #0.03125 clkx8 = ~clkx8;
    #0.03125 ;
    din = 14;
    addr = 4;
    cs = 1;
    write = 1;
    #0.03125 clkx8 = ~clkx8;
    #0.03125 ;
    #0.03125 clkx8 = ~clkx8;
    #0.03125 ;
    din = 13;
    addr = 4;
    cs = 1;
    write = 1;
    din = 10;
    addr = 4;
    cs = 1;
    write = 1;
    #0.03125 clkx8 = ~clkx8;
    #0.03125 ;
    #0.03125 clkx8 = ~clkx8;
    #0.03125 ;
    din = 12;
    addr = 4;
    cs = 1;
    write = 1;
    #0.03125 clkx8 = ~clkx8;
    clk = ~clk;
    
    write = 0;
    
    for( k = 0; k < 2; k = k + 1) begin
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
    #0.03125; 
    #0.03125 clkx8 = ~clkx8;
    addr = 5;
    write = 1;
    #0.03125; 
    #0.03125 clkx8 = ~clkx8;
    for( k = 0; k < 2; k = k + 1) begin
        for( l = 0; l < 6; l++) begin
            #0.0625 clkx8 = ~clkx8;
        end
        clk = ~clk;
        counter = counter + 1;
        
        for( l = 0; l < 8; l++) begin
            #0.0625 clkx8 = ~clkx8;
        end
        clk = ~clk;
    end    
    addr = 2;
    write = 0;
    for( k = 0; k < 2; k = k + 1) begin
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
    
    #0.03125 ;
    #0.03125 clkx8 = ~clkx8;
    #0.03125 ;
    din =15;
    addr = 4;
    cs = 1;
    write = 1;
    #0.03125 clkx8 = ~clkx8;
    #0.03125;
    #0.03125 clkx8 = ~clkx8;
    #0.03125 ;
    din = 14;
    addr = 4;
    cs = 1;
    write = 1;
    #0.03125 clkx8 = ~clkx8;
    #0.03125 ;
    #0.03125 clkx8 = ~clkx8;
    #0.03125 ;
    din = 13;
    addr = 4;
    cs = 1;
    write = 1;
    din = 10;
    addr = 4;
    cs = 1;
    write = 1;
    #0.03125 clkx8 = ~clkx8;
    #0.03125 ;
    #0.03125 clkx8 = ~clkx8;
    #0.03125 ;
    din = 12;
    addr = 4;
    cs = 1;
    write = 1;
    #0.03125 clkx8 = ~clkx8;
    clk = ~clk;
    
    write = 0;
    for( k = 0; k < 2; k = k + 1) begin
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
