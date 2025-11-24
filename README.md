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
<table>
  <tr>
    <th>Parameter</th>
    <th>Description</th>
  </tr>
  <tr>
    <td>width</td>
    <td>Width of each FIFO entry (default: 8 bits)</td>
  </tr>
  <tr>
    <td>depth</td>
    <td>Number of FIFO storage locations (default: 16)</td>
  </tr>
  <tr>
    <td>add_bus</td>
    <td>Address pointer width (default: 4 bits)</td>
  </tr>
</table>


## Input/Output Ports
<table>
  <tr>
    <th>Signal</th>
    <th>Direction</th>
    <th>Description</th>
  </tr>
  <tr>
    <td>clk</td>
    <td>Input</td>
    <td>Clock signal</td>
  </tr>
  <tr>
    <td>rst</td>
    <td>Input</td>
    <td>Active-high reset</td>
  </tr>
  <tr>
    <td>we</td>
    <td>Input</td>
    <td>Write enable</td>
  </tr>
  <tr>
    <td>re</td>
    <td>Input</td>
    <td>Read enable</td>
  </tr>
  <tr>
    <td>din</td>
    <td>Input</td>
    <td>Data input</td>
  </tr>
  <tr>
    <td>dout</td>
    <td>Output (reg)</td>
    <td>Data output</td>
  </tr>
  <tr>
    <td>full</td>
    <td>Output</td>
    <td>FIFO full flag</td>
  </tr>
  <tr>
    <td>empty</td>
    <td>Output</td>
    <td>FIFO empty flag</td>
  </tr>
</table>
