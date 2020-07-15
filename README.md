# demo-aes-256-gcm

```
$ php encrypt.php 
ciphertext = 20977118e42831a7fe840054a8f7394d48f22133eca6d9
tag = 0f867658a59fb2388f7f1217bac658bb

$ carton exec perl decrypt.pl --ciphertext=20977118e42831a7fe840054a8f7394d48f22133eca6d9 --tag=0f867658a59fb2388f7f1217bac658bb
original plaintext = message to be encrypted

$ python decrypt.py  --ciphertext=20977118e42831a7fe840054a8f7394d48f22133eca6d9 --tag=0f867658a59fb2388f7f1217bac658bb
original plaintext =  b'message to be encrypted'
```
