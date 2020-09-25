`timescale 1ns/1ps
module test_cpu();

    logic clk, n_rst, data, addr;
    logic [3:0] led, switch;
    cpu cpu(.*);

    always  #5 clk = ~clk;
    initial clk = 1'b0;
    initial n_rst = 1'b1; // initialize D-flipflop
    initial data = 1'b0;
    initial switch = 'b1;

    initial begin
        #10;
        assign n_rst = 1'b0;

        // Scenario1. LED ON
        #90; assign data = 1'b1; assign switch = 5;

        // Scenario1. LED OFF
        #100; assign data = 1'b0; // always 0

        #2000;
        $finish();
    end
endmodule
