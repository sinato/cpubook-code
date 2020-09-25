`timescale 1ns/1ps
module test_mother_board();

    logic clk, n_rst;
    logic [3:0] switch, led;
    mother_board mother_board(.*);

    always  #5 clk = ~clk;
    initial clk = 1'b0;
    initial n_rst = 1'b0; // initialize D-flipflop
    initial switch = 10;

    initial begin
        #10;
        assign n_rst = 1'b1;

        #2000;
        $finish();
    end
endmodule
