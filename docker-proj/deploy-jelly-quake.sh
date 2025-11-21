#!/bin/bash

# only run after deploy-docker.sh

sudo mkdir -p /srv/media
sudo chown 1000:1000 /srv/media
    # default UID/GID for jellyfin inside the container

sudo mkdir -p /srv/media-stack
cd /srv/media-stack

# git clone ...
# clone the docker-compose.yml...

docker compose up -d
    # docker ps to check containers running


# management:
    # docker compose logs -f
    # docker compose down
    # docker compose restart jellyfin

# if changes are made, e.g. to the yml, restart:
    # docker compose down
    # docker compose up -d

