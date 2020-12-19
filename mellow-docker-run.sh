#!/bin/sh

docker stop mellow
docker rm mellow
docker pull voidp/mellow:latest

docker run -d \
  --restart=unless-stopped \
  --name mellow \
  -v ~/apps/mellow-discord-bot/data:/usr/src/app/data/ \
	--net=host \
  voidp/mellow

docker start mellow
# docker logs -f mellow
