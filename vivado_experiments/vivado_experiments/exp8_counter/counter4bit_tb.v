// Experiment 8: 4-bit Counter Testbench
`timescale 1ns/1ps

module counter4bit_tb;
  reg        clk, clr;
  wire [3:0] count;

  counter4bit uut (.clk(clk), .clr(clr), .count(count));

  initial clk = 0;
  always #5 clk = ~clk;  // 100 MHz clock (10ns period)

  initial begin
    $dumpfile("counter4bit_tb.vcd");
    $dumpvars(0, counter4bit_tb);

    $monitor("Time=%0t | clk=%b | clr=%b | count=%b (%0d)",
              $time, clk, clr, count, count);

    // Reset first
    clr = 1; #20;
    clr = 0;

    // Count for 20 clock cycles (covers 0-15 and wraps)
    #200;

    // Reset mid-count
    clr = 1; #20;
    clr = 0;

    // Count again
    #100;

    $finish;
  end
endmodule
