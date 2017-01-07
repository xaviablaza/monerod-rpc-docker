# monero-docker
Docker Repo for Monerod.

## Usage Instructions

**Mandatory Requirement**: Must use a local mount volume and config file.

Example:

```
sudo docker run -it --name=monero-docker \   
-v /path/to/local/monero/dir:/opt/monero \   
-p 127.0.0.1:18081 sreekanthgs/monero-docker:latest
```

**Config file is read from**: `/opt/monero/monerod.conf`, i.e., `/path/to/local/monero/dir/monerod.conf`

##Storing of Data

You can store data within `/opt/monero/data` or any directory within `/opt/monero`.

This will inturn store your data within `/path/to/local/monero/dir` described above. 

Hence, to store within a different local dir, create a hard symlink for any other directory inside `/path/to/local/monero/dir` and then use that directory as `data-dir` in `monerod.conf`

###Example

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
