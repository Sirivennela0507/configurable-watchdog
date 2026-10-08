# Configurable Watchdog Timer – RTL to GDSII

## Project Overview

This project implements a configurable Watchdog Timer (WDT) in Verilog HDL and demonstrates a complete RTL-to-GDSII digital VLSI flow using the Sky130 PDK and OpenLane.

A watchdog timer monitors system activity using a periodic heartbeat/kick signal. If the heartbeat is not received within the configured timeout period, the watchdog asserts a reset signal to recover the system from an unresponsive condition.

## Objectives

- Design a practical digital hardware block using Verilog HDL
- Verify functionality using RTL simulation
- Perform logic synthesis using Yosys
- Perform physical design using OpenLane
- Generate the final GDSII layout
- Verify the physical design using DRC and LVS
- Analyze timing and physical-design metrics

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
Logic Synthesis
    |
    v
Gate-Level Netlist
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
Static Timing Analysis
    |
    v
DRC / LVS
    |
    v
Final GDSII
