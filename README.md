# Softex CI Expert - RTL Track (Personal Portfolio)

This repository serves as my personal collection of records for the **Softex CI Expert** program, specifically focusing on the RTL (Register-Transfer Level) track. It serves as a centralized archive of my learning journey, storing the code, projects, and exercises developed throughout the training.

---

## Repository Structure

The repository is organized into the following directories:

* **`assignments/`**: Contains all my graded assessment tasks and projects submitted throughout the course.
* **`classes/`**: Stores the RTL code and source files developed and practiced during my lecture sessions.
* **`labs/`**: Contains my solutions and work related to the laboratory exercises provided by Synopsys.
* **`utils/`**: A collection of general-purpose tools, scripts, and utilities that I have developed or gathered to assist with my workflows.

---

## 🛠️ Environment and Tools Setup

To use the Synopsys tools and display graphical user interfaces (GUIs), your current terminal session needs to be connected to your active x2go session. This is especially important if you are using an SSH terminal, such as the integrated terminal in **VS Code**, which doesn't automatically know where to forward the graphical windows.

You need to initialize your environment using the `enable_tools.sh` script to bridge this connection.

### What does this script do?

1. **Connects SSH/VS Code to x2go (`DISPLAY` Configuration):** It automatically searches for your active x2go session and exports the correct `DISPLAY` environment variable to your current terminal. This is what allows GUI applications launched from your SSH/VS Code terminal to actually appear on your x2go screen.
2. **Synopsys Initialization:** It loads the necessary variables and paths for the Synopsys environment (`/Tools/synopsys/snps.sh`).

### 🚀 How to use

Since the script exports environment variables to your current shell session, it **must** be executed using the `source` command.

Run the following command in your terminal:

```bash
source utils/enable_tools.sh

```

**Expected output on success:**
If your x2go session is successfully detected, you will see the following message in your terminal:

```text
✅ Success! DISPLAY configured to :<display_number>

```

> **Note:** If no x2go session is found, the script will alert you with the message `No x2go session found.`

---

## Project Rules and Commit Types

Since this repository hosts several independent projects, the **scope** is critical to identify which project a commit belongs to. When introducing a new project to the repository, use its folder name as the scope:

* **`init(<project_name>)`**: Use this custom type when committing the first functional baseline or a complete starting skeleton of a new project.
    > *Example:* `init(spi_master): setup directory structure and baseline RTL`


* **`chore(<project_name>)`**: Use this if you are only setting up empty directories, Makefiles, or filelists without any functional RTL code.
    > *Example:* `chore(uart_rx): create folder hierarchy and EDA scripts`


* **`feat(<project_name>)`**: Alternatively, `feat` can be used for the first major functional block added to the new project.
    > *Example:* `feat(i2c_core): implement baseline state machine`

### Commit Types

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

---

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