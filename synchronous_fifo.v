`timescale 1ns/1ps

module synchronous_fifo #(
    parameter DATA_WIDTH = 8,
    parameter DEPTH = 8
)(
    input clk,
    input rst,
    input wr_en,
    input rd_en,
    input [DATA_WIDTH-1:0] din,
    output reg [DATA_WIDTH-1:0] dout,
    output full,
    output empty,
    output reg [3:0] count
);

reg [DATA_WIDTH-1:0] memory [0:DEPTH-1];
reg [2:0] write_pointer;
reg [2:0] read_pointer;

assign full  = (count == DEPTH);
assign empty = (count == 0);

always @(posedge clk) begin
    if (rst) begin
        write_pointer <= 0;
        read_pointer  <= 0;
        count         <= 0;
        dout          <= 0;
    end
    else begin
        if (wr_en && !full) begin
            memory[write_pointer] <= din;

            if (write_pointer == DEPTH-1)
                write_pointer <= 0;
            else
                write_pointer <= write_pointer + 1;
        end

        if (rd_en && !empty) begin
            dout <= memory[read_pointer];

            if (read_pointer == DEPTH-1)
                read_pointer <= 0;
            else
                read_pointer <= read_pointer + 1;
        end

        case ({wr_en && !full, rd_en && !empty})
            2'b10: count <= count + 1;
            2'b01: count <= count - 1;
            default: count <= count;
        endcase
    end
end

endmodule
