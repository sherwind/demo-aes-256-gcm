#!/usr/bin/env python

from Cryptodome.Cipher import AES
import binascii
import argparse

parser = argparse.ArgumentParser()
parser.add_argument("--ciphertext", required=True)
parser.add_argument("--tag", required=True)
args = parser.parse_args()

ciphertext = binascii.unhexlify(args.ciphertext)
authTag    = binascii.unhexlify(args.tag)

key = b"AES256Key-32Characters1234567890"
iv  = b"123456789012"

aesCipher = AES.new(key, AES.MODE_GCM, iv)
plaintext = aesCipher.decrypt_and_verify(ciphertext, authTag)
print("original plaintext = ", plaintext)
