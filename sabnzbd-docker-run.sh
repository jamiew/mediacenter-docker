#!/bin/bash

docker rm -f sabnzbd
docker stop sabnzbd
docker pull ghcr.io/linuxserver/sabnzbd:latest

docker run -d \
  --name=sabnzbd \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=America/New_York \
  -p 8085:8080 \
  -p 9090:9090 \
  -v /home/usenet/apps/sabnzbd-docker:/config \
  -v /home/usenet/downloads/complete:/downloads \
  -v /home/usenet/downloads/incomplete:/incomplete-downloads \
  --restart unless-stopped \
  ghcr.io/linuxserver/sabnzbd
