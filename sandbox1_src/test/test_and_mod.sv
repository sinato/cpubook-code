`timescale 1ns/1ps
module test_and_mod();
  logic x;
  logic y;
  logic z;
  and_mod and_mod(.*);

  always #10 x = ~x;
  initial   x = 1'b0;
  always #5 y = ~y;
  initial   y = 1'b1;

  initial begin
    #2000;
    $finish();
  end
endmodule
