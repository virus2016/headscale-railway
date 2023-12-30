FROM headscale/headscale:0.22.3

WORKDIR /var/lib/headscale

COPY config.yml /etc/headscale/config.yml

CMD [ "headscale", "serve" ]