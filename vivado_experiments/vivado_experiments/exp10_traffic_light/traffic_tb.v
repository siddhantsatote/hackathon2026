// Experiment 10: Traffic Light Controller Testbench
`timescale 10ns/1ps

`define DELAY 1

module tb_traffic;
  parameter ENDTIME = 400000;

  reg clk, rst_n, sensor;
  wire [2:0] light_farm, light_highway;

  traffic_light tb (
    .light_highway(light_highway),
    .light_farm(light_farm),
    .C(sensor),
    .clk(clk),
    .rst_n(rst_n)
  );

  initial begin
    clk    = 1'b0;
    rst_n  = 1'b0;
    sensor = 1'b0;
  end

  // Clock generation
  always #`DELAY clk = !clk;

  // Reset
  initial begin
    rst_n = 0;
    #20 rst_n = 1;
  end

  // Sensor stimulus
  initial begin
    sensor = 0;
    #600  sensor = 1;
    #1200 sensor = 0;
    #1200 sensor = 1;
  end

  // Monitor output
  initial begin
    $monitor("TIME=%0d | reset=%b | sensor=%b | highway=%0h | farm=%0h",
              $time, rst_n, sensor, light_highway, light_farm);
  end

  initial begin
    $dumpfile("traffic_tb.vcd");
    $dumpvars(0, tb_traffic);
  end

  // End simulation
  initial begin
    #ENDTIME
    $display("-------------- SIMULATION END --------------");
    $finish;
  end

endmodule
