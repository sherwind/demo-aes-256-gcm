#!/usr/bin/env perl

use strict;
use feature qw(say);
use Crypt::AuthEnc::GCM qw(gcm_encrypt_authenticate gcm_decrypt_verify);
use Getopt::Long;

GetOptions(
  'ciphertext=s' => \ my $ciphertext,
  'tag=s' => \ my $tag,
) or die "Invalid options passed to $0\n";

die "--ciphertext and --tag are required\n" unless $ciphertext and $tag;

$ciphertext = pack('H*', $ciphertext);
$tag        = pack('H*', $tag);

my $key = "AES256Key-32Characters1234567890";
my $iv  = "123456789012";

my $pt = gcm_decrypt_verify('AES', $key, $iv, '', $ciphertext, $tag);
say "original plaintext = " . $pt;
