module top(
    input logic xin,
    output logic xout
);
logic x1, x2, x3, x4, x5;
assign xout = ~xin;
assign x1 = xin;
assign x2 = ~xin;
assign x3 = xin;
assign x4 = ~xin;
assign x5 = xin;
endmodule
