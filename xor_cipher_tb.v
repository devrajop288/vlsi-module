`timescale 1ns/1ps

module xor_cipher_tb;

    reg [7:0] plaintext;
    reg [7:0] key;
    wire [7:0] ciphertext;
    wire [7:0] decrypted;

    // Instantiate encryption module
    xor_cipher encrypt_inst (
        .data_in(plaintext),
        .key(key),
        .data_out(ciphertext)
    );

    // Instantiate decryption module (same as encryption for XOR)
    xor_cipher decrypt_inst (
        .data_in(ciphertext),
        .key(key),
        .data_out(decrypted)
    );

    initial begin
        // Test vector
        plaintext = 8'b10101010;
        key       = 8'b11001100;

        #10;
        $display("Plaintext : %b", plaintext);
        $display("Key       : %b", key);
        $display("Ciphertext: %b", ciphertext);
        $display("Decrypted : %b", decrypted);

        // Verify
        if (decrypted == plaintext)
            $display("Decryption successful ✅");
        else
            $display("Decryption failed ❌");

        $finish;
    end

endmodule
