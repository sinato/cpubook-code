module cpu(
    input  logic clk,
    input  logic n_rst,
    output logic led
);

logic a, next_a;

dff dff(.clk, .n_rst, .in(next_a), .out(a));

assign led = a;

always_comb begin
    next_a = ~a;
end

endmodule