#!/bin/bash

# only run after deploy-docker.sh

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

