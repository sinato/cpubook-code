module mother_board(
    input  logic       clk,
    input  logic       n_rst,
    input  logic [3:0] switch,
    output logic [3:0] led
);

logic [3:0] addr, opecode, imm;
rom rom(.addr, .opecode, .imm);
cpu cpu(.clk, .n_rst, .opecode, .imm, .switch, .addr, .led);

endmodule
