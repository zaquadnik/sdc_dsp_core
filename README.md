# SDC DSP Core

This document describes the experimental Small DSP Core (SDC) architecture. The core is written in System Verilog HDL language. The software used for development is Intel (Altera) Quartus Prime 19.1. The FPGA device used for running this core is Cyclone V EP5CEBA4F23C7N with 48k LEs. The Terasic DE0-CV development kit was used for running the core. 

## Overview

The SDC core is 32-bit VLIW architecture. Initially it supports fixed-point math. The idea is to keep this core scalable (including the word width). The core is optimized for baseband SSB or CW signal processing. The main usage is for ham radio applications, like SDR transmitters and receivers.

## Design assumptions

Summary of design assumptions:

* 32-bit word length, but this shall be scalable (parametrized)
* VLIW architecture for parallelism - simplifies HW design
* 4 32-bit instruction packages that can be executed in parallel
* 128-bit (scalable) instruction cache memory
* 128-bit data cache memory
* 4 execution units:

    * ALU
    * Shifter
    * MAC
    * Address calculation unit

* Load - store architecture, operations allowed on internal register file only
* 32 internal 32-bit registers in basic configuration
* R31 used as program counter (PC)
* R30 used as stack pointer (SP)
* The processor state register (PSR) is separated from register file
* 32-bit address bus
* 32-bit data bus
* Addressing modes:

    * Absolute
    * PC-relative
    * TBD...

* Interrupt system is TBD (need to think how to solve this)
* Processor protection modes are TBD
* Totally new instruction set (no existing tools). Assumption is to keep it as small as possible.

Future extensions:

* Floating-point data support
* SIMD support
* Vector instructions