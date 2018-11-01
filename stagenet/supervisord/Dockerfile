FROM xaviablaza/monero

RUN apt-get update && \
    apt-get install -y supervisor

EXPOSE 38083

RUN mkdir -p /var/log/supervisor
COPY supervisord.conf.stagenet /etc/supervisor/conf.d/supervisord.conf

ENTRYPOINT /usr/bin/supervisord
