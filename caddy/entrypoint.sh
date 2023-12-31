#!/bin/sh

# Generate Caddyfile
cat <<EOF > /etc/caddy/Caddyfile
:80 {
    reverse_proxy /web* http://headscale-ui.railway.internal

    reverse_proxy * http://headscale-production.up.railway.app:8080
}
EOF

# Start Caddy
caddy run --config /etc/caddy/Caddyfile