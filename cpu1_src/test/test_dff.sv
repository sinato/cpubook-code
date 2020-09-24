`timescale 1ns/1ps
module test_dff();
logic clk, n_rst, in, out;
dff dff(.*);

initial clk = 1'b0;
always  #5 clk = ~clk;

initial n_rst = 1'b1;
initial in = 1'b0;
initial begin

    // Scenario1. test update
        // initialize
        #50;  assign n_rst = 1'b0;
        // 0 -> 1
        #100; assign in = 1'b1;
        // 1 -> 0
        #100; assign in = 1'b0;

    // Scenario2. test reset
        // initialize
        #50; assign in = 1'b1;
        #100;  assign n_rst = 1'b1;

    #2000;
    $finish();
end
endmodule
