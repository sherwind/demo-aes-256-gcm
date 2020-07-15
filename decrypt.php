<?php
$opt = getopt(null, ["ciphertext:", "tag:" ]);

if (!is_array($opt) || ! isset($opt['ciphertext']) || ! isset($opt['tag'])) {
  print "--ciphertext and --tag are required\n";
  exit(1);
}

$key       = "AES256Key-32Characters1234567890";
$iv        = "123456789012";

$ciphertext = hex2bin($opt['ciphertext']);
$tag        = hex2bin($opt['tag']);

$plaintext = openssl_decrypt($ciphertext, "aes-256-gcm", $key, $options=OPENSSL_RAW_DATA, $iv, $tag);
echo "original plaintext = " . $plaintext . "\n";

