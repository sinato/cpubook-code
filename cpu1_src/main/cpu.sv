module cpu(
    input  logic       clk,
    input  logic       n_rst,
    input  logic [3:0] opecode,
    input  logic [3:0] imm,
    input  logic [3:0] switch,
    output logic       addr,
    output logic [3:0] led
);

logic [3:0] a, next_a;
dff4 dff_a(.clk, .n_rst, .in(next_a), .out(a));

logic [3:0] b, next_b;
dff4 dff_b(.clk, .n_rst, .in(next_b), .out(b));

// Output Register
logic [3:0] out, next_out;
dff4 dff_output(.clk, .n_rst, .in(next_out), .out(out));
assign led = out;

// Program Counter
logic ip, next_ip;
dff dff_pc(.clk, .n_rst, .in(next_ip), .out(ip));
assign addr = ip;

always_comb begin
    unique case(opecode)
        0: next_out = 0;       // LED OFF
        1: next_b = a;         // MOV A, B
        4: next_a = b;         // MOV B, A
        2: next_a = switch;    // IN A
        6: next_b = switch;    // IN B
        9: next_out = b;       // OUT B
        default: ;
    endcase
end
assign next_ip = ip + 1'b1;

endmodule