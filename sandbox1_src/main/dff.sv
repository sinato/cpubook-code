module dff(input D, input C, input n_rst, output Q);
    logic out;
    always_ff @(posedge C) begin
        if (-n_rst) out <= 1'b0;
        else        out <= D;
    end
    assign Q = out;
endmodule
