`timescale 1ns/1ps

module watchdog_timer #(
    parameter TIMEOUT_WIDTH = 4
)(
    input  wire                     clk,
    input  wire                     rst,
    input  wire                     enable,
    input  wire                     kick,
    input  wire [TIMEOUT_WIDTH-1:0] timeout,

    output reg                      wdt_reset,
    output reg  [TIMEOUT_WIDTH-1:0] count
);

always @(posedge clk) begin
    if (rst) begin
        count     <= 0;
        wdt_reset <= 0;
    end
    else if (!enable) begin
        count     <= 0;
        wdt_reset <= 0;
    end
    else if (kick) begin
        count     <= 0;
        wdt_reset <= 0;
    end
    else if (count >= timeout) begin
        wdt_reset <= 1;
    end
    else begin
        count <= count + 1'b1;
        wdt_reset <= 0;
    end
end

endmodule
