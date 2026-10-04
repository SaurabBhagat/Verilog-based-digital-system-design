`timescale 1ns/1ps

module tb_traffic_light_controller;

reg clk;
reg rst;

wire NS_R, NS_Y, NS_G;
wire EW_R, EW_Y, EW_G;

traffic_light_controller #(
    .GREEN_TIME(5),
    .YELLOW_TIME(2)
) uut (
    .clk(clk),
    .rst(rst),
    .NS_R(NS_R),
    .NS_Y(NS_Y),
    .NS_G(NS_G),
    .EW_R(EW_R),
    .EW_Y(EW_Y),
    .EW_G(EW_G)
);

always #5 clk = ~clk;

initial begin
    clk = 0;
    rst = 1;

    #10;
    rst = 0;

    #120;
    $finish;
end

initial begin
    $monitor("Time=%0t | NS(RYG)=%b%b%b | EW(RYG)=%b%b%b",
             $time, NS_R, NS_Y, NS_G, EW_R, EW_Y, EW_G);
end

endmodule
