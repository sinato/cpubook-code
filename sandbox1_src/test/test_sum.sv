`timescale 1ns/1ps
module test_sum();
  logic in1;
  logic in2;
  logic [1:0] out;
  sum sum(.*);

  always #10 in1 = ~in1;
  initial   in1 = 1'b0;
  always #5 in2 = ~in2;
  initial   in2 = 1'b1;

  initial begin
    #2000;
    $finish();
  end
endmodule
