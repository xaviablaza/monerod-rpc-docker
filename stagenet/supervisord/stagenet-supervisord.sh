#!/bin/sh
docker run -it -d -v /mnt/monerod_stagenet/monero-stagenet/chain:/root/.bitmonero -v /mnt/monerod_stagenet/monero-stagenet/wallet:/wallet -p 38080:38080 -p 38083:38083 --name stagenet-supervisord xaviablaza/monero:stagenet-supervisord
