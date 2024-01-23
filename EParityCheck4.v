module EParityCheck4 (
    input[2:0] in,
    input parity,
    output[1:0] out,
    output confirm
);
    // full-add logic circuit
    assign out[0] = in[2] ^ in[1] ^ in[0];
    assign out[1] = (in[2] & in[1]) | (in[2] & in[0]) | (in[1] & in[0]);

    // confirm
    assign confirm = ~(out[0] ^ parity);

endmodule
