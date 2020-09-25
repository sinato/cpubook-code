module rom(
  input  logic       addr,
  output logic [3:0] data
);

always_comb begin
  case (addr)
    1'b0: data = 1; // NOT
    1'b1: data = 0; // NOP
  endcase
end

endmodule
