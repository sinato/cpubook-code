`timescale 1ns/1ps
module test_cpu();

    logic clk, n_rst, addr;
    logic [3:0] data, led, switch;
    cpu cpu(.*);

    always  #5 clk = ~clk;
    initial clk = 1'b0;
    initial n_rst = 1'b1; // initialize D-flipflop
    initial data = 0;
    initial switch = 'b1;

    initial begin
        #10;
        assign n_rst = 1'b0;

        // Scenario1. LED ON
        #90; assign data = 1; assign switch = 5;

        // Scenario1. LED OFF
        #100; assign data = 0; // always 0

        #100; assign switch = 3; assign data = 2; // IN A
        #100; assign data = 1; // MOV A, B
        #100; assign switch = 6; assign data = 6; // IN B
        #100; assign data = 4; // MOV B, A
        #100; assign data = 9; // OUT B

        #2000;
        $finish();
    end
endmodule
