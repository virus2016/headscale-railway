FROM headscale/headscale:0.22.3

COPY config.yml /etc/headscale/config.yml

CMD [ "headscale", "serve" ]