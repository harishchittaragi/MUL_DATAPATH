**# MUL_DATAPATH**

 **#Sequential Multiplier (MUL_DATAPATH) Project**
 
**#Project Overview**
This project implements a 16-bit Sequential Multiplier using Verilog HDL in Vivado.
The design follows a datapath + controller architecture, where multiplication is performed through repeated addition under the control of a finite state machine (FSM).
It serves as a fundamental example of how control logic and data operations interact in digital system design.

**#DESIGN MODULES**

**#Datapath (MUL_datapath)**
   Contains all hardware elements required for computation:
   Registers (PIPO1, PIPO2) – to store the multiplicand and product.
   Counter (CNTR) – to store and decrement the multiplier.
   Adder (ADD) – performs addition for partial product accumulation.
   Comparator (EQZ) – detects when the counter reaches zero.
   Performs the core arithmetic operations based on control signals from the controller.

**#Controller (controller)**
  Implements a finite state machine (FSM) with 5 states.
  Controls the sequencing of operations:
  Load multiplicand (A)
  Load multiplier (B)
  Clear product (P)
  Add and decrement steps
  Completion detection (done signal)
  Synchronizes datapath activities using control signals like LdA, LdB, LdP, clrP, and decB.

**#Top Module (MUL_top)**
  Integrates the controller and datapath.
  Provides system-level I/O: clk, start, data_in, and done.

**#Testbench (tb_MUL_top)**
  Stimulates the design with test inputs.
  Monitors internal signals (A, B, P) and control signals (LdA, LdB, LdP, etc.) for verification.
  Displays intermediate and final results on the simulation console.

**#Working Principle**
The multiplication is carried out using repeated addition:
Load the multiplicand (A) and multiplier (B).
Clear the product register.
Add the multiplicand to the product repeatedly while decrementing the counter B.
When B reaches zero (eqz = 1), the multiplication process stops and done = 1 is asserted.

**#Simulation Output**

**During simulation, the console shows:**
Control signals (LdA, LdB, LdP, clrP, decB)
Internal datapath values (A, B, P)
Status flags (eqz, done)
This makes it easy to trace how the FSM drives each step of the multiplication process.

**#Key Learning Outcomes**
Understanding datapath and control unit separation.
Implementation of FSM-based control logic.
Practical insight into sequential arithmetic operations.
Verification of multi-module design hierarchy in Verilog.

**#Tools Used**
Vivado Design Suite,
Verilog HDL,
Behavioral Simulation.
