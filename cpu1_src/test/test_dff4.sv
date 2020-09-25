`timescale 1ns/1ps
module test_dff4();
logic clk, n_rst;
logic [3:0] in, out;
dff4 dff4(.*);

initial clk = 1'b0;
always  #5 clk = ~clk;

initial n_rst = 1'b1;
initial in = 0;
initial begin

    // Scenario1. test update
        // initialize
        #50;  assign n_rst = 1'b0;
        // 0 -> 6
        #100; assign in = 6;
        // 6 -> 0
        #100; assign in = 0;

    // Scenario2. test reset
        // initialize
        #50; assign in = 5;
        #100;  assign n_rst = 1'b1;

    #2000;
    $finish();
end
endmodule
