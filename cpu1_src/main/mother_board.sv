module mother_board(
    input  clk,
    input  n_rst,
    output led
);

logic addr, data;
rom rom(.addr, .data);
cpu cpu(.clk, .n_rst, .data, .addr, .led);

endmodule
