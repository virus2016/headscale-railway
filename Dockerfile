FROM headscale/headscale:0.22.3-debug

WORKDIR /var/lib/headscale

COPY config.yml /etc/headscale/config.yml
COPY entrypoint.sh entrypoint.sh

RUN chmod +x entrypoint.sh

ENTRYPOINT ["entrypoint.sh"]