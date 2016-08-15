#!/usr/bin/env bash

DOMAIN="192.168.1.104"
SUBJECT="/C=US/ST=Mars/L=iTranswarp/O=iTranswarp/OU=iTranswarp/CN=$DOMAIN"
CERT_NAME="cert"

# 生成一个RSA密钥
openssl genrsa -des3 -out $CERT_NAME.key 2048

# 生成一个证书请求
openssl req -new -subj $SUBJECT -key $CERT_NAME.key -out $CERT_NAME.csr

mv $CERT_NAME.key $CERT_NAME.origin.key
openssl rsa -in $CERT_NAME.origin.key -out $CERT_NAME.key

# 自己签发证书
openssl x509 -req -days 3650 -in $CERT_NAME.csr -signkey $CERT_NAME.key -out $CERT_NAME.crt

