# moneropark

These are a collection of Dockerfiles and scripts used to deploy `monerod` and
`monero-rpc-wallet`.

## Running the daemon and wallet separately

Place the config file into the volume mounted for the config. You can also
publish port 18081 if you want to expose the RPC server.

```
# either run in foreground
docker run -it -v /monero/chain:/root/.bitmonero -v /monero/wallet:/wallet -v /monero/config:/config -p 18080:18080 xaviablaza/monero:mainnet-daemon [--config-file /config/config.conf]

docker run -it -v /monero/chain:/root/.bitmonero -v /monero/wallet:/wallet -v /monero/config:/config -p 18083:18083 xaviablaza/monero:mainnet-rpc-wallet [--config-file /config/config.conf]

# or in background
docker run -it -d -v /monero/chain:/root/.bitmonero -v /monero/wallet:/wallet -v /monero/config:/config -p 18080:18080 xaviablaza/monero:mainnet-daemon [--config-file /config/config.conf]

docker run -it -d -v /monero/chain:/root/.bitmonero -v /monero/wallet:/wallet -v /monero/config:/config -p 18083:18083 xaviablaza/monero:mainnet-rpc-wallet [--config-file /config/config.conf]
```

## Building the base image

You can use the base images available at:
- [xaviablaza/monero:latest](https://hub.docker.com/r/xaviablaza/monero/tags/)
- [xaviablaza/monero:v0.13.0.4](https://hub.docker.com/r/xaviablaza/monero/tags/)

These images use v0.13.0.4-release (Beryillium Bullet), built from
[source](https://github.com/monero-project/monero/releases/tag/v0.13.0.4).

## Building the image with supervisord

This image uses the base image above and adds supervisor to run both the daemon
and the rpc wallet. You need to make sure that you have:
- A strong username and password for the daemon and the rpc logins
- Generate a wallet (you can mount a local volume to access the wallet files)

You can use the shell scripts to easily start the container.

## Protecting the environment variables

You can use a config file and pass your configuration in via `--config-file /path/to/config` in
either `monerod` or `monero-rpc-wallet`.

## Donation

If you want to donate directly to support further development, here is my
wallet:

xaviablaza:
```
4BKmXgzLJueVgGxBgRjNpzbNUVwyLSQs5EMTy83AT2xHbS9k6zWu2rUJ1yfxbgnorAZFYjsKRfC9WYTBJtqrRSxZPQfmmJ1
```
