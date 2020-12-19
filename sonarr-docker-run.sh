#!/bin/sh

docker stop sonarr
docker rm -f sonarr
docker pull linuxserver/sonarr

docker create \
  --name=sonarr \
  --net=host \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=America/New_York \
  -v /home/usenet/apps/sonarr-docker/config:/config \
  -v /mnt/data3/complete/tv:/tv \
  -v /mnt/data3/downloads:/downloads \
  --restart unless-stopped \
  linuxserver/sonarr

#  -p 8989:8989 \

docker start sonarr
