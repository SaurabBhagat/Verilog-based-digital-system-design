`timescale 1ns/1ps

module traffic_light_controller #(
    parameter GREEN_TIME = 5,
    parameter YELLOW_TIME = 2
)(
    input clk,
    input rst,

    output reg NS_R,
    output reg NS_Y,
    output reg NS_G,

    output reg EW_R,
    output reg EW_Y,
    output reg EW_G
);

localparam NS_GREEN  = 2'b00;
localparam NS_YELLOW = 2'b01;
localparam EW_GREEN  = 2'b10;
localparam EW_YELLOW = 2'b11;

reg [1:0] state;
reg [1:0] next_state;
reg [3:0] counter;

always @(posedge clk) begin
    if (rst) begin
        state   <= NS_GREEN;
        counter <= 0;
    end
    else begin
        state <= next_state;

        if (state != next_state)
            counter <= 0;
        else
            counter <= counter + 1;
    end
end

always @(*) begin
    next_state = state;

    case (state)
        NS_GREEN:
            if (counter >= GREEN_TIME-1)
                next_state = NS_YELLOW;

        NS_YELLOW:
            if (counter >= YELLOW_TIME-1)
                next_state = EW_GREEN;

        EW_GREEN:
            if (counter >= GREEN_TIME-1)
                next_state = EW_YELLOW;

        EW_YELLOW:
            if (counter >= YELLOW_TIME-1)
                next_state = NS_GREEN;

        default:
            next_state = NS_GREEN;
    endcase
end

always @(*) begin
    NS_R = 0;
    NS_Y = 0;
    NS_G = 0;

    EW_R = 0;
    EW_Y = 0;
    EW_G = 0;

    case (state)
        NS_GREEN: begin
            NS_G = 1;
            EW_R = 1;
        end

        NS_YELLOW: begin
            NS_Y = 1;
            EW_R = 1;
        end

        EW_GREEN: begin
            NS_R = 1;
            EW_G = 1;
        end

        EW_YELLOW: begin
            NS_R = 1;
            EW_Y = 1;
        end

        default: begin
            NS_R = 1;
            EW_R = 1;
        end
    endcase
end

endmodule
