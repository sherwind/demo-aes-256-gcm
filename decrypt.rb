require 'openssl'
require 'optparse'

options = {}
optparse = OptionParser.new do |opts|
    opts.on("--ciphertext=CIPHERTEXT") { |arg| options[:ciphertext] = arg }
    opts.on("--tag=TAG") { |arg| options[:tag] = arg }
end
optparse.parse!

if options[:ciphertext].nil? or options[:tag].nil?
    abort(optparse.help)
end

ciphertext = [options[:ciphertext]].pack('H*')
tag        = [options[:tag]].pack('H*')

key        = "AES256Key-32Characters1234567890"
nonce      = "123456789012"

decipher = OpenSSL::Cipher::AES.new(256, :GCM).decrypt
decipher.key = key
decipher.iv = nonce
decipher.auth_tag = tag

decrypted = decipher.update(ciphertext) + decipher.final

puts "original plaintext = " + decrypted
