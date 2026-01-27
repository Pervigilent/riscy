## IC Design Process
### System Level Design
### Microarchitecture Planning
- functional requirements
- verification test benches
- testing methodologies
- system level specification
- instruction set
- operation
### RTL (register transfer level) Design
- functional verification
- logic simulation
- formal methods
- hardware emulation
- lint-like code checking
- code coverage
### Physical Design
- logic syntehsis
- floorplanning
- placement
- logic/placement refinement
- clock insertion
- routing
- postwiring optimization
- design for manufacturability
- final checking
- tapeout and mask generation

## IC Design Flow
1. System Specification
2. Architectural Design
3. Functional Design and Logic Design
4. Circuit Design
5. Physical Design
6. Physical Verification and Signoff
7. Fabrication
8. Packing and Testing
9. Chip

## IC Design
1. Feasibility study and die size estimation
2. Functional analysis
3. System level design
4. Analog design, simulation and layout
5. Digital design, simulation and synthesis
6. System simulation and verification
7. Design for test and automatic test pattern generation
8. Design for manufacturability (IC)
9. Tape-in
10. Mask data preparation
11. Tape-out
12. Wafer fabrication
13. Die test
14. Packaging
15. Post silicon validation and integration
16. Device characterization
17. Tweak
18. Datasheet generation
19. Ramp up
20. Production
21. Yield analysis/warranty analysis reliability (semiconductor)
22. Failure analysis on any returns
23. Plan for next generation chip using production information

## Physical Design
### Physical Design
1. partitioning
2. floorplanning
3. placement
4. clock tree synthesis
5. signal routing
6. timing closure

- logic synthesis - the RTL is mapped to a gate-level netlist in the target technology of the chip
- floorplanning - the RTL of the chip is assigned to gross regions of the chip, input/output pins are assigned and large objects (arrays, cores, etc.) are placed
- placement - the gates in the netlist are assigned to nonoverlapping location in the die area
- logic placement/refinement - iterative logical and placement transformations to close logical and power constraints
- clock insertion - clock signal wiring is introduced into the design (i.e. clock trees)
- routing - the wires that connect the gates in the netlist are added
- postwiring optimization - performance (timing closure), noise (signal integrity), and yield (design for manufacturability) violations are removed
- design for manufacturability - the design is modified, where possible, to make it as easy and efficient as possible to produce
- final checking - (1) extensive error checking, (2) formal equivalence checking, (3) design rule checking
- tapeout and mask generation - the design data is turned into photomasks in mask data preparation

