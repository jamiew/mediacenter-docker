docker stop emby
docker rm emby
docker pull emby/embyserver:latest
docker run -d \
    --volume /home/usenet/apps/emby-data/:/config \
    --volume /mnt/data3/complete/incomplete:/mnt/share1 \
    --device /dev/dri:/dev/dri \
    --publish 8096:8096 \
    --publish 8920:8920 \
    --name emby \
    emby/embyserver:latest


##
#    --runtime=nvidia \ # To expose your NVIDIA GPU
#    --env UID=1000 \ # The UID to run emby as (default: 2)
#    --env GID=100 \ # The GID to run emby as (default 2)
#    --env GIDLIST=100 \ # A comma-separated list of additional GIDs to run emby as (default: 2)
