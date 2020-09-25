module cpu(
    input  logic       clk,
    input  logic       n_rst,
    input  logic [3:0] data,
    input  logic [3:0] switch,
    output logic       addr,
    output logic [3:0] led
);

logic [3:0] a, next_a;
dff4 dff_alu(.clk, .n_rst, .in(next_a), .out(a));
assign led = a;

// Program Counter
logic ip, next_ip;
dff dff_pc(.clk, .n_rst, .in(next_ip), .out(ip));
assign addr = ip;

always_comb begin
    unique case(data)
        0: next_a = 0;       // LED OFF
        1: next_a = switch;  // LED ON
        default: ;
    endcase
end
assign next_ip = ip + 1'b1;

endmodule