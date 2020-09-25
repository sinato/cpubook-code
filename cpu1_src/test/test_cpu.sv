`timescale 1ns/1ps
module test_cpu();

    logic clk, n_rst, addr;
    logic [3:0] opecode, imm, led, switch;
    cpu cpu(.*);

    always  #5 clk = ~clk;
    initial clk = 1'b0;
    initial n_rst = 1'b1; // initialize D-flipflop
    initial opecode = 0;
    initial imm = 0;
    initial switch = 'b1;

    initial begin
        #10;
        assign n_rst = 1'b0;

        // Scenario1. LED ON
        #90; assign opecode = 1; assign switch = 5;

        // Scenario1. LED OFF
        #50; assign opecode = 0; // always 0

        #50; assign switch = 3; assign opecode = 2; // IN A
        #50; assign opecode = 1; // MOV A, B
        #50; assign switch = 6; assign opecode = 6; // IN B
        #50; assign opecode = 4; // MOV B, A
        #50; assign opecode = 9; // OUT B

        #50; assign opecode = 3; assign imm = 0; // MOV A, IMM
        #50; assign opecode = 7; assign imm = 1; // MOV A, IMM

        #50; assign opecode = 0; assign imm = 1; // ADD A, IMM
        #50; assign opecode = 5; assign imm = 1; // ADD A, IMM

        #2000;
        $finish();
    end
endmodule
