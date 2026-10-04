`timescale 1ns/1ps

module tb_synchronous_fifo;

reg clk;
reg rst;
reg wr_en;
reg rd_en;
reg [7:0] din;

wire [7:0] dout;
wire full;
wire empty;
wire [3:0] count;

synchronous_fifo uut (
    .clk(clk),
    .rst(rst),
    .wr_en(wr_en),
    .rd_en(rd_en),
    .din(din),
    .dout(dout),
    .full(full),
    .empty(empty),
    .count(count)
);

always #5 clk = ~clk;

initial begin
    clk = 0;
    rst = 1;
    wr_en = 0;
    rd_en = 0;
    din = 0;

    #10;
    rst = 0;

    // Write four values
    #10; wr_en = 1; din = 8'h10;
    #10; din = 8'h20;
    #10; din = 8'h30;
    #10; din = 8'h40;
    #10; wr_en = 0;

    // Read four values
    #10; rd_en = 1;
    #10; rd_en = 0;
    #10; rd_en = 1;
    #10; rd_en = 0;
    #10; rd_en = 1;
    #10; rd_en = 0;
    #10; rd_en = 1;
    #10; rd_en = 0;

    #20;
    $finish;
end

initial begin
    $monitor("Time=%0t Write=%b Read=%b Din=%h Dout=%h Count=%d Full=%b Empty=%b",
             $time, wr_en, rd_en, din, dout, count, full, empty);
end

endmodule
