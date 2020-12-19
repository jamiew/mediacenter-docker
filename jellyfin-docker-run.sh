#!/bin/bash

dir="/home/usenet/apps/jellyfin-data"
media="/mnt/data3/complete/incomplete"
mkdir -p $dir/{config,cache}

docker stop jellyfin
docker rm -f jellyfin
docker pull jellyfin/jellyfin:latest
docker run -d \
    -v $dir/config:/config \
    -v $dir/cache:/cache \
    -v $media:/media \
    --restart unless-stopped \
    --net=host \
    --name jellyfin \
    jellyfin/jellyfin:latest
