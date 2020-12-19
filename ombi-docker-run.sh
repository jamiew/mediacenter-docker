#!/bin/sh
image="linuxserver/ombi"
name="ombi"

docker stop $name
docker rm -f $name
docker pull $image

docker create \
  --name=$name \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=America/New_York \
  -p 3579:3579 \
  --net=host \
  -v /home/usenet/apps/ombi-config:/config \
  --restart unless-stopped \
  $image

docker start $name

echo "Visit http://dubtron.local:3579"
