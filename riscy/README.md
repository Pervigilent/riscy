# RV32I Verilog RISC-V Core (Skeleton)

This repository contains a **minimal, synthesizable RV32I RISC-V CPU skeleton** written in Verilog.
It is intended as a **starting point for independent digital designers, researchers, or students** who want to build a RISC-V core from first principles.

The design emphasizes:
- Clarity over performance
- Clean RTL structure
- Incremental extensibility
- Compatibility with open-source EDA tools

This is **not a complete processor**, but a correct architectural scaffold suitable for extension into a full RISC-V implementation.

---

## Features

- RV32I base integer ISA (partial)
- Single-cycle datapath (initial form)
- Synthesizable Verilog (no simulation-only constructs)
- Modular structure (PC, decode, regfile, ALU, memory)
- Harvard-style instruction/data interfaces
- Zero register (`x0`) correctly hardwired to zero

---

## Status

**Current state:**  
- Instruction fetch, decode, register file, ALU, load/store skeleton
- No branches, jumps, or hazards yet
- No CSR, interrupts, or privilege modes

**Intended evolution path:**
1. Complete RV32I instruction set
2. Branch and jump support
3. Multi-cycle or pipelined implementation
4. Hazard detection and forwarding
5. Optional extensions (M, C, Zicsr)
6. Formal verification and compliance testing

---

## Directory Structure

```text
.
├── rtl/
│   ├── riscv_core.v     # Top-level CPU module
│   ├── regfile.v        # 32x32 register file
│   └── alu.v            # Arithmetic Logic Unit (optional split)
│
├── tb/
│   └── tb_core.sv       # Testbench (to be added)
│
├── docs/
│   └── architecture.md # Microarchitecture notes
│
├── scripts/
│   └── sim.mk           # Simulation helpers (optional)
│
└── README.md

