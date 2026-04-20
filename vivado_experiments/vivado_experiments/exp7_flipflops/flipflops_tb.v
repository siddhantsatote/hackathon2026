// Experiment 7: Flip Flop Testbench (D, SR, JK)
`timescale 1ns/1ps

// ===== D Flip Flop Testbench =====
module dff_tb;
  reg  D, CLK, reset;
  wire Q, QBAR;

  dff_async_clear dut (
    .d(D), .clk(CLK), .clear(reset),
    .q(Q), .qbar(QBAR)
  );

  initial CLK = 0;
  always #10 CLK = ~CLK;

  initial begin
    $dumpfile("dff_tb.vcd");
    $dumpvars(0, dff_tb);
    $monitor("simtime=%0t CLK=%b D=%b reset=%b Q=%b QBAR=%b",
              $time, CLK, D, reset, Q, QBAR);
    reset=1; D<=0;
    #100; reset=0; D<=1;
    #100; D<=0;
    #100; D<=1;
    #100 $finish;
  end
endmodule

// ===== SR Flip Flop Testbench =====
module srff_tb;
  reg  S, R, CLK;
  wire Q, QBAR;

  srff_behave dut (
    .s(S), .r(R), .clk(CLK),
    .q(Q), .qbar(QBAR)
  );

  initial CLK = 0;
  always #10 CLK = ~CLK;

  initial begin
    $dumpfile("srff_tb.vcd");
    $dumpvars(0, srff_tb);
    $monitor("simtime=%0t CLK=%b S=%b R=%b Q=%b QBAR=%b",
              $time, CLK, S, R, Q, QBAR);
    S=1; R=0;
    #100; S=0; R=1;
    #100; S=0; R=0;
    #100; S=1; R=1; // Invalid
    #100 $finish;
  end
endmodule

// ===== JK Flip Flop Testbench =====
module jkff_tb;
  reg  J, K, CLK;
  wire Q, QBAR;

  jkff_behave dut (
    .j(J), .k(K), .clk(CLK),
    .q(Q), .qbar(QBAR)
  );

  initial CLK = 0;
  always #10 CLK = ~CLK;

  initial begin
    $dumpfile("jkff_tb.vcd");
    $dumpvars(0, jkff_tb);
    $monitor("simtime=%0t CLK=%b J=%b K=%b Q=%b QBAR=%b",
              $time, CLK, J, K, Q, QBAR);
    J=1; K=0;         // Set
    #100; J=0; K=1;   // Reset
    #100; J=0; K=0;   // No change
    #100; J=1; K=1;   // Toggle
    #100 $finish;
  end
endmodule
