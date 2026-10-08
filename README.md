# Configurable Watchdog Timer – RTL to GDSII

## Project Overview

This project implements a configurable Watchdog Timer (WDT) using Verilog HDL and demonstrates a complete RTL-to-GDSII digital VLSI implementation using the Sky130 PDK and OpenLane.

A watchdog timer monitors system activity using a periodic heartbeat or kick signal. If the heartbeat is not received within the configured timeout period, the watchdog asserts a reset signal to recover the system from an unresponsive condition.

## Objectives

- Design a practical digital hardware block using Verilog HDL
- Verify functionality using RTL simulation
- Perform logic synthesis using Yosys
- Perform physical design using OpenLane
- Generate the final GDSII layout
- Verify the physical design using DRC and LVS
- Analyze area, utilization and timing-related metrics

## Block Description

The watchdog timer contains:

- Clock input
- Reset input
- Enable control
- Kick/heartbeat input
- Configurable timeout value
- Internal counter
- Watchdog reset output

### Functional Operation

1. Reset initializes the watchdog counter.
2. When enabled, the counter starts counting clock cycles.
3. A kick/heartbeat signal clears the counter.
4. If the counter reaches the configured timeout value, `wdt_reset` is asserted.
5. The reset signal can be used by a larger system to recover from an unresponsive state.

## RTL-to-GDSII Flow

```text
Verilog RTL
    |
    v
RTL Simulation
    |
    v
Functional Verification
    |
    v
Logic Synthesis – Yosys
    |
    v
Floorplanning
    |
    v
Placement
    |
    v
Clock Tree Synthesis
    |
    v
Routing
    |
    v
Physical Verification
    |
    +---- DRC
    |
    +---- LVS
    |
    v
Final GDSII
