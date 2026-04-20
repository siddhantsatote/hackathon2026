// Experiment 5: 8x1 MUX Testbench
`timescale 1ns/1ps

module mux_8x1_tb;
  reg  [7:0] data_in;
  reg  [2:0] select;
  wire       mux_out;

  mux_8x1 dut (
    .data_in(data_in),
    .select(select),
    .mux_out(mux_out)
  );

  initial begin
    $dumpfile("mux_8x1_tb.vcd");
    $dumpvars(0, mux_8x1_tb);
  end

  initial begin
    data_in = 8'b11110000; // D7=1,D6=1,D5=1,D4=1,D3=0,D2=0,D1=0,D0=0
    select  = 3'b000;

    $display("Time | Select | Data_in  | Mux_out");
    $display("-----+--------+----------+--------");

    #10; $display("%4t |  %b   | %b |    %b", $time, select, data_in, mux_out);
    #10 select = 3'b001; $display("%4t |  %b   | %b |    %b", $time, select, data_in, mux_out);
    #10 select = 3'b010; $display("%4t |  %b   | %b |    %b", $time, select, data_in, mux_out);
    #10 select = 3'b011; $display("%4t |  %b   | %b |    %b", $time, select, data_in, mux_out);
    #10 select = 3'b100; $display("%4t |  %b   | %b |    %b", $time, select, data_in, mux_out);
    #10 select = 3'b101; $display("%4t |  %b   | %b |    %b", $time, select, data_in, mux_out);
    #10 select = 3'b110; $display("%4t |  %b   | %b |    %b", $time, select, data_in, mux_out);
    #10 select = 3'b111; $display("%4t |  %b   | %b |    %b", $time, select, data_in, mux_out);
    // Change data and retest
    #10 data_in = 8'b00001111; select = 3'b000;
    $display("--- Changed data_in = 8'b00001111 ---");
    #10; $display("%4t |  %b   | %b |    %b", $time, select, data_in, mux_out);
    #10 select = 3'b111; $display("%4t |  %b   | %b |    %b", $time, select, data_in, mux_out);
    #10 $finish;
  end

  initial begin
    $monitor("Time=%0d | Select=%b | Data_in=%b | Mux_out=%b",
              $time, select, data_in, mux_out);
  end
endmodule
