# Nginx Notes

### Hardening

```bash

# hide nginx version number
server_tokens off;

# hide nginx server signature
more_clear_headers 'Server';

# keep only TLS 1.3 + TLS 1.2
ssl_protocols TLSv1.3 TLSv1.2;

# use only strong ciphers for TLS 1.3 + TLS 1.2 + min. 2048 DH
ssl_ciphers "ECDHE-ECDSA-AES256-GCM-SHA384:ECDHE-RSA-AES256-GCM-SHA384:ECDHE-ECDSA-CHACHA20-POLY1305:ECDHE-RSA-CHACHA20-POLY1305:ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES128-GCM-SHA256:DHE-RSA-AES256-GCM-SHA384:DHE-RSA-CHACHA20-POLY1305:DHE-RSA-AES128-GCM-SHA256";
ssl_dhparam ffdhe2048.pem;

# use more secure ECDH Curves
ssl_ecdh_curve X25519:secp521r1:secp384r1:prime256v1;

# enable DNS CAA
example.com. CAA 0 issue "certificate-authority"

# enable OCSP Stapling
ssl_stapling on;
ssl_stapling_verify on;
ssl_trusted_certificate ssl/inter-CA-chain.pem
resolver 1.1.1.1 8.8.8.8 valid=300s;
resolver_timeout 5s;

# force all connections over TLS
return 301 https://$host$request_uri;

# defend against the BEAST attack
ssl_prefer_server_ciphers on;

# HTTP Strict Transport Security
add_header Strict-Transport-Security "max-age=63072000; includeSubdomains" always;

# disable http compression
# only for private resources when using TLS
gzip off;

# reduce XSS risks (Content-Security-Policy)
add_header Content-Security-Policy "default-sre 'none'; script-sre 'self'; connect-sre 'self' ; img-sre 'self'; style-sre 'self';" always;

# control the behavior of the Referer header
add_header Referrer-Policy "no-referrer";

# provide clickjacking protection
add_header X-Frame-options "SAMEORIGIN" always;

# prevent some categories of XSS attacks
add_header X-XSS-Protection "1; mode=block" always

# prevent sniff mimetype
add_header X-Content-Type-Options "nosniff" always;

# deny the use of browser features
add_header Feature-Policy "geolocation 'none'; midi 'none'; notifications 'none'; push 'none'; sync-xhr 'none'; microphone 'none'; camera 'none'; magnetometer 'none'; gyroscope 'none'; speaker 'none'; vibrate 'none'; fullscreen 'none'; payment 'none'; usb 'none';";

```

### Structure

- `/etc/nginx/nginx.conf`

```bash



```
