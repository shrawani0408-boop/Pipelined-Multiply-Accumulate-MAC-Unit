# Pipelined Multiply-Accumulate (MAC) Unit

A high-performance **8×8 Pipelined Multiply-Accumulate (MAC) Unit** implemented in **Verilog HDL** featuring a **32-bit accumulator**. The design demonstrates fundamental digital signal processing (DSP) concepts, pipelining techniques, throughput optimization, and hardware implementation on a **Xilinx CoolRunner-II CPLD**.

---

## 📌 Project Overview

The Multiply-Accumulate (MAC) operation is widely used in DSP, machine learning accelerators, filters, and embedded systems.

This project implements:

\[
Accumulator = Accumulator + (A * B)
]

where:

- **A** = 8-bit input
- **B** = 8-bit input
- **Product** = 16-bit multiplication result
- **Accumulator** = 32-bit register

The datapath is pipelined to improve throughput and support higher clock frequencies.

---

## ✨ Features

- 8-bit × 8-bit multiplication
- 32-bit accumulation register
- Multi-stage pipelined datapath
- Synchronous reset support
- Enable-controlled operation
- Verilog RTL implementation
- Self-checking testbench verification
- Timing and synthesis analysis
- Implemented on Xilinx CoolRunner-II CPLD
- Throughput and resource utilization evaluation

---

## 🏗️ Architecture

### MAC Operation

```text
Accumulator(n+1) = Accumulator(n) + (A × B)
```

### Datapath

```text
          +---------+
A[7:0] -->|         |
          |  8×8    |----+
B[7:0] -->| Mult.   |    |
          +---------+    |
                         v
                  +-------------+
                  | Pipeline    |
                  | Registers   |
                  +------+------+ 
                         |
                         v
                  +-------------+
                  | 32-bit      |
                  | Accumulator |
                  +------+------+ 
                         |
                         v
                   MAC Output
```

---

## 🔄 Pipeline Stages

### Stage 1
- Input sampling
- Operand registration

### Stage 2
- 8×8 multiplication

### Stage 3
- Product registration

### Stage 4
- Accumulation into 32-bit register

The pipelined architecture allows new operands to enter the datapath every clock cycle, improving throughput.

---

## 📂 Project Structure

```text
pipelined-mac-unit/
│
├── rtl/
│   ├── mac_unit.v
│   ├── multiplier.v
│   ├── accumulator.v
│   └── pipeline_registers.v
│
├── testbench/
│   └── mac_tb.v
│
├── results/
│   ├── waveform.png
│   ├── timing_report.png
│   └── synthesis_report.png
│
├── docs/
│   └── architecture.pdf
│
├── LICENSE
└── README.md
```

---

## 🧪 Verification

A self-checking testbench was developed to verify:

- Multiplication correctness
- Accumulation correctness
- Pipeline latency
- Enable signal functionality
- Reset operation
- Continuous streaming inputs
- Edge-case arithmetic conditions

### Example Test Cases

| Input A | Input B | Product | Accumulator Output |
|----------|----------|----------|--------------------|
| 5 | 4 | 20 | 20 |
| 3 | 6 | 18 | 38 |
| 8 | 2 | 16 | 54 |

---

## 📸 Results

### Simulation Waveform

![Waveform](results/waveform.png)

### Timing Analysis

![Timing Report](results/timing_report.png)

### Synthesis Summary

![Synthesis Report](results/synthesis_report.png)

---

## 📊 Synthesis Results

Target Device:

- Xilinx CoolRunner-II CPLD

Performance achieved:

| Parameter | Value |
|------------|--------|
| Architecture | Pipelined MAC |
| Multiplier Size | 8 × 8 |
| Accumulator Width | 32-bit |
| Maximum Frequency | 11.55 MHz |
| Verification Method | Self-checking Testbench |

---

## 🚀 Getting Started

### Prerequisites

- Xilinx ISE
- Verilog HDL Simulator
- ModelSim (optional)

### Run Simulation

```bash
git clone https://github.com/your-username/pipelined-mac-unit.git
cd pipelined-mac-unit
```

Compile RTL and testbench files.

Run simulation:

```bash
run -all
```

Observe the waveform and verify MAC functionality.

---

## 📈 Learning Outcomes

This project provided practical experience in:

- Verilog RTL Design
- Datapath Design
- Pipeline Architecture
- Multiply-Accumulate Operations
- Hardware Verification
- CPLD Synthesis
- Timing Analysis
- Digital Signal Processing Fundamentals

---

## 🛠️ Tools & Technologies

- Verilog HDL
- Xilinx ISE
- Xilinx CoolRunner-II CPLD
- ModelSim
- Digital Design
- RTL Design

---

## 👩‍💻 Author

**Shrawani Wagh**

Electronics & Telecommunication Engineering  
Cummins College of Engineering for Women, Pune

---

## 📄 License

This project is licensed under the MIT License. See the LICENSE file for details.
