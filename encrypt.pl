#!/usr/bin/env perl

use strict;
use feature qw(say);
use Crypt::AuthEnc::GCM qw(gcm_encrypt_authenticate gcm_decrypt_verify);

my $key       = "AES256Key-32Characters1234567890";
my $iv        = "123456789012";
my $plaintext = "message to be encrypted";

my ($ct, $tag) = gcm_encrypt_authenticate('AES', $key, $iv, '', $plaintext);
say "ciphertext = " . unpack('H*', $ct);
say "tag = " . unpack('H*', $tag);
