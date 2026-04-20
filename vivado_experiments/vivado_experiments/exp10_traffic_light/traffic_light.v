// Experiment 10: Traffic Light Controller (FSM)
// Highway has higher priority. Farm road activates only when sensor detects vehicles.
// light encoding: 3'b001 = GREEN, 3'b010 = YELLOW, 3'b100 = RED

module traffic_light (
  output reg [2:0] light_highway,
  output reg [2:0] light_farm,
  input            C,        // sensor on farm road
  input            clk,
  input            rst_n
);

  // State encoding
  parameter HGRE_FRED = 2'b00; // Highway GREEN, Farm RED
  parameter HYEL_FRED = 2'b01; // Highway YELLOW, Farm RED
  parameter HRED_FGRE = 2'b10; // Highway RED, Farm GREEN
  parameter HRED_FYEL = 2'b11; // Highway RED, Farm YELLOW

  reg [27:0] count = 0, count_delay = 0;
  reg delay10s = 0, delay3s1 = 0, delay3s2 = 0;
  reg RED_count_en = 0, YELLOW_count_en1 = 0, YELLOW_count_en2 = 0;
  wire clk_enable;

  reg [1:0] state, next_state;

  // State register
  always @(posedge clk or negedge rst_n) begin
    if (~rst_n) state <= 2'b00;
    else        state <= next_state;
  end

  // FSM combinational logic
  always @(*) begin
    case (state)
      HGRE_FRED: begin
        RED_count_en     = 0;
        YELLOW_count_en1 = 0;
        YELLOW_count_en2 = 0;
        light_highway    = 3'b001; // GREEN
        light_farm       = 3'b100; // RED
        if (C) next_state = HYEL_FRED;
        else   next_state = HGRE_FRED;
      end

      HYEL_FRED: begin
        light_highway    = 3'b010; // YELLOW
        light_farm       = 3'b100; // RED
        RED_count_en     = 0;
        YELLOW_count_en1 = 1;
        YELLOW_count_en2 = 0;
        if (delay3s1) next_state = HRED_FGRE;
        else          next_state = HYEL_FRED;
      end

      HRED_FGRE: begin
        light_highway    = 3'b100; // RED
        light_farm       = 3'b001; // GREEN
        RED_count_en     = 1;
        YELLOW_count_en1 = 0;
        YELLOW_count_en2 = 0;
        if (delay10s) next_state = HRED_FYEL;
        else          next_state = HRED_FGRE;
      end

      HRED_FYEL: begin
        light_highway    = 3'b100; // RED
        light_farm       = 3'b010; // YELLOW
        RED_count_en     = 0;
        YELLOW_count_en1 = 0;
        YELLOW_count_en2 = 1;
        if (delay3s2) next_state = HGRE_FRED;
        else          next_state = HRED_FYEL;
      end

      default: next_state = HGRE_FRED;
    endcase
  end

  // Delay counters
  always @(posedge clk) begin
    if (clk_enable == 1) begin
      if (RED_count_en || YELLOW_count_en1 || YELLOW_count_en2)
        count_delay <= count_delay + 1;

      if ((count_delay == 9) && RED_count_en) begin
        delay10s = 1; delay3s1 = 0; delay3s2 = 0;
        count_delay <= 0;
      end
      else if ((count_delay == 2) && YELLOW_count_en1) begin
        delay10s = 0; delay3s1 = 1; delay3s2 = 0;
        count_delay <= 0;
      end
      else if ((count_delay == 2) && YELLOW_count_en2) begin
        delay10s = 0; delay3s1 = 0; delay3s2 = 1;
        count_delay <= 0;
      end
      else begin
        delay10s = 0; delay3s1 = 0; delay3s2 = 0;
      end
    end
  end

  // 1s clock enable generation (for testbench: count==3)
  always @(posedge clk) begin
    count <= count + 1;
    if (count == 3) count <= 0;
  end

  assign clk_enable = (count == 3) ? 1 : 0;

endmodule
