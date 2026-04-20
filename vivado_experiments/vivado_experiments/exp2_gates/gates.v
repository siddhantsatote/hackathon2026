// Experiment 2: Basic Logic Gates - Gate Level Modeling
// NOT Gate - Structural
module not_gate_s(input a, output y);
  not(y, a);
endmodule

// NOT Gate - Dataflow
module not_gate_d(input a, output y);
  assign y = ~a;
endmodule

// AND Gate - Structural
module and_gate_s(input a, b, output y);
  and(y, a, b);
endmodule

// AND Gate - Dataflow
module and_gate_d(input a, b, output y);
  assign y = a & b;
endmodule

// OR Gate - Structural
module or_gate_s(input a, b, output y);
  or(y, a, b);
endmodule

// OR Gate - Dataflow
module or_gate_d(input a, b, output y);
  assign y = a | b;
endmodule

// NAND Gate - Structural
module nand_gate_s(input a, b, output y);
  nand(y, a, b);
endmodule

// NAND Gate - Dataflow
module nand_gate_d(input a, b, output y);
  assign y = ~(a & b);
endmodule

// NOR Gate - Structural
module nor_gate_s(input a, b, output y);
  nor(y, a, b);
endmodule

// NOR Gate - Dataflow
module nor_gate_d(input a, b, output y);
  assign y = ~(a | b);
endmodule

// XOR Gate - Structural
module xor_gate_s(input a, b, output y);
  xor(y, a, b);
endmodule

// XOR Gate - Dataflow
module xor_gate_d(input a, b, output y);
  assign y = a ^ b;
endmodule

// XNOR Gate - Structural
module xnor_gate_s(input a, b, output y);
  xnor(y, a, b);
endmodule

// XNOR Gate - Dataflow
module xnor_gate_d(input a, b, output y);
  assign y = ~(a ^ b);
endmodule
