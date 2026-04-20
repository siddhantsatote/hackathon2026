// Experiment 2: Testbench for All Basic Logic Gates
`timescale 1ns/1ps

module gates_tb;
  reg a, b;
  wire not_y, and_y, or_y, nand_y, nor_y, xor_y, xnor_y;

  // Instantiate all gates
  not_gate_s  u_not  (.a(a),       .y(not_y));
  and_gate_s  u_and  (.a(a), .b(b), .y(and_y));
  or_gate_s   u_or   (.a(a), .b(b), .y(or_y));
  nand_gate_s u_nand (.a(a), .b(b), .y(nand_y));
  nor_gate_s  u_nor  (.a(a), .b(b), .y(nor_y));
  xor_gate_s  u_xor  (.a(a), .b(b), .y(xor_y));
  xnor_gate_s u_xnor (.a(a), .b(b), .y(xnor_y));

  initial begin
    $display("a b | NOT AND OR NAND NOR XOR XNOR");
    $display("----+-------------------------------");
    a=0; b=0; #10;
    $display("%b %b |  %b   %b   %b    %b   %b   %b    %b",
              a,b,not_y,and_y,or_y,nand_y,nor_y,xor_y,xnor_y);
    a=0; b=1; #10;
    $display("%b %b |  %b   %b   %b    %b   %b   %b    %b",
              a,b,not_y,and_y,or_y,nand_y,nor_y,xor_y,xnor_y);
    a=1; b=0; #10;
    $display("%b %b |  %b   %b   %b    %b   %b   %b    %b",
              a,b,not_y,and_y,or_y,nand_y,nor_y,xor_y,xnor_y);
    a=1; b=1; #10;
    $display("%b %b |  %b   %b   %b    %b   %b   %b    %b",
              a,b,not_y,and_y,or_y,nand_y,nor_y,xor_y,xnor_y);
    $finish;
  end

  // Waveform dump
  initial begin
    $dumpfile("gates_tb.vcd");
    $dumpvars(0, gates_tb);
  end
endmodule
