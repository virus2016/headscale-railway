FROM caddy/caddy

COPY entrypoint.sh /etc/caddy/entrypoint.sh

RUN chmod +x /etc/caddy/entrypoint.sh

USER root

ENTRYPOINT ["/etc/caddy/entrypoint.sh"]
