#!/bin/bash
mkdir /etc/nginx/certs/
cd /etc/nginx/certs/
openssl genrsa -out $1.key 2048
openssl req -new -sha256 -key $1.key -nodes -subj "/C=NL/ST=Nord-Holland/L=Amsterdam/O=PressPage/CN=$1" -out $1.csr
openssl x509 -req -in $1.csr -signkey $1.key -out $1.crt
