FROM ubuntu:18.04
LABEL maintainer="xlablaza@gmail.com"

RUN apt-get update && apt-get install -y \
 wget

WORKDIR /usr/local/bin

RUN wget https://downloads.getmonero.org/linux64 -O monero.tar.bz2

RUN tar -jvxf monero.tar.bz2 --strip-components=2

VOLUME ["/root/.bitmonero"]
VOLUME ["/wallet"]
VOLUME ["/config"]

RUN apt-get purge -y \
 wget & \
 rm monero.tar.bz2

EXPOSE 18080
EXPOSE 18081

ENTRYPOINT ["monerod", "--non-interactive", "--confirm-external-bind"]
