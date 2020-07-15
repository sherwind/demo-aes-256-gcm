#!/usr/bin/env python

from Cryptodome.Cipher import AES
import binascii

key       = b"AES256Key-32Characters1234567890"
iv        = b"123456789012"
plaintext = b"message to be encrypted"

aesCipher = AES.new(key, AES.MODE_GCM, iv)
ciphertext, authTag = aesCipher.encrypt_and_digest(plaintext)

print("ciphertext = ", binascii.hexlify(ciphertext))
print("tag = ", binascii.hexlify(authTag))
