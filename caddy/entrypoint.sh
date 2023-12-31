#!/bin/sh

# Generate Caddyfile
cat <<EOF > /etc/caddy/Caddyfile
https://${PUBLIC_URL} {
    reverse_proxy /web* http://${UI} 

    reverse_proxy * http://${BACKEND}:8080
}
EOF

# Start Caddy
caddy run --config /etc/caddy/Caddyfile