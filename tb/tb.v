`timescale 1ns/1ps

module tb;

    reg clk;
    reg rst;
    reg enable;
    reg kick;
    reg [3:0] timeout;

    wire wdt_reset;
    wire [3:0] count;

    watchdog_timer #(
        .TIMEOUT_WIDTH(4)
    ) dut (
        .clk(clk),
        .rst(rst),
        .enable(enable),
        .kick(kick),
        .timeout(timeout),
        .wdt_reset(wdt_reset),
        .count(count)
    );

    // Clock: 10 ns period
    always #5 clk = ~clk;

    initial begin
        // Waveform dump
        $dumpfile("../sim/dump.vcd");
        $dumpvars(0, tb);

        // Initial values
        clk     = 0;
        rst     = 1;
        enable  = 0;
        kick    = 0;
        timeout = 4'd5;

        // Reset
        #20;
        rst = 0;
        enable = 1;

        // Normal operation: heartbeat/kick
        #20;
        kick = 1;
        #10;
        kick = 0;

        // Allow counter to run
        #20;

        // Another heartbeat
        kick = 1;
        #10;
        kick = 0;

        // Stop heartbeat and wait for timeout
        #80;

        if (wdt_reset)
            $display("WATCHDOG TIMEOUT DETECTED - PASS");
        else
            $display("WATCHDOG TIMEOUT NOT DETECTED - FAIL");

        $finish;
    end

endmodule
