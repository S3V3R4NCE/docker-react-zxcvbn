# Getting Started

## Creating a new self-signed certificate for testing
RUN openssl on compatible systems
- `cd ./crypto/`
- `openssl req -newkey rsa:2048 -nodes -keyout nginx-react-zxcvbn.key -x509 -days 365 -out nginx-react-zxcvbn.crt`

## Issuing a new corporate PKI signed certificate
TODO

## Dealing with SSL inspection on corporate firewalls
1. Replace `./crypto/ssl_intercept.cer` with public key of corporate firewall
2. Uncomment `Dockerfile` line setting npm config for `ssl_intercept.cer`
