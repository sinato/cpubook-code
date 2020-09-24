`timescale 1ns/1ps
module test_top();
  logic       xin;
  logic       xout;
  top top(.*);

  always #5 xin = ~xin;
  initial   xin = 1'b0;

  initial begin
    #2000;
    $finish();
  end
endmodule
