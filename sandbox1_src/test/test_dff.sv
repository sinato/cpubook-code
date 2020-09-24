`timescale 1ns/1ps
module test_dff();
    logic D, C, n_rst, Q;
    dff dff(.*);

    always  #5 C = ~C;
    initial C = 1'b0;
    initial D = 1'b0;
    initial n_rst = 1'b0;

    initial begin
        #500;
        assign D = 1'b1;
        #100;
        assign D = 1'b0;
        #50;
        assign n_rst = 1'b1;
        #50;
        assign n_rst = 1'b0;
        #2000;
        $finish();
    end
endmodule
