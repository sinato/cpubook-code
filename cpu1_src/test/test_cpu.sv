`timescale 1ns/1ps
module test_cpu();

    logic clk, n_rst, data, addr;
    logic [3:0] led;
    cpu cpu(.*);

    always  #5 clk = ~clk;
    initial clk = 1'b0;
    initial n_rst = 1'b1; // initialize D-flipflop
    initial data = 1'b0;

    initial begin
        #10;
        assign n_rst = 1'b0;

        // Scenario1. NOT
        #90; assign data = 1'b1;

        // Scenario1. NOP
        #100; assign data = 1'b0; // always 0
        #100; assign data = 1'b1;
        #90; assign data = 1'b0;  // always 1

        #2000;
        $finish();
    end
endmodule
