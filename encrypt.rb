require 'openssl'

key       = "AES256Key-32Characters1234567890"
nonce     = "123456789012"
plaintext = "message to be encrypted"

cipher     = OpenSSL::Cipher::AES.new(256, :GCM).encrypt
cipher.key = key
cipher.iv  = nonce

encrypted = cipher.update(plaintext) + cipher.final
tag       = cipher.auth_tag # produces 16 bytes tag by default

puts "ciphertext = " + encrypted.unpack('H*').first
puts "tag = " + tag.unpack('H*').first
