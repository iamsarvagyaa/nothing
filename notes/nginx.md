# Nginx Notes

### Hardening

```bash
# Hide nginx version number
server_tokens off;

# Hide nginx server signature
more_clear_headers 'Server';

# Keep only TLS 1.3 + TLS 1.2
ssl_protocols TLSv1.3 TLSv1.2;


```

### Structure

- `/etc/nginx/nginx.conf`

```bash

```
