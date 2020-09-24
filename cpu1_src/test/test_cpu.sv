`timescale 1ns/1ps
module test_cpu();

    logic clk, n_rst, led;
    cpu cpu(.*);

    always  #5 clk = ~clk;
    initial clk = 1'b0;
    initial n_rst = 1'b1; // initialize D-flipflop

    initial begin
        #10;
        assign n_rst = 1'b0;
        // initialize step end
        #2000;
        $finish();
    end
endmodule
