#!/bin/sh

# Generate Caddyfile
cat <<EOF > /etc/caddy/Caddyfile
:80 {
    reverse_proxy /web* http://headscale-ui.railway.internal:8080

    reverse_proxy * http://headscale-railway.railway.internal:8080
}
EOF

# Start Caddy
caddy run --config /etc/caddy/Caddyfile