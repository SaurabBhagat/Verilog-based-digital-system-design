# Verilog-Based Digital System Design

This project demonstrates RTL design and functional verification using Verilog HDL.

## Projects

1. 4-bit ALU
2. Synchronous FIFO
3. FSM-based Traffic Light Controller

## Tools

- Verilog HDL
- Xilinx Vivado
- RTL Design
- Behavioral Simulation
- Verilog Testbenches

## Folder Structure

```text
Verilog-Digital-System-Design/
├── rtl/
│   ├── alu_4bit.v
│   ├── synchronous_fifo.v
│   └── traffic_light_controller.v
├── testbench/
│   ├── tb_alu_4bit.v
│   ├── tb_synchronous_fifo.v
│   └── tb_traffic_light_controller.v
└── README.md
```

## ALU

The 4-bit ALU supports:

- Addition
- Subtraction
- AND
- OR
- XOR
- NOT
- Left shift
- Right shift

## Synchronous FIFO

The FIFO is 8 bits wide and has 8 storage locations.

It includes:

- Write enable
- Read enable
- Full flag
- Empty flag
- Read pointer
- Write pointer
- Occupancy counter

## Traffic Light Controller

The controller uses a four-state FSM:

```text
NS_GREEN
    ↓
NS_YELLOW
    ↓
EW_GREEN
    ↓
EW_YELLOW
    ↓
NS_GREEN
```

## Running in Vivado

1. Create a new RTL project.
2. Add files from `rtl/` as Design Sources.
3. Add the corresponding file from `testbench/` as Simulation Sources.
4. Set the testbench as the simulation top.
5. Select **Run Behavioral Simulation**.
6. Observe the waveform and output values.

## Resume Description

**Verilog-Based Digital System Design**  
*Verilog HDL, Xilinx Vivado, RTL Design, Testbenches*

- Designed and simulated combinational and sequential digital circuits using Verilog HDL and Xilinx Vivado.
- Developed a 4-bit ALU, synchronous FIFO, and FSM-based Traffic Light Controller and verified functionality using testbenches.
