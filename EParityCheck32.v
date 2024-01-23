module EParityCheck32 (
    input[30:0] in,
    input parity,
    output[4:0] out,
    output confirm
);
    wire[10:0] c1;
    wire c_prime;
    wire[21:0] o;
    genvar i;

    // compute confirm
    generate
        for (i = 0; i < 10; i = i + 1) begin
            EParityCheck4 epc1(in[3*i+2 : 3*i], 1'b0, o[2*i+1 : 2*i], c1[i]);
        end
    endgenerate
    EParityCheck4 epc1({1'b0, 1'b0, in[30]}, 1'b0, o[21:20], c1[10]);

    // -- 0s must be even to num be even
    assign c_prime = ^(~c1);
    assign confirm = c_prime ~^ parity;

    // compute out
    assign out = o[21:20] + o[19:18] + o[17:16] + o[15:14] + o[13:12] + o[11:10] + o[9:8] + o[7:6] + o[5:4] + o[3:2] + o[1:0]; 

endmodule
