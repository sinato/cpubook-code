module rom(
  input  logic [3:0] addr,
  output logic [3:0] opecode,
  output logic [3:0] imm
);
always_comb begin
  case (addr)                     // addr  assembler
    4'b0000: opecode = 4'b0110;   // 0     IN  B
    4'b0001: opecode = 4'b1001;   // 1     OUT B
    4'b0010: opecode = 4'b0011;   // 2     MOV A, 15
    4'b0011: opecode = 4'b0000;   // 3     ADD A, 1
    4'b0100: opecode = 4'b1110;   // 4     JNC    3
    4'b0101: opecode = 4'b0101;   // 5     ADD B, 1
    4'b0110: opecode = 4'b1110;   // 6     JNC    1
    4'b0111: opecode = 4'b1011;   // 7     OUT    0
    4'b1000: opecode = 4'b1011;   // 8     OUT    15
    4'b1001: opecode = 4'b1111;   // 9     JMP    7
    default: opecode = 4'b0000;
  endcase
  case (addr)                     // addr  assembler
    4'b0000: imm = 4'b0000;       // 0     IN  B
    4'b0001: imm = 4'b0000;       // 1     OUT B
    4'b0010: imm = 4'b1111;       // 2     MOV A, 15
    4'b0011: imm = 4'b0001;       // 3     ADD A, 1
    4'b0100: imm = 4'b0011;       // 4     JNC    3
    4'b0101: imm = 4'b0001;       // 5     ADD B, 1
    4'b0110: imm = 4'b0001;       // 6     JNC    1
    4'b0111: imm = 4'b0000;       // 7     OUT    0
    4'b1000: imm = 4'b1111;       // 8     OUT    15
    4'b1001: imm = 4'b0111;       // 9     JMP    7
    default: imm = 4'b0000;
  endcase
end

endmodule
