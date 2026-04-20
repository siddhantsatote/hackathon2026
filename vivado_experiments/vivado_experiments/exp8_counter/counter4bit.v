// Experiment 8: 4-bit Synchronous Counter

module counter4bit (
  input        clk, clr,
  output [3:0] count
);
  reg [3:0] count;

  initial count = 4'b0000;

  always @(posedge clk) begin
    if (clr == 1'b1)
      count <= 4'b0000;
    else
      count <= count + 1'b1;
  end
endmodule
