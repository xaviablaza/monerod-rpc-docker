# monerod-rpc-docker
Dockerfile for running monerod and its rpc client in one Docker container

## Usage Instructions

**Mandatory Requirement**: Must use a config file `monerod.conf` and must also mount a local volume.

Copy `monerod.conf` to `/opt/monero/monerod.conf`

Make sure to configure `supervisord.conf` with the startup instructions you'd like for both `monerod` and the rpc client.

Build the image:
```
docker build -t monerod-rpc-docker .
```

Run the container:
```
sudo docker run -it --name=monerod-rpc-docker \   
-v /opt/monero:/opt/monero \   
-p 18081:18081 monerod-rpc-docker
```

Upon running the container, `monerod` will begin syncing (downloading the blockchain). However, the RPC client will fail because it will not be able to find a wallet file to open. To mitigate this, run this command *after monerod is finished syncing*:

```
docker exec -it monero-rpc-docker ./monero-wallet-cli [--testnet]
```

When creating the wallet file, you can specify a path to the wallet file (e.g. `/opt/monero/testnet-wallet`). This is why it is recommended to use a local volume so you may get the wallet file for use in other applications or secure it in an airgapped computer, etc.

## Storing of Data

**Config file is read from**: `/opt/monero/monerod.conf`

You can store data within `/opt/monero/data` or any directory within `/opt/monero`.

This will inturn store your data within `/opt/monero` described above. 

Hence, to store within a different local dir, create a hard symlink for any other directory inside `/path/to/local/monero/dir` and then use that directory as `data-dir` in `monerod.conf`

### Example

If your host directory is `/usr/local/monero` and want to store data in `/var/monero`, do the following:

```
mkdir -p /usr/local/monero
mkdir -p /var/monero
ln -s /var/monero /usr/local/monero/data
```

and use `/opt/monero/data` as your data dir inside the `monerod.conf`

```
#monerod.conf
data-dir=/opt/monero/data
```

## Sources

```
https://stackoverflow.com/questions/38882654/docker-entrypoint-running-bash-script-gets-permission-denied#comment82232384_38882798
https://blog.turret.io/basic-supervisor-logging-with-docker/
```

## Ports

- `18080` is mainnet p2p port
- `18081` is mainnet rpc port
- `28080` is testnet p2p port
- `28081` is testnet rpc port