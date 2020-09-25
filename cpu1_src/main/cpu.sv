module cpu(
    input  logic       clk,
    input  logic       n_rst,
    input  logic [3:0] opecode,
    input  logic [3:0] imm,
    input  logic [3:0] switch,
    output logic [3:0] addr,
    output logic [3:0] led
);

// General-purpose register
logic [3:0] a, next_a;
dff4 dff_a(.clk, .n_rst, .in(next_a), .out(a));

logic [3:0] b, next_b;
dff4 dff_b(.clk, .n_rst, .in(next_b), .out(b));

// Output register
logic [3:0] out, next_out;
dff4 dff_output(.clk, .n_rst, .in(next_out), .out(out));

// Flag register
logic cf, next_cf;
dff dff_flag(.clk, .n_rst, .in(next_cf), .out(cf));

// Instruction register
logic [3:0] ip, next_ip;
dff4 dff_ip(.clk, .n_rst, .in(next_ip), .out(ip));

always_comb begin
    led = out;
    addr = ip;

    next_cf = 1'b0;
    next_ip = ip + 1;
    next_a = a;
    next_b = b;
    next_out = out;

    unique case(opecode)
        1:  next_b = a;                    // MOV A, B
        4:  next_a = b;                    // MOV B, A
        3:  next_a = imm;                  // MOV A, IMM
        7:  next_b = imm;                  // MOV B, IMM
        2:  next_a = switch;               // IN A
        6:  next_b = switch;               // IN B
        9:  next_out = b;                  // OUT B
        11: next_out = imm;                // OUT IMM
        0:  {next_cf, next_a} = a + imm;   // ADD A, IMM
        5:  {next_cf, next_b} = b + imm;   // ADD B, IMM
        15: next_ip = imm;                 // JMP IMM
        14: next_ip = cf ? ip + 1 : imm;   // JNC IMM
        default: ;
    endcase
end

endmodule