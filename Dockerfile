FROM ubuntu:16.04
LABEL maintainer="xlablaza@gmail.com"

RUN apt-get update && apt-get install -y \
 git build-essential bsdmainutils libunbound-dev \
 libevent-dev libgtest-dev libboost-dev libpcsclite-dev \
 curl wget supervisor

WORKDIR /usr/local/monero

RUN wget https://downloads.getmonero.org/linux64 -O monero.tar.bz2

RUN tar -jvxf monero.tar.bz2 --strip-components=2

VOLUME ["/opt/monero"]
COPY monerod.conf /opt/monero/monerod.conf

EXPOSE 18080
EXPOSE 18081
EXPOSE 28080
EXPOSE 28081

RUN mkdir -p /var/log/supervisor
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

CMD /usr/bin/supervisord