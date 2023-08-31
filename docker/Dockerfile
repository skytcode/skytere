FROM debian:stretch
LABEL maintainer="Skytere Developers <dev@skytere.org>"
LABEL description="Dockerised SkytereCore, built from Travis"

RUN apt-get update && apt-get -y upgrade && apt-get clean && rm -fr /var/cache/apt/*

COPY bin/* /usr/bin/
