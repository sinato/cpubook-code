`timescale 1ns/1ps
module test_mother_board();

    logic clk, n_rst, led;
    mother_board mother_board(.*);

    always  #5 clk = ~clk;
    initial clk = 1'b0;
    initial n_rst = 1'b1; // initialize D-flipflop

    initial begin
        #10;
        assign n_rst = 1'b0;

        #2000;
        $finish();
    end
endmodule
