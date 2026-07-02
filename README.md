# Softex CI Expert - RTL Track (Personal Portfolio)

This repository serves as my personal collection of records for the **Softex CI Expert** program, specifically focusing on the RTL (Register-Transfer Level) track. It serves as a centralized archive of my learning journey, storing the code, projects, and exercises developed throughout the training.

## Repository Structure

The repository is organized into the following directories:

* `assignments/`: Contains all my **graded assessment tasks** and projects submitted throughout the course.
* `classes/`: Stores the **RTL code and source files** developed and practiced during my lecture sessions.
* `labs/`: Contains my solutions and work related to the **laboratory exercises** provided by Synopsys.
* `utils/`: A collection of **general-purpose tools, scripts, and utilities** that I have developed or gathered to assist with my workflows.

## Usage

This repository is maintained as a personal reference to document my progression in RTL design. It serves as a portfolio of my practical work, ensuring that all exercises, assignments, and supporting tools are organized and accessible for future review.


## Multi-Project Rules (Adding New Projects)

Since this repository hosts several independent projects, the **scope** is critical to identify which project a commit belongs to. When introducing a new project to the repository, use its folder name as the scope:

* **`init(<project_name>)`**: Use this custom type when committing the first functional baseline or a complete starting skeleton of a new project.
* *Example:* `init(spi_master): setup directory structure and baseline RTL`


* **`chore(<project_name>)`**: Use this if you are only setting up empty directories, Makefiles, or filelists without any functional RTL code.
* *Example:* `chore(uart_rx): create folder hierarchy and EDA scripts`


* **`feat(<project_name>)`**: Alternatively, `feat` can be used for the first major functional block added to the new project.
* *Example:* `feat(i2c_core): implement baseline state machine`

## Commit Types for Hardware Design

| Type | Purpose | Example |
| --- | --- | --- |
| **`init`** | Initializing a brand new project in the repo. | `init(pwm_gen): add initial project structure and specs` |
| **`feat`** | New hardware logic, modules, or sub-blocks. | `feat(alu): implement 32-bit multiplier` |
| **`fix`** | Resolving functional bugs, simulation mismatches, or synthesis errors. | `fix(fsm): remove unintended latch in state decoder` |
| **`perf`** | Structural/algorithmic changes to optimize PPA or fix timing. | `perf(datapath): pipeline critical path to resolve setup violation` |
| **`refactor`** | Restructuring code without altering functional behavior or PPA metrics. | `refactor(mux): rewrite cascaded if-else into case statements` |
| **`chore`** | Updating scripts (synthesis, simulation), environments, or dependencies. | `chore(syn): update Design Compiler Tcl constraints` |
| **`test`** | Modifying testbenches or adding SystemVerilog Assertions (SVA). | `test(tb_dma): add constrained-random testcase for bursts` |
| **`docs`** | Updating internal comments, register maps, or specifications. | `docs(regmap): update address offsets in readme` |
| **`style`** | Code formatting (indentation, signal alignment) not affecting logic. | `style(top): realign port declarations` |

## Scope Guidelines

Always use a scope. It should clearly identify the **project name**, the specific **IP module**, or the **environment** being modified:

* **Projects:** `uart_tx`, `spi_master`, `riscv_core`
* **Modules/Components:** `alu`, `fifo`, `fsm`, `cdc_sync`
* **Tooling/Scripts:** `tb` (Testbench), `syn` (Synthesis), `sdc` (Constraints)

## Best Practices

1. **Use the Imperative Mood**
Write the description as if giving a command to the codebase.
* ✅ `feat(fifo): add programmable full flag`
* ❌ `feat(fifo): added programmable full flag`

2. **Formatting Rules**
* Keep the description entirely in lowercase (except for acronyms like AXI, FIFO).
* Do **not** place a period at the end of the description line.

3. **Documenting Breaking Changes (Interface Alterations)**
If a change modifies port interfaces, pinouts, or parameters that break top-level wrapper instantiation, append an exclamation mark `!` after the scope, and document it in the footer.
    ```text
    feat(crypto)!: shift from 32-bit to 64-bit parallel data interface

    BREAKING CHANGE: The dynamic data input port `data_i` has been resized 
    from [31:0] to [63:0]. Top-level wrapper instantiation must be updated.

    ```

4. **Tie Performance Commits to Metrics**
When using `perf` to fix timing or area, include synthesis or static timing analysis (STA) log metrics within the commit body.
    ```text
    perf(multiplier): re-architect partial product generation

    Reduces the critical path delay by restructuring the Wallace tree.
    - Setup Slack before: -120ps (violating)
    - Setup Slack after: +15ps (met)
    - Total Cell Area impact: +2.3%

    ```
