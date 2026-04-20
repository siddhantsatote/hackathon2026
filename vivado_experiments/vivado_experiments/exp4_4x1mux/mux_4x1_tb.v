// Experiment 4: 4x1 MUX Testbench
`timescale 1ns/1ps

module mux_4x1_tb;
  wire out;
  reg  a, b, c, d;
  reg  s0, s1;

  mux_4x1_struct uut (.out(out), .a(a), .b(b), .c(c), .d(d), .s0(s0), .s1(s1));

  initial begin
    a=1'b0; b=1'b0; c=1'b0; d=1'b0; s0=1'b0; s1=1'b0;

    $display("s1 s0 | a b c d | out");
    $display("------+---------+----");

    // Test all select combinations
    a=1;b=0;c=0;d=0; s1=0;s0=0; #10;
    $display(" %b  %b  | %b %b %b %b |  %b  (expect a=%b)", s1,s0,a,b,c,d,out,a);

    a=0;b=1;c=0;d=0; s1=0;s0=1; #10;
    $display(" %b  %b  | %b %b %b %b |  %b  (expect b=%b)", s1,s0,a,b,c,d,out,b);

    a=0;b=0;c=1;d=0; s1=1;s0=0; #10;
    $display(" %b  %b  | %b %b %b %b |  %b  (expect c=%b)", s1,s0,a,b,c,d,out,c);

    a=0;b=0;c=0;d=1; s1=1;s0=1; #10;
    $display(" %b  %b  | %b %b %b %b |  %b  (expect d=%b)", s1,s0,a,b,c,d,out,d);

    #500 $finish;
  end

  // Clock-based toggling for waveform view
  reg clk=0;
  always #20 clk = ~clk;

  always #40  a = ~a;
  always #80  b = ~b;
  always #160 c = ~c;
  always #320 d = ~d;
  always #80  s0 = ~s0;
  always #160 s1 = ~s1;

  initial begin
    $dumpfile("mux_4x1_tb.vcd");
    $dumpvars(0, mux_4x1_tb);
  end
endmodule
