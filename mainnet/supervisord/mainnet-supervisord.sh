#!/bin/sh
docker run -it -d -v /monero/chain:/root/.bitmonero -v /monero/wallet:/wallet -p 18080:18080 -p 18081:18081 -p 18083:18083 --name mainnet-supervisord xaviablaza/monero:mainnet-supervisord
