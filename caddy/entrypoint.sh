#!/bin/bash

# Generate Caddyfile
cat <<EOF > /etc/caddy/Caddyfile
https://{$PUBLIC_URL} {
    reverse_proxy /web* http://${UI} {
        transport http {
            tls_insecure_skip_verify
        }
    }

    reverse_proxy * http://${BACKEND}:8080
}
EOF

# Start Caddy
caddy run --config /etc/caddy/Caddyfile