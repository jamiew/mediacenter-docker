#!/bin/sh

docker stop nzbget
docker rm -f nzbget
docker pull linuxserver/nzbget

docker run -d \
  --name=nzbget \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=America/New_York \
  -p 6789:6789 \
  -v /home/usenet/apps/nzbget-docker:/config \
  -v /mnt/data3/downloads:/downloads \
  --restart unless-stopped \
  ghcr.io/linuxserver/nzbget

docker start nzbget
