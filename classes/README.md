# Lectures & Theoretical Content (`classes/`)

This directory is dedicated to storing the code, scripts, and notes developed during the theoretical and practical lectures of the **Softex CI Expert** program (RTL Track).

## Highlighted Designs & Tool Introduction

### 1. AND Gate (`and_gate`)
* **Purpose:** Served as the initial hands-on baseline to establish the design workflow and get a first contact with the Synopsys tool suite.
* **Concepts:** Basic combinational logic instantiation, environment setup, and introductory synthesis scripts.

### 2. Arithmetic Logic Unit (`alu`)
* **Purpose:** Developed as an introductory project to explore more complex combinational structures within the Synopsys ecosystem.
* **Concepts:** Behavioral hardware description, multiplexing logic, and dynamic operation handling.

### 3. Sequential Accumulator (`accumulator`)
* **Purpose:** A parameterized sequential circuit designed to study memory elements and synchronous design methodologies.
* **Concepts:** * **Parameterized Width:** Configurable bit-width (`WIDTH`) for the internal register to handle varying data sizes.
    * **Synchronous Updates:** Internal state tracking updated precisely at every rising edge of the clock (`posedge clk`).
    * **Operation Control:** Multi-functional execution where transitions and values are dynamically driven by a selected operation code (opcode).