module rom(
  input  logic       addr,
  output logic [3:0] opecode,
  output logic [3:0] imm
);

always_comb begin
  imm = 0;
  case (addr)
    8'b0: opecode = 1; // NOT
    8'b1: opecode = 0; // NOP
  endcase
end

endmodule
