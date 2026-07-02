## Featured Lesson: Sequential Accumulator Design in SystemVerilog

This lesson covers the implementation and analysis of a parameterized sequential circuit: a **Sequential Accumulator**.

### Overview
Unlike combinational circuits, where outputs depend solely on current inputs, this sequential system incorporates memory elements. Consequently, its output is a function of both the current inputs and the internal state history.

### Key Features
* **Parameterized Width:** Built with a configurable bit-width (`WIDTH`) for the internal register to handle varying data sizes.
* **Synchronous Updates:** The internal register values are updated precisely at every rising edge of the clock signal (`posedge clk`).
* **Operation Control:** Multi-functional design where state transitions and value updates are driven dynamically by a selected operation code (opcode).