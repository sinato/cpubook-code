module mother_board(
    input  logic       clk,
    input  logic       n_rst,
    input  logic [3:0] switch,
    output logic [3:0] led
);

logic addr, data;
rom rom(.addr, .data);
cpu cpu(.clk, .n_rst, .data, .addr, .led);

endmodule
