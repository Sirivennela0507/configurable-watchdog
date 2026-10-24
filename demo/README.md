# Configurable Watchdog Timer — RTL to GDSII

## Project Overview

This project implements a configurable Watchdog Timer (WDT) using Verilog HDL
and demonstrates an RTL-to-GDSII implementation flow using the SkyWater
SKY130 PDK and OpenLane.

A watchdog timer monitors system activity through a heartbeat or kick signal.
If the heartbeat is not received within the configured timeout period, the
watchdog asserts a reset output.

## Objectives

- Design a sequential watchdog timer in Verilog RTL.
- Verify functionality through simulation.
- Synthesize the design using Yosys.
- Implement the design using OpenLane and Sky130.
- Generate final GDSII, DEF, and LEF outputs.
- Review static timing analysis (STA) results.
- Review physical verification evidence, including DRC and LVS.

## Demo Review

Click here to view demo video - https://drive.google.com/file/d/1uFaESmMQE6RRD8SPOTxHrbvsKIOwRxtS/view?usp=sharing

## Functional Overview

The watchdog uses a clock, reset/control inputs, a heartbeat/kick input,
an internal counter, and a watchdog reset output.

1. Reset initializes the timer state.
2. The counter advances according to the RTL control logic.
3. A valid kick refreshes the timer.
4. If the timeout condition is reached, `wdt_reset` is asserted.

Refer to `rtl/watchdog_timer.v` for the exact interface and behavior.

## RTL-to-GDSII Flow

```text
Verilog RTL
    |
    v
RTL Simulation
    |
    v
Yosys Synthesis
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
Timing and Physical Verification
    |
    v
Final GDSII / DEF / LEF# Configurable Watchdog Timer – RTL to GDSII

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
