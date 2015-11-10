#!/bin/bash

openssl req -newkey rsa:2048 -sha256 -keyout example.com.key -nodes -x509 -days 365 -out example.crt -subj '/C=ES/ST=Madrid/L=Madrid/O=GlobalSecurity/OU=ITDepartment/CN=example.com'
cat example.com.key example.crt > example.pem
openssl dhparam -rand - 1024 >> example.pem

exec /usr/local/sbin/hitch --config=/etc/hitch.conf
