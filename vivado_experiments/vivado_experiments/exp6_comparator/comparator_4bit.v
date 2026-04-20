// Experiment 6: 4-bit Comparator

// Dataflow version
module comparator_4bit_d (
  input  [3:0] a, b,
  output       eq, gt, lt
);
  assign eq = (a == b);
  assign gt = (a >  b);
  assign lt = (a <  b);
endmodule

// Behavioral version
module comparator_4bit (
  input  [3:0] a, b,
  output reg   eq, gr, lw
);
  always @(*) begin
    if (a == b) begin
      eq = 1'b1; gr = 1'b0; lw = 1'b0;
    end
    else if (a > b) begin
      eq = 1'b0; gr = 1'b1; lw = 1'b0;
    end
    else begin
      eq = 1'b0; gr = 1'b0; lw = 1'b1;
    end
  end
endmodule
