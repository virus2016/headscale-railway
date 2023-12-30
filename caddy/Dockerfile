FROM caddy/caddy

COPY entrypoint.sh /etc/caddy/entrypoint.sh

RUN chmod +x /etc/caddy/entrypoint.sh

ENTRYPOINT ["/etc/caddy/entrypoint.sh"]
