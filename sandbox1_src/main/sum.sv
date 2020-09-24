module sum(input in1, input in2, output [1:0] out);
logic [1:0] p;
always_comb begin
    case ({in1, in2})
        2'b00: p = 2'b00;
        2'b01: p = 2'b01;
        2'b11: p = 2'b10;
        2'b10: p = 2'b01;
    endcase
end
assign out = p;
endmodule