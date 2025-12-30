## RISC-V Design Workflow

## Overall Workflow for RISC-V Design
This workflow can be thought of as the steps you’d follow from concept → RTL → verification → synthesis → physical implementation (if desired).
1. Specification & Architecture
2. Microarchitecture & RTL Design
3. Verification & Testbenches
4. Simulation & Debugging
5. Synthesis
6. Place & Route (for ASIC/FPGA)
7. Timing Closure & Signoff
8. Prototyping / Deployment

## 1. Specification & Architecture
Before writing code you should decide architectural scope:
- RISC-V ISA version (e.g., RV32I, RV32IM, RV64G)
- Pipeline depth (single, 5-stage, superscalar, out-of-order)
- Additional features (cache, MMU, interrupts)
Reference Materials
- RISC-V ISA specification (free)
- Privileged architecture spec
- RISC-V Vector/Compressed extensions
This phase is about whiteboards, not tools.

## 2. Microarchitecture & RTL Design
You translate ISA and pipeline design into Verilog RTL.
### Tasks
- Build pipeline components: IF, ID, EX, MEM, WB
- Decode logic
- Register file
- ALU, branch logic
- Memory interfaces & control
### Typical Tools
| Tool Type | Commercial | Open Source |
| --------- | ---------- | ----------- |
| Text editor | VS Code, Sublime Text | VS Code, Emacs, Vim |
| RTL design IDE | Synopsys Custom Compiler | N/A |
| Version control | GitHub Desktop | Git + GitHub/GitLab |
### Notes
- Creating modular, parameterized RTL helps reuse and testing.
- Maintain coding style per synthesizability rules (avoid simulation-only constructs).

## 3. Verification & Testbenches
Verification is critical — it catches correctness issues before hardware synthesis.
### Types of tests
- Unit tests (instruction execution)
- Integration tests (pipelines, hazards)
- Randomized tests
- Compliance tests (RISC-V test suite)
### Tools
| Task | Commercial | Open Source |
| ---- | ---------- | ----------- |
|Simulator | Questa-Sim (Mentor) | Icarus Verilog |
| Advanced sim | VCS (Synopsys) | Verilator |
| UVM testbench | Questa UVM | UVM Open Source |
| Formal verification | JasperGold | SymbiYosys (Yosys + SMT) |
### Notes
- Formal tools help prove correctness for portions (e.g., instruction decoder).
- Use test vectors from official RISC-V compliance suites.

## 4. Simulation & Debugging
Simulate your RTL against testbenches:
### Commercial
- Questa-Sim: Advanced waveform, coverage, debug
- VCS: Industry standard fast simulation
### Open Source
- Verilator: Converts Verilog to C++ for fast cycle-accurate sim
- Icarus Verilog: Lightweight sim for functional testing
### Debug Aids
- Waveform viewers: GTKWave, ModelSim/Questa
- Coverage reports

## 5. Synthesis
You turn RTL into a gate-level netlist.
### Commercial
- Synopsys Design Compiler
- Cadence Genus
- Siemens EDA (formerly Mentor) Precision
### Open Source
- Yosys: Popular open synthesis tool
- ArtiSynth (FPGA focused flows)
### Notes
- Synthesizable subset of Verilog matters here.
- Synthesis maps to a specific process library or FPGA primitives.

## 6. Place & Route (ASIC / FPGA)
Once you have a synthesized netlist:
### For FPGA
- Commercial
    - Xilinx Vivado
    - Intel Quartus
- Open Source
    - Open FPGA Toolchain (project evolving)
    - nextpnr + Yosys
### For ASIC
- Commercial
    - Cadence Innovus
    - Synopsys IC Compiler II
- Open Source
    - OpenROAD (emerging complete flow, RTL→GDS)
    - OpenLane (wraps OpenROAD & Yosys)

## 7. Timing Closure & Signoff
Ensuring your design meets frequency and power targets.
### Commercial
- PrimeTime (STA)
- Voltus (power)
### Open Source
- OpenSTA
- Early tools in OpenROAD

## 8. Prototyping & Deployment
- FPGA prototyping (attach to real memory, peripherals)
- Boot software (payload, toolchain)
- Integration with OS (Linux on bigger cores)
### Tools
- FPGA boards (e.g., Arty, Pynq, Versal)
- Open Source SDKs (GCC/LLVM for RISC-V)

## Contrasting Open vs. Commercial Tools
| Phase | Commercial Strengths | Open Source Strengths |
| ----- | -------------------- | --------------------- |
| RTL design | IDE support, debug | Lightweight, free |
| Verification | UVM automation, formal | Verilator speed, community testbenches |
| Simulation | Speed, advanced debug | Free and accessible |
| Synthesis | Vendor libs, performance | Yosys flexibility |
| P&R (FPGA) | Tight vendor optimizations | Nextpnr + open flows |
| P&R (ASIC) | Mature, certified | Pioneering flows (OpenROAD) |
| Signoff | Production-grade cert | Early-stage, improving |

## Example Open-Source RISC-V Projects
Studying others is a huge boost:
| Project | Type | Language | Notes |
| ------- | ---- | -------- | ----- |
| Rocket Chip | RISC-V SoC | Chisel → Verilog | From Berkeley |
| VexRiscv | RISC-V core | SpinalHDL → Verilog | Configurable |
| PicoRV32 | RISC-V | Verilog | Small teaching core |
| CV32E40P | RISC-V | Verilog | Open HW core |
These show different design approaches, from minimal to high-performance.

## Putting It Together — A Minimal Example Path
1. Write a basic pipeline in Verilog (RV32I only) →
2. Create tests for each instruction →
3. Simulate with Verilator →
4. Synthesize with Yosys →
5. Run on FPGA with nextpnr →
6. Iterate timing & correctness →
7. (Optional) Upgrade to multicycle, caches, interrupts

## Tips for Success
- Start small: begin with RV32I, then add extensions
- Invest in verification early — bugs late are costly
- Use continuous integration (CI) for tests
- Modularize design (blocks that swap easily)
- Document assumptions & interfaces

