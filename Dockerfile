FROM headscale/headscale:0.22.3-debug

RUN apt-get update && apt-get install -y openssh-server

WORKDIR /var/lib/headscale

COPY config.yml /etc/headscale/config.yml

ENTRYPOINT service ssh restart && headscale serve

# CMD [ "headscale", "serve" ]