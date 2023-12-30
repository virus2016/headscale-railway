FROM headscale/headscale:0.22.3-debug

WORKDIR /var/lib/headscale

COPY config.yml /etc/headscale/config.yml

RUN headscale headscale apikeys create

CMD [ "headscale", "serve" ]