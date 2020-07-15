<?php

$key       = "AES256Key-32Characters1234567890";
$iv        = "123456789012";
$plaintext = "message to be encrypted";

$ciphertext = openssl_encrypt($plaintext, "aes-256-gcm", $key, $options=OPENSSL_RAW_DATA, $iv, $tag);
echo "ciphertext = " . bin2hex($ciphertext) . "\n";
echo "tag = " . bin2hex($tag) . "\n";
