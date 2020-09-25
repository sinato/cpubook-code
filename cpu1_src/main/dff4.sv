// 4bit D-flipflop
module dff4(
    input  logic       clk,
    input  logic       n_rst,
    input  logic [3:0] in,
    output logic [3:0] out
);

logic [3:0] a;
always_ff @(posedge clk) begin
    if (~n_rst) a <= 'b0;
    else        a <= in;
end
assign out = a;

endmodule