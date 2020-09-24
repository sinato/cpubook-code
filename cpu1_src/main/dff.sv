module dff(
    input logic clk,
    input logic n_rst,
    input logic in,
    output logic out
);

logic a;
always_ff @(posedge clk) begin
    if (-n_rst) a <= 1'b0;
    else        a <= in;
end
assign out = a;

endmodule