// Experiment 4: 4x1 MUX using Structural Modeling

// Sub-modules
module and_gate(output a, input b, c, d);
  assign a = b & c & d;
endmodule

module not_gate(output f, input e);
  assign f = ~e;
endmodule

module or_gate(output l, input m, n, o, p);
  assign l = m | n | o | p;
endmodule

// Top module: 4x1 MUX
module mux_4x1_struct (
  output out,
  input  a, b, c, d,
  input  s0, s1
);
  wire s0bar, s1bar, T1, T2, T3, T4;

  not_gate u1 (.f(s1bar), .e(s1));
  not_gate u2 (.f(s0bar), .e(s0));

  and_gate u3 (.a(T1), .b(a), .c(s0bar), .d(s1bar));
  and_gate u4 (.a(T2), .b(b), .c(s0),    .d(s1bar));
  and_gate u5 (.a(T3), .b(c), .c(s0bar), .d(s1));
  and_gate u6 (.a(T4), .b(d), .c(s0),    .d(s1));

  or_gate  u7 (.l(out), .m(T1), .n(T2), .o(T3), .p(T4));
endmodule

// Behavioral version (for reference)
module mux_4x1_beh (
  output reg out,
  input  a, b, c, d,
  input  s0, s1
);
  always @(*) begin
    case ({s1, s0})
      2'b00: out = a;
      2'b01: out = b;
      2'b10: out = c;
      2'b11: out = d;
    endcase
  end
endmodule
