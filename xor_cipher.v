module xor_cipher (
    input  [7:0] data_in,     // 8-bit plaintext or ciphertext
    input  [7:0] key,         // 8-bit encryption/decryption key
    output [7:0] data_out     // 8-bit output: ciphertext or plaintext
);
    assign data_out = data_in ^ key;
endmodule
