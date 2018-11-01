FROM xaviablaza/monero

RUN apt-get update && \
    apt-get install -y supervisor

EXPOSE 18083

RUN mkdir -p /var/log/supervisor
COPY supervisord.conf.mainnet /etc/supervisor/conf.d/supervisord.conf

ENTRYPOINT /usr/bin/supervisord
