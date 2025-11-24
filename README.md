# FIFO_design
This repository contains a Verilog implementation of a synchronous FIFO (First-In First-Out) buffer.
The design performs both read and write operations on the same clock edge, making it ideal for synchronous digital systems such as processors, communication pipelines, and memory buffers.

## Introduction
This Verilog code implements a synchronous FIFO (First-In First-Out) that uses a single clock for both read and write operations. The design uses a memory array along with read and write pointers to store and retrieve data in order. Data is written when the FIFO is not full and read when it is not empty. The module also generates full and empty status flags based on pointer positions, and the entire FIFO is reset to a known state using an active-high reset. This design is fully parameterized, making it easy to customize for different data widths and depths.

## Features
* Synchronous read and write (single clock)
* Parameterized data width and FIFO depth
* Automatic full and empty flag generation
* Internal memory implemented using register array
* Pointer-based addressing for read and write operations
* Clean reset behavior

## Parameters
<br>
| Parameter     | Description     |
|---------------|-----------------|
| `width`       | Width of each FIFO entry (default: 8 bits) |
| `depth`       | Number of FIFO storage locations (default: 16) |
| `add_bus`     | Address pointer width (default: 4 bits) |

## Input/Output Ports
<br>
| Signal | Direction | Description |
|--------|-----------|-------------|
| clk    | Input     | Clock signal |
| rst    | Input     | Active-high reset |
| we     | Input     | Write enable |
| re     | Input     | Read enable |
| din    | Input     | Data input |
| dout     | Output(reg)    | Data output |
| full     | Output     | FIFO full flag |
| empty    | Output     | FIFO empty flag |

