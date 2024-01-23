module EParityCheck32_test;
    reg[31:0] data;
    wire confirmFlag;
    wire[4:0] oneCount;

    EParityCheck32 epc(data[31:1], data[0], oneCount, confirmFlag);

    initial begin
        data = 32'b00001010100; // cf = 0
        #10
        data = 32'b01010101011; // cf = 1
        #10
        data = 32'b01001001000; // cf = 0
        #10
        data = 32'b00011100001101000; // cf = 1
    end
    
endmodule
