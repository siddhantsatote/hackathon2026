// Experiment 3: Full Adder Testbench
`timescale 1ns/1ps

module full_adder_tb;
  reg  a, b, cin;
  wire sum_s, carry_s;
  wire sum_d, carry_d;
  wire sum_b, carry_b;

  full_adder_s uut_s (.a(a),.b(b),.cin(cin),.sum(sum_s),.carry(carry_s));
  full_adder_d uut_d (.a(a),.b(b),.cin(cin),.sum(sum_d),.carry(carry_d));
  full_adder_b uut_b (.a(a),.b(b),.cin(cin),.sum(sum_b),.carry(carry_b));

  initial begin
    $display("a b cin | sum carry");
    $display("--------+-----------");
    a=0;b=0;cin=0; #10; $display("%b %b  %b  |  %b    %b", a,b,cin,sum_s,carry_s);
    a=0;b=0;cin=1; #10; $display("%b %b  %b  |  %b    %b", a,b,cin,sum_s,carry_s);
    a=0;b=1;cin=0; #10; $display("%b %b  %b  |  %b    %b", a,b,cin,sum_s,carry_s);
    a=0;b=1;cin=1; #10; $display("%b %b  %b  |  %b    %b", a,b,cin,sum_s,carry_s);
    a=1;b=0;cin=0; #10; $display("%b %b  %b  |  %b    %b", a,b,cin,sum_s,carry_s);
    a=1;b=0;cin=1; #10; $display("%b %b  %b  |  %b    %b", a,b,cin,sum_s,carry_s);
    a=1;b=1;cin=0; #10; $display("%b %b  %b  |  %b    %b", a,b,cin,sum_s,carry_s);
    a=1;b=1;cin=1; #10; $display("%b %b  %b  |  %b    %b", a,b,cin,sum_s,carry_s);
    $finish;
  end

  initial begin
    $dumpfile("full_adder_tb.vcd");
    $dumpvars(0, full_adder_tb);
  end
endmodule
