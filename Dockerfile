FROM headscale/headscale:0.22.3-debug

RUN apt-get update && apt-get install -y netcat

WORKDIR /var/lib/headscale

COPY config.yml /etc/headscale/config.yml
COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]