`timescale 1ns / 1ps

module tb_aes_top;

reg  [127:0] plaintext;
reg  [127:0] key;
wire [127:0] ciphertext;

// Instantiate the AES top module
aes_top uut (
    .plaintext(plaintext),
    .key(key),
    .ciphertext(ciphertext)
);

initial begin

// Apply standard AES-128 test vector
    plaintext = 128'h00112233445566778899aabbccddeeff;
    key       = 128'h000102030405060708090a0b0c0d0e0f;

    #10;

    $display("Plaintext  = %h", plaintext);
    $display("Key        = %h", key);
    $display("Ciphertext = %h", ciphertext);

// Compare against the standard AES-128 result
    if (ciphertext === 128'h69c4e0d86a7b0430d8cdb78070b4c55a)
        $display("TEST PASSED");
    else
        $display("TEST FAILED");

    #10;
    $finish;

end

endmodule

