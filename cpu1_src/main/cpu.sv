module cpu(
    input  logic clk,
    input  logic n_rst,
    input  logic data,
    output logic addr,
    output logic led
);

logic a, next_a;
dff dff_alu(.clk, .n_rst, .in(next_a), .out(a));
assign led = a;

// Program Counter
logic ip, next_ip;
dff dff_pc(.clk, .n_rst, .in(next_ip), .out(ip));
assign addr = ip;

always_comb begin
    case(data)
        1'b0: next_a = a;  // NOP
        1'b1: next_a = ~a; // NOT
    endcase
end
assign next_ip = ip + 1'b1;

endmodule