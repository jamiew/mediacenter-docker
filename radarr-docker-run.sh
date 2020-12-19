#!/bin/sh

docker stop radarr
docker rm -f radarr
docker pull linuxserver/radarr

docker create \
  --name=radarr \
  --net=host \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=America/New_York \
  -v /home/usenet/apps/radarr-docker/config:/config \
  -v /mnt/data3/complete/movies:/movies \
  -v /mnt/data3/downloads:/downloads \
  --restart unless-stopped \
  linuxserver/radarr
  # 4c01e79c4a16
#   linuxserver/radarr

#  -p 7878:7878 \
#  -e UMASK_SET=022 `#optional` \

docker start radarr
