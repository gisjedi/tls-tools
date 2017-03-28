#!/bin/bash

# Usage:
# ./gen-cert.sh mykeyname

mkdir $1

# Create private key and CSR
openssl req -subj '/C=US/ST=AllYourBase/O=BelongToUs/CN=$1' \
       -newkey rsa:2048 -nodes -keyout $1/$1.key \
       -out $1/$1.csr
       
# Sign cert with CA key
openssl ca -config ../ca/openssl.conf \
      -extensions usr_cert -days 375 -notext -md sha256 \
      -in $1/$1.csr \
      -out $1/$1.crt
       
# Create p12 from private and public keys
openssl pkcs12 \
       -inkey $1/$1.key \
       -in $1/$1.crt \
       -export -out $1/$1.pfx