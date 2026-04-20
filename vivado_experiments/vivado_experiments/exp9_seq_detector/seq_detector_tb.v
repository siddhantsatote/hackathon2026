// Experiment 9: Sequence Detector Testbench
`timescale 1ns/1ps

module seq_detector_tb;
  reg  clk, rst_n, x;
  wire z;

  seq_detector_1010 sd (.clk(clk), .rst_n(rst_n), .x(x), .z(z));

  initial clk = 0;
  always #2 clk = ~clk;

  initial begin
    $dumpfile("seq_detector_tb.vcd");
    $dumpvars(0, seq_detector_tb);

    $monitor("Time=%0t | x=%b | z=%b", $time, x, z);

    // Reset
    x = 0; rst_n = 0;
    #1 rst_n = 1;

    // Input sequence: 1 0 1 0 -> should detect at 4th bit
    #3 x = 1;
    #4 x = 1;
    #4 x = 0;
    #4 x = 1;
    #4 x = 0;   // z should go HIGH here
    #4 x = 1;
    #4 x = 0;
    #4 x = 1;
    #4 x = 0;   // z should go HIGH again (overlapping)
    #4 x = 1;
    #4 x = 1;
    #4 x = 1;
    #4 x = 0;
    #4 x = 1;
    #4 x = 0;   // z should go HIGH
    #4 x = 1;
    #4 x = 0;
    #10 $finish;
  end
endmodule
