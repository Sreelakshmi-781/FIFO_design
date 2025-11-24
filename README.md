# FIFO_design
This repository contains a synchronous FIFO (First-In First-Out) buffer designed in Verilog.
It is fully parameterized, supports synchronous read/write operations, and includes proper flag generation for full and empty conditions.

## Introduction
This Verilog code implements a synchronous FIFO (First-In First-Out) that uses a single clock for both read and write operations. The design uses a memory array along with read and write pointers to store and retrieve data in order. Data is written when the FIFO is not full and read when it is not empty. The module also generates full and empty status flags based on pointer positions, and the entire FIFO is reset to a known state using an active-high reset. This design is fully parameterized, making it easy to customize for different data widths and depths.
