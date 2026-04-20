// Experiment 7: D, SR, and JK Flip Flops

// ============ D FLIP FLOP ============
// D FF - Basic (no clear)
module dff_basic (
  input  d, clk,
  output reg q, qbar
);
  always @(posedge clk) begin
    q    <= d;
    qbar <= ~d;
  end
endmodule

// D FF - Synchronous Clear
module dff_sync_clear (
  input  d, clk, clear,
  output reg q, qbar
);
  always @(posedge clk) begin
    if (clear == 1) begin
      q    <= 0;
      qbar <= 1;
    end else begin
      q    <= d;
      qbar <= ~d;
    end
  end
endmodule

// D FF - Asynchronous Clear
module dff_async_clear (
  input  d, clk, clear,
  output reg q, qbar
);
  always @(posedge clk or posedge clear) begin
    if (clear == 1) begin
      q    <= 0;
      qbar <= 1;
    end else begin
      q    <= d;
      qbar <= ~d;
    end
  end
endmodule

// ============ SR FLIP FLOP ============
module srff_behave (
  input  s, r, clk,
  output reg q, qbar
);
  always @(posedge clk) begin
    if (s == 1) begin
      q    = 1;
      qbar = 0;
    end
    else if (r == 1) begin
      q    = 0;
      qbar = 1;
    end
    else if (s == 0 && r == 0) begin
      q    <= q;
      qbar <= qbar;
    end
    // s=1,r=1 is invalid, no assignment
  end
endmodule

// ============ JK FLIP FLOP ============
module jkff_gate (
  input  j, k, clk,
  output q, qbar
);
  wire nand1_out, nand2_out;
  nand(nand1_out, j, clk, qbar);
  nand(nand2_out, k, clk, q);
  nand(q,    qbar, nand1_out);
  nand(qbar, q,    nand2_out);
endmodule

// JK FF - Behavioral (recommended for simulation)
module jkff_behave (
  input  j, k, clk,
  output reg q, qbar
);
  always @(posedge clk) begin
    case ({j, k})
      2'b00: begin q <= q;    qbar <= qbar; end  // No change
      2'b01: begin q <= 0;    qbar <= 1;    end  // Reset
      2'b10: begin q <= 1;    qbar <= 0;    end  // Set
      2'b11: begin q <= ~q;   qbar <= ~qbar;end  // Toggle
    endcase
  end
endmodule
