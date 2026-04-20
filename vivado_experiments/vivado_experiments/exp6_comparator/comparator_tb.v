// Experiment 6: 4-bit Comparator Testbench
`timescale 1ns/1ps

module tb_comparator_4bit;
  reg  [3:0] a, b;
  wire       eq, gr, lw;

  comparator_4bit uut (.a(a), .b(b), .eq(eq), .gr(gr), .lw(lw));

  integer i, j;
  integer errors = 0;

  initial begin
    $dumpfile("comparator_tb.vcd");
    $dumpvars(0, tb_comparator_4bit);
  end

  initial begin
    $display("Testing all 256 combinations of 4-bit comparator...");
    for (i = 0; i <= 15; i = i + 1) begin
      for (j = 0; j <= 15; j = j + 1) begin
        a = i; b = j; #10;
        if ((a == b && eq !== 1'b1) ||
            (a >  b && gr !== 1'b1) ||
            (a <  b && lw !== 1'b1)) begin
          $display("ERROR: A=%0d B=%0d | eq=%b gr=%b lw=%b", a, b, eq, gr, lw);
          errors = errors + 1;
        end
      end
    end
    if (errors == 0)
      $display("All 256 tests PASSED!");
    else
      $display("%0d ERRORS found!", errors);
    #10 $finish;
  end

  // Spot-check display
  initial begin
    #5;
    $display("A    B  | EQ GT LT");
    $display("---------+---------");
    a=4'd5;  b=4'd5;  #10; $display("%0d vs %0d  |  %b  %b  %b", a, b, eq, gr, lw);
    a=4'd9;  b=4'd3;  #10; $display("%0d vs %0d  |  %b  %b  %b", a, b, eq, gr, lw);
    a=4'd2;  b=4'd7;  #10; $display("%0d vs %0d  |  %b  %b  %b", a, b, eq, gr, lw);
    a=4'd15; b=4'd15; #10; $display("%0d vs %0d |  %b  %b  %b", a, b, eq, gr, lw);
  end
endmodule
