#!/bin/bash

mkdir certs crl newcerts private
chmod 700 private
touch index.txt
echo 1000 > serial

# Shim CA conf by the relative location
cat openssl.conf | sed 's^/home/ubuntu/workspace^'`cd .. && pwd && cd ca`'^g' > openssl.cnf

# Generate certificate authority private key
openssl genrsa -aes256 -out private/ca.key.pem 4096

# Unencrypted private key
openssl rsa -in private/ca.key.pem -out private/decrypted.ca.key.pem

chmod 400 private/*ca.key.pem

# Create public key
openssl req -config openssl.conf \
      -key private/ca.key.pem \
      -new -x509 -days 7300 -sha256 -extensions v3_ca \
      -out certs/ca.cert.pem
      
chmod 444 certs/ca.cert.pem

# Verify public key
openssl x509 -noout -text -in certs/ca.cert.pem
