// Experiment 5: 8x1 Multiplexer - Behavioral Modeling

module mux_8x1 (
  input  wire [7:0] data_in,   // 8-bit data input
  input  wire [2:0] select,    // 3-bit select line
  output reg        mux_out    // 1-bit output
);
  always @(*) begin : MUX_BEHAVIOR
    case (select)
      3'b000: mux_out = data_in[0];
      3'b001: mux_out = data_in[1];
      3'b010: mux_out = data_in[2];
      3'b011: mux_out = data_in[3];
      3'b100: mux_out = data_in[4];
      3'b101: mux_out = data_in[5];
      3'b110: mux_out = data_in[6];
      3'b111: mux_out = data_in[7];
      default: mux_out = 1'bx;
    endcase
  end
endmodule
