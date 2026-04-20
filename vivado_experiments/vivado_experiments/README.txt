=======================================================
  VIVADO ML STANDARD - FPGA EXPERIMENTS (Exp 2-10)
  ACEM - ENTC Department | Verilog HDL Lab
=======================================================

FOLDER STRUCTURE:
-----------------
exp2_gates/         -> gates.v + gates_tb.v
exp3_full_adder/    -> full_adder.v + full_adder_tb.v
exp4_4x1mux/        -> mux_4x1.v + mux_4x1_tb.v
exp5_8x1mux/        -> mux_8x1.v + mux_8x1_tb.v
exp6_comparator/    -> comparator_4bit.v + comparator_tb.v
exp7_flipflops/     -> flipflops.v + flipflops_tb.v
exp8_counter/       -> counter4bit.v + counter4bit_tb.v
exp9_seq_detector/  -> seq_detector_1010.v + seq_detector_tb.v
exp10_traffic_light/-> traffic_light.v + traffic_tb.v

=======================================================
HOW TO IMPORT INTO VIVADO ML STANDARD
=======================================================

STEP 1: Create a New Project
  1. Open Vivado ML Standard
  2. Click "Create Project" -> Next
  3. Enter Project Name (e.g., exp2_gates) -> Next
  4. Select "RTL Project" -> check "Do not specify sources" -> Next
  5. Select your FPGA part (e.g., xc7a35tcpg236-1 for Artix-7) -> Next
  6. Finish

STEP 2: Add Source Files
  1. In Project Manager -> Click "Add Sources" (or Alt+A)
  2. Select "Add or create design sources" -> Next
  3. Click "Add Files"
  4. Browse and select the .v source file (NOT the _tb.v file)
     Example: for Exp2, select gates.v
  5. Click Finish

STEP 3: Add Testbench
  1. Again click "Add Sources" (Alt+A)
  2. Select "Add or create simulation sources" -> Next
  3. Click "Add Files"
  4. Select the _tb.v testbench file
     Example: for Exp2, select gates_tb.v
  5. Click Finish

STEP 4: Run Simulation
  1. In Flow Navigator (left panel) -> Click "Run Simulation"
  2. Select "Run Behavioral Simulation"
  3. Vivado opens the simulation window
  4. Waveforms will appear in the Wave window
  5. Press F3 (Run All) or click the play button to run full simulation
  6. Check the TCL Console at the bottom for $display outputs

STEP 5: View Waveforms
  1. In the Wave window, signals are shown
  2. Use "Zoom Fit" button to see all signals
  3. Right-click signals -> "Waveform Style" to change display

=======================================================
EXPERIMENT-SPECIFIC NOTES
=======================================================

EXP 2 (Gates):
  - Top module for TB: gates_tb
  - All 7 gates tested simultaneously

EXP 3 (Full Adder):
  - Top module for TB: full_adder_tb
  - Tests all 3 modeling styles (structural, dataflow, behavioral)

EXP 4 (4x1 MUX):
  - Top module for TB: mux_4x1_tb
  - Uses structural modeling with sub-modules

EXP 5 (8x1 MUX):
  - Top module for TB: mux_8x1_tb
  - Behavioral modeling with case statement

EXP 6 (4-bit Comparator):
  - Top module for TB: tb_comparator_4bit
  - Tests all 256 input combinations automatically

EXP 7 (Flip Flops):
  - THREE separate TBs: dff_tb, srff_tb, jkff_tb
  - Run each separately as top simulation module
  - DFF uses async clear version

EXP 8 (4-bit Counter):
  - Top module for TB: counter4bit_tb
  - Clock period = 10ns (100MHz)
  - Counts 0-15, wraps to 0, resets

EXP 9 (Sequence Detector):
  - Top module for TB: seq_detector_tb
  - Detects 1010 pattern (overlapping, Mealy)
  - z=1 when pattern detected

EXP 10 (Traffic Light):
  - Top module for TB: tb_traffic
  - highway=1 GREEN, 2 YELLOW, 4 RED
  - farm=1 GREEN, 2 YELLOW, 4 RED
  - Sensor triggers farm road green phase

=======================================================
TROUBLESHOOTING
=======================================================

Issue: "Module not found" error
Fix: Make sure BOTH .v files are added to the project

Issue: Simulation runs but no output in console
Fix: Check that $display/$monitor are in the testbench

Issue: Waveform window is empty
Fix: Make sure simulation top module is set to the _tb module
     (Right-click on simulation sources -> Set as Top)

Issue: Exp9 "bit" type error
Fix: In Vivado, change SystemVerilog to Verilog 2001 in project settings
     OR replace "bit" with "reg/wire" in the source

=======================================================
